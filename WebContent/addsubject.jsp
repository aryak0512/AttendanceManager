<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<meta charset="ISO-8859-1">
<title>INSERT SUBJECT</title>
<%String Msg=(String)request.getAttribute("msg");%>
<%String subj=(String)request.getAttribute("subj");%>
<%String table_name=(String)request.getAttribute("table_name");%>
<style>
<!--header css-->

* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
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


h2{
color: yellow;
background-color: red;
border-top:0px;
padding:10px;
}
fieldset{
background-image: url("C:\xampp\htdocs\formbg1.jpg");
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
</head>

<body background="C:\xampp\htdocs\formbg1.jpg">
<div class="header">
  <a href="#default" class="logo">Aryak's Attendance Manager
      <br>
      <font color="red"><p id="name">FOR EVER-STRESSED ENGINEERING STUDENTS.</p></font>
  </a>
  <div class="header-right">
    <p id="label" align="right">Your id is:
    <font color="red"><u><%out.println(table_name) ;%></u></p></font>
    <a class="active" href="AppServlet?id=back&table_name=<%out.println(table_name) ;%>">Home</a>
    <a href="AppServlet">Log-out</a>
  </div>
</div>
<p class="text-center">
<br><br>
</p>

<div class="container">
<form action="AppServlet?id=create_subject&table_name=<% out.println(table_name);%>" method="post">
<fieldset>
<legend>Enter subject details:</legend>
<br>
<p class="text-center">
<b>ENTER SUBJECT NAME:</b>
</p>
<p class="text-center">
<input type="text" name="subject_name" value="<% out.println(subj);%>" required></input>
</p>

<p class="text-center">
-------------------------------------------------
</p>

<p class="text-center">
<b>Total no. of lectures:</b>
</p>

<p class="text-center">
<select name="total_lectures" required>
    <option value="0">00</option>
    <option value="1">01</option>
    <option value="2">02</option>
    <option value="3">03</option>
    <option value="4">04</option>
    <option value="5">05</option>
    <option value="6">06</option>
    <option value="7">07</option>
    <option value="8">08</option>
    <option value="9">09</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
    
  </select>
</p>
<br>
<p class="text-center">
<b>No. of lectures attended:</b>
</p>

<p class="text-center">
<select name="attended_lectures" required>
    <option value="0">00</option>
    <option value="1">01</option>
    <option value="2">02</option>
    <option value="3">03</option>
    <option value="4">04</option>
    <option value="5">05</option>
    <option value="6">06</option>
    <option value="7">07</option>
    <option value="8">08</option>
    <option value="9">09</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
  </select>
</p>

<p class="text-center">
<font color="red"><% out.println(Msg);%></font>
</p>

<p class="text-center">
-------------------------------------------------
</p>

<p class="text-center">
<input type="submit" class="btn btn-primary" value="CREATE SUBJECT">
</p>
<br>
<p class="text-center">
<a href="AppServlet?id=back&table_name=<% out.println(table_name);%>">BACK TO HOME PAGE</a>
<br>
<br>
<br>
<br>
<br>
</p>
</fieldset>
</form>
</div>
<div class="footer">
  <p>Copyright &copy; Aryak's Attendance Manager System 2020 | MADE BY: Aryak Deshpande</p>
</div>
</body>
</html>