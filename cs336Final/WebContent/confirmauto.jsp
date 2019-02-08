<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>confirmauto</title>
</head>
<body>
	<%
	int itemid = Integer.parseInt(request.getParameter("id"));
	int lmt = Integer.parseInt(request.getParameter("lmt"));
	String email = ""+session.getAttribute("username");
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String str = "insert into AutomaticlyBid (Email, ItemID, Lmt) values (?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1, email);
		ps.setInt(2, itemid);
		ps.setInt(3, lmt);
		ps.executeUpdate();
		
		con.close();
	} catch (Exception ex) {
		out.println(ex);
		
	}
	%>
	<a href='dashboard.jsp'>Back to dashboard</a>
</body>
</html>