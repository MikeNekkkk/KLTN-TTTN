package AdminControl;

import Dao.Dao;
import Entity.Category;
import Entity.Product;
import Entity.User;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HTU")
public class HienThiUser extends HttpServlet {
       
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
            List<User> listUser = dao.AllUser();
            request.setAttribute("listP", listUser);
            List<Category> listCategories = dao.getAllCategories();
            request.setAttribute("listC", listCategories);
            request.getRequestDispatcher("doc/table-data-table.jsp").forward(request, response);

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