<!-- By IT19180526 -->
<!DOCTYPE html>
<html>
<head>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="laundry.*,java.util.*,java.sql.*" %>
    
    <link href="AdminDashboard/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="AdminDashboard/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="AdminDashboard/css/datepicker3.css" rel="stylesheet" type="text/css">
    <link href="AdminDashboard/css/styles.css" rel="stylesheet" type="text/css">
    
	<meta charset="ISO-8859-1">
	<title>Dashboard</title>
</head>
<body>

<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="admindashboard.jsp">Laundry Management<span>System</span></a>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="images/admin.jpg" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name"></div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		
		<ul class="nav menu">
			<li class="active"><a href="admindashboard.jsp"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
			
			
			
			<li class="parent "><a data-toggle="collapse" href="#sub-item-2">
				<em class="fa fa-navicon">&nbsp;</em> Employee <span data-toggle="collapse" href="#sub-item-2" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-2">
					<li><a class="" href="employeedetails.jsp">
						<span class="fa fa-arrow-right">&nbsp;</span> Employee List
					</a></li>
					<li><a class="" href="addemployee.jsp">
						<span class="fa fa-arrow-right">&nbsp;</span> Add Employee
					</a></li>
					
				</ul>
			</li>
			
			<li class="parent "><a data-toggle="collapse" href="#sub-item-3">
				<em class="fa fa-navicon">&nbsp;</em> Order <span data-toggle="collapse" href="#sub-item-3" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-3">
					<li><a class="" href="orderdetails.jsp">
						<span class="fa fa-arrow-right">&nbsp;</span> Order List
					</a></li>
					
					
				</ul>
			</li>
			
			
			
			<li class="parent "><a data-toggle="collapse" href="#sub-item-5">
				<em class="fa fa-navicon">&nbsp;</em> Payment <span data-toggle="collapse" href="#sub-item-5" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-5">
					<li><a class="" href="paymentdetails.jsp">
						<span class="fa fa-arrow-right">&nbsp;</span> Payment List
					</a></li>
					
					
				</ul>
			</li>
			
			<li><a href="login.jsp"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
</div><!--/.sidebar-->
		
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
				
				
				
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-user color-orange"></em>
							<div class="large"><% try { Connection con = dbconnect.getConnection();
														Statement st = con.createStatement();
														String sql = "SELECT COUNT(*) FROM employee";
														ResultSet rs = st.executeQuery(sql);
														String Countrow="";
														while(rs.next()){
															Countrow = rs.getString(1);
															out.println(Countrow);
															}} catch (Exception e){ e.printStackTrace();} %></div>
							<div class="text-muted">Employees</div>
						</div>
					</div>
				</div>
			
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-shopping-cart color-blue"></em>
							<div class="large"><% try { Connection con = dbconnect.getConnection();
														Statement st = con.createStatement();
														String sql = "SELECT COUNT(*) FROM laundry_orders";
														ResultSet rs = st.executeQuery(sql);
														String Countrow="";
														while(rs.next()){
															Countrow = rs.getString(1);
															out.println(Countrow);
															}} catch (Exception e){ e.printStackTrace();} %>
							</div>
							<div class="text-muted">Orders</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-balance-scale color-red"></em>
							<div class="large"><% 
                                                  try { 
     													Connection con = dbconnect.getConnection();
   													    Statement st = con.createStatement();
   													    String sql = "SELECT SUM(weight) FROM laundry_orders";
                                          				ResultSet rs = st.executeQuery(sql);
    													double totalWeight = 0.0;
    
    													while(rs.next()) {
        														totalWeight = rs.getDouble(1);
   																		 }
    
    
    															java.text.DecimalFormat df = new java.text.DecimalFormat("0.0");
    															String formattedWeight = df.format(totalWeight);
    
    															out.println(formattedWeight + " Kg");
																} catch (Exception e) {
   																			 e.printStackTrace();
																					  }
																				%>
							</div>
							<div class="text-muted">Total Service Weight</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding">
							<div class="large"><% try { Connection con = dbconnect.getConnection();
														Statement st = con.createStatement();
														String sql = "SELECT COUNT(*) FROM payment";
														ResultSet rs = st.executeQuery(sql);
														String Countrow="";
														while(rs.next()){
															Countrow = rs.getString(1);
															out.println(Countrow);
															}} catch (Exception e){ e.printStackTrace();} %>
							</div>
							<div class="text-muted">Total Sale</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding"><em class="fa fa-xl fa-money color-teal"></em>
							<div class="large">Rs. <% try { Connection con = dbconnect.getConnection();
														Statement st = con.createStatement();
														String sql = "SELECT SUM(amount) FROM payment";
														ResultSet rs = st.executeQuery(sql);
														String Countrow="";
														while(rs.next()){
															Countrow = rs.getString(1);
															out.println(Countrow);
															}} catch (Exception e){ e.printStackTrace();} %>
							</div>
							<div class="text-muted">Total Payment</div>
						</div>
					</div>
				</div>
				
			</div><!--/.row-->
		</div>
		
		<div class="row">
			<div class="col-md-12">
			</div>
		</div><!--/.row-->
		
	
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>New Orders</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="70" ><span class="percent">70%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>New Customers</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="71" ><span class="percent">71%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Feedback</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="99" ><span class="percent">99%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Visitors</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="92" ><span class="percent">92%</span></div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<div class="row">	
		
			
		
			<div class="col-sm-12">
					
			</div>
		
		</div><!--/.row-->
</div>	<!--/.main-->

	
<script src="AdminDashboard/js/jquery-1.11.1.min.js"></script>
	<script src="AdminDashboard/js/bootstrap.min.js"></script>
	<script src="AdminDashboard/js/chart.min.js"></script>
	<script src="AdminDashboard/js/chart-data.js"></script>
	<script src="AdminDashboard/js/easypiechart.js"></script>
	<script src="AdminDashboard/js/easypiechart-data.js"></script>
	<script src="AdminDashboard/js/bootstrap-datepicker.js"></script>
	<script src="AdminDashboard/js/custom.js"></script>
	<script>
		window.onload = function () {
	var chart1 = document.getElementById("line-chart").getContext("2d");
	window.myLine = new Chart(chart1).Line(lineChartData, {
	responsive: true,
	scaleLineColor: "rgba(0,0,0,.2)",
	scaleGridLineColor: "rgba(0,0,0,.05)",
	scaleFontColor: "#c5c7cc"
	});
	};
	</script>
</body>
</html>