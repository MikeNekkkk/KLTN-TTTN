package Controller;

import Entity.User;
import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    private Dao dao;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user != null) {
            response.sendRedirect("home");
            return;
        }
        
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            fullName == null || fullName.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin bắt buộc!");
            preserveFormData(request, username, email, fullName, phone, address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if (username.length() < 4 || username.length() > 20) {
            request.setAttribute("errorMessage", "Tên đăng nhập phải từ 4-20 ký tự!");
            preserveFormData(request, username, email, fullName, phone, address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if (password.length() < 6) {
            request.setAttribute("errorMessage", "Mật khẩu phải có ít nhất 6 ký tự!");
            preserveFormData(request, username, email, fullName, phone, address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu xác nhận không khớp!");
            preserveFormData(request, username, email, fullName, phone, address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("errorMessage", "Email không hợp lệ!");
            preserveFormData(request, username, email, fullName, phone, address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if (phone != null && !phone.trim().isEmpty()) {
            if (!phone.matches("^0\\d{9}$")) {
                request.setAttribute("errorMessage", "Số điện thoại không hợp lệ! (10 số, bắt đầu bằng 0)");
                preserveFormData(request, username, email, fullName, phone, address);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        }
        
        try {
            if (dao.isUsernameExists(username)) {
                request.setAttribute("errorMessage", "Tên đăng nhập đã tồn tại!");
                preserveFormData(request, username, email, fullName, phone, address);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            if (dao.isEmailExists(email)) {
                request.setAttribute("errorMessage", "Email đã được sử dụng!");
                preserveFormData(request, username, email, fullName, phone, address);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            User newUser = new User(username, password, email, fullName);
            newUser.setPhone(phone);
            newUser.setAddress(address);
            
            boolean success = dao.register(newUser);
            
            if (success) {
                request.setAttribute("successMessage", 
                    "Đăng ký thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Đăng ký thất bại! Vui lòng thử lại.");
                preserveFormData(request, username, email, fullName, phone, address);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra. Vui lòng thử lại sau!");
            preserveFormData(request, username, email, fullName, phone, address);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    

    private void preserveFormData(HttpServletRequest request, String username, 
                                  String email, String fullName, String phone, String address) {
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("fullName", fullName);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
    }
}