<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			Statement stmt = con.createStatement();
			
			String keyword =request.getParameter("keyword");
			
	
			if(keyword.isEmpty()){
				keyword = "";
			} else {
				keyword = " Title like '%"+keyword+"%'";
			}	
			
					
			String str1 = "select Qid, Title from Question where "+keyword;
			ResultSet result1 = stmt.executeQuery(str1);
			out.println("<table border='2'>");
			
			out.println("<tr><td>Question</td><td>From</td></tr>");
			while(result1.next()){
				
				out.println("<tr><td><a href='qst.jsp?id="+result1.getInt("Qid")+"'>"+result1.getString("Title")+"</a></td>"+result1.getString("EUEmail")+"<td></td></tr>");
					
				
			
			
			}
			out.println("</table>");
			con.close();
	%>
</body>
</html>