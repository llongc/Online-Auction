<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AskForRemovingBid</title>
</head>
<body>
	<p>Table for customer representatives:</p>
	<table>
		<tr>
	    <th>Name</th>
	    <th>Email</th> 
	  </tr>
	  <% 
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
	  	
		String str = "select * from CustomerRepresentative";
		
		ResultSet result = stmt.executeQuery(str);
		while(result.next()){
			//Parse out the result of the query
			out.print("<tr><th>"+result.getString("FirstName")+" "+result.getString("LastName")+"</th>");
			out.print("<th><a href='EmailPage.jsp?id=" + result.getString("Email") + "'>" +result.getString("Email") + "</a></th></tr>");
				
		}
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	  %>
	</table>
</body>
</html>