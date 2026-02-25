package Controller;

import Dao.Dao;
import Entity.Order;
import Entity.User;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/listuserOrders")
public class ListOrderOfUserServlet extends HttpServlet {
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
    		String firstName = request.getParameter("firstName");
    		Long id = user.getId();
    		List<Order> orders = dao.getOrdersbyiduser(id);
           
          
            request.setAttribute("orders", orders);
            
            request.getRequestDispatcher("DonHang.jsp")
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