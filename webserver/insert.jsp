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
  <h2>Your request was processed. </h2>
  <!-- Database Connection -->
  <%@page language="java" import="java.sql.*; import java.text.SimpleDateFormat; import java.util.Date;"%>
  <%
	final String driver = "com.mysql.jdbc.Driver";
	Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
	final String server
            = "jdbc:mysql://localhost:3306/mss?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
	Connection con = DriverManager.getConnection(server);

	PreparedStatement addFood = con.prepareStatement("INSERT INTO MOVIESTAR (starName,gender,address,birthdate) VALUES(?,?,?,?)");
	addFood.setString(1, request.getParameter("name"));
	addFood.setString(2, request.getParameter("vegan"));
	addFood.setString(3, request.getParameter("gluten"));
	String stringDate = request.getParameter("price");
	Date birthDate = new SimpleDateFormat("yyyy-MM-dd").parse(stringDate); 
	java.sql.Date timeStamp = new java.sql.Date(birthDate.getTime());
	addFood.setDate(4,timeStamp);
	try {
		addFood.executeUpdate();
		out.println("Food added.");
	}
	catch (Exception e){
		out.println("You tried to add an entry that already exists!");
	}
  %>
  <p></p>
  
  <input type="button" class="button" value="Go back to previous page" />
  
  <script src="query.js"></script>
  
</body>

</html>