<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cfm</title>
</head>
<body>
	<%
		String eml = request.getParameter("email");
		String pwd = request.getParameter("password");
		Timestamp date = new Timestamp(System.currentTimeMillis());
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			String str = "insert into Email values (?, ?, ?, ?,?);";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, eml);
			ps.setString(2, "CustomerRepresentative");
			ps.setTimestamp(3, date);
			ps.setString(4,"ResetPassword");
			ps.setString(5,"email: "+eml+"; new password: "+pwd);
			ps.executeUpdate();
			out.println("submitted your request");
			con.close();
		} catch (Exception ex) {
			out.println(ex);
		}
	%>
	<a href='index.jsp'>back</a>
</body>
</html>