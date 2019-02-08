<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BidderHistoryPage</title>
</head>
<body>
<p>Bidder History:</p>
<table border=1>
<tr>
<th>Item Name</th>
<th>No. of bids</th>
<th>Last bid time</th>
</tr>
<%
//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//get bidder name 
		String bidder =request.getParameter("name");
		
		String str = "select h.Name, count(*), Max(b.BidTime) from Headphone as h join Bid as b on h.ItemID=b.ItemID where b.Email= '" + bidder +"' group by b.ItemID;";
		
		ResultSet result = stmt.executeQuery(str);
		while(result.next()){
			String name =result.getString("h.Name");
			int bidCounts=result.getInt("count(*)");
			String lastBidTime=result.getString("Max(b.BidTime)");
			
			out.print("<tr><th>"+ name+ "</a></th>");
			out.print("<th>" + bidCounts +"</th>");
			out.print("<th>"+ lastBidTime + "</th></tr>");

			
		}
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		%>

</table>

</body>
</html>