package AdminControl;

import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");

        try {
            String productId = request.getParameter("id");

            if (productId == null || productId.isEmpty()) {
                response.getWriter().write("{\"success\": false, \"message\": \"ID sản phẩm không hợp lệ!\"}");
                return;
            }
            boolean success = dao.deleteProduct(productId);

            if (success) {
                response.getWriter().write("{\"success\": true, \"message\": \"Xóa sản phẩm thành công!\"}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"Không thể xóa sản phẩm!\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            String msg = e.getMessage().replace("\"", "\\\"");
            response.getWriter().write("{\"success\": false, \"message\": \"Lỗi: " + msg + "\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}