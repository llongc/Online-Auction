<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>autobid</title>
</head>
<body>
	<%
		int itemid = Integer.parseInt(request.getParameter("id"));
	%>
	<form method="post" action="confirmauto.jsp?id=<%=itemid %>">
		<table>
				<tr>
				<td>Your upper limit:</td><td><input type="number" name="lmt"></td>
				</tr>
		</table>
		<input type="submit" value="submit">
	</form>
	<a href='dashboard.jsp'>Back to dashboard</a>
</body>
</html>