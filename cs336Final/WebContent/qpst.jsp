<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>qpst</title>
</head>
<body>
	<%
		try {
			String eml = ""+session.getAttribute("username");
			
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
						
			String str1 = "insert into Question (Title, Detail, EUEmail) values (?,?,?)";
			PreparedStatement st = con.prepareStatement(str1);
			st.setString(1,request.getParameter("title"));
			st.setString(2,request.getParameter("detail"));
			st.setString(3,eml);
			st.executeUpdate();
			out.println("Success");
			con.close();
		} catch (Exception ex){
			
			out.println(ex);
		}
	
	%>
	<a href='question.jsp'>back to question page</a>
</body>
</html>