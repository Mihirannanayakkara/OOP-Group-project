<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="laundry.order" %>
<%@page import="java.util.List" %>
<%@ page import="laundry.orderdbutil" %>
<%
    List<order> orderdetails = orderdbutil.orderedetails();
    request.setAttribute("orderdetails", orderdetails);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Orders</title>
    <link rel="stylesheet" type="text/css" href="csss/details.css">
</head>
<body>
<section>
<div class="tbl-header">
    <h1>All Orders</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Customer ID</th>
            <th>Weight</th>
            <th>Order Date</th>
            <th>Delivery Date</th>
            <th>Name</th>
            
        </tr>
        </table>
    </div>
  <div class="tbl-content">
   <table >
        <c:forEach var="order" items="${orderdetails}" >
            <tr>
                <td>${order.orderId}</td>
                <td>${order.custId}</td>
               
                <td>${order.weight}</td>
                <td>${order.orderDate}</td>
                <td>${order.deliveryDate}</td>
                 <td>${order.name}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
    </section>
    <a href="admindashboard.jsp" class="btnbtn-info">Dashboard</a>
</body>
</html>
