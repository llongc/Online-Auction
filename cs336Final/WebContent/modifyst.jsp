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
	
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		int ItemID = Integer.parseInt(request.getParameter("id"));
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
		
		
		if(name.isEmpty()){
			name = "";
		} else {
			name = ", Name='"+name+"'";
		}
		if(type.isEmpty()){
			type = "";
		} else {
			type = ", Type='"+type+"'";
		}
		if(connectivity.isEmpty()){
			connectivity = "";
		} else {
			connectivity = " , Connectivities='" + connectivity+"'";
		}
		if(cond.isEmpty()){
			cond = "";
		} else {
			cond = ", Condt='" + cond+"'";
		}
		
		if(use.isEmpty()){
			use= "";
		} else {
			use = ", Usee='"+use+"'";
		}
		
		if(connectorsize.isEmpty()){
			connectorsize = "";
		} else {
			connectorsize =", ConnectorSize='" + connectorsize+"'";
		}
		if(color.isEmpty()){
			color = "";
		} else {
			color = ", Color='"+color+"'"; 
		}
		if(measure.isEmpty()){
			measure = "";
		} else {
			measure = ", Measure='" + measure + "'";
		}
		if(brand.isEmpty()){
			brand="";
		} else {
			brand=", brand='"+brand+"'";
		}
		if(inip.isEmpty()){
			inip="";
		} else {
			inip = ", InitialPrice = "+inip;
		}
		if(incre.isEmpty()){
			incre="";
		} else {
			incre=", Increment="+incre;
		}
		if(closingdate.isEmpty()){
			closingdate="";
		} else {
			closingdate=", CloseDateAndTime = "+closingdate.replace("T", " ")+":00";
		}
		if(minp.isEmpty()){
			minp="";
		} else {
			minp=", MinPrice ="+minp;
		} 
		if(shipp.isEmpty()){
			shipp="";
		} else {
			shipp=", ShippingPrice = "+shipp;
		}
		if(name.isEmpty() && type.isEmpty() && cond.isEmpty() && use.isEmpty() && brand.isEmpty() && measure.isEmpty() && connectivity.isEmpty() && connectorsize.isEmpty() && color.isEmpty()){
		
		} else {
			try {
				String insert1 = name+type+cond+use+connectivity+connectorsize+measure+color+brand;
				insert1=insert1.replaceFirst(",", "");
				//make an update SQL query
				insert1 = "update Headphone set "+insert1+" where ItemID="+ItemID+";";
				//make a statement object that will execute the query
				PreparedStatement ps = con.prepareStatement(insert1);

				//add query parameters to the statement object
				//run the query against the database
				ps.executeUpdate();
			} catch (Exception ex) {
				out.println(ex);
			}
		}
		if(inip.isEmpty() && minp.isEmpty() && closingdate.isEmpty() && shipp.isEmpty() && incre.isEmpty()){
			
		} else {
			try {
				String str = inip+minp+closingdate+shipp+incre;
				str=str.replaceFirst(",","");
				str = "update BidInfo set "+str +" where ItemID="+ItemID+";";
				PreparedStatement rt = con.prepareStatement(str);
				rt.executeUpdate();
			} catch (Exception ex) {
				
			}	
		
		}
				con.close();


		
	%>
	<form method="post" action="customerRepresentative.jsp">
		<input type="submit" value="Back to dashboard"><br>
	</form>
</body>
</html>