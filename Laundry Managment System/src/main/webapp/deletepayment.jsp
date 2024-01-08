<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="CSS/css2.css">
</head>
<body>

<div class="mainscreen">
        <div class="card">
            <div class="rightside">

<%
		String paymentid = request.getParameter("paymentid");
		String cardnumber = request.getParameter("cardnumber");
		String cardholdername = request.getParameter("cardholdername");
		String exdate = request.getParameter("exdate");
		String cvv = request.getParameter("cvv");
		
	%>
	
	<form id="payment-form" action="delete" method="post">
	<h1>Payment Success & Remove Card Details</h1>
	<table>
	<tr>
			<td>Payment ID</td>
			<td><input type="text" name="paymentid" value="<%= paymentid %>"  readonly></td>
		</tr>
		
		<tr>
			<td>Card Number</td>
			<td><input type="text" name="cardnumber" value="<%= cardnumber %>" readonly></td>
		</tr>
		<tr>
			<td>Card holder name</td>
			<td><input type="text" name="cardholdername" value="<%= cardholdername %>" readonly></td>
		</tr>
		<tr>
		<td>Expiration Date</td>
		<td><input type="date" name="exdate" value="<%= exdate %>" readonly></td>
	</tr>
	<tr>
		<td>CVV</td>
		<td><input type="text" name="cvv" value="<%= cvv %>" readonly></td>
	</tr>
		
	</table>
	<br>
	<input class="button" type="submit" name="submit" value="Remove"><br>
	
	</form>
	<a href="index.jsp">
	<input class="button" type="submit" name="save" value="Save Card Details & Exit"></a>
		</div></div></div>
</body>
</html>