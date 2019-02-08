<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>alertcheck</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Parse out the information from the newBeer.jsp
			String itemid = request.getParameter("item");
			String email = ""+session.getAttribute("username");
			
			//make an update SQL query
			String insert1 = "INSERT INTO Alert values (?, ?);";
				
			//make a statement object that will execute the query
			PreparedStatement ps = con.prepareStatement(insert1);

			//add query parameters to the statement object
			ps.setString(1, email);
			ps.setString(2, itemid);

			//run the query against the database
			ps.executeUpdate();
			out.print("<p>Sucessfully alert it!</p>");
			
			//close the connection
			con.close();

			//notify the user that the update succeeded.
			

		} catch (Exception ex) {
		}
	%>
	<p><a href='dashboard.jsp'>Back to dashboard</a></p>
</body>
</html>