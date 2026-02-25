package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Dao;
import Entity.CartItem;
import Entity.Product;

@WebServlet("/addToCart")
public class AddToCartControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddToCartControl() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id_raw = request.getParameter("id");
        try {
            Dao dao = new Dao();
            Product p = dao.getProductById(id_raw);

            if (p == null) {
                request.setAttribute("message", "Không tìm thấy sản phẩm với ID: " + id_raw);
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean found = false;
            for (CartItem item : cart) {
                if (String.valueOf(item.getProduct().getId()).equals(id_raw)) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new CartItem(p, 1));
            }

            session.setAttribute("cart", cart);

            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Lỗi khi thêm sản phẩm vào giỏ hàng: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
