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

<p> Registration has failed! </p>
<p> You have not entered all fields. Please try again </p>

<form action = "Register.jsp">
<p><input type = "submit" value = "Return to Registration Page"/></p>
</form>


<form action = "Register.jsp">
<p> Don't have an ID?  </p>
<p><input type = "submit" value = "Click here to register"/></p>
</form>


</body>
</html>