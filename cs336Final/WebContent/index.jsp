<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
	<div id="frame">
		<form method="post" action="check.jsp">
			<table id="loginfo">
			<tr>    
			<td>Email: </td><td><input type="text" name="email"></td>
			</tr>
			<tr>
			<td>Password: </td><td><input type="password" name="password"></td>
			</tr>
			</table>
			<br>
			<input type="submit" value="Log in" class="button">
		</form>
			<form method="post" action="register.jsp">
				<input type="submit" value="Register" class="button"><br>
			</form>
			<form method="get" action="forget.jsp">
				<input type="submit" value="Forgot password?" class="button"><br>
			</form>
			<form method="get" action="crlog.jsp">
				<input type="submit" value="IF Customer Representative" class="button"><br>
			</form>
			<form method="get" action="aslog.jsp">
				<input type="submit" value="IF Administrative Staff" class="button"><br>
			</form>
	</div>
</body>
</html>