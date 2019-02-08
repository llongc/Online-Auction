<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PostPage</title>
	</head>
	<body>
<p>Post Page:</p>
	<form method="post" action="postrst.jsp">
		<table>

			<tr>
				<td>Item Name:</td><td><input type="text" name="name"></td>
			</tr>

			<tr>
				<td>Condition:</td><td><select name="condition" size=1>
				<option value="New"> New</option>
				<option value="Used"> Used</option>
				<option value="Refurbished"> Refurbished</option>
				<option value="Open-box"> Open-box</option>
				</select></td>
			</tr>

			<tr>
				<td>Type:</td><td><select name="type" size=1>
				<option value="In-ear-monitor and earbuds"> In-ear-monitor and Earbuds</option>
				<option value="Over-ear"> Over-ear</option>
				<option value="On-ear"> On-ear</option>
				<option value="Other"> Other</option>
				</select></td>
			</tr>

			<tr>
				<td>Brand:</td><td><input type="text" name="brand"></td>
			</tr>

			<tr>
				<td>Connector Size:</td><td><select name="connectorsize" size=1>
				<option value="3.5mm"> 3.5mm</option>
				<option value="2.5mm"> 2.5mm</option>
				<option value="6.35mm"> 6.35mm</option>
				<option value="Wireless"> Wireless </option>
				<option value="Lightning"> Lightning </option>
				<option value="Other"> other </option>
				</select></td>
			</tr>

			<tr>
				<td>Connectivities:</td><td><select name="connectivity" size=1>
				<option value="Wired"> wired </option>
				<option value="Wireless"> wireless </option>
				<option value="Bluetooth"> bluetooth </option>
				<option value="Other"> other </option>
				</select></td>
			</tr>

			<tr>
				<td>Use:</td><td><select name="use" size=1>
				<option value="Sports"> Sports</option>
				<option value="Gaming"> Gaming</option>
				<option value="Studio"> Studio</option>
				<option value="Kids"> Kids</option>
				<option value="Pro"> Pro</option>
				<option value="Foldable-design"> Foldable Design</option>
				<option value="DJ"> DJ</option>
				<option value="Behindtheneck"> Behind the neck</option>
				<option value="Other"> Other</option>
				</select>
				</td>
			</tr>

			<tr>
				<td>Color:</td><td><select name="color" size=1>
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
				<option value="other"> Other</option>
				<option value="heart rate"> heart rate</option>
				<option value="calories burned"> calories burned</option>
				<option value="distance traveled"> Distance traveled</option>
				<option value="speed"> Speed</option>
				<option value="steps taken"> Steps taken</option>
				<option value="pace"> Pace</option>
				</select></td>
			</tr>

			<tr>
				<td>Initial Price:</td><td><input type="number" name="InitialPrice" min="0"></td>
			</tr>

			<tr>
				<td>Increment:</td><td><input type="number" name="increment" min="0"></td>
			</tr>

			<tr>
				<td>Closing date and time:</td><td><input type="datetime-local"  name="closingDate"></td>
			</tr>

			<tr>
				<td>Minimum Price:</td><td><input type="number" name="minimumPrice" min="0"></td>
			</tr>

			<tr>
				<td>Shipping Price:</td><td><input type="number" name="shippingPrice" min="0"></td>
			</tr>

		</table>
		<br>
		<input type="submit" value="Post!">
	</form>

	<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>