package laundry;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateorderservlet")
public class updateorderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String oid = request.getParameter("orderid");
		String cid = request.getParameter("custid");
		String weight = request.getParameter("weight");
		String orderdate = request.getParameter("orderdate");
		String deliverydate = request.getParameter("deliverydate");
		String name = request.getParameter("name");
		
		boolean isTrue;
		
		isTrue = orderdbutil.updateOrder(oid, cid, weight, orderdate, deliverydate,name);
		
		if(isTrue==true) {
			 
			order lastAddedOrder = orderdbutil.getLastAddedOrder();
	        request.setAttribute("lastAddedOrder", lastAddedOrder);
			
			RequestDispatcher dis = request.getRequestDispatcher("orderlist.jsp");
			dis.forward(request, response);
		}else {
			order lastAddedOrder = orderdbutil.getLastAddedOrder();
	        request.setAttribute("lastAddedOrder", lastAddedOrder);
			
			RequestDispatcher dis = request.getRequestDispatcher("orderlist.jsp");
			dis.forward(request, response);
		}
		
	}

}
