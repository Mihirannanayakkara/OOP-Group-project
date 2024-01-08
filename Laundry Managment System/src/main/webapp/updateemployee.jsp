<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Update Employee</title>
    
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="csss/custom.css">
    
    
</head>
<body>
<%
		String id=request.getParameter("id");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String address=request.getParameter("address");
		String dob=request.getParameter("dob");
		String phone=request.getParameter("phone");
		String eid=request.getParameter("eid");
	%>
    <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1>Update Employee</h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">

              <form action="updateemployee" method="post" id="stripe-login">
              
                <div class="field padding-bottom--24">
                <input class="form-control" type="hidden" name="id" value="<%= id %>" >
                  <label for="fname">First Name</label>
                  <input class="form-control" type="text" name="fname" value="<%= fname %>" required>
                  <label for="lname">Last Name</label>
                  <input class="form-control" type="text" name="lname" value="<%= lname %>" required>
                  <label for="address">Address</label>
                  <input class="form-control" type="text" name="address" value="<%= address %>" required>
                  <label for="dob">Date of Birth</label>
                  <input class="form-control" type="date" name="dob"value="<%= dob %>" required>

                </div>

                <div class="field padding-bottom--24">
                  <div class="grid--50-50">

                    <label for="eid">Employee ID</label>
                  </div>

                  <input class="form-control" type="text" name="eid" value="<%= eid %>" required>
                  <label for="phone">Phone</label>
                  <input class="form-control" type="text" name="phone" value="<%= phone %>" pattern="0\d{9}" required>
                </div>

                <div class="field padding-bottom--24">
                  <input type="submit" name="submit" value="Update">
					
                </div>
                 
                  
					
          

              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">

            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span><a href="#">©Laundry Service Providers(PVT)
</a></span>
              <span><a href="#">Contact</a></span>
              <span><a href="#">Privacy & terms</a></span>
            </div>
          </div>
        </div>
      </div>
    
       
    </div>
</div>

</body>
</html>