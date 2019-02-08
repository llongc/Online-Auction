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
	
	
	
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Parse out the information from the newBeer.jsp
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			if (email.isEmpty() || password.isEmpty()){
				out.print("<p>Miss something, failed.</P>");
			} else {
				//make an update SQL query
				String insert1 = "INSERT INTO CustomerRepresentative values (?, ?, ?, ?);";
				
				//make a statement object that will execute the query
				PreparedStatement ps = con.prepareStatement(insert1);

				//add query parameters to the statement object
				ps.setString(1, email);
				ps.setString(2, fname);
				ps.setString(3, lname);
				ps.setString(4, password);

				//run the query against the database
				ps.executeUpdate();
				out.print("<p>Sucessfully create your account!</p>");
			} 
			
			//close the connection
			con.close();

			//notify the user that the update succeeded.
			

		} catch (Exception ex) {
		}
	%>
	<form method="post" action="administrativeStaff.jsp">
		<input type="submit" value="Back"><br>
	</form>
</body>
</html>