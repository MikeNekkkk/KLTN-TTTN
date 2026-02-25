package Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Entity.Product;
import Entity.Category;

@WebServlet("/category")
public class CategoryControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cid = request.getParameter("cid"); 
        try {
            List<Product> listProducts = dao.getProductsByCategoryId(cid);
            List<Category> listCategories = dao.getAllCategories();
            List<Product> listProducts4 = dao.getProductsByCategoryId4();

            request.setAttribute("listP4", listProducts4); 
            request.setAttribute("listP", listProducts);
            request.setAttribute("listC", listCategories);
            request.setAttribute("selectedCategoryId", cid);

            request.getRequestDispatcher("shop.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi khi tải sản phẩm theo danh mục.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
