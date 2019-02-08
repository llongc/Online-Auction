<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SellerHistoryPage</title>
</head>
<body>
<p>Seller History:</p>
<form method="post">

<p>Seller:<%= request.getParameter("id") %></p>

<table border="1">
<tr>
<th>Item Name</th>
<th>Bid Amount</th>
<th>Closing date</th>
</tr>
	<% 
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String str="select h.ItemID, h.Name, cb.BidPrice, bi.CloseDateAndTime from Headphone as h join CurrentBid as cb join BidInfo as bi where h.ItemID=bi.ItemID and h.ItemID=cb.ItemID and h.SEmail='"+request.getParameter("id")+"';";
		
		ResultSet result = stmt.executeQuery(str);
		while(result.next()){
			int itemid=result.getInt("h.ItemID");
			String ItemName = result.getString("h.name");
			int bidAmount= result.getInt("cb.BidPrice");
			String closeTime = result.getString("bi.CloseDateAndTime");
			
		
		out.print("<tr><th><a href='itempage.jsp?id=" + itemid + "'>" +ItemName + "</a></th>");
		out.print("<th>" + bidAmount +"</th>");
		out.print("<th>"+ closeTime + "</th></tr>");
	}
	con.close();
	%>

</table>


</form>
</body>
</html>