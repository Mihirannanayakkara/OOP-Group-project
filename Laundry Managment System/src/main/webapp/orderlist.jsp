
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>Order Summary </title>
    
    <style type="text/css">
  <%@include file="CSS/ordersummary.css" %>
</style>

</head>
	
	
<body>
    <fieldset class="order69">
	<legend></legend><br>
    <p>-Order Summary-</p>
    <table>
    
    	<c:set var="oid" value="${lastAddedOrder.orderId}"/>
    	<c:set var="cid" value="${lastAddedOrder.custId}"/>
    	<c:set var="name" value="${lastAddedOrder.name}"/>
    	<c:set var="weight" value="${lastAddedOrder.weight}"/>
    	<c:set var="orderdate" value="${lastAddedOrder.orderDate}"/>
    	<c:set var="deliverydate" value="${lastAddedOrder.deliveryDate}"/>
    	<c:set var="amount" value="${lastAddedOrder.weight * 200.0}" />
    	
    	
        <tr>
            <td>Order ID</td>
            <td>${lastAddedOrder.orderId}</td>
        </tr>
        
        <tr>
            <td>Customer ID</td>
            <td>${lastAddedOrder.custId}</td>
        </tr>
        <tr>
            
            <td>Name</td>
            <td>${lastAddedOrder.name}</td>
          
        </tr>
        <tr>     
            <td>Weight</td>
            <td>${lastAddedOrder.weight}</td>
        </tr>
        <tr>     
            <td>Order Date</td>
            <td>${lastAddedOrder.orderDate}</td>
        </tr>
        <tr>
            <td>Delivery Date</td>
            <td>${lastAddedOrder.deliveryDate}</td>
            
        </tr>
        
        <tr> 
            <td>Amount</td>
            <td>LKR <c:out value="${amount}" /></td>
        </tr>
    </table>
    </fieldset>
    <c:url value="updateorder.jsp" var="orderupdate">
    
    	<c:param name="oid" value="${oid}"/>
    	<c:param name="cid" value="${cid}"/>
    	<c:param name="name" value="${name}"/>
    	<c:param name="weight" value="${weight}"/>
    	<c:param name="orderdate" value="${orderdate}"/>
    	<c:param name="deliverydate" value="${deliverydate}"/>
    	
    
    </c:url>
    
    <a href="${orderupdate}">
    <input class="up" type="button"  name="update"  value="Update order details" >
    </a>
    
    
   
    <c:url value="deleteorder.jsp" var="orderdelete">
    	
    	<c:param name="oid" value="${oid}"/>
    	<c:param name="cid" value="${cid}"/>
    	<c:param name="name" value="${name}"/>
    	<c:param name="weight" value="${weight}"/>
    	<c:param name="orderdate" value="${orderdate}"/>
    	<c:param name="deliverydate" value="${deliverydate}"/>
    	
    </c:url>
    
     <c:url value="paymentinsert.jsp" var="makepayment">
    	
    	<c:param name="weight" value="${weight}"/>
    	
    </c:url>
   
    <a href="${orderdelete}">
    <input class="can"type="button"  name="delete"  value="Cancle order" >
    </a>
    
 
    <a href="${makepayment}">
    <input class="pay" type="button"  name="payment"  value="Make payment" >
    </a>
    
    
    
</body>
</html>
