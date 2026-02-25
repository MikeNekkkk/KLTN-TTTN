package Controller;

import Entity.Order;
import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    
    private Dao dao; 
    private static final long serialVersionUID = 1L;
       
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String paymentMethod = request.getParameter("paymentMethod");
        
        if ("cod".equals(paymentMethod)) {
            processCOD(request, response);
        } else {
            response.sendRedirect("payment-method.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        
        String paymentMethod = request.getParameter("paymentMethod");
        
        Order order = (Order) session.getAttribute("pendingOrder");
        
        if (order == null) {
            response.sendRedirect("cart.jsp");
            return;
        }
        
        try {
            if ("cod".equals(paymentMethod)) {
            	processCOD(request, response);
            } else {
                request.setAttribute("errorMessage", "Vui lòng chọn phương thức thanh toán!");
                request.getRequestDispatcher("payment-method.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình thanh toán!");
            request.getRequestDispatcher("payment-method.jsp").forward(request, response);
        }
    }
   
    private void processCOD(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("pendingOrder");
        
        if (order == null) {
            response.sendRedirect("cart.jsp");
            return;
        }
        
        try {
            order.setStatus("PROCESSING");
            order.setPaymentMethod("COD");
            dao.updateOrderStatus(order.getId(), "PROCESSING", "COD");
            
            session.removeAttribute("cart");
            session.removeAttribute("pendingOrder");
            
            session.setAttribute("completedOrder", order);
            
            response.sendRedirect("payment-success.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý đơn hàng COD!");
            request.getRequestDispatcher("payment-method.jsp").forward(request, response);
        }
    }
    
   
}