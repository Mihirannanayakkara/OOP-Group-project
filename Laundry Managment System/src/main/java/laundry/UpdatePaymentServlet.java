package laundry;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paymentid = request.getParameter("paymentid");
		
		String cardnumber = request.getParameter("cardnumber");
		String cardholdername = request.getParameter("cardholdername");
		String exdate = request.getParameter("exdate");
		String cvv = request.getParameter("cvv");
		String amount = request.getParameter("amount");
	
boolean isTrue;
		
		isTrue = PaymentDBUtil.updatePayment(paymentid,cardnumber, cardholdername, exdate, cvv ,amount);
		
		if(isTrue == true) {
			
			payment lastAddedPayment = PaymentDBUtil.getLastAddedPayment();
	        request.setAttribute("lastAddedPayment", lastAddedPayment);
	        
			RequestDispatcher dis = request.getRequestDispatcher("paymentlist.jsp");
			dis.forward(request, response);
		}
		else {
			
			payment lastAddedPayment = PaymentDBUtil.getLastAddedPayment();
	        request.setAttribute("lastAddedPayment", lastAddedPayment);
	       
			RequestDispatcher dis = request.getRequestDispatcher("paymentlist.jsp");
			dis.forward(request, response);
		}
	
	
	}

}
