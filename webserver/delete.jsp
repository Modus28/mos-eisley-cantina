<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>

<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

  <title>EECS 341 Final Project </title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
  <h1>You have deleted food! Don't you know there's starving children in $countryName ? </h1>
  
  <!-- Database Connection -->
  <%@page language="java" import="java.sql.*;"%>
  <%
	final String driver = "com.mysql.jdbc.Driver";
	Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
	final String server
            = "jdbc:mysql://localhost:3306/mss?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
	Connection con = DriverManager.getConnection(server);
	String[] toDelete = request.getParameterValues("id");
	for(String toDel : toDelete) {
		PreparedStatement deleteFood = con.prepareStatement("DELETE FROM MOVIESTAR WHERE starName = ?");
		deleteFood.setString(1, toDel);
		deleteFood.executeUpdate();
	}
%>

  <input type="button" class="button" value="Go back to previous page" />

  <script src="query.js"></script>

</body>

</html>