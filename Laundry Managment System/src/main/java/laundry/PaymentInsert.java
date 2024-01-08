package laundry;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PaymentInsert")
public class PaymentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cardnumber = Integer.parseInt(request.getParameter("cardnumber")) ;
		String cardholdername = request.getParameter("cardholdername") ;
		String exdate = request.getParameter("exdate") ;
		int cvv = Integer.parseInt(request.getParameter("cvv")) ;
		double amount = Double.parseDouble(request.getParameter("amount")) ;
		
		boolean isTrue ;
		
		isTrue = PaymentDBUtil.insertPayment(cardnumber, cardholdername, exdate, cvv, amount) ;
		
		if(isTrue == true) {
			
			payment lastAddedPayment = PaymentDBUtil.getLastAddedPayment();
			request.setAttribute("lastAddedPayment", lastAddedPayment);
			
			RequestDispatcher dis = request.getRequestDispatcher("paymentlist.jsp") ;
			dis.forward(request,response) ;
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp") ;
			dis2.forward(request,response) ;
		}
	}

}