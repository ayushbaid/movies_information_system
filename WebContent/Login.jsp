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

<p> Please enter your details to login. </p>

<form action = "Main">

<p> User ID <input type = "text" name = "uid"/></p>
<p> Password <input type = "text" name = "pwd"/></p>
<p><input type = "submit" value = "Login"/></p>
<p><input type = "hidden" name = "action" value = "0"/></p> 	//Action 0 corresponds to login sequence
</form>


<form action = "Register.jsp">
<p> Don't have an ID?  </p>
<p><input type = "submit" value = "Click here to register"/></p>
</form>


</body>
</html>