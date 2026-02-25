package AdminControl;

import Dao.Dao;
import Entity.User;
import Entity.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminHome")
public class AdminHome extends HttpServlet {
       
    private Dao dao;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int totalCustomers = dao.getTotalCustomers();
            int totalProducts = dao.getTotalProducts();
            int totalOrders = dao.getTotalOrders();
            int lowStockProducts = dao.getLowStockProducts();
            int totalContacts = dao.getTotalContacts();
            int newContacts = dao.getNewContactsCount();
            
            List<User> recentCustomers = dao.getRecentCustomers(5);
            
            List<Order> recentOrders = dao.getRecentOrders(5);
            
            request.setAttribute("totalCustomers", totalCustomers);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("lowStockProducts", lowStockProducts);
            request.setAttribute("totalContacts", totalContacts);
            request.setAttribute("newContacts", newContacts);
            request.setAttribute("recentCustomers", recentCustomers);
            request.setAttribute("recentOrders", recentOrders);
            
            request.getRequestDispatcher("doc/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                               "Lỗi khi tải dữ liệu trang chủ admin.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}