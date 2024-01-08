package laundry;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("username");
		String pass=request.getParameter("password");
		
	
		   HttpSession session=request.getSession();
		   RequestDispatcher dis=null;
		   
		try {
			 Connection connection = dbconnect.getConnection();
			   PreparedStatement pst=connection.prepareStatement("select * from user where uname=? and password=?");
			   pst.setString(1, uname);
			   pst.setString(2, pass);
			   
			   ResultSet rs=pst.executeQuery();
			   if(rs.next()) {
				   if (uname.equals("admin") && pass.equals("admin123")) {
		               session.setAttribute("name", uname);
		               session.setAttribute("isAdmin", true);
		               dis = request.getRequestDispatcher("admindashboard.jsp");
		           }else {
				   session.setAttribute("name",rs.getString("uname"));
				   dis=request.getRequestDispatcher("index.jsp");}
			   }else {
				   request.setAttribute("status","Failed");
				   dis=request.getRequestDispatcher("login.jsp");
			   }
			   dis.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
