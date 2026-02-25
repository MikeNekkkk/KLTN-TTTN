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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
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
            if (user.isAdmin()) {
                response.sendRedirect("AdminHome");
            } else {
                response.sendRedirect("home");
            }
            return;
        }
        
        String returnUrl = request.getParameter("returnUrl");
        if (returnUrl != null && !returnUrl.isEmpty()) {
            session.setAttribute("returnUrl", returnUrl);
        }
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        try {
            User user = dao.login(username, password);
            
            if (user == null) {
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng!");
                request.setAttribute("username", username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            if ("on".equals(remember)) {
            }
            
            String returnUrl = (String) session.getAttribute("returnUrl");
            
            if (user.isAdmin()) {
                session.removeAttribute("returnUrl");
                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                if (returnUrl != null && !returnUrl.isEmpty()) {
                    session.removeAttribute("returnUrl");
                    response.sendRedirect(request.getContextPath() + "/" + returnUrl);
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra. Vui lòng thử lại sau!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}