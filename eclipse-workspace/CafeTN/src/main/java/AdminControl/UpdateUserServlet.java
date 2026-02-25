package AdminControl;

import Dao.Dao;
import Entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
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
            String userId = request.getParameter("userId");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            if (userId == null || userId.trim().isEmpty()) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"ID khách hàng không hợp lệ!\"}"
                );
                return;
            }

            if (username == null || username.trim().isEmpty()) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Tên đăng nhập không được để trống!\"}"
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

            Long id = Long.parseLong(userId);

            if (dao.isUsernameExistsExcept(username.trim(), id)) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Tên đăng nhập đã tồn tại!\"}"
                );
                return;
            }

            if (dao.isEmailExistsExcept(email.trim(), id)) {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Email đã tồn tại!\"}"
                );
                return;
            }

            User user = new User();
            user.setId(id);
            user.setUsername(username.trim());
            user.setEmail(email.trim());
            user.setFullName(fullName.trim());
            user.setPhone(phone != null ? phone.trim() : "");
            user.setAddress(address != null ? address.trim() : "");

            boolean success = dao.updateUser(user);

            if (success) {
                response.getWriter().write(
                    "{\"success\": true, \"message\": \"Cập nhật khách hàng thành công!\"}"
                );
            } else {
                response.getWriter().write(
                    "{\"success\": false, \"message\": \"Không thể cập nhật khách hàng!\"}"
                );
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write(
                "{\"success\": false, \"message\": \"Dữ liệu không hợp lệ!\"}"
            );
        } catch (Exception e) {
            e.printStackTrace();
            String msg = escapeJson(e.getMessage());
            response.getWriter().write(
                "{\"success\": false, \"message\": \"Lỗi: " + msg + "\"}"
            );
        }
    }

    private String escapeJson(String text) {
        if (text == null) {
            return "";
        }
        return text.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r")
                   .replace("\t", "\\t");
    }
}