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
  <%@page language="java" import="java.sql.*; import java.io.*;"%>
  <%
	final String driver = "com.mysql.jdbc.Driver";
	Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
	final String server
            = "jdbc:mysql://localhost:3306/bar?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
	Connection con = DriverManager.getConnection(server);
  // Preset deleteion strings
  String deleteFoodString = "DELETE FROM `bar`.`fooditem` WHERE f_id = ?";
  String deleteDrinkString = "DELETE FROM `bar`.`drinks` WHERE d_id = ?";
  String deleteEmployeeString = "DELETE FROM `bar`.`employee` WHERE e_id = ?";

    // Delete all values specified in form
  	try {
      // Get delete type
      String deleteType = request.getParameter("itemToDelete");
      PreparedStatement deleteStatement = null;


      // Delete based on delete type
      switch(deleteType) {
        case "employee":
          deleteStatement = con.prepareStatement(deleteEmployeeString);
          break;
        case "food":
          deleteStatement = con.prepareStatement(deleteFoodString);
          break;
        case "drink":
          deleteStatement = con.prepareStatement(deleteDrinkString);
          break;
      }
      deleteStatement.setInt(1,Integer.parseInt(request.getParameter("id")));
      deleteStatement.executeUpdate();
  	out.println("Entry in " + deleteType + " was deleted successfully.");
  	}
  	catch (Exception e){
      StringWriter sw = new StringWriter();
      e.printStackTrace(new PrintWriter(sw));
      String exceptionAsString = sw.toString();
      out.println(exceptionAsString);
  		out.println("You tried to delete something that someone else just deleted!");
  	}
    %>
    <p></p>

  <input type="button" class="button" style = "width:250px;height:40px;"  value="Go back to previous page" />

  <script src="query.js"></script>

</body>
</center>
</html>
