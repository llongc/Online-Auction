<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SimilarItemPage</title>
</head>
<body>
<p>Similar Item Page:</p>


<table border="1">
<tr>
<th>Item Name</th>
<th>Current Bid</th>
<th>Closing date</th>
</tr>

<%
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//get ItemID from itempage
		int id1 =Integer.parseInt(request.getParameter("id"));
		
		//get comparsion attributes from the original item
		String str1 ="select h.Type, h.Connectivities, h.Usee from Headphone as h where h.ItemID = '" + id1 +"';";
		ResultSet result1 = stmt.executeQuery(str1);
		if(result1.next()){
			
			String oType=result1.getString("h.Type");
			String oConnectivities=result1.getString("h.Connectivities");
			String oUsee=result1.getString("h.Usee");
			
			//get ItemID of all items which match comparsion attributes with the original item
			String str2 ="select h2.ItemID from Headphone as h2 where h2.Type='"+oType+"'and h2.Connectivities='"+oConnectivities+"'and h2.Usee='"+oUsee+"';";
			Statement stmt2 = con.createStatement();
			ResultSet result2 = stmt2.executeQuery(str2);
			
			while(result2.next()){
				int itemid = result2.getInt("h2.ItemID");
				

				//get item name, bid price, closing date for display table
				String str3="select h.ItemID,h.name, cb.BidPrice, bi.CloseDateAndTime from Headphone as h join CurrentBid as cb on h.ItemID=cb.ItemID join BidInfo as bi on h.ItemID=bi.ItemID where h.ItemID = '" + itemid +"';";
				Statement stmt3 = con.createStatement();
				ResultSet result3 = stmt3.executeQuery(str3);
				
				while(result3.next()){
					int d = result3.getInt("h.ItemID");
					String itemName = result3.getString("h.name");
					int currentBid = result3.getInt("cb.BidPrice");
					String closingDate = result3.getString("bi.CloseDateAndTime");
					
					out.print("<tr><th><a href='itempage.jsp?id="+d+"'>"+ itemName+ "</a></th>");
					out.print("<th>" + currentBid +"</th>");
					out.print("<th>"+ closingDate + "</th></tr>");
				}

			}
		}
		con.close();
		
		%>
</table>


</body>
</html>