<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reply</title>
</head>
<body>
	<table border="1">
	<%
		try {
			int qid = Integer.parseInt(request.getParameter("id"));
			
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String str1 = "select Title, Detail from Question where Qid="+qid+";";
			ResultSet rst1 = stmt.executeQuery(str1);
			if(rst1.next()){
				String title = rst1.getString("Title");
				String detail = rst1.getString("Detail");
				out.println("<tr><td>TITLE</td><td>"+title+"</td></tr>");
				out.println("<tr><td>DETAIL</td><td>"+detail+"</td></tr>");
			}
			
			String str2 = "select Detail, CREmail from Reply where Qid="+qid+";";
			ResultSet rst2 = stmt.executeQuery(str2);
			while(rst2.next()){
				String dt = rst2.getString("Detail");
				String eml =rst2.getString("CREmail");
				out.println("<tr><td>REPLY</td><td>"+dt+"</td></tr>");
				out.println("<tr><td>by</td><td>"+eml+"</td></tr>");
				
			}
			
			
			con.close();
		} catch (Exception ex){
			
			out.println(ex);
		}
	
	%>
	</table>
	<p>Reply: </p>
	<form method="post" action='replyst.jsp?id=<%=Integer.parseInt(request.getParameter("id"))%>'>
		<table>
			<tr>
			<td>Detail:</td><td><br><textarea name="detail" style="width:350px;height:150px;"></textarea>
			</td>
			</tr>
		</table>
		<input type="submit" value="submit">
	</form>
	<a href='qpage.jsp'>back to questions</a>
</body>
</html>