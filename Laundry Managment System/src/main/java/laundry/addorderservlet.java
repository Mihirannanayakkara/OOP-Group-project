package laundry;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addorderservlet")
public class addorderservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int custid = Integer.parseInt(request.getParameter("custid"));
        double weight = Double.parseDouble(request.getParameter("weight"));
        String orderdate = request.getParameter("orderdate");
        String deliverydate = request.getParameter("deliverydate");
        String name = request.getParameter("name");

        boolean isTrue = orderdbutil.insertOrder(custid, weight, orderdate, deliverydate,name);

        if (isTrue) {
            order lastAddedOrder = orderdbutil.getLastAddedOrder();
            request.setAttribute("lastAddedOrder", lastAddedOrder);

            RequestDispatcher dis = request.getRequestDispatcher("orderlist.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
        }
    }
}
