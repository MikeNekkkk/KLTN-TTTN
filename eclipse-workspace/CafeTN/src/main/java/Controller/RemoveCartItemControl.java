package Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.CartItem;

@WebServlet("/removeCartItem")
public class RemoveCartItemControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id_raw = request.getParameter("id");

        try {
            long productIdToRemove = Long.parseLong(id_raw);

            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart != null) {
               for (int i = 0; i < cart.size(); i++) {
                    if (cart.get(i).getProduct().getId() == productIdToRemove) {
                        cart.remove(i);
                        break; 
                    }
                }

                if (cart.isEmpty()) {
                    session.removeAttribute("cart");
                } else {
                    session.setAttribute("cart", cart);
                }
            }

            response.sendRedirect("cart.jsp");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xóa sản phẩm khỏi giỏ hàng.");
        }
    }
}