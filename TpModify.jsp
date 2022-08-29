<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.text.*" %>
<%@ page import= "java.sql.*" %> 
<%@ page import= "DBPKG.Util" %>    
<%@ page import= "java.text.SimpleDateFormat" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TpModify</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	

	<jsp:include page="header.jsp"></jsp:include>
	<section style = " position: fixed; top: 60px; width: 100% ; height: 100% ;
	background-color: lightgray ; color: black ; line-height: 20px ; font-size: 15px ; 
	padding-left: 20px">
	<h2 style = "text-align: center"><b>이동수단 정보수정</b></h2><br>
	
	
	<form method = "post" action = "action.jsp" name="frm" style = "display: flex; align-items: center; 
	justify-content: center ; text-align: center">
	
	<input type = "hidden" name = "mode" value = "modify">
	
	<table border="1">
	
	
	<%
	
	Connection conn = null;
	Statement stmt = null ; 
	String mod_Tp_ID = request.getParameter("mod_Tp_ID") ;
	String Tp_Capacity = "";
	String Tp_Name = "";
	String Tp_Price = "";

	
	try {
		conn = Util.getConnection(); 
		stmt = conn.createStatement();
		String sql = "select * from Tp Where Tp_ID = " + mod_Tp_ID ; 
		ResultSet rs = stmt.executeQuery(sql);
		rs.next(); 
		mod_Tp_ID = rs.getString("Tp_ID");
		Tp_Capacity = rs.getString("Tp_Capacity");
		Tp_Name = rs.getString("Tp_Name");
		Tp_Price = rs.getString("Tp_Price");
		
//		SimpleDateFormat transFormat = new SimpleDateFormat("YYYY-MM-dd") ;
//			joindateStr = transFormat.format(joindate); 
	}
	
	catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
	<tr>
	<td>이동수단ID</td>
	<td><input type = "text" name= "Tp_ID" value= "<%=mod_Tp_ID %>"></td>
	</tr>
	
		<tr>
	<td>수용인원</td>
	<td><input type = "text" name= "Tp_Capacity" value= "<%=Tp_Capacity %>"></td>
	</tr>
	
		<tr>
	<td>이름</td>
	<td><input type = "text" name= "Tp_Name" value= "<%=Tp_Name %>"></td>
	</tr>
	
		<tr>
	<td>가격</td>
	<td><input type = "text" name= "Tp_Price" value= "<%=Tp_Price %>"></td>
	</tr>

	<tr>
		<td COLSPAN="2">
		<input type = "SUBMIT" value="수정" onclick="return modify()"> &nbsp;
		<input type = "button" value="조회" onclick="return TpSearchCheck()">
		</td>
	</tr>
	  
	</table>
	</form>
	</section>
	<jsp:include page ="footer.jsp"></jsp:include>

</body>
</html>