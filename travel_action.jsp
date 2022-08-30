<%@page import ="java.text.*" %>
<%@page import ="java.sql.*" %>
<%@page import ="DBPKG.Util" %>

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
<<<<<<< HEAD

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;

String mode = request.getParameter ("mode") ;
String Travel_ID = request.getParameter ("Travel_ID");
String Travel_Location = request.getParameter ("Travel_Location");
String Travel_Place = request.getParameter ("Travel_Place");
String Travel_Food = request.getParameter ("Travel_Food");


=======
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt = null;
String mode = request.getParameter ("mode") ;
String Travel_ID = request.getParameter ("mod_Travel_ID");
String Travel_Location = request.getParameter ("Travel_Location");
String Travel_Place = request.getParameter ("Travel_Place");
String Travel_Food = request.getParameter ("Travel_Food");
>>>>>>> 398302a76c63ffef77dd7baded3ea059a14146f7
try {
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "";
	switch ( mode ) {
	case "insert" :
		sql = "insert into Travel values(" + Travel_ID + " , " + " '" + Travel_Location + "' , " + " '" + Travel_Place + "' , " + " '" + Travel_Food + "' ) ";
		stmt.executeUpdate ( sql );
<<<<<<< HEAD

%>

		<jsp:forward page ="traver_list.jsp"></jsp:forward>
		
=======
%>

		<jsp:forward page ="traver_list.jsp"></jsp:forward>

>>>>>>> 398302a76c63ffef77dd7baded3ea059a14146f7
<%
		
		break ;
	
	case "travel_modify" :
		sql = " update Travel set " + " Travel_Location = '" + Travel_Location + "' , " + "Travel_Place = '" + Travel_Place + "' , " + "Travel_Food = '" + Travel_Food + "' " + "where Travel_ID =" + Travel_ID;
		stmt.executeUpdate (sql);
		
%>

		<jsp:forward page ="travel_modify.jsp"></jsp:forward>

<%
<<<<<<< HEAD

=======
>>>>>>> 398302a76c63ffef77dd7baded3ea059a14146f7
		break ;
	
	}
}
<<<<<<< HEAD


catch ( Exception e) {
	e.printStackTrace();
}

%>

</body>
</html>
=======
catch ( Exception e) {
	e.printStackTrace();
}
%>

</body>
</html> 
>>>>>>> 398302a76c63ffef77dd7baded3ea059a14146f7
