<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ConfirmBid</title>
</head>
<body>
	<%
		int itemid = Integer.parseInt(request.getParameter("id"));
		String email = ""+session.getAttribute("username");
		int p = Integer.parseInt(request.getParameter("bid"));
		int a = Integer.parseInt(request.getParameter("anonymous"));
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			//String str = "select BidPrice from CurrentBid where ItemID = "+itemid;
			//ResultSet result = stmt.executeQuery(str);
			//if(result.next()){
				//if(p < result.getInt("BidPrice")){
					//out.println("<script>alert('Your bid is lower than the current bidprice, try again.')</script>");
				//} else {
					String str="INSERT INTO Bid (BidTime, BidPrice, ItemID, Email, Anonymous) values (?, ?, ?, ?,?);";
					PreparedStatement ps = con.prepareStatement(str);
					Timestamp biddate = new Timestamp(System.currentTimeMillis());
					ps.setTimestamp(1,biddate);
					ps.setInt(2,p);
					ps.setInt(3,itemid);
					ps.setString(4,email);
					ps.setInt(5, a);
					ps.executeUpdate();
					
					//str = "select BidID from Bid where Email='"+email+"' order by BidTime limit 1";
					//result = stmt.executeQuery(str);
					//if(result.next()){
						
						/*int bidid = result.getInt("BidID");	 
						
						str="update CurrentBid set BidID=?, BidPrice =?, Email=? where ItemID=?";
						ps = con.prepareStatement(str);
						ps.setInt(1,bidid);
						ps.setInt(2,p);
						ps.setString(3,email);
						ps.setInt(4,itemid);
						ps.executeUpdate();
						
				
					}
					
				}
			} else {
				if(){
					
				} else{
					str="INSERT INTO Bid (BidTime, BidPrice, ItemID, Email) values (?, ?, ?, ?);";
					PreparedStatement ps = con.prepareStatement(str);
					Timestamp biddate = new Timestamp(System.currentTimeMillis());
					ps.setTimestamp(1,biddate);
					ps.setInt(2,p);
					ps.setInt(3,itemid);
					ps.setString(4,email);
				}
			}*/
			con.close();
		} catch (Exception ex) {
			out.println(ex);
			if(ex.equals("java.sql.SQLException: error for bid price smaller then current price")){
				try{
					ApplicationDB db = new ApplicationDB();	
				
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
					String str="delete from Bid where ItemID="+itemid+" and BidPrice="+p;
					stmt.execute(str);
					con.close();
				} catch (Exception x){
					out.println(x);
					
				}
			} else {
				try{
					
					ApplicationDB db = new ApplicationDB();	
					
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
					
					String str="select * from BidInfo where ItemID="+itemid;
					ResultSet rst2 = stmt.executeQuery(str);
					int inc = 0;
					String emal="";
					if(rst2.next()){
						inc = rst2.getInt("Increment");
					}
					p = inc+p;
					str = "select * from AutomaticlyBid where ItemID ="+itemid;
					ResultSet rst = stmt.executeQuery(str);
					if(rst.next()){
						emal=rst.getString("Email");
					}
					out.println("emal is "+email+", p is "+p);
					str = "update Bid set BidPrice = "+p+" where ItemID="+itemid+" and Email='"+emal+"' order by BidPrice limit 1";
					out.println(str);
					PreparedStatement ps = con.prepareStatement(str);
					ps.executeUpdate();
					con.close();
				} catch (Exception c){
					out.println(c);
				}
			}
		}
	
			
	%>
	
	<p><a href='itempage.jsp?id=<%=itemid%>'>Back to item page</a></p>
	<p><a href='autobid.jsp?id=<%=itemid%>'>Automatic Bidding</a></p>
	<a href='dashboard.jsp'>Back to dashboard</a>
</body>
</html>