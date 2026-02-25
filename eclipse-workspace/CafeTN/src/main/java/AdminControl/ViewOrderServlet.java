package AdminControl;

import Dao.Dao;
import Entity.Order;
import Entity.OrderItem;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewOrder")
public class ViewOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orderIdStr = request.getParameter("id");
            
            if (orderIdStr == null || orderIdStr.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/listOrders");
                return;
            }
            
            Long orderId = Long.parseLong(orderIdStr);
            
            Order order = dao.getOrderById(orderId);
            
            if (order == null) {
                request.setAttribute("errorMessage", "Không tìm thấy đơn hàng!");
                request.getRequestDispatcher("404.jsp").forward(request, response);
                return;
            }
            
            List<OrderItem> orderItems = dao.getOrderItemsByOrderId(orderId);
            order.setOrderItems(orderItems);
            
            request.setAttribute("order", order);
            request.getRequestDispatcher("doc/view-order-detail.jsp")
                   .forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi xem chi tiết đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }
}