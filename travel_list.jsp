<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray; color: white; line-height: 20px; font-size: 10px; padding-left: 20px">
<h2 style="text-align: center"><b>여행지목록조회/수정</b></h2><br>

<form style="display: flex; align-terms: center; justify-content: center; text-align: center">
<table border="1">
<tr>
		<td> 여행지ID </td>
		<td> 여행지 </td>
		<td> 명소 </td>
		<td> 먹거리 </td>
	</tr>
	<%
	
	Connection conn = null;
	Statement stmt = null;
	String grade = "";
	
	try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select * from TRAVEL";
		
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
	
	%>
	
	<tr>
	<td><a href = "travel_modify.jsp?mod_Travel_ID=<%= rs.getString("Travel_ID") %>"><%= rs.getString("Travel_ID") %></a> </td>
	<td><%= rs.getString("TRAVEL_LOCATION") %> </td>
	<td><%= rs.getString("TRAVEL_PLACE") %> </td>
	<td><%= rs.getString("TRAVEL_FOOD") %> </td>	
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