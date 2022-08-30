<%@ page import= "java.text.*" %>
<%@ page import= "java.sql.*" %> 
<%@ page import= "java.util.*" %>
<%@ page import= "DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null ;
	
	String tblName="";
	String keyPm="";
	int index=0;
	
	Enumeration<String> em = request.getParameterNames();
	
	ArrayList<String> pmName = new ArrayList<String>();
	ArrayList<Integer> pmType = new ArrayList<Integer>();
	String mode = request.getParameter(em.nextElement());
	
	while(true) {
		String temp;
		pmName.add(em.nextElement());
		temp=request.getParameter(pmName.get(index).toString());
		
		if(index==0){
			keyPm=pmName.get(index);
			tblName=keyPm.substring(0,keyPm.lastIndexOf("_"));	
		}
		
		pmType.add(0);
		
		try {
			Integer intTemp=Integer.parseInt(temp);
			if(!temp.equals(intTemp.toString()))
				throw new Exception();
		} catch (Exception e) {
			pmType.remove(index);
			pmType.add(1);
		}
		
		if(!em.hasMoreElements())
			break;
			
		index++;
	}
	
	try {
		conn = Util.getConnection(); 
		stmt = conn.createStatement();
		String sql = "" ; 
		
		switch ( mode ) {
		
		case "insert" : 
			sql = "insert into "+ tblName +" values(";
			for(int i=0;i<pmName.size();i++) {
				if(i>0)
					sql+=",";
				if(pmType.get(i)==1)
					sql+="'"+request.getParameter(pmName.get(i))+"'";
				else
					sql+=request.getParameter(pmName.get(i));
			}
			sql+=")";
			
			stmt.executeUpdate ( sql );
			
			%>
			<jsp:forward page="join.jsp"></jsp:forward>
			<%
			
			break; 
			
		case "modify" :
			
			sql = "update "+ tblName +" set ";
			for(int i=1;i<pmName.size();i++) {
				if(i>1)
					sql+=",";
				sql+=pmName.get(i)+"=";
				if(pmType.get(i)==1)
					sql+="'"+request.getParameter(pmName.get(i))+"'";
				else
					sql+=request.getParameter(pmName.get(i));
			}
			sql+=" where "+keyPm+"="+request.getParameter(keyPm);
			stmt.executeUpdate ( sql );
			%>
			<jsp:forward page="modify.jsp"></jsp:forward>
			<%
			break; 
		}
		
	}
	
	catch ( Exception e) {
		e.printStackTrace();
	}
	
	%>



</body>
</html>