<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body> 
<h1>Your food was added to the menu! Don't forget to refresh. </h1>
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
addFood.executeUpdate();
%> 

<button onclick="goBack()">Go Back</button>

<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html>