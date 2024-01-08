<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Information</title>

 <link rel="stylesheet" type="text/css" href="CSS/css.css">

 
 
</head>
<body>
<%
    String weight = request.getParameter("weight");

    double totalAmount = 0.0;

    if (weight != null && !weight.isEmpty()) {
        try {
            double parsedWeight = Double.parseDouble(weight);
            totalAmount = parsedWeight * 200;
        } catch (NumberFormatException e) {
            // Handle invalid input or parsing errors here
        }
    }

    // Set weight and totalAmount as JSP variables
    request.setAttribute("weight", weight);
    request.setAttribute("totalAmount", totalAmount);
%>
    <div class="mainscreen">
        <div class="card">
            <div class="leftside">
                <img src="https://cdn.pixabay.com/photo/2016/09/05/18/49/plastic-card-1647376_1280.jpg" class="product" alt="Shoes" />
            </div>
            <div class="rightside">
            
	<form  id="payment-form" action="insert" method="post">
		<h1>Payment Information</h1>
 				
				    Accepted Cards :<br>
				    <img src="https://th.bing.com/th/id/R.f00a481613ce3685347c928c801fdbec?rik=h20iU3wrHBea4g&riu=http%3a%2f%2fwpuploads.appadvice.com%2fwp-content%2fuploads%2f2014%2f08%2fAmerican-Express-MasterCard-Visa.jpg&ehk=Z2Hy85q4AbOJhfxW4Urixq93UYdfNpVkvtmcr2WIm6E%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1" alt="Accepted Cards" width="150" height="60">
				   <br>
				   
				    <label for="cardnumber">Card Number</label>
				    <input class="inputbox" type="password" id="cardnumber" name="cardnumber" placeholder="Credit Card Number" required pattern="[0-9]{7,16}"><br>
				    
				    <label for="cardholdername">Card holder name</label>
				    <input class="inputbox" type="text" id="cardholdername" name="cardholdername" placeholder="Name on Card" required><br>
				    
				    <label for="exdate">Expiration Date</label>
				    <input class="inputbox" type="date" id="exdate" name="exdate" placeholder="MM/YY" required><br>
				
				    <label for="cvv">CVV</label>
				    <input class="inputbox" type="password" id="cvv" name="cvv" placeholder="Enter 3 digit number" required pattern="[0-9]{3}"><br>
				
				    <label for="amount">Total Amount</label>
				    <input class="inputbox" type="text" id="amount" name="amount"  value="<%= totalAmount %>" required pattern="^\d+(\.\d{1,2})?$" readonly><br>
							
				    <input class="button" type="submit"   value="Proceed to Pay">
  			</form>
	</div></div></div>
</body>
</html>