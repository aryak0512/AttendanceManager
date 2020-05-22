<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.List" %>
    <%@page import="com.beans.Subject" %>
<!DOCTYPE html>
<html>
<head>
<!-- header css -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<meta charset="ISO-8859-1">
<title>REPORT CARD</title>
<style type="text/css">

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

<!--header css-->

* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-image:url("formbg1.jpg");
  background-size:cover;
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


   #subjects {
  font-family: helvetica;
  border-collapse: collapse;
  text-align: center;
}
h2{
color: yellow;
background-color: red;
padding:10px;
}
#subjects td, #subjects th {
  border: 1px solid black;
  padding: 8px;
}

#subjects tr:nth-child(even){background-color: #f2f2f2;}

#subjects tr:hover {background-color: #ddd;}

#subjects th {
  padding-top: 8px;
  padding-bottom: 5px;
  text-align: center;
  background-color: #4CAF50;
  color: white;
}
h3{
  color: black;
  font-family: arial;
  font-size: 20px;
  font-weight: normal;
  margin: 5px;
  margin-top: 5px;
}

</style>
</head>
<body >

<%
String msg1= (String)request.getAttribute("msg1");
String Percent=(String)request.getAttribute("percent");
double percent = Double.parseDouble(Percent);
System.out.println(percent);
String table_name=(String)request.getAttribute("table_name");
%>
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

<br>
<p class="text-center">
<h2>WELCOME TO ARYAK'S ATTENDANCE MANAGER SYSTEM</h2>
</p>

<div class="container">
<br>
<p class="text-center"><font color="red"><b><u>YOUR REPORT CARD:</u></b></font></p>
<br>
<p class="text-center">



<h3>
<p class="text-center">
<font color="red"><% out.println(msg1);%></font>
</p>
</h3>
<br>
<div>     
  <table align="center" id="subjects">
    <thead>
      <tr>
        <th>NAME</th>
        <th>ATTENDED</th>
        <th>TOTAL</th>
      </tr>
    </thead>
    <tbody>
        
<% 
List <Subject> List = (List<Subject>)request.getAttribute("records1");
for(Subject s:List){
%>

      <tr>
        <td><%out.println(s.getName());%></td>
        <td><%out.println(s.getAttended()); %></td>
        <td><%out.println(s.getTotal()); %></td>
      </tr>
    <% 
}
%>
</p>
    
    </tbody>
  </table>
</div>
<br>
<h3 class="text-center">
Your attendance is:
</h3>

<h1>
<p class="text-center">
<font color="blue"><% out.println(percent+"%");%></font>
</p>
</h1>


<p class="text-center">
<font color="red">(*Minimum attendance criteria=75%)</font>
</p>


<p class="text-center">
<a href="AppServlet?id=back&table_name=<% out.println(table_name);%>">BACK TO HOME PAGE</a>
<br>
<br>
<br>
<br>
</p>
</div>

<div class="footer">
  <p>Copyright &copy; Aryak's Attendance Manager System 2020 | MADE BY: Aryak Deshpande</p>
</div>
</body>
</html>