package Controller;

import Dao.Dao;
import Entity.Blog;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/blogDetail")
public class BlogDetailServlet extends HttpServlet {
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            
            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("blog.jsp");
                return;
            }
            
            Long blogId = Long.parseLong(idParam);
            Blog blog = dao.getBlogById(blogId);
            
            if (blog == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy bài viết");
                return;
            }
            
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("blog1.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Lỗi khi tải bài viết: " + e.getMessage());
        }
    }
}