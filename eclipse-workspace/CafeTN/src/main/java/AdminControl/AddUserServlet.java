package AdminControl;

import Dao.Dao;
import Entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            // Validate
            if (username == null || username.trim().isEmpty()) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Tên đăng nhập không được để trống!\"}"
                );
                return;
            }

            if (password == null || password.trim().isEmpty()) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Mật khẩu không được để trống!\"}"
                );
                return;
            }

            if (email == null || email.trim().isEmpty()) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Email không được để trống!\"}"
                );
                return;
            }

            if (fullName == null || fullName.trim().isEmpty()) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Họ tên không được để trống!\"}"
                );
                return;
            }

            if (dao.isUsernameExists(username.trim())) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Tên đăng nhập đã tồn tại!\"}"
                );
                return;
            }

            if (dao.isEmailExists(email.trim())) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Email đã tồn tại!\"}"
                );
                return;
            }

            User user = new User();
            user.setUsername(username.trim());
            user.setPassword(password.trim());
            user.setEmail(email.trim());
            user.setFullName(fullName.trim());
            user.setPhone(phone != null ? phone.trim() : "");
            user.setAddress(address != null ? address.trim() : "");

            boolean success = dao.addUser(user);

            if (success) {
                response.getWriter().write(
                    "{\"success\": true, \"message\": \"Thêm khách hàng thành công!\"}"
                );
            } else {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Không thể thêm khách hàng!\"}"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
            String msg = e.getMessage().replace("\"", "\\\"");
            response.getWriter().write(
                "{\"success\": false, \"message\": \"Lỗi: " + msg + "\"}"
            );
        }
    }
}