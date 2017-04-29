<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->

<!--[if lt IE 7 ]> <html class="ie ie6 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie ie7 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie ie8 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie ie9 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>

<meta charset="UTF-8"/>

<title>Mos Eisley Cantina</title>

<meta name="description" content="EECS 341 Final project">
<meta name="author" content="Daniel Grigsby">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/theme.css">
<link rel="stylesheet" href="css/tabs.css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>

  <!-- Database Connection -->
  <%@page language="java" import="java.sql.*"%>
  <%
	final String driver = "com.mysql.jdbc.Driver";
	Driver DriverRecordset1 = (Driver)Class.forName(driver).newInstance();
	final String server
            = "jdbc:mysql://localhost:3306/bar?" +
            "user=root&password=UnforgettablePassword" +
            "&useSSL=false";
	Connection Conn = DriverManager.getConnection(server);
	Statement StatementRecordset1 = Conn.createStatement();
  %>
</head>
<body>
<!--wrapper start-->
<div class="wrapper" id="wrapper">

	<!--header-->
	<header>
	<div class="banner row" id="banner">
		<div class="parallax text-center" style="background-image: url(http://i.imgur.com/jv4dvT9.jpg);">
			<div class="parallax-pattern-overlay">
				<div class="container text-center" style="height:870px;padding-top:170px;">
					<a href="#"><img id="site-title" class=" wow fadeInDown" wow-data-delay="0.0s" wow-data-duration="0.9s" src="img/starwarslogowhite.png" alt="logo"/></a>
					<h2 class="intro wow zoomIn" wow-data-delay="0.4s" wow-data-duration="0.9s">This IS The Bar You're Looking For</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="menu">
		<div class="navbar-wrapper">
			<div class="container">
				<div class="navwrapper">
					<div class="navbar navbar-inverse navbar-static-top">
						<div class="container">
							<div class="navArea">
								<div class="navbar-collapse collapse">
									<ul class="nav navbar-nav">
										<li class="menuItem active"><a href="#wrapper">Home</a></li>
										<li class="menuItem"><a href="#aboutus">Who We Are</a></li>
										<li class="menuItem"><a href="#specialties">Specialties</a></li>
										<li class="menuItem"><a href="#feedback">Feedback</a></li>
										<li class="menuItem"><a href="#administrative">Admin</a></li>
										<li class="menuItem"><a href="#contact">Info </a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!--about us-->
	<section class="aboutus" id="aboutus">
	<div class="container">
		<div class="heading text-center">
			<img class="dividerline" src="img/sep.png" alt="">
			<h2>Our Founders</h2>
			<img class="dividerline" src="img/sep.png" alt="">
			<h3></h3>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="papers text-center">
					<img src="http://i.imgur.com/QyJoi6Q.png" alt=""><br/>
					<a href="http://i.imgur.com/RpEGD6e.jpg"><b>Download my resume</b></a>
					<h4 class="notopmarg nobotmarg">Anakin Skywalker</h4>
					<p>
						I don't like sand. It's coarse and rough and irritating and it gets everywhere. Not like here. Here everything is soft and smooth. </p>

						<p>I killed them. I killed them all. They're dead, every single one of them. And not just the men, but the women and the children, too. They're like animals, and I slaughtered them like animals. I hate them!
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="papers text-center">
					<img src="http://i.imgur.com/vqBWG32.jpg" alt="Darth Vader's Profile Shot"><br/>
					<a href="http://i.imgur.com/1jFJan2.jpg"><b>Download my resume</b></a>
					<h4 class="notopmarg nobotmarg">Darth Vader</h4>
					<p>
						Give yourself to the Dark Side. It is the only way you can save your friends. Yes, your thoughts betray you. Your feelings for them are strong. Especially for... sister. So, you have a twin sister. </p>

						<p>Your feelings have now betrayed her, too. Obi-Wan was wise to hide her from me. Now his failure is complete. If you will not turn to the Dark Side... then perhaps she will...
					</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!--specialties-->
	<section class="specialties" id="specialties">
	<div class="container">
		<div class="heading text-center">
			<img class="dividerline" src="img/sep.png" alt="">
			<h2>Our Specialties</h2>
			<img class="dividerline" src="img/sep.png" alt="">
			<h3>The Mos Eisley cantina is a dimly-lit tavern known for its strong drinks, hot tunes, and occasional outbreaks of shocking violence. Most star pilots visiting Tatooine spend their downtime in the cantina, making it an ideal spot to hire a starship's crew. Take a gander at our menu:</h3>
		</div>
			<div  class="table-responsive" style = " display:block;overflow-y:scroll; height:400px; ">
			<%
				ResultSet foodSet = StatementRecordset1.executeQuery("SELECT * FROM bar.fooditem INNER JOIN bar.pricetable on bar.fooditem.p_id = bar.pricetable.p_id");
			%>
			<hr>
			<form method="post" action="order.jsp" autocomplete="off">
				<table class="table">
				  <tr>
					<th>Choice</th>
					<th>Name</th>
					<th>Vegan</th>
					<th>Gluten-Free</th>
					<th>Price</th>
				  </tr>
						<%
							while (foodSet.next()) {
								String id = foodSet.getString("f_id");
						%>
								<tr>
								<td><input type="checkbox" name="id" value="<%= id %>"></td>
								<td>
									<%= foodSet.getString("fname") %>
								</td>
								<td>
									<%= foodSet.getInt("vegan") != 0  %>
								</td>
								<td>
									<%= foodSet.getInt("glutenfree")  != 0 %>
								</td>
								<td>
									$<%= foodSet.getInt("price") %>.00
								</td>
								</tr>
						<%
						}
						%>
				  <tr>
					<th>Choice</th>
					<th>Name</th>
					<th>Vegan</th>
					<th>Gluten-Free</th>
					<th>Price</th>
				  </tr>
				</table>
				<br>
				<center><input type="submit" value="Order Selection">
				<input type="reset" value="Clear Selection"></center>
			  </form>
      </div>
		<br></br>
		<center><h4>You're probably here for the alcohol. Here's our stock: </h4></center>

	<div  class="table-responsive" style = " display:block;overflow-y:scroll; height:400px;">
        <%
			 ResultSet drinkSet = StatementRecordset1.executeQuery("SELECT * FROM bar.drinks INNER JOIN bar.pricetable on bar.drinks.p_id = bar.pricetable.p_id");
		%>
		<hr>
		<form method="post" action="order.jsp" autocomplete="off">
			<table class="table">
              <tr>
                <th>Choice</th>
                <th>Name</th>
                <th>Alcoholic</th>
                <th>Price</th>
              </tr>
					<%
						while (drinkSet.next()) {
							String id = drinkSet.getString("d_id");
					%>
					<tr>
						<td><input type="checkbox" name="id" value="<%= id %>"></td>
						<td>
							<%= drinkSet.getString("dname") %>
						</td>
						<td>
							<%= drinkSet.getInt("alchohol") != 0  %>
						</td>
						<td>
							$<%= drinkSet.getInt("price") %>.00
						</td>
					</tr>
					<%
					}
					%>
				<tr>
                <th>Choice</th>
                <th>Name</th>
                <th>Alcoholic</th>
                <th>Price</th>
              </tr>
            </table>
            <br>
            <center><input type="submit" value="Order Selection">
            <input type="reset" value="Clear Selection"></center>
          </form>
      </div>


	</div>
	</section>


	<!--feedback-->
	<section class="feedback" id="feedback">
	<div class="container w960">
		<div class="heading">
			<img class="dividerline" src="img/sep.png" alt="">
			<h2>Feedback</h2>
			<img class="dividerline" src="img/sep.png" alt="">
			<h3>Many famous figures have visited our establishment.<br>
			 While we can't list them all, here are a few of the many five star reviews we've had.</h3>
		</div>
		<div class="row">
			<blockquote>Now, you will pay the price for your lack of vision!
				[shoots more Force lighting] " <cite>The Emperor, On receiving his order<br/><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i></cite>
			</blockquote>
			<blockquote> Weesa has munchy here a few times while onda island visit fami and friends.da servers here is just bombad and has great memories it seems.weesa sat onda ocean front patio and enjoy da view with weesa 	delicious wine and munchy.must try!" <cite>Jar Jar Binks, A Cocktail Party<br/><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i></cite>
			</blockquote>
		</div>
		</div>

	</section>
	<!-- Administrative tools -->
	<section class="administrative" id="administrative">
		<div class="heading text-center">
			<img class="dividerline" src="img/sep.png" alt="">
			<h2>Administrative</h2>
			<img class="dividerline" src="img/sep.png" alt="">
			<h3>We've detected that you're an individual with the rights to change the world. Start with our Cantina.</h3>
		</div>
		<div class="container">
		<span id='tab-container' style = "display:inline-block;">

		<!-- Add/Remove Food -->
			<div class="tab-content">
					<h1 class="tab" title="Add Food to Menu">Add Food</h1>
						<form method="post" action="insert.jsp">
						  <table class="centertable">
							<tr>
							  <th>Name</th>
							  <th>Vegan</th>
							  <th>Gluten-Free</th>
							  <th>Price</th>
							</tr>
							<tr>
							  <td> <input type="text" name="name" , class="mywidth"><br></td>
							  <td> <select name="vegan" style="width:150px;  height: 33px;">
								<option value="1">Yes</option>
								<option value="0">No</option>
							</select>

							  <td> <select name="gluten" style="width:150px;  height: 33px;">
								<option value="1">Yes</option>
								<option value="0">No</option>
							</select>
							  <td> <input type="text" name="price" , class="mywidth"><br></td>
							</tr>
						  </table>
						  <br>
                <input type="hidden" name="itemToAdd" value="0">
						  <input type="submit" value="Add Food to Menu">
						</form>
			</div>

			<div class="tab-content">
					<h1 class="tab" title="title for page 2">Remove Foods</h1>

			<div  class="table-responsive" style = " display:block;overflow-y:scroll; height:400px; ">
			<%
				ResultSet foodToDelete = StatementRecordset1.executeQuery("SELECT * FROM bar.fooditem INNER JOIN bar.pricetable on bar.fooditem.p_id = bar.pricetable.p_id");
			%>
			<form method="post" action="delete.jsp" autocomplete="off">
				<table class="table">
				  <tr>
					<th>Choice</th>
					<th>Name</th>
					<th>Vegan</th>
					<th>Gluten-Free</th>
					<th>Price</th>
				  </tr>
						<%
							while (foodToDelete.next()) {
								String id = foodToDelete.getString("f_id");
						%>
								<tr>
								<td><input type="checkbox" name="id" value="<%= id %>"></td>
								<td>
									<%= foodToDelete.getString("fname") %>
								</td>
								<td>
									<%= foodToDelete.getInt("vegan") != 0  %>
								</td>
								<td>
									<%= foodToDelete.getInt("glutenfree")  != 0 %>
								</td>
								<td>
									$<%= foodToDelete.getInt("price") %>.00
								</td>
								</tr>
						<%
						}
						%>
				<tr>
					<th>Choice</th>
					<th>Name</th>
					<th>Vegan</th>
					<th>Gluten-Free</th>
					<th>Price</th>
				  </tr>
				</table>
				<br>
				<center><input type="submit" value="Remove Food From Menu">
          <input type="hidden" name="itemToDelete" value="0">
				<input type="reset" value="Clear Selection"></center>
			  </form>
				</div>
	  </div>



		<!-- Add/Remove Drinks -->
			<div class="tab-content">
					<h1 class="tab" title="title for page 3">Add Drinks</h1>
					<form method="post" action="insert.jsp">
					  <table class="centertable">
						<tr>
						  <th>Name</th>
						  <th>Alcoholic</th>
						  <th>Price</th>
						</tr>
						<tr>
						  <td> <input type="text" name="name" , class="mywidth"><br></td>
						  <td> <select name="alcoholic" style="width:150px;  height: 33px;">
							<option value="1">Yes</option>
							<option value="0">No</option>
						</select>
						 <td> <input type="text" name="price" , class="mywidth"><br></td>
						</tr>
					  </table>
					  <br>
					  <input type="submit" value="Add Drink to Menu">
					  <input type="hidden" name="itemToAdd" value="1">
					</form>
			</div>

			<div class="tab-content">
					<h1 class="tab" title="title for page 3">Remove Drinks</h1>
					<div  class="table-responsive" style = " display:block;overflow-y:scroll; height:400px;">
						<%
							 ResultSet drinksToDelete = StatementRecordset1.executeQuery("SELECT * FROM bar.drinks INNER JOIN bar.pricetable on bar.drinks.p_id = bar.pricetable.p_id");
						%>
						<form method="post" action="delete.jsp" autocomplete="off">
							<table class="table">
							  <tr>
								<th>Choice</th>
								<th>Name</th>
								<th>Alcoholic</th>
								<th>Price</th>
							  </tr>
									<%
										while (drinksToDelete.next()) {
											String id = drinksToDelete.getString("d_id");
									%>
									<tr>
										<td><input type="checkbox" name="id" value="<%= id %>"></td>
										<td>
											<%= drinksToDelete.getString("dname") %>
										</td>
										<td>
											<%= drinksToDelete.getInt("alchohol") != 0  %>
										</td>
										<td>
											$<%= drinksToDelete.getInt("price") %>.00
										</td>
									</tr>
									<%
									}
									%>
								<tr>
								<th>Choice</th>
								<th>Name</th>
								<th>Alcoholic</th>
								<th>Price</th>
							  </tr>
							</table>
							<br>
							<center><input type="submit" value="Remove Drinks from Menu">
                <input type="hidden" name="itemToDelete" value="1">
							<input type="reset" value="Clear Selection"></center>
						  </form>
					  </div>
			</div>



			<!-- Add/Remove Employees -->
			<div class="tab-content">
					<h1 class="tab" title="title for page 3">Add Employees</h1>
					<form method="post" action="insert.jsp">
						  <table class="centertable">
							<tr>
							  <th>Employee ID</th>
							  <th>Name</th>
							  <th>Salary</th>
							  <th>Date Hired</th>
							   <th>Manager ID</th>
							</tr>
							<tr>
							  <td> <input type="text" name="employeeID" , class="mywidth"><br></td>
							  <td> <input type="text" name="name" , class="mywidth"><br></td>
							  <td> <input type="text" name="salary" , class="mywidth"><br></td>
							  <td> <input type="text" name="datehired" , class="mywidth"><br></td>
							 <td> <input type="text" name="managerid" , class="mywidth"><br></td>
							</tr>
						  </table>
						  <br>
                <input type="hidden" name="itemToAdd" value="2">
						  <input type="submit" value="Add Employee">

						</form>
			</div>

			<div class="tab-content">
					<h1 class="tab" title="title for page 3">Remove Employees</h1>
					<div  class="table-responsive" style = " display:block;overflow-y:scroll; height:400px;">
						<%
							 ResultSet employeesToDelete = StatementRecordset1.executeQuery("SELECT * FROM bar.employee");
						%>
						<form method="post" action="delete.jsp" autocomplete="off">
							<table class="table">
							  <tr>
								<th>Choice</th>
								<th>ID</th>
								<th>Name</th>
								<th>Salary</th>
								<th>Date Hired</th>
								<th>Manager ID</th>
							  </tr>
									<%
										while (employeesToDelete.next()) {
											int id = employeesToDelete.getInt("e_id");
									%>
									<tr>
										<td><input type="checkbox" name="id" value="<%= id %>"></td>
										<td>
											<%= employeesToDelete.getInt("e_id") %>
										</td>
										<td>
											<%= employeesToDelete.getString("ename") %>
										</td>
										<td>
											$<%= employeesToDelete.getInt("salary")  %>.00 / year
										</td>
										<td>
											<%= employeesToDelete.getString("datehired") %>
										</td>
										<td>
											<%= employeesToDelete.getInt("m_id") %>
										</td>
									</tr>
									<%
									}
									%>
								<tr>
								<th>Choice</th>
								<th>ID</th>
								<th>Name</th>
								<th>Salary</th>
								<th>Date Hired</th>
								<th>Manager ID</th>
							  </tr>
							</table>
							<br>
							<center><input type="submit" value="Fire Employee">
                <input type="hidden" name="itemToDelete" value="2">
							<input type="reset" value="Clear Selection"></center>
						  </form>
					  </div>
			</div>



			<!-- View Purchase History -->
			<!-- <div class="tab-content">
					<h1 class="tab" title="title for page 3">View Purchases</h1>
					<p>This is the content of tab 6.5 on container 1</p>
			</div>
			-->



			<!-- Data Analysis -->
			<div class="tab-content">
					<h1 class="tab" title="title for page 3">Data Analysis</h1>
					<form method="post" action="search.jsp">
					  <table class="centertable">
						<tr>
						  <th>Data Analysis Type</th>
						  <th>Parameter</th>
						</tr>
						<tr>
						  <td> <select name="queryType" style="width:350px;  height: 33px;">
							<option value="1">All Food Cheaper than Price:</option>
							<option value="2">All Drinks Cheaper than Price:</option>
							<option value="0">All Customers Served by Employee: </option>
							<option value="3">Total Spent on Food by Customer:</option>
						</select>
						 <td> <input type="text" name="parameter" , class="mywidth"><br></td>
						</tr>
					  </table>
					  <br>
					  <input type="submit" value="Return Results">

					</form>
			</div>

		</span>
		</div>
	</section>


	<!--feedback-->
	<section class="contact" id="contact">
	<div class="container">
		<div class="heading">
				<img class="dividerline" src="img/sep.png" alt="">
				<h2>Info</h2>
				<img class="dividerline" src="img/sep.png" alt="">
				<h3> Here is a report on how we designed this project: </h3>
				<h3> Click one of our social links below.<br>
				 You can find coupons on our Github page! Don't miss out! </h3>
		</div>
	</div>
	</section>

	<!--footer-->
	<section class="footer" id="footer">
	<p class="text-center">
		<a href="#wrapper" class="gototop"><i class="fa fa-angle-double-up fa-2x"></i></a>
	</p>
	<div class="container">
		<ul>
			<li><a href="https://github.com/Modus28/bar-info-db"><i class="fa fa-github"></i></a></li>
		</ul>
	</div>
	</section>

</div><!--wrapper end-->

<!-- Open Source Javascript Library Imports-->
<script src="js/jquery.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/menustick.js"></script>
<script src="js/parallax.js"></script>
<script src="js/easing.js"></script>
<script src="js/wow.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/masonry.js"></script>
<script src="js/imgloaded.js"></script>
<script src="js/classie.js"></script>
<script src="js/colorfinder.js"></script>
<script src="js/common.js"></script>
<script src="js/tabs.js"></script>

<script type="text/javascript">
jQuery(function($) {
$(document).ready( function() {
  //enabling stickUp on the '.navbar-wrapper' class
	$('.navbar-wrapper').stickUp({
		parts: {
		  0: 'banner',
		  1: 'aboutus',
		  2: 'specialties',
		  3: 'feedback',
		  4: 'administrative',
		  5: 'contact'
		},
		itemClass: 'menuItem',
		itemHover: 'active',
		topMargin: 'auto'
		});
	});
});
</script>
</body>
</html>
