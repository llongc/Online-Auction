<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions</title>
</head>
<body>
	<table border='2'>
		<%
			String id = ""+session.getAttribute("username");
			out.println("<tr><td>Question</td></tr>");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String str = "select Qid, Title from Question where EUEmail='" +id+"';" ;
			ResultSet rst = stmt.executeQuery(str);
			while(rst.next()){
				out.println("<tr><td><a href='qst.jsp?id="+rst.getInt("Qid")+"'>"+rst.getString("Title")+"</a></td></tr>");
			}
			con.close();
		
		%>
		
	
	
	</table>
	<form method="post" action='qpst.jsp'>
		<table>
			<tr>
			<td>Title:</td><td><input type="text" name="title"></td>
			</tr>
			<tr>
			<td>Detail:</td><td><br><textarea name="detail" style="width:350px;height:150px;"></textarea>
			</td>
			</tr>
		</table>
		<input type="submit" value="submit">
	</form>
	<a href='qs.jsp'>search question</a>
	<a href='dashboard.jsp'>back to dashboard</a>
</body>
</html>