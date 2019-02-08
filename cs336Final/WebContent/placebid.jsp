<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>placebid</title>
</head>
<body>
	<%
		int itemid = Integer.parseInt(request.getParameter("id"));
	%>
	<form method="post" action="confirmbid.jsp?id=<%=itemid %>">
		<table>
				<tr>
				<td>Place Bid:</td><td><input type="number" name="bid"></td>
				</tr>
				<tr>
				<td>Do you want to be anonymous?</td><td><select name="anonymous" size=1>
				<option value="0">No</option>
				<option value="1">Yes</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="Place">
	</form>
</body>
</html>