<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Last Added Payment</title>
    <link rel="stylesheet" type="text/css" href="CSS/css2.css">
</head>
<body>


	 <div class="mainscreen">
        <div class="card">
            <div class="rightside">
            
    <h1>Last Added Payment</h1>
    <table>
    
     <c:set var="paymentid" value="${lastAddedPayment.paymentid}"/>
          
      <c:set var="cardnumber" value="${lastAddedPayment.cardnumber}"/>
       <c:set var="cardholdername" value="${lastAddedPayment.cardholdername}"/>
        <c:set var="exdate" value="${lastAddedPayment.exdate}"/>
         <c:set var="cvv" value="${lastAddedPayment.cvv}"/>
          <c:set var="amount" value="${lastAddedPayment.amount}"/>
    
        <tr>
            <th>Payment ID</th>
            
            <th>Card Number</th>
            <th>Card HolderName</th>
            <th>Expiration Date</th>
            <th>CVV</th>
            <th>Amount</th>
        </tr>
        <tr>
            <td>${lastAddedPayment.paymentid}</td>
             <td>${lastAddedPayment.cardnumber}</td>
            <td>${lastAddedPayment.cardholdername}</td>
            <td>${lastAddedPayment.exdate}</td>
             <td>${lastAddedPayment.cvv}</td>
            <td>${lastAddedPayment.amount}</td>
        </tr>
    </table>

<c:url value="updatepayment.jsp" var="updatepayment">
<c:param name="paymentid" value="${paymentid}"/>
		<c:param name="cardnumber" value="${cardnumber}"/>
		<c:param name="cardholdername" value="${cardholdername}"/>
		<c:param name="exdate" value="${exdate}"/>
		<c:param name="cvv" value="${cvv}"/>
		<c:param name="amount" value="${amount}"/>
	</c:url>
	<c:url value="deletepayment.jsp" var="deletepayment">
<c:param name="paymentid" value="${paymentid}"/>
		<c:param name="cardnumber" value="${cardnumber}"/>
		<c:param name="cardholdername" value="${cardholdername}"/>
		<c:param name="exdate" value="${exdate}"/>
		<c:param name="cvv" value="${cvv}"/>
		<c:param name="amount" value="${amount}"/>
	</c:url>

<a href="${updatepayment}">
<input class="button" type="button" name="update" value="Update Details">
</a>

<a href="${deletepayment}">
<input class="button" type="button" name="Pay" value="Pay">
</a>
</div>
        </div>
    </div>
</body>
</html>