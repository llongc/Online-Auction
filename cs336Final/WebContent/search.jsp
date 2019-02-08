<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
	<p>Search Page</p>

	<form method="post" action="SearchResult.jsp">
		<table>
		
			<tr>
			<td>Search by keyword:</td><td><input type="text" name="keyword"></td>
			</tr>
		</table>

	<p>Category</p>

	<table>
		<tr>
		<td>Type:</td><td><select name=type size=1>
		<option value="">      </option>
		<option value="In-ear-monitor & earbuds"> In-ear-monitor & earbuds</option>
		<option value="Over-ear"> Over-ear</option>
		<option value="On-ear"> On-ear</option>
		<option value="Other"> Other</option>
		</select></td>
		</tr>
	
		<tr>
		<td>Connectivities:</td><td><select name=connectivities size=1>
		<option value="">      </option>
		<option value="Wireless"> Wireless</option>
		<option value="Wired"> Wired</option>
		<option value="Bluetooth"> Bluetooth</option>
		<option value="Other"> Other</option>
		</select></td>
		</tr>
	
		<tr>
		<td>Condition:</td><td><select name=condition size=1>
		<option value="">      </option>
		<option value="New"> New</option>
		<option value="Used"> Used</option>
		<option value="Refurbished"> Refurbished</option>
		<option value="Open-box"> Open-box</option>
		</select></td>
		</tr>
	
		<tr>
		<td>Use:</td><td><select name="use" size=1>
		<option value="">      </option>
		<option value="Sports"> Sports</option>
		<option value="Gaming"> Gaming</option>
		<option value="Studio"> Studio</option>
		<option value="Kids"> Kids</option>
		<option value="Pro"> Pro</option>
		<option value="Foldable-design"> Foldable Design</option>
		<option value="DJ"> DJ</option>
		<option value="BehindTheNeck"> Behind the neck</option>
		<option value="Other"> Other</option>
		</select>
		</td>
		</tr>
	
		 <tr>
		    <td>Connector Size:</td><td><select name="connectorsize" size=1>
		    <option value="">      </option>
		    <option value="3.5mm"> 3.5mm</option>
		    <option value="2.5mm"> 2.5mm</option>
		    <option value="6.35mm"> 6.35mm</option>
		    <option value="Wireless"> Wireless </option>
		    <option value="Lightning"> Lightning </option>
		    <option value="Other"> other </option>
		    </select></td>
		</tr>
	
		<tr>
		    <td>Color:</td><td><select name="color" size=1>
		    <option value="">      </option>
		    <option value="black"> black</option>
		    <option value="white"> white</option>
		    <option value="multi"> multi </option>
		    <option value="blue"> blue </option>
		    <option value="red"> red </option>
		    <option value="pink"> pink</option>
		    <option value="gray"> gray </option>
		    <option value="silver"> silver </option>
		    <option value="other"> other</option>
		    </select>
		    </td>
		  </tr>
	
		<tr>
		    <td>Measures (only for in-ear/ear buds):</td><td><select name="measure" size=1>
		    <option value="">      </option>
		    <option value="other"> Other</option>
		    <option value="heart rate"> heart rate</option>
		    <option value="calories burned"> calories burned</option>
		    <option value="distance traveled"> Distance traveled</option>
		    <option value="speed"> Speed</option>
		    <option value="steps taken"> Steps taken</option>
		    <option value="pace"> Pace</option>
		    </select></td>
		</tr>
	</table>
	<p>Sort by:</p>
	<table>
		<tr>
		    <td>sort:</td><td><select name="sort" size=1>
		    <option value="">      </option>
		    <option value="Type"> type </option>
		    <option value="BidPrice"> bidding price </option>
		    <option value="CloseDateAndTime"> closing date</option>
		    <option value="Usee"> use </option>
		    <option value="Color"> color </option>
		    </select></td>
		</tr>
	</table>
	<input type="submit" value="Search">



</form>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>