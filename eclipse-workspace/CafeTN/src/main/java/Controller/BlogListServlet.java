package Controller;

import Dao.Dao;
import Entity.Blog;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/blogList")
public class BlogListServlet extends HttpServlet {
    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Blog> listBlogs = dao.getAllBlogs();
                        
            request.setAttribute("listBlogs", listBlogs);
            request.getRequestDispatcher("blog.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Lỗi khi tải danh sách blog: " + e.getMessage());
        }
    }
}