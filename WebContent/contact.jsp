<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
<!--header css-->

* {box-sizing: border-box;}


.header {
  overflow: hidden;
  background-color: black;
  padding: 10px;
  border-bottom: 0px;
}

.header a {
  float: left;
  color: white;
  font-weight:bold;
  text-align: center;
  padding: 10px 10px;
  text-decoration: none;
  font-size: 15px; 
  line-height: 25px;
  border: 10px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
  padding-bottom:5px;
  color:yellow;
  font-family: 'Open Sans', sans-serif;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: #4CAF50;
  color: white;
}

.header-right {
  float: right;
}
#name{
font-weight:lighter;
font-size: 15px;
}
#label{
color:white;
}
@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
#line{
font-style: italic;
}
.footer {
   padding:10px;
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: black;
   color: white;
   text-align: center;
}



body{
background-image: url("A5.jpg");
background-size: 100% 100%;
background-size: cover ;
font-family: Arial, Helvetica, sans-serif;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<meta charset="ISO-8859-1">
<title>CONTACT ME</title>
</head>
<body>
<div id="page">
<div class="header">
  <a href="#default" class="logo">Aryak's Attendance Manager
      <br>
      <font color="red"><p id="name">FOR EVER-STRESSED ENGINEERING STUDENTS.</p></font>
  </a>
  <div class="header-right">
    <p id="label" align="right">We will help you recover your password</p>
    <a href="AppServlet" style="text-decoration: none;">Login</a>
    <a href="AppServlet?id=signup" style="text-decoration: none;">Register</a>
    <a class ="active" href="AppServlet?id=contact" style="text-decoration: none;">Contact me</a>
  </div>
</div>
<br><br>
<p class="text-center">
<h2 align="center">CONTACT US</h2>
</p>
<hr>

<div class="container">
<form action="AppServlet?id=recover_password" method="post">
<p class="text-center">

<font color="blue">PLEASE ENTER VALID ENTRIES:</font>
<BR><BR>
Name: <input type="text" name="name" placeholder="Enter valid full name" required/><font color="red">*</font>
<BR><BR>
Username: <input type="text" name="uname" placeholder="Enter valid username" required/><font color="red">*</font>

<br><br>

Email ID: <input type="email" name="email" placeholder="Enter valid email" required/><font color="red">*</font>

<br>
<br>

<input type="submit" class="btn btn-warning" value="RECOVER PASSWORD"/>
<br>
<br>

<p align="center"><b><i>We will get back to you within 24 hours through this information</i></b></p>

</p>



</form>
</div>
<div class="footer">
  <p>Copyright &copy; Aryak's Attendance Manager System 2020 | MADE BY: Aryak Deshpande</p>
</div>
</div>
</body>
</html>