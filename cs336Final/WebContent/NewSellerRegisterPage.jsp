<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New seller register page</title>
</head>
<body>
	<p>New Seller Register Page</p>
	<form method="post" action="sellerresult.jsp">
		<table>
			<tr>
			<td>Country:</td><td><input type="text" name="country"></td>
			</tr>
			<tr>
			<td>Address 1:</td><td><input type="text" name="address1"></td>
			</tr>
			<tr>
			<td>Address 2:</td><td><input type="text" name="address2"></td>
			</tr>
			<tr>
			<td>State:</td><td><input type="text" name="state"></td>
			</tr>
			<tr>
			<td>Postcode:</td><td><input type="number" name="postcode"></td>
			</tr>
			<tr>
			<td>Phone:</td><td><input type="number" name="phone"></td>
			</tr>
		
		</table>
		<input type="submit" value="Register">
	</form>

</body>
</html>