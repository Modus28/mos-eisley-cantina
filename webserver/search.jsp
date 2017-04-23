<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>

<head>
  <title>Mos Eisley Cantina </title>

  
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
  <h1>Here are your data analytics results: </h1>

 <!-- Database Connection -->
  <%@page language="java" import="java.sql.*;"%>
  <%
	final String driver = "com.mysql.jdbc.Driver";
	Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
	final String server
            = "jdbc:mysql://localhost:3306/bar?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
	Connection con = DriverManager.getConnection(server);
	String allCustomersServedBy = "select distinct customer.cname, employee.ename from customer, bill, employee where customer.c_id = bill.c_id and employee.e_id = bill.e_id and employee.ename = ?";
	String allFoodCheaperThan = "select fooditem.fname, priceTable.price from fooditem, priceTable where fooditem.p_id = priceTable.p_id and priceTable.price <= ?";
	String allDrinksCheaperThan = "select drinks.dname, priceTable.price from drinks, priceTable where drinks.p_id = priceTable.p_id and priceTable.price <= ? order by priceTable.price asc";
	String totalSpendByCustomerOnFood = "select sum(priceTable.price * foodpurchase.qty) as TotalSpent, cname from foodpurchase, bill, fooditem, priceTable, customer where foodpurchase.billNum = bill.billNum and bill.c_id = customer.c_id and customer.cname = ? and fooditem.f_id = foodpurchase.f_id and fooditem.p_id = priceTable.p_id";
	
	String fieldOne = "";
	String fieldTwo = "";
	ResultSet results = null;
	try {
		String queryNumberString[] = request.getParameterValues("queryType");
		int queryNumber = Integer.parseInt(queryNumberString[0]);
		System.out.println("STUFF HERE " + queryNumber);
		String parameters[] = request.getParameterValues("parameter");
		String parameter = parameters[0];
		// Pick from query options
		String queryString = "";
		
		switch(queryNumber){
			case 0: queryString = allCustomersServedBy;
					fieldOne = "Customer Name";
					fieldTwo = "Employee Name";
					break;
			case 1: queryString = allFoodCheaperThan;
					fieldOne = "Name";
					fieldTwo = "Price";
					break;
			case 2: queryString = allDrinksCheaperThan;
					fieldOne = "Name";
					fieldTwo = "Price";
					break;
			case 3: queryString = totalSpendByCustomerOnFood;
					fieldOne = "Total Spent";
					fieldTwo = "Customer Name";
					break;
		}

		PreparedStatement dataAnalytics = con.prepareStatement(queryString);
		dataAnalytics.setString(1, parameter);
		results = dataAnalytics.executeQuery();
		
	}
	catch (Exception e){
		out.println("Error!");
	}
%>
	<div  class="table-responsive" style = " display:block;overflow-y:scroll; height:700px;">
 
			<table class="table">
              <tr>
                <th><%= fieldOne %></th>
				<th><%= fieldTwo %></th>
              </tr>
					<%	
						while (results.next()) {
					%>
					<tr>
						<td>
							<%= results.getString(1)%>
						</td>
						<td>
							<%= results.getString(2)%>
						</td>
					</tr>
					<%
					}
					%>
				<tr>
              </tr>
            </table>
            <br>
      </div>
  <input type="button" class="button" style = "width:250px;height:40px;"  value="Go back to previous page" />

  <script src="query.js"></script>

</body>
</center>
</html>
