<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrative</title>
</head>
<body>
<p>Create account for a customer representative:</p>
<br>
<form method="post" action="createcheck.jsp">
<table>
<tr>
<td>First Name:</td><td><input type="text" name="fname"></td>
</tr>

<tr>
<td>Last Name:</td><td><input type="text" name="lname"></td>
</tr>

<tr>
<td>Email:</td><td><input type="text" name="email"></td>
</tr>

<tr>
<td>Password:</td><td><input type="password" name="password"></td>
</tr>

</table>
<input type="submit" value="submit">
</form>

<br>
<p>General sales report:</p>
<form method="post" action="rst.jsp">
total earnings<input type="radio" name="command" value="totalEarnings"><br>
earnings per item<input type="radio" name="command" value="earningsPerItem"><br>
earnings per item type<input type="radio" name="command" value="earningsPerItemType"><br>
earnings per end user<input type="radio" name="command" value="earningsPerEndUser"><br>
best selling: items<input type="radio" name="command" value="bestSellingItems"><br>
best selling: end users<input type="radio" name="command" value="bestSellingEndUsers"><br>
<input type="submit" value="submit">
</form>



<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>