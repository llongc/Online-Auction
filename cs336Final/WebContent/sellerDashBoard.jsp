<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seller DashBoard</title>
</head>
<body>
<%
try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
	
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String eml = ""+session.getAttribute("username");
		
		
		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		String str = "SELECT Email FROM Seller where Email=" + "'"+eml+"';" ;
	
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
		
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		if(result.next()){
			//Parse out the result of the query
			String email = result.getString("Email");
			
	
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			if(email.equals(eml)){
				out.println("<p>Seller Dashboard:</p>");
				out.println("<table border='1'><tr><th>item name</th><th>current price</th><th>closing date</th></tr>");
				con = db.getConnection();
				stmt = con.createStatement();
				str = "select h.Name, h.ItemID, bi.CloseDateAndTime from BidInfo as bi join Headphone as h on h.ItemID = bi.ItemID where SEmail = '" + eml + "';";
				result = stmt.executeQuery(str);
				while(result.next()){
					int id= result.getInt("h.ItemID");
					String name = result.getString("h.Name");
					String date = result.getString("bi.CloseDateAndTime");
					String str1 = "select cb.BidPrice from CurrentBid as cb join Headphone as h on cb.ItemID = h.ItemID where h.ItemID = " + id;
					String a = "No one bid yet";
					Statement stat = con.createStatement();
					ResultSet rst = stat.executeQuery(str1);
					if(rst.next()){
						a = rst.getString("cb.BidPrice");
	
					}
					
					out.print("<tr><th><a href='itempage.jsp?id=" + id + "'>" +name + "</a></th>");
					out.print("<th>"+ a + "</th>");
					out.print("<th>"+ date + "</th></tr>");
					
				}
				out.println("</table>");
				out.println("<p><a href='PostPage.jsp'>Post</a><p>");
				con.close();
			} else {
				
				out.println("we found matched data but something wrong happened");
			}
			
			
		} else {
			out.println("<a href='NewSellerRegisterPage.jsp'>New Seller?</a>");
			
		}
	} catch (Exception ex) {
		out.println(ex);
		out.println("failed");
	}

%>

</body>
</html>