<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.beans.*" %>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- header css -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>FIRST PAGE</title>
<%String Msg=(String)request.getAttribute("msg");
String table_name=(String)request.getAttribute("table_name");
%>

<script type="text/javascript">
function deletePrompt(){
	return confirm("Are you sure you want to delete this subject?");
}
</script>

<style type="text/css">
   #subjects {
  font-family: helvetica;
  border-collapse: collapse;
  text-align: center;
}
h2{
color: yellow;
background-color: red;
border-top: 0px;
padding:10px;
}

#subjects td, #subjects th {
  border: 1px solid black;
  padding: 8px;
  background-color:#f2f2f2;
  font-weight: bold;
}

#subjects tr:{background-color:#FFFFFF;}

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
#buttonlink:link, #buttonlink:visited {
  background-color: red;
  color: yellow;
  padding: 8px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border: 2px solid black;
}

#buttonlink:hover, #buttonlink:active {
  background-color:#4CAF50 ;
}

#buttons{
padding-bottom: 5px;
padding-left: 5px;
padding-right: 5px;
padding-top: 5px;


margin-bottom: 5px;
margin-left: 5px;
margin-right: 5px;
margin-top: 5px;
}

<!--header css-->

* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-image: url("A5.jpg");
background-size: 100% 100%;
background-size: cover ;
background-repeat: no-repeat;

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

<body>


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
<br><br><br>
</p>

<div class="container">
<p class="text-center">
<h3 align="center"><b>YOUR SUBJECT LIST:</b></h3> 
</p>
<p class="text-center">
<font color="red"><% out.println(Msg);%></font>
</p>

<p class="text-center">


<div>     
  <table align="center" id="subjects">
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>ATTENDED</th>
        <th>TOTAL</th>
        <th>OPTIONS</th>
      </tr>
    </thead>
    <tbody>
        
<% 
List <Subject> list = (List<Subject>)request.getAttribute("list");
for(Subject s:list){
%>

      <tr>
      	<td><%out.println(s.getId());%></td>
        <td><%out.println(s.getName());%></td>
        <td><%out.println(s.getAttended()); %></td>
        <td><%out.println(s.getTotal()); %></td>
        <td ><a href="AppServlet?id=delete&sname=<%=s.getName() %>&table_name=<%out.println(table_name) ;%>"><button id="buttons" class="btn btn-primary" onclick="return deletePrompt()">REMOVE</button></a>
        <!--&nbsp;&nbsp;&nbsp;&nbsp;  -->
        <a href="AppServlet?id=update&sname=<%=s.getName() %>&table_name=<%out.println(table_name) ;%>"><button id="buttons" class="btn btn-primary">UPDATE</button></a></td>
      </tr>
    <% 
}
%>
</p>
    
    </tbody>
  </table>
</div>



<BR>
<br>
<p class="text-center">
<a href="AppServlet?id=add_subject&table_name=<% out.println(table_name);%>" id="buttonlink">ADD A NEW SUBJECT</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="AppServlet?id=calculate&table_name=<% out.println(table_name);%>" id="buttonlink">GENERATE REPORT CARD</a>
</p>
<br>
<br>
<br>
<br>
</div>
<div class="footer">
  <p>Copyright &copy; Aryak's Attendance Manager System 2020 | MADE BY: Aryak Deshpande</p>
</div>
</body>
</html>