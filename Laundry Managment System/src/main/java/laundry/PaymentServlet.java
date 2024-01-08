package laundry;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet { protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    

	        Connection conn = null;
	        List<payment> paymentList = new ArrayList<>();

	        try {
	        	Class.forName("com.mysql.jdbc.Driver");
	            // Initialize your database connection
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/laundry", "root", "Thamindu#12345");

	            // Write your SQL query for payments
	            String sql = "SELECT * FROM payment";

	            // Prepare and execute the query
	            PreparedStatement statement = conn.prepareStatement(sql);
	            ResultSet resultSet = statement.executeQuery();

	            // Retrieve data and store it in paymentList
	            while (resultSet.next()) {
	                payment payment = new payment();
	                payment.setPaymentid(resultSet.getInt("paymentid"));
	                payment.setCardnumber(resultSet.getInt("cardnumber"));
	                payment.setCardholdername(resultSet.getString("cardholdername"));
	                payment.setExdate(resultSet.getString("expirydate"));
	                payment.setCvv(resultSet.getInt("cvv"));
	                payment.setAmount(resultSet.getDouble("amount"));
	                paymentList.add(payment);
	            }
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        } finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }

	        // Pass the paymentList to the JSP
	        request.setAttribute("paymentList", paymentList);
	        request.getRequestDispatcher("paymentdetails.jsp").forward(request, response);
	    }
	}
