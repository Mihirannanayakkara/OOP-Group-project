package laundry;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registrationservlet
 */
@WebServlet("/registrationservlet")
public class registrationservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("contact");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		
		
		   
		   RequestDispatcher dis=null;
		try {
			Connection connection = dbconnect.getConnection();
			   PreparedStatement pst=connection.prepareStatement("insert into user(fname,lname,email,address,phone,uname,password)values(?,?,?,?,?,?,?)");
			   pst.setString(1, fname);
			   pst.setString(2, lname);
			   pst.setString(3, email);
			   pst.setString(4, address);
			   pst.setString(5, phone);
			   pst.setString(6, uname);
			   pst.setString(7, pass);
			   
			   int rawcount=pst.executeUpdate();
			   dis=request.getRequestDispatcher("login.jsp");
			   if(rawcount>0) {
				   request.setAttribute("status","Success");
			   }else {
				   request.setAttribute("status","Failed");
			   }
			   dis.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
