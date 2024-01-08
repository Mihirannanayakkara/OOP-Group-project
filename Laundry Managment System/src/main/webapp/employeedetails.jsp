<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="laundry.employee" %>
<%@page import="java.util.List" %>
<%@ page import="laundry.employeeDBUtil" %>
<%
    List<employee> empdetails = employeeDBUtil.employeedetails();
    request.setAttribute("empdetails", empdetails);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="csss/details.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Employee Details</title>

</head>
<body>
<section>
<div class="tbl-header">
        <h1 >Employee List</h1>
        <table >
    <thead>
      <tr>
        <th>No</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Address</th>
        <th>Date of Birth</th>
        <th>Phone</th>
        <th>Employee ID</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
    </thead>
    </table>
    </div>
  <div class="tbl-content">
   <table >
    <tbody>
      <c:forEach var="emp" items="${empdetails}">
     <c:set var="id" value="${emp.id}"/>
      <c:set var="fname" value="${emp.fname}"/>
      <c:set var="lname" value="${emp.lname}"/>
      <c:set var="address" value="${emp.address}"/>
      <c:set var="dob" value="${emp.dob}"/>
      <c:set var="phone" value="${emp.phone}"/>
      <c:set var="eid" value="${emp.eid}"/>
      
        <tr>
          <td>${emp.id}</td>
          <td>${emp.fname}</td>
          <td>${emp.lname}</td>
          <td>${emp.address}</td>
          <td>${emp.dob}</td>
          <td>${emp.phone}</td>
          <td>${emp.eid}</td>
          <td>
          <c:url value="updateemployee.jsp" var="empupdate">
 			 <c:param name="id" value="${id}"/>
 			 <c:param name="fname" value="${fname}"/>
  			 <c:param name="lname" value="${lname}"/>
  			 <c:param name="address" value="${address}"/>
 			 <c:param name="dob" value="${dob}"/>
			 <c:param name="phone" value="${phone}"/>
  			 <c:param name="eid" value="${eid}"/>
  		</c:url>
  		 <c:url value="deleteemployee.jsp" var="empdelete">
 			 <c:param name="id" value="${id}"/>
 			 <c:param name="fname" value="${fname}"/>
  			 <c:param name="lname" value="${lname}"/>
  			 <c:param name="address" value="${address}"/>
 			 <c:param name="dob" value="${dob}"/>
			 <c:param name="phone" value="${phone}"/>
  			 <c:param name="eid" value="${eid}"/>
  		</c:url>
  <a class="btn" href="${empupdate}" >Edit</a> </td> <td>
  <a class="btn" href="${empdelete}">delete</a>
  </td>
        </tr>
      </c:forEach>
    </tbody>
  </table></div>
   </section>
  <a href="admindashboard.jsp" class="btnbtn-info">Dashboard</a>
  
    
    
  
 
</body>

</html>