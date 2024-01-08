<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Place an order</title>
<style type="text/css">
  <%@include file="CSS/addOrder.css" %>
</style>


</head>
<body>

	<fieldset class="order69">
	<legend></legend><br>
	<form method="post" action="addorder">
    <p>New Order</p>
		<table style="width: 100%;">
		<tr>
    <td>Order Id</td>
    <td><input type="text" name="orderid" value="Auto Generated" readonly="readonly" style="color:#B0B0B0;"></td>
    </tr>

		<tr>
			<td>Customer Id</td>
			<td><input type="text" pattern=".{5}" placeholder="mini 5 characters" name="custid" required></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" required></td>
		</tr>
		<tr>
			<td>Order Weight(kg)</td>
			<td><input type="text" name="weight" required placeholder="max 200kg" pattern="^(?:200(\.0{1,2})?|1\d{2}(\.\d{1,2})?|\d{1,2}(\.\d{1,2})?)$">
</td>
		</tr>
		<tr>
			<td>Order Date</td>
			<td><input type="date" name="orderdate" required></td>
		</tr>
		<tr>
			<td>Delivery Date</td>
			<td><input type="date" name="deliverydate" required></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="Submit" /></td>
		</tr>
		</table>
	</form>
	</fieldset>

</body>
</html>