<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>

<head>
 <!-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frontpage.css" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EECS 341 Final Project </title>

</head>

<style>
.action {
	vertical-align: top;
	background-color: #d8d2c0;
    margin: 5px;
    padding: 15px;
	min-width: 470px;
    max-width: 1700px;
	min-height: 600px;
	max-height: 1400px;
	border: 2px solid black;
	text-align: center;
	display:inline-block;
	
} 

.mywidth {
  width: 80px;   
}

.title { 
	font-family: 'Helvetica Neue', sans-serif; 
	font-size: 50px; 
	font-weight: bold;  
	letter-spacing: -1px; 
	line-height: 1; 
	text-align: center; 
	margin-left: auto;
    margin-right: auto;
	font-family: 'Trocchi';
	color: #7c795d;
	position: relative;
	display:inline;
}	
	
.container {
    text-align: center;
}
.centertable, tr, td {
	margin-left: auto;
    margin-right: auto;
	 border: 1px solid black;
	cellpadding: 5;
}

.body,html {
	background-color: #f5f4ef;
}

</style>
<body> 
<br>
<center><h1 class="title"> EECS 341: Final Project</h1></center>
<br><br>
<!-- Database Connection -->
<%@page language="java" import="java.sql.*"%>
<%
final String driver = "com.mysql.jdbc.Driver";
Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
final String server
            = "jdbc:mysql://localhost:3306/mss?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
Connection Conn = DriverManager.getConnection(server);
Statement StatementRecordset1 = Conn.createStatement();
%> 


<div class="container">
<div class="action">

  <h2>Insert</h2>
  <p>Add Food Items</p>
  <hr>
      <form method="get" action="insert.jsp">
        <table class = "centertable">
          <tr>
			<th>Name</th>
            <th>Vegan</th>
            <th>Gluten-Free</th>
            <th>Price</th>

          </tr>
          <tr>
			
            <td> <input type="text" name="name", class = "mywidth"><br></td>
			<td> <input type="text" name="vegan", class = "mywidth"><br></td>
			<td> <input type="text" name="gluten", class = "mywidth"><br></td>
			<td> <input type="text" name="price", class = "mywidth"><br></td>
			
          </tr>
 
        </table>
        <br>
        <input type="submit" value="Add Food">
      </form>
<pre style= "border: black 1px solid">Insert and Remove now work!
However, there are some constraints. 
Name < 45 characters 
Vegan < 16 characters
Gluten-Free < 95 characters
'Price' must be a date format: yyyy-mm-dd
This is because we are still hooked up to the old database.
Don't delete the 'real' actors please
</pre>
</div>

<div class="action">
<%
ResultSet foodSet = StatementRecordset1.executeQuery("SELECT * from moviestar");
%>
  <h2>Remove</h2>
  <p>Remove Food Items</p> 
	<hr>
      <form method="get" action="delete.jsp">
        <table class = "centertable">
          <tr>
            <th>Choice</th>
			<th>Name</th>
            <th>Vegan</th>
            <th>Gluten-Free</th>
            <th>Price</th>

          </tr>
  <%
      while (foodSet.next()) {
        String id = foodSet.getString("starName");
  %>
          <tr>
            <td><input type="checkbox" name="id" value="<%= id %>"></td>
			<td><%= foodSet.getString("starName") %></td>
            <td><%= foodSet.getString("gender") %></td>
            <td><%= foodSet.getString("address") %></td>
            <td>$<%= foodSet.getString("birthdate") %></td>
          </tr>
  <%
      }
  %>
        </table>
        <br>
        <input type="submit" value="Remove Selected">
        <input type="reset" value="Clear Selection">
      </form>
</form>
</div>


<div class="action">
  <h2>Transaction History</h2>
  <p>Live copy of our sales data</p>
	<hr>
        <table class = "centertable">
          <tr>
			<th>Customer ID</th>
            <th>Food ID</th>
            <th>Quantity</th>
          </tr>
  <%
	  Statement state = Conn.createStatement();
	  ResultSet transactSet = state.executeQuery("SELECT * FROM studio INNER JOIN movies ON movies.studioName = studio.studioName;");
      while (transactSet.next()) {
        String id = transactSet.getString("studioName");
  %>
          <tr>
			<td><%= transactSet.getString("studioName") %></td>
            <td><%= transactSet.getString("movieTitle") %></td>
            <td><%= transactSet.getString("movieYear") %></td>
          </tr>
  <%
      }
  %>
        </table>
        <br>
</div> 
</div>
</body>
</html>