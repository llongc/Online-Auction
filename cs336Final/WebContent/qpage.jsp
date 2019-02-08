<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>question page</title>
</head>
<body>
	<table border='2'>
		<%
			out.println("<tr><td>Question</td><td>From</td></tr>");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String str = "select Qid, Title, EUEmail from Question;" ;
			ResultSet rst = stmt.executeQuery(str);
			while(rst.next()){
				out.println("<tr><td><a href='crply.jsp?id="+rst.getInt("Qid")+"'>"+rst.getString("Title")+"</a></td>"+rst.getString("EUEmail")+"<td></td></tr>");
			}
			con.close();
		
		%>
	</table>
	<a href='customerRepresentative.jsp'>back to dashboard</a>
</body>
</html>