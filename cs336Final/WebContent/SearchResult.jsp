<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>
</head>
<body>
<p>Search Results:</p>

<table border="1">
	<tr>
	<th>Item Name</th>
	<th>Current Bid</th>
	<th>Closing date</th>
	</tr>
	
	<%
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	
			Statement stmt = con.createStatement();
			
			String keyword =request.getParameter("keyword");
			String type = request.getParameter("type");
			String connectivities = request.getParameter("connectivities");
			String condition = request.getParameter("condition");
			String use = request.getParameter("use");
			String connectorsize = request.getParameter("connectorsize");
			String color = request.getParameter("color");
			String measure = request.getParameter("measure");
			String sort = request.getParameter("sort");
	
			if(keyword.isEmpty()){
				keyword = "";
			} else {
				keyword = " and h.Name like '%"+keyword+"%'";
			}
			if(type.isEmpty()){
				type = "";
			} else {
				type = " and h.Type = '"+type+"'";
			}
			if(connectivities.isEmpty()){
				connectivities = "";
			} else {
				connectivities = " and h.Connectivities='" + connectivities+"'";
			}
			if(condition.isEmpty()){
				condition = "";
			} else {
				condition = " and h.Condt='" + condition+"'";
			}
			
			if(use.isEmpty()){
				use= "";
			} else {
				use = " and h.Usee='"+use+"'";
			}
			
			if(connectorsize.isEmpty()){
				connectorsize = "";
			} else {
				connectorsize =" and h.ConnectorSize='" + connectorsize+"'";
			}
			if(color.isEmpty()){
				color = "";
			} else {
				color = " and h.Color='"+color+"'"; 
			}
			if(measure.isEmpty()){
				measure = "";
			} else {
				measure = " and h.Measure=" + measure + "'";
			}
			if(sort.isEmpty()){
				sort="";
			} else {
				sort = " order by "+ sort;
			}
					
					
			
					
			String str1 = "select h.ItemID from Headphone as h where h.status=0"+keyword+type+connectivities+condition+use+connectorsize+color+measure+sort;
			ResultSet result1 = stmt.executeQuery(str1);
			while(result1.next()){
				int ItemID1=result1.getInt("h.ItemID");
				
				String str2 ="select h.ItemID, h.Name, bi.CloseDateAndTime from Headphone as h join BidInfo as bi on h.ItemID=bi.ItemID where h.ItemID=" + ItemID1;
				Statement stmt2 = con.createStatement();
				ResultSet result2 = stmt2.executeQuery(str2);
				
				while(result2.next()){
					
					int id= result2.getInt("h.ItemID");
					String ItemName = result2.getString("h.Name");
					String closingDate = result2.getString("bi.CloseDateAndTime");
					String a = "No one bid yet";
					String str3 = "select cb.BidPrice from CurrentBid as cb join Headphone as h on cb.ItemID = h.ItemID where h.ItemID = " + id;
					//Parse out the result of the query
					Statement stat = con.createStatement();
					ResultSet rst = stat.executeQuery(str3);
					if(rst.next()){
						a = rst.getString("cb.BidPrice");

					}
					out.print("<tr><th><a href='itempage.jsp?id=" + id + "'>"+ ItemName+ "</a></th>");
					out.print("<th>" + a +"</th>");
					out.print("<th>"+ closingDate + "</th></tr>");
					
					
				}
			
			
			}
			con.close();
	%>



</table>
<p><a href='dashboard.jsp'>Back to search</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>