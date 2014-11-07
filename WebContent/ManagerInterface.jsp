<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html >
<html>
<head>
<title>Login</title>
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

<p> Enter a movie name to browse it's details </p>

<form action = "Main">

<p> Movie name <input type = "text" name = "mname"/></p>
<p><input type = "submit" value = "Submit"/></p>
<p><input type = "hidden" name = "action" value = "3"/></p> 	//Action 0 corresponds to login sequence
</form>




</body>
</html>