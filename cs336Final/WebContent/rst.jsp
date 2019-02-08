<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result</title>
</head>
<body>
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "";
		String rst = request.getParameter("command");
		if(rst.equals("totalEarnings")){
			str="select sum(Price) from final;";
			ResultSet result = stmt.executeQuery(str);
			if(result.next()){
				int sum = result.getInt("sum(Price)");
  				out.print("<table><tr><th>"+ sum + "</th></tr></table>");
				
			}
			
		}else if(rst.equals("earningsPerItem")){
			//Since we let user to enter their own item name, in here we define that items with same connectivities, brand, type, connector size and use to be same items in order to generalize sales report 
			
		
  				out.println("<p>earnings per item REPORT</p>");
  				out.print("<table border='1'><tr><th>sum</th><th>Connectivities</th><th>Brand</th><th>Type</th><th>Connector Size</th><th>Use</th></tr>");
				str= "select h.ItemID from Headphone as h group by h.Connectivities, h.Brand, h.Type, h.ConnectorSize, h.Usee";
  				ResultSet result1 = stmt.executeQuery(str);
  				while(result1.next()){
  					int itemid = result1.getInt("h.ItemID");
  					
  					String str2 ="select sum(f.Price), h.Connectivities, h.Brand, h.Type, h.ConnectorSize, h.Usee from final as f join Headphone as h on f.ItemID=h.ItemID where f.ItemID = "+ itemid +" group by h.Connectivities, h.Brand, h.Type, h.ConnectorSize, h.Usee;";
  					Statement stmt2 = con.createStatement();
  					ResultSet result2 = stmt2.executeQuery(str2);
  					
  					while(result2.next()){
  						int EPI = result2.getInt("sum(f.Price)");
  						String connectivities = result2.getString("h.Connectivities");
  						String brand = result2.getString("h.Brand");
  						String type = result2.getString("h.Type");
  						String connectorsize = result2.getString("h.ConnectorSize");
  						String use = result2.getString("h.Usee");
  					
  					out.print("<tr><th>"+ EPI +"</th><th>"+ connectivities +"</th><th>"+ brand +"</th><th>"+ type +"</th><th>"+ connectorsize+"</th><th>"+ use +"</th></tr></table>");
  					}
  				}
		}else if(rst.equals("earningsPerItemType")){
			out.println("<p>earnings per item type REPORT</p>");
			out.print("<table border='1'><tr><th>sum</th><th>type</th></tr>");
			str = "select sum(f.Price), h.Type from final as f join Headphone as h on h.ItemID=f.ItemID group by h.Type";
			ResultSet result = stmt.executeQuery(str);
				while(result.next()){
					int EPIT = result.getInt("sum(f.price)");
					String type = result.getString("h.Type");
					
					
					out.print("<tr><th>"+ EPIT + "</th></tr>");
					out.print("<tr><th>"+type+"</th></tr>");
					
				}
				out.print("</table>");
		}else if(rst.equals("earningsPerEndUser")){
			out.println("<p>earnings per end user REPORT</p>");
			out.print("<table border='1'><tr><th>sum</th><th>End User</th></tr>");
			str = "select sum(f.Price), f.Email from final as f join Headphone as h on f.ItemID=h.ItemID group by f.Email";
			ResultSet result = stmt.executeQuery(str);
				while(result.next()){
					int EPEU = result.getInt("sum(f.price)");
					String eml = result.getString("f.Email");
					out.print("<tr><th>"+ EPEU + "</th></tr>");
					out.print("<tr><th>"+eml+"</th></tr>");
				}
				out.print("</table>");
		} else if(rst.equals("bestSellingItems")){
			
			out.println("<p>earnings per item REPORT</p>");
				out.print("<table border='1'><tr><th>sum</th><th>Connectivities</th><th>Brand</th><th>Type</th><th>Connector Size</th><th>Use</th></tr>");
			str= "select h.ItemID from Headphone as h group by h.Connectivities, h.Brand, h.Type, h.ConnectorSize, h.Usee";
				ResultSet result1 = stmt.executeQuery(str);
				while(result1.next()){
					int itemid = result1.getInt("h.ItemID");
					
					String str2 ="select sum(f.Price), h.Connectivities, h.Brand, h.Type, h.ConnectorSize, h.Usee from final as f join Headphone as h on f.ItemID=h.ItemID where f.ItemID = "+ itemid +" group by h.Connectivities, h.Brand, h.Type, h.ConnectorSize, h.Usee order by sum(f.Price) desc;";
					Statement stmt2 = con.createStatement();
					ResultSet result2 = stmt2.executeQuery(str2);
					
					while(result2.next()){
						int EPI = result2.getInt("sum(f.Price)");
						String connectivities = result2.getString("h.Connectivities");
						String brand = result2.getString("h.Brand");
						String type = result2.getString("h.Type");
						String connectorsize = result2.getString("h.ConnectorSize");
						String use = result2.getString("h.Usee");
					
					out.print("<tr><th>"+ EPI +"</th><th>"+ connectivities +"</th><th>"+ brand +"</th><th>"+ type +"</th><th>"+ connectorsize+"</th><th>"+ use +"</th></tr></table>");
					}
				}
			
			
			
			
		} else {
						
			out.println("<p>Best buyers</p >");
				out.print("<table border='1'><tr><th>Buyer</th><th>No. of total purchase</th></tr>");
				str = "select f.Email, sum(f.Price) from final as f group by f.Email order by sum(f.Price) DESC";
				ResultSet result = stmt.executeQuery(str);
				while(result.next()){
					String buyer = result.getString("f.Email");
					int totalPurchase = result.getInt("count(f.email)");
					out.print("<tr><th>"+ buyer + "</th><th>"+ totalPurchase +"</th></tr></table>");
				}
				
			
				
				
			
		}
		
	
		con.close();
	%>
		<p><a href='logout.jsp'>Log out</a></p>
		<p><a href='administrativeStaff.jsp'>back</a></p>
</body>
</html>