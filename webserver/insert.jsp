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

</head>

<center>
<body>
  <h1>Your request was processed. </h1>
  <!-- Database Connection -->
  <%@page language="java" import="java.sql.*; import java.util.Random; import java.io.*;"%>
  <%
	final String driver = "com.mysql.jdbc.Driver";
	Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
	final String server
            = "jdbc:mysql://localhost:3306/bar?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
	Connection con = DriverManager.getConnection(server);

// Preset insertion strings
String insertPriceString = "INSERT INTO `bar`.`pricetable`VALUES (?,?)";
String insertFoodString = "INSERT INTO `bar`.`fooditem` VALUES (?,?,?,?,?)";
String insertDrinkString = "INSERT INTO `bar`.`drinks` VALUES (?,?,?,?)";
String insertEmployeeString = "INSERT INTO `bar`.`employee` VALUES (?,?,?,?,?)";


	/* 		Date birthDate = new SimpleDateFormat("yyyy-MM-dd").parse(stringDate);
		java.sql.Date timeStamp = new java.sql.Date(birthDate.getTime());
		addFood.setDate(4,timeStamp); */


  // Insert all values specified in form
	try {
    // Get insert type
    String insertType = request.getParameter("itemToAdd");
    PreparedStatement insertStatement = null;
    PreparedStatement insertPrice = null;
    // Random Price Generation
    Random ran = new Random();
    int priceID = ran.nextInt(99998) + 1;
    int entryID = ran.nextInt(99998) + 1;

    // Insert based on insert type
    switch(insertType) {
      case "employee":
        // Prepare Employee Insert
        insertStatement = con.prepareStatement(insertEmployeeString);
        insertStatement.setInt(1,Integer.parseInt(request.getParameter("employeeID")));
        insertStatement.setString(2, request.getParameter("name"));
        insertStatement.setInt(3,Integer.parseInt(request.getParameter("salary")));
        insertStatement.setString(4,request.getParameter("datehired"));
        insertStatement.setInt(5, Integer.parseInt(request.getParameter("managerid")));
        break;
      case "food":
        // Prepare Price Insert
        insertPrice = con.prepareStatement(insertPriceString);
        insertPrice.setInt(1, priceID);
        int fPrice = Integer.parseInt(request.getParameter("price"));
        insertPrice.setInt(2, fPrice);
        insertPrice.executeUpdate();
        // Prepare Food Insert
        insertStatement = con.prepareStatement(insertFoodString);
        insertStatement.setInt(1, entryID);
        insertStatement.setString(2, request.getParameter("name"));
        insertStatement.setInt(3, priceID);
        insertStatement.setInt(4, Integer.parseInt(request.getParameter("vegan")));
        insertStatement.setInt(5, Integer.parseInt(request.getParameter("gluten")));

        break;
      case "drink":
        // Prepare Price Insert
        insertPrice = con.prepareStatement(insertPriceString);
        insertPrice.setInt(1, priceID);
        int dPrice = Integer.parseInt(request.getParameter("price"));
        insertPrice.setInt(2, dPrice);
        insertPrice.executeUpdate();
        // Prepare Drink Insert
        insertStatement = con.prepareStatement(insertDrinkString);
        insertStatement.setInt(1, entryID);
        insertStatement.setString(2, request.getParameter("name"));
        insertStatement.setInt(3, priceID);
        insertStatement.setInt(4, Integer.parseInt(request.getParameter("alcoholic")));
        break;
    }
    insertStatement.executeUpdate();
	out.println("Entry: " + insertType + " was added successfully.");
	}
	catch (Exception e){
    StringWriter sw = new StringWriter();
    e.printStackTrace(new PrintWriter(sw));
    String exceptionAsString = sw.toString();
    out.println(exceptionAsString);
		out.println("You tried to add an entry that already exists, or mixed the types up");
	}
  %>
  <p></p>

  <input type="button" class="button" style = "width:250px;height:40px" value="Go back to previous page" />
  <script src="query.js"></script>

</body>
</center>
</html>
