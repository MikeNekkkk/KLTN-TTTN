package Controller;

import Dao.Dao;
import Entity.Order;
import Entity.OrderItem;
import Entity.User;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DetaillistuserOrders")
public class DetailOrderOfUserServlet extends HttpServlet {
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
        
    		HttpSession session = request.getSession();
    		User user = (User) session.getAttribute("user");
    		String idParam = request.getParameter("id");
            Long id = Long.parseLong(idParam);
    		List<OrderItem> DTorders = dao.getOrderItemsByOrderId(id);
            Order order = dao.getOrderById(id);
          
            request.setAttribute("DTorders", DTorders);
            request.setAttribute("order", order);

            request.getRequestDispatcher("ChiTiet_DonHang.jsp")
                   .forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi tải danh sách đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}