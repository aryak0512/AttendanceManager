<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
<!--header css-->

* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-image: url("A5.jpg");
background-size: 100% 100%;
background-size: cover ;

}

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

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>REGISTER</title>

</head>
<body>

<div class="header">
  <a href="#default" class="logo">Aryak's Attendance Manager
      <br>
      <font color="red"><p id="name">FOR EVER-STRESSED ENGINEERING STUDENTS.</p></font>
  </a>
  <div class="header-right">
    <p id="label" align="right">Please REGISTER yourself here</p>
    <a  href="AppServlet" style="text-decoration: none;">Login</a>
    <a class ="active" href="AppServlet?id=signup" style="text-decoration: none;">Register</a>
    <a href="AppServlet?id=contact" style="text-decoration: none;">Contact me</a>
  </div>
</div>
<br><br>
<p class="text-center">
<h2 align="center">REGISTRATION PAGE</h2>
</p>
<hr>

<div class="container">
<form action="AppServlet?id=register" method="post">

<p class="text-center">

<font color="blue">PLEASE ENTER A USERNAME AND A PASSWORD:</font>
<BR><BR>

Username: <input type="text" name="username" required/><font color="red">*</font>

<br><br>

Password: <input type="password" name="password" required/><font color="red">*</font>

<br>
<br>
<font><b>NOTE: Every character in username should be in lower case.</b></font>
<br>
<br>
<input type="submit" class="btn btn-warning" value="REGISTER"/>
<br>
<br>



</p>



</form>
</div>
<div class="footer">
  <p>Copyright &copy; Aryak's Attendance Manager System 2020 | MADE BY: Aryak Deshpande</p>
</div>
</body>
</html>