<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
  <%@include file="CSS/deleteorder.css" %>
</style>
</head>
<body>
		<% 
		
		String oid = request.getParameter("oid");
		String cid = request.getParameter("cid");
		String weight = request.getParameter("weight");
		String orderdate = request.getParameter("orderdate");
		String deliverydate = request.getParameter("deliverydate");
		String name = request.getParameter("name");
		
		
	    %>
	    
    <fieldset class="order69">
	<legend></legend><br>
	<form method="post" action="deleteorder">
	<p>Cancle Order</p>
		<table style="width: 100%;">
		
		<tr>
           <td>Order Id</td>
           <td><input type="text" name="orderid" value="<%=oid %>" readonly="readonly" style="color:#B0B0B0;"></td>
       </tr>

		<tr>
			<td>Customer Id</td>
			<td><input type="text" name="custid" value="<%=cid %>" readonly></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name="name" value="<%=name %>" readonly></td>
		</tr>
		<tr>
			<td>Order Weight</td>
			<td><input type="text" name="weight" value="<%=weight %>" readonly></td>
		</tr>
		<tr>
			<td>Order Date</td>
			<td><input type="date" name="orderdate" value="<%=orderdate %>" readonly></td>
		</tr>
		<tr>
			<td>Delivery Date</td>
			<td><input type="date" name="deliverydate" value="<%=deliverydate %>" readonly></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="Cancle order " /></td>
		</tr>
		</table>
	</form>
	</fieldset>
	    

</body>
</html>