<!DOCTYPE html>
<!-- EECS 341 Spring 2017 Final Project - Daniel Grigsby -->
<!-- Daniel Grigsby, Dominique Owens, Lee Kelvin, Dina Benayad-Cherif -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.action {
    float: left;
    margin: 5px;
    padding: 15px;
    max-width: 300px;
    height: 300px;
    border: 2px solid blue;
} 
</style>
</head>
<body>
<h1>EECS 341: Final Project</h1>
<div class="action">
  <h2>Insert</h2>
  <p>Add Food Items</p>
  <form action="server.jsp" method="get">
 <textarea name="text"></textarea>
<input type="submit" value="Submit Query"/>
</form>

</div>

<div class="action">
  <h2>Remove</h2>
  <p>Remove Food Items</p> 
<form action="server.jsp" method="get">
 <textarea name="text"></textarea>
<input type="submit" value="Submit Query"/>
</form>
</div>

<div class="action">
  <h2>Search</h2>
  <p>Look at our menu!</p>
<form action="server.jsp" method="get">
 <textarea name="text"></textarea>
<input type="submit" value="Submit Query"/>
</form>
</form>
</div>



</body>
</html>