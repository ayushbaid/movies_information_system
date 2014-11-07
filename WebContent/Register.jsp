<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html >
<html>
<head>
<title>Register</title>
<% 
String bgColor = request.getParameter("bgColor");
if ((bgColor == null)||(bgColor.trim().equals(""))){ 
bgColor = "azure"; 
} 
%>
<style>
h1 {font-family:calibri; font-size:60px; color:crimson; text-align:center;}
p {font-family:calibri;}
</style>
</head>
<body>

<BODY BGCOLOR="<%= bgColor %>"> 
<h1> Movies Database </h1>
<%= new java.util.Date() %> <br>

<p> Please enter your details to register </p>

<form action = "Main">
<p> Register as a User </p>
<p> User ID <input type = "text" name = "uid"/></p>
<p> Password <input type = "text" name = "pwd"/></p>
<p><input type = "submit" value = "Register as a User"/></p>
<p><input type = "hidden" name = "action" value = "1"/></p> 	//Action 1 corresponds to user reg
</form>

<form action = "Main">
<p> Register as a Manager </p>
<p> User ID <input type = "text" name = "uid"/></p>
<p> Password <input type = "text" name = "pwd"/></p>
<p><input type = "hidden" name = "action" value = "2"/></p> 	//Action 2 corresponds to manager reg
<p><input type = "submit" value = "Register as a Manager"/></p>
</form>


</body>
</html>
