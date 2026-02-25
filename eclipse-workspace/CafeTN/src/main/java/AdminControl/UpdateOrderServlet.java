package AdminControl;

import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/updateOrder")
public class UpdateOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        try {
            String orderIdStr = request.getParameter("orderId");
            String status = request.getParameter("status");
            String paymentMethod = request.getParameter("paymentMethod");

            if (orderIdStr == null || status == null) {
                response.getWriter().write("{\"success\": false, \"message\": \"Thiếu thông tin!\"}");
                return;
            }

            Long orderId = Long.parseLong(orderIdStr);
            
            boolean success = dao.updateOrderStatus(orderId, status, paymentMethod);

            if (success) {
                response.getWriter().write("{\"success\": true, \"message\": \"Cập nhật đơn hàng thành công!\"}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"Không thể cập nhật đơn hàng!\"}");
            }

        } catch (RuntimeException e) {
            String msg = e.getMessage().replace("\"", "\\\"");
            response.getWriter().write("{\"success\": false, \"message\": \"" + msg + "\"}");
        } catch (Exception e) {
            e.printStackTrace();
            String msg = e.getMessage().replace("\"", "\\\"");
            response.getWriter().write("{\"success\": false, \"message\": \"Lỗi: " + msg + "\"}");
        }
    }
}