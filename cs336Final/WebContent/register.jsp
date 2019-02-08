<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/register.css"/>
<title>Register Page</title>
</head>
<body>
	<div id="frame">
		<form method="post" action="registerst.jsp">
			<table id="register">
			<tr>    
			<td>Email: </td><td><input type="email" name="email"></td>
			</tr>
			<tr>
			<td>Password: </td><td><input type="password" name="password"></td>
			</tr>
			<tr>
			<td>Confirm Password: </td><td><input type="password" name="cpassword"></td>
			</tr>
			<tr>
			<td>First Name: </td><td><input type="text" name="fname"></td>
			</tr>
			<tr>
			<td>Last Name: </td><td><input type="text" name="lname"></td>
			</tr>
			</table>
			<br>
			<input type="submit" value="Register" class="button">
		</form>
		<form method="post" action="index.jsp">
			<input type="submit" value="Back to log in" class="button">
		</form>
	</div>
</body>
</html>