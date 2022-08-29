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
<title>travel_modify</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	

	<jsp:include page="header.jsp"></jsp:include>
	<section style = " position: fixed; top: 60px; width: 100% ; height: 100% ;
	background-color: lightgray ; color: black ; line-height: 20px ; font-size: 15px ; 
	padding-left: 20px">
	<h2 style = "text-align: center"><b>여행지 정보수정</b></h2><br>
	
	
	<form method = "post" action = "travel_action.jsp" name="frm" style = "display: flex; align-items: center; 
	justify-content: center ; text-align: center">
	
	<input type = "hidden" name = "mode" value = "travel_modify">
	
	<table border="1">
	
	
	<%
	
	Connection conn = null;
	Statement stmt = null ; 
	String Travel_ID = "" ;
	String Travel_Location = "";
	String Travel_Place = "";
	String Travel_Food = "";


	
	try {
		conn = Util.getConnection(); 
		stmt = conn.createStatement();
		String sql = "select * from Travel " ; 
		ResultSet rs = stmt.executeQuery(sql);
		rs.next() ; 
		Travel_ID = rs.getString("Travel_ID");
		Travel_Location = rs.getString("Travel_Location");
		Travel_Place = rs.getString("Travel_Place");
		Travel_Food = rs.getString("Travel_Food");
}

//		SimpleDateFormat transFormat = new SimpleDateFormat("YYYY-MM-dd") ;
//			joindateStr = transFormat.format(joindate); 
//}
	
	catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
	<tr>
	<td>여행지ID</td>
	<td><input type = "text" name= "Travel_ID" value= "<%=Travel_ID %>"></td>
	</tr>
	
		<tr>
	<td>여행지 </td>
	<td><input type = "text" name= "Travel_Location" value= "<%=Travel_Location %>"></td>
	</tr>
	
		<tr>
	<td>명소</td>
	<td><input type = "text" name= "Travel_Place" value= "<%=Travel_Place %>"></td>
	</tr>
	
		<tr>
	<td>먹거리</td>
	<td><input type = "text" name= "Travel_Food" value= "<%=Travel_Food %>"></td>
	</tr>
	

	

	
	<tr>
		<td COLSPAN="2">
		<input type = "SUBMIT" value="수정" onclick="return travel_modify()"> &nbsp;
		<input type = "button" value="조회" onclick="return searchCheck02()">
		</td>
	</tr>
	
	  
	  
	  
	</table>
	</form>
	</section>
	<jsp:include page ="footer.jsp"></jsp:include>

</body>
</html>