<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tp_list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position: fixed; top: 60px; width: 100%; height: 100%;
background-color: lightgray; color: white; line-height: 20px;
font-size: 10px; padding-left: 20px">
<h2 style="text-align: center"><b>이동수단목록조회/수정</b></h2><br>

<form style="display: flex; align-terms: center; justify-content:
center; text-align: center">

<table border="1">
<tr>
<td> 이동수단ID</td>
<td> 수용인원 </td>
<td> 모델 </td>
<td> 가격 </td>
</tr>
<%
	
Connection conn = null;
Statement stmt = null;
String grade = "";
	
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select * from Tp";
		
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
	
%>
	
	<tr>
	
	<td><a href = "car_modify.jsp?mod_Tp_ID=<%= rs.getString("Tp_ID") %>"><%= rs.getString("Tp_ID") %></a> </td>
	<td><%= rs.getString("Tp_Capacity") %> </td>
	<td><%= rs.getString("Tp_Name") %> </td>
	<td><%= rs.getString("Tp_Price") %> </td>
	</tr>
<%
	}
}
catch(Exception e) {
	e.printStackTrace();
}
%>

</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>