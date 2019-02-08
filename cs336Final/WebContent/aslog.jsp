<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="ascheck.jsp">
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
</body>
</html>