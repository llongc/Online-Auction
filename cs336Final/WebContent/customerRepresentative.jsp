<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Representative Dashboard</title>
</head>
<body>
<p>Customer Representative Dashboard</p>
<br>
<p>Reset Password</p>
<table border='0.1'>
	<tr><td>list</td></tr>
	<%
	ApplicationDB db = new ApplicationDB();	
	
		Connection con = db.getConnection();
	
		Statement state = con.createStatement();
	  	
		String str = "select Detail from Email where T='CustomerRepresentative'";
		
		ResultSet rst = state.executeQuery(str);
		while(rst.next()){
			
			String Fr = rst.getString("Fr");
			
			String detail = rst.getString("Detail");
			out.print("<tr><th>"+detail + "</th></tr>");
				
		}
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	
	%>
</table>
<form method="post" action="rspwd.jsp">

<table>
<tr>
<td>Email:</td><td><input type="text" name="email"></td>
</tr>

<tr>
<td>New Password:</td><td><input type="password" name="newpassword"></td>
</tr>
</table>
<br>
<input type="submit" value="submit">
</form>
<br>
<p>-----------------------------------------------------</p>
<br>
<p>Remove Bids</p>
<form method="post" action="rmbid.jsp">
<table>
<tr>
<td>Item id:</td><td><input type="text" name="itemid"></td>
</tr>

<tr>
<td>User Email:</td><td><input type="text" name="email"></td>
</tr>
</table>

<br>
<input type="submit" value="submit">
</form>

<p>Modify: </p>
<form method="post" action="modify.jsp">
<table>
<tr>
<td>Item id:</td><td><input type="text" name="itemid"></td>
</tr>

</table>

<br>
<input type="submit" value="submit">
</form>

<p>Remove auction:</p>
<form method="post" action="rmauc.jsp">
<table>
<tr>
<td>Item id:</td><td><input type="text" name="itemid"></td>
</tr>

</table>

<br>
<input type="submit" value="submit">
</form>

<p><a href=qpage.jsp>Questions</a></p>

<p><a href='logout.jsp'>Log out</a></p>

</body>
</html>