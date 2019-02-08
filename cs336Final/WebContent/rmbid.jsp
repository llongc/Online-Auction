<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			String eml = request.getParameter("email");
			int itemid = Integer.parseInt(request.getParameter("itemid"));
			String creml = ""+session.getAttribute("username");
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			String str = "select BidID from Bid where Email = '"+eml+"' and ItemID="+itemid+" order by BidPrice desc limit 1;";
			ResultSet result = stmt.executeQuery(str);
			if(result.next()){
				int bidid = result.getInt("BidID");
				String s = "insert into RemoveBid values (?, ? ,?)";
				PreparedStatement ps = con.prepareStatement(s);
				ps.setString(1, creml);
				ps.setInt(2, bidid);
				ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
				ps.executeUpdate();
				s="delete from Bid where BidID = ?";
				PreparedStatement ps1 = con.prepareStatement(s);
				ps1.setInt(1, bidid);
				ps1.executeUpdate();
				
				
			}
		
		} catch(Exception ex) {
			out.println(ex);
			
		}
	
	
	%>
	<a href='customerRepresentative.jsp'>back</a>
</body>
</html>