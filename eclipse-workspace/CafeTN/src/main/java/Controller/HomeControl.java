package Controller;

import Dao.Dao;
import Entity.Category;
import Entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeControl extends HttpServlet {
    
    private Dao dao; 
    private static final long serialVersionUID = 1L;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            List<Product> listProducts = dao.getAllProducts();
            request.setAttribute("listP", listProducts); 
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                               "Lỗi khi tải dữ liệu trang chủ.");
        }
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}