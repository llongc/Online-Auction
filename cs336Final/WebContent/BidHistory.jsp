<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BidHistoryPage</title>
</head>
<body>
<p>Bid History:</p>


<table border="1">
<tr>
<th>Bidder</th>
<th>Bid Amount</th>
<th>Bid Time</th>
</tr>
<% 
		int itemid = Integer.parseInt(request.getParameter("id"));
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String str="select Email, BidPrice, BidTime, Anonymous from Bid where ItemID = "+itemid+" order by BidTime desc";
		ResultSet result = stmt.executeQuery(str);
		while(result.next()){
		
			String bidder = result.getString("Email");
			int bidAmount= result.getInt("BidPrice");
			String bidTime = result.getString("BidTime");
			int a = result.getInt("Anonymous");
			String l = bidder;
			if(a==1){
				l=bidder.substring(0, 2)+"****";
				
			}
			
	
		
		out.print("<tr><th><a href='BidderHistory.jsp?name="+bidder+"'>"+ l+ "</a></th>");
		out.print("<th>" + bidAmount +"</th>");
		out.print("<th>"+ bidTime + "</th></tr>");
	}
	con.close();
	%>

</table>
</body>
</html>