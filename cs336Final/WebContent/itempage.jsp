<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item Page</title>
</head>
<body>
	<%!
		String name,condt,use,color,cntvt,type,cntsize,brand,measure,pstdate,seller,closedate, currentbid = "";
		int initp,shipp,inc,status = 0;
	%>
	<% 
		int itemid = Integer.parseInt(request.getParameter("id"));
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String str = "select * from Headphone where ItemID = '" + itemid + "';";
		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
		
		if(result.next()){
			name = result.getString("Name");
			condt = result.getString("Condt");
			use = result.getString("Usee");
			color = result.getString("Color");
			cntvt = result.getString("Connectivities");
			type = result.getString("Type");
			cntsize = result.getString("ConnectorSize");
			brand = result.getString("Brand");
			measure = result.getString("Measure");
			pstdate = result.getString("PostDate");
			seller = result.getString("SEmail");
			status = result.getInt("status");
		} 
		
		str = "select * from BidInfo where ItemID = '" + itemid + "';";
		result = stmt.executeQuery(str);
		if(result.next()){
			initp = result.getInt("InitialPrice");
			closedate = result.getString("CloseDateAndTime");
			shipp = result.getInt("ShippingPrice");
			inc = result.getInt("Increment");
		}
		
		str = "select * from CurrentBid where ItemID = '" + itemid + "';";
		result = stmt.executeQuery(str);
		if(result.next()){
			currentbid = ""+result.getInt("BidPrice");
			
		} else {
			currentbid = "no bids";
		}
		con.close();
		
	%>
	<form action="alertcheck.jsp" method="post"><p>alert it!<input type="submit" value="<%=itemid %>" name="item"></p></form>
	<table>
		<tr>
			<td>Name: </td><td><%=name %></td>
		</tr>
		<tr>
			<td>Condition: </td><td><%=condt %></td>
		</tr>
		<tr>
			<td>Type: </td><td><%=type %></td>
		</tr>
		<tr>
			<td>Color: </td><td><%=color %></td>
		</tr>
		<tr>
			<td>Connectivities: </td><td><%=cntvt %></td>
		</tr>
		<tr>
			<td>Use: </td><td><%=use %></td>
		</tr>
		<tr>
			<td>Connector Size: </td><td><%=cntsize %></td>
		</tr>
		<tr>
			<td>Brand: </td><td><%=brand %></td>
		</tr>
		<tr>
			<td>Measure: </td><td><%=measure %></td>
		</tr>
		<tr>
			<td>Post Date: </td><td><%=pstdate %></td>
		</tr>
		<tr>
			<td>Close Date: </td><td><%=closedate %></td>
		</tr>
		<tr>
			<td>Initial Price: </td><td><%=initp %></td>
		</tr>
		<tr>
			<td>Increment: </td><td><%=inc %></td>
		</tr>
		<tr>
			<td>Current Bid: </td><td><%=currentbid %></td>
		</tr>
		<tr>
			<td>Shipping Price: </td><td><%=shipp %></td>
		</tr>
		<tr>
			<td>Seller Email: </td><td><%=seller %></td>
		</tr>
	</table>
	
	<%
		if (status != 1){
			out.println("<p><a href='pdcheck.jsp?id="+itemid+"'>Place Bid</a></p><p><a href='BidHistory.jsp?id="+itemid+"'>Bid History</a></p><p><a href='SellerHistory.jsp?id="+seller+"'>Seller History</a></p><p><a href='SimilarItemPage.jsp?id="+itemid+"&type="+type+"&cntvt="+cntvt+"&use="+use+"'>Similar Items</a></p>");
		}
	%>
	<!--<p><a href='pdcheck.jsp?id=<%=itemid %>'>Place Bid</a></p>
	<p><a href='BidHistory.jsp?id=<%=itemid%>'>Bid History</a></p>
	<p><a href='SellerHistory.jsp?id=<%=seller%>'>Seller History</a></p>
	<p><a href='SimilarItemPage.jsp?id=<%=itemid %>&type=<%=type%>&cntvt=<%=cntvt %>&use=<%=use %>>'>Similar Items</a></p>-->
	<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>