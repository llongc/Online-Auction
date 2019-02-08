<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>resetpassword</title>
</head>
<body>
	<%
		try{
			String eml = request.getParameter("email");
		
		String pwd = request.getParameter("newpassword");
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String str = "update EndUser set Password='"+pwd+"' where Email = '"+eml+"';";
		PreparedStatement ps = con.prepareStatement(str);
		ps.executeUpdate();
		
		} catch (Exception ex){
			out.println(ex);
		}
	%>
	<a href='customerRepresentative.jsp'>back</a>
</body>
</html>