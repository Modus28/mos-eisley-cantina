<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>

<head>
 <!-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frontpage.css" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body> 
<style>
.action {
	background-color: #e7e3d8;
    float: left;
    margin: 5px;
    padding: 15px;
    max-width: 1000px;
	min-height: 470px;
	max-height: 800px;
} 

.mywidth {
  width: 80px;   
}
</style>

<h1 style="font-family: Times New Roman;" > EECS 341: Final Project</h1>

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
ResultSet transactSet = StatementRecordset1.executeQuery("SELECT * FROM studio INNER JOIN movies ON movies.studioName = studio.studioName;");
%> 


<div class="action">
  <h2>Transaction History</h2>
  <p>Live copy of our sales data</p>
	<hr>
        <table border=1 cellpadding=5>
          <tr>
			<th>Customer ID</th>
            <th>Food ID</th>
            <th>Quantity</th>
          </tr>
  <%
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


<div class="action">

  <h2>Insert</h2>
  <p>Add Food Items</p>
  <hr>
      <form method="get" action="insert.jsp">
        <table border=1 cellpadding=5>
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
<pre>Insert and Remove now work! 
However, there are some constraints.
'Price' must be a date format: yyyy-mm-dd
Name < 45 characters 
Gender < 16 characters
Address < 95 characters
This is because we are still hooked up to the old database.
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
        <table border=1 cellpadding=5>
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

</body>
</html>