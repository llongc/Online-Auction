<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<p>Hello <%out.print(session.getAttribute("name")); %></p>
	<p><a href='search.jsp'>search</a></p>
	<p>Alert list Table</p>
	<table border='1'>
	  <tr>
	    <th>Name</th>
	    <th>Current Bid</th> 
	    <th>Close Time</th>
	  </tr>
	  <% 
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
	  	
		String str = "select h.ItemID, h.Name, bi.CloseDateAndTime from Headphone as h join BidInfo as bi on h.ItemID = bi.ItemID join Alert as a on a.ItemID = h.ItemID where a.Email = '" + session.getAttribute("username") + "';";
		
		ResultSet result = stmt.executeQuery(str);
		while(result.next()){
			int id= result.getInt("h.ItemID");
			String name = result.getString("h.Name");
			String date = result.getString("bi.CloseDateAndTime");
			String a = "No one bid yet";
			String str1 = "select cb.BidPrice from CurrentBid as cb join Headphone as h on cb.ItemID = h.ItemID where h.ItemID = " + id;
			//Parse out the result of the query
			Statement stat = con.createStatement();
			ResultSet rst = stat.executeQuery(str1);
			if(rst.next()){
				a = rst.getString("cb.BidPrice");

			}
			out.print("<tr><th><a href='itempage.jsp?id=" + id + "'>" +name + "</a></th>");
			out.print("<th>" + a +"</th>");
			out.print("<th>"+ date + "</th></tr>");
				
		}
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	  %>
	</table>
	<p>Email</p>
	<table border='2'>
		<tr>
			<td>From</td>
			<td>Subject</td>
			<td>Content</td>
			<td>Time</td>
		</tr>
		<%
				Connection c = db.getConnection();

				Statement state = c.createStatement();
			  	
				str = "select Fr, tm, Sub, Detail from Email where T='"+session.getAttribute("username")+"'";
				
				ResultSet rst = state.executeQuery(str);
				while(rst.next()){
					
					String Fr = rst.getString("Fr");
					String tm = rst.getString("tm");
					String sub = rst.getString("Sub");
					String detail = rst.getString("Detail");
					out.print("<tr><th>" +Fr + "</th>");
					out.print("<th>" + sub +"</th>");
					out.print("<th>"+detail + "</th>");
					out.print("<th>"+tm+"</th></tr>");
						
				}
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		
		
		%>
	</table>
	<!--  <p>Result:</p>
	<table>
		<tr>
			<th>item name</th>
			<th>result</th>
		</tr>
		
	</table>-->
	<a href='EmailPage.jsp'>Send an email</a>
	<p><a href='sellerDashBoard.jsp'>If Seller</a></p>
	<p><a href='askremovingbid.jsp'>Ask for removing bid</a></p>
	<p><a href='question.jsp'>Questions</p>
	<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>