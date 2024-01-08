<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page import="laundry.payment" %>
<%@page import="java.util.List" %>
<%@ page import="laundry.PaymentDBUtil" %>
<%
    List<payment> paymentdetails = PaymentDBUtil.employeedetails();
    request.setAttribute("paymentdetails", paymentdetails);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Payments</title>
  <link rel="stylesheet" type="text/css" href="csss/details.css">
    
</head>
<body>
<section>
<div class="tbl-header">
    <h1>All Payments</h1>
    <table>
        <tr>
            <th>Payment ID</th>
            <th>Card Number</th>
            <th>Card Holder Name</th>
            <th>Expiration Date</th>
            <th>CVV</th>
            <th>Amount</th>
        </tr>
        </table>
        </div>
        <div class="tbl-content">
   <table >
        <c:forEach items="${paymentdetails}" var="payment">
            <tr>
                <td>${payment.paymentid}</td>
                <td>${payment.cardnumber}</td>
                <td>${payment.cardholdername}</td>
                <td>${payment.exdate}</td>
                <td>${payment.cvv}</td>
                <td>${payment.amount}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
    </section>
   <div class="button-container">
        <a href="admindashboard.jsp">
            <button class="btnbtn-info">Dashboard</button>
        </a>
    </div>
    
</body>
</html>
