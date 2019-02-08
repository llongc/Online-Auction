<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>emailcfm</title>
</head>
<body>
	<%
		String T = request.getParameter("to");
		String sub = request.getParameter("subject");
		String detail = request.getParameter("detail");
		String from = ""+session.getAttribute("username");
		Timestamp tm = new Timestamp(System.currentTimeMillis());
		if(T.isEmpty() || sub.isEmpty()) {
			out.println("<a href='EmailPage.jsp'>miss something, back</a>");
		} else {
			try {
		
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
		
				String str = "insert into Email values (?, ?, ?,?,?)";
				PreparedStatement ps = con.prepareStatement(str);
				ps.setString(1, from);
				ps.setString(2,T);
				ps.setTimestamp(3,tm);
				ps.setString(4,sub);
				ps.setString(5,detail);
				ps.executeUpdate();
				
				con.close();
				out.println("<a href='dashboard.jsp'>success, back</a>");
		
				
			} catch (Exception ex) {
				out.println(ex);
				out.println("failed");
			}
		}
	%>
</body>
</html>