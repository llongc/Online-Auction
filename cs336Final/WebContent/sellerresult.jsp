<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sellerresult</title>
</head>
<body>
	<%
		String email = ""+session.getAttribute("username");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String postcode = request.getParameter("postcode");
		String phone = request.getParameter("phone");
		if(country.isEmpty()|| address1.isEmpty()||state.isEmpty()||postcode.isEmpty()){
			out.print("<p>Miss something, failed.</P>");
		}else{
	
			try {

				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
	
				//Create a SQL statement
	
				//Parse out the information from the newBeer.jsp
				
			
			
				//make an update SQL query
				String insert1 = "INSERT INTO Seller values (?, ?, ?, ?, ?, ?, ?);";
				
				//make a statement object that will execute the query
				PreparedStatement ps = con.prepareStatement(insert1);

				//add query parameters to the statement object
				
				ps.setString(1, email);
				ps.setString(2, address1);
				ps.setString(3, address2);
				ps.setInt(4, Integer.parseInt(postcode));
				ps.setString(5, state);
				ps.setLong(6,Long.parseLong(phone));
				ps.setString(7,country);
				//run the query against the database
				ps.executeUpdate();
				out.print("<p>Sucessfully create your seller account!</p>");
			
			
			//close the connection
			con.close();

			//notify the user that the update succeeded.
			

			} catch (Exception ex) {
				out.println(ex);
			}
		}
	%>
	<form method="post" action="sellerDashBoard.jsp">
		<input type="submit" value="Back to seller dashboard"><br>
	</form>
</body>
</html>