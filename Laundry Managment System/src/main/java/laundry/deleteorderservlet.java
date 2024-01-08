package laundry;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteorderservlet")
public class deleteorderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String orderid = request.getParameter("orderid");
		
		boolean isTrue;
		
		isTrue = orderdbutil.deleteOrder(orderid);
		
		if(isTrue == true) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
			order lastAddedOrder = orderdbutil.getLastAddedOrder();
            request.setAttribute("lastAddedOrder", lastAddedOrder);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("orderlist.jsp");
			dispatcher.forward(request, response);
			
		}
	}

}
