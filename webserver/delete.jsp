<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>

<head>
    
  <meta name="description" content="EECS 341 Final project">
<meta name="author" content="Daniel Grigsby">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/theme.css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>

  <title>Mos Eisley Cantina </title>

</head>
<center>
<body>
  <h1>Your request has been processed. </h1>

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

  // Delete food with prepared statement 
	try {
		String[] toDelete = request.getParameterValues("id");
		for(String toDel : toDelete) {
			PreparedStatement deleteFood = con.prepareStatement("DELETE FROM MOVIESTAR WHERE starName = ?");
			deleteFood.setString(1, toDel);
			deleteFood.executeUpdate();
		}
		out.println("Food deleted.");
	}
	catch (Exception e){
		out.println("You tried to delete something that's already gone.");
	}
%>
<p></p>

  <input type="button" class="button" style = "width:250px;height:40px;"  value="Go back to previous page" />

  <script src="query.js"></script>

</body>
</center>
</html>
