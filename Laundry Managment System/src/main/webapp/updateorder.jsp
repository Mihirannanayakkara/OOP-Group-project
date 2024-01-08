<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Update Order details </title>
	
     <style type="text/css">
  <%@include file="CSS/updateorder.css" %>
     </style>

</head>

<body>

	<% 
		String oid = request.getParameter("oid");
		String cid = request.getParameter("cid");
		String name = request.getParameter("name");
		String weight = request.getParameter("weight");
		String orderdate = request.getParameter("orderdate");
		String deliverydate = request.getParameter("deliverydate");
		
		
	%>

	<fieldset class="order69">
    <p>Update Order Details</p><br>
	<form method="post" action="updateorder">
		<table style="width: 100%;">
		
		<tr>
           <td>Order Id</td>
           <td><input type="text" name="orderid" value="<%=oid %>" readonly="readonly" style="color:#B0B0B0;"></td>
   </tr>

		<tr>
			<td>Customer Id</td>
			<td><input type="text" name="custid" value="<%=cid %>" readonly="readonly" ></td>
		</tr>
      
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" value="<%=name %>"></td>
		</tr>
		<tr>
			<td>Order Weight</td>
			<td><input type="text" name="weight"  value="<%=weight %>" ></td>
		</tr>
		<tr>
			<td>Order Date</td>
			<td><input type="date" name="orderdate" value="<%=orderdate %>"></td>
		</tr>
		<tr>
			<td>Delivery Date</td>
			<td><input type="date" name="deliverydate" value="<%=deliverydate %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="Update order details" /></td>
		</tr>
		</table>
	</form>
	</fieldset>

</body>
</html>