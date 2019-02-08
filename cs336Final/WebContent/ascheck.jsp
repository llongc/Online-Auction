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
		String pwd = request.getParameter("password");
		String eml = request.getParameter("email");
		if(pwd.isEmpty() || eml.isEmpty()) {
			out.println("failed");
		} else {
			try {
		
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = con.createStatement();
				
				//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
				String str = "SELECT Password, Name FROM AdministrativeStaff where Email=" + "'"+eml+"';" ;
		
				//Run the query against the DB
				ResultSet result = stmt.executeQuery(str);
				
				//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
				if(result.next()){
					//Parse out the result of the query
					String tpwd = result.getString("Password");
					String fname = result.getString("Name");
					
					
			
					//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
					con.close();
					
					if(tpwd.equals(pwd)){
						session.setAttribute("username", eml);
						session.setAttribute("name",fname);
						out.println("Welcome " + session.getAttribute("name") + "!");
						out.println("<a href='administrativeStaff.jsp'>Dashboard</a>");
						
						
					} else {
						out.println("Failed to log in.");
						
					}
				} else {
					out.println("no match data.");
					
				}
			} catch (Exception ex) {
				out.println(ex);
				out.println("failed");
			}
		}
			
	
			
	%>
</body>
</html>