<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>postrst</title>
</head>
<body>
	<%
		String semail = ""+session.getAttribute("username");
		String name = request.getParameter("name");
		String cond = request.getParameter("condition");
		String type = request.getParameter("type");
		String brand = request.getParameter("brand");
		String connectorsize = request.getParameter("connectorsize");
		String connectivity = request.getParameter("connectivity");
		String use = request.getParameter("use");
		String color = request.getParameter("color");
		String measure = request.getParameter("measure");
		String inip = request.getParameter("InitialPrice");
		String incre = request.getParameter("increment");
		String closingdate = request.getParameter("closingDate");
		String minp = request.getParameter("minimumPrice");
		String shipp = request.getParameter("shippingPrice");
		Timestamp postdate = new Timestamp(System.currentTimeMillis());
		int status = 0;
		if(shipp.isEmpty()){
			shipp = "0";
		}
		
		if(name.isEmpty()||cond.isEmpty() || type.isEmpty()||inip.isEmpty()||closingdate.isEmpty()||incre.isEmpty()||minp.isEmpty()||Integer.parseInt(minp) < Integer.parseInt(inip)|| postdate.after(Timestamp.valueOf(closingdate.replace("T", " ")+":00"))){
			out.print("<p>Miss something, failed.</P>");
		}else{
	
			try {

				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
	
				//Create a SQL statement
				Statement stmt = con.createStatement();
				
				//make an update SQL query
				String insert1 = "INSERT INTO Headphone (Name, Condt, Usee, Color, Connectivities, Type, ConnectorSize, Brand, Measure, PostDate, SEmail,status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?)";
				
				//make a statement object that will execute the query
				PreparedStatement ps = con.prepareStatement(insert1);

				//add query parameters to the statement object
				
				ps.setString(1, name);
				ps.setString(2, cond);
				ps.setString(3, use);
				ps.setString(4, color);
				ps.setString(5,connectivity);
				ps.setString(6,type);
				ps.setString(7, connectorsize);
				ps.setString(8, brand);
				ps.setString(9, measure);
				ps.setTimestamp(10, postdate);
				ps.setString(11,semail);
				ps.setInt(12, status);
				//run the query against the database
				ps.executeUpdate();
				
				String str = "select ItemID from Headphone where SEmail = '"+ semail +"' order by PostDate desc limit 1";
				ResultSet result = stmt.executeQuery(str);
				if(result.next()){
					
					int itemid = result.getInt("ItemID");	 
					
					insert1="INSERT INTO BidInfo values (?, ?, ?, ?, ?, ?)";
					PreparedStatement pss = con.prepareStatement(insert1);
					pss.setInt(1, itemid);
					pss.setInt(2, Integer.parseInt(inip));
					pss.setTimestamp(3, Timestamp.valueOf(closingdate.replace("T", " ")+":00"));
					pss.setInt(4, Integer.parseInt(incre));
					pss.setInt(5, Integer.parseInt(minp));
					pss.setInt(6, Integer.parseInt(shipp));
					pss.executeUpdate();
					
			
				}
				//close the connection
				con.close();

				//notify the user that the update succeeded.
				out.print("<p>Sucessfully post!</p>");

			} catch (Exception ex) {
				out.println(ex);
			}
		}
	%>
	<form method="post" action="sellerDashBoard.jsp">
		<input type="submit" value="Back to seller dashboard"><br>
	</form>
</body>
</html>