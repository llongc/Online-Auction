<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email Page</title>
</head>
<body>
<p>Email Page:</p>
<form method="post" action="emailcfm.jsp">
<table>

<tr>
<td>To:</td><td><input type="text" name="to"></td>
</tr>

<tr>
<td>Subject:</td><td><input type="text" name="subject"></td>
</tr>

<tr>
<td>Content:</td><td><br><textarea name="detail" style="width:350px;height:150px;"></textarea>
</td>
</tr>

</table>
<br>

<input type="submit" value="Send">
</form>


</body>
</html>