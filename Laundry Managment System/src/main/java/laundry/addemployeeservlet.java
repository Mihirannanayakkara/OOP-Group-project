package laundry;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class addemployeeservlet
 */
@WebServlet("/addemployeeservlet")
public class addemployeeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String address=request.getParameter("address");
		String dob=request.getParameter("dob");
		String phone=request.getParameter("phone");
		String eid=request.getParameter("eid");
		
		boolean isTrue;
		isTrue = employeeDBUtil.addemployee(fname, lname, address, dob, phone, eid);
		
		if(isTrue==true) {
			
				 List<employee> empdetails = employeeDBUtil.employeedetails();
				    request.setAttribute("empdetails", empdetails);
				    
			RequestDispatcher dis3 = request.getRequestDispatcher("employeedetails.jsp");
		    dis3.forward(request, response);
		}else {
			RequestDispatcher dis2=request.getRequestDispatcher("index.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}

