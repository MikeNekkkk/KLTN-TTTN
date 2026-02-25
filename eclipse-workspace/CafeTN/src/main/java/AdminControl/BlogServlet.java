package AdminControl;

import Dao.Dao;
import Entity.Blog;
import java.io.IOException;
import java.io.File;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/blog")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class BlogServlet extends HttpServlet {

    private Dao dao;

    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("list")) {
                listBlogs(request, response);
            } else if (action.equals("add")) {
                showAddForm(request, response);
            } else if (action.equals("edit")) {
                showEditForm(request, response);
            } else if (action.equals("delete")) {
                deleteBlog(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addBlog(request, response);
            } else if ("update".equals(action)) {
                updateBlog(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi: " + e.getMessage());
        }
    }

    private void listBlogs(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String keyword = request.getParameter("keyword");
        List<Blog> listBlogs;

        if (keyword != null && !keyword.trim().isEmpty()) {
            listBlogs = dao.searchBlogs(keyword);
        } else {
            listBlogs = dao.getAllBlogsAD();
        }

        request.setAttribute("listBlogs", listBlogs);
        request.getRequestDispatcher("doc/blog-list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.getRequestDispatcher("doc/blog-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Long id = Long.parseLong(request.getParameter("id"));
        Blog blog = dao.getBlogById(id);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("doc/blog-form.jsp").forward(request, response);
    }

    private void addBlog(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String excerpt = request.getParameter("excerpt");
        String category = request.getParameter("category");
        String status = request.getParameter("status");

        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("error", "Tiêu đề không được để trống!");
            showAddForm(request, response);
            return;
        }

        String thumbnailUrl = "img/blog/default-blog.jpg";
        Part filePart = request.getPart("thumbnail");

        if (filePart != null && filePart.getSize() > 0) {

            String fileName = extractFileName(filePart);

            if (fileName != null && fileName.contains(".")) {

                String extension = fileName.substring(fileName.lastIndexOf("."));
                String uniqueFileName = "blog_" + System.currentTimeMillis() + extension;

                String uploadDir = getServletContext().getRealPath("/img/blog");

                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                String filePath = uploadDir + File.separator + uniqueFileName;
                filePart.write(filePath);

                thumbnailUrl = "img/blog/" + uniqueFileName;
            }
        }

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setSlug(Dao.createSlug(title));
        blog.setThumbnailUrl(thumbnailUrl);
        blog.setContent(content);
        blog.setExcerpt(excerpt);
        blog.setAuthorId(1L);
        blog.setAuthorName("Admin");
        blog.setCategory(category);
        blog.setStatus(status);

        boolean success = dao.addBlog(blog);

        if (success) {
            response.sendRedirect("blog?msg=add_success");
        } else {
            request.setAttribute("error", "Không thể thêm blog!");
            showAddForm(request, response);
        }
    }

    private void updateBlog(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String excerpt = request.getParameter("excerpt");
        String category = request.getParameter("category");
        String status = request.getParameter("status");
        String oldThumbnail = request.getParameter("oldThumbnail");

        String thumbnailUrl = oldThumbnail;
        Part filePart = request.getPart("thumbnail");

        if (filePart != null && filePart.getSize() > 0) {

            String fileName = extractFileName(filePart);

            if (fileName != null && fileName.contains(".")) {

                String extension = fileName.substring(fileName.lastIndexOf("."));
                String uniqueFileName = "blog_" + System.currentTimeMillis() + extension;

                String uploadDir = getServletContext().getRealPath("/img/blog");

                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                String filePath = uploadDir + File.separator + uniqueFileName;
                filePart.write(filePath);

                thumbnailUrl = "img/blog/" + uniqueFileName;
            }
        }

        Blog blog = new Blog();
        blog.setId(id);
        blog.setTitle(title);
        blog.setSlug(Dao.createSlug(title));
        blog.setThumbnailUrl(thumbnailUrl);
        blog.setContent(content);
        blog.setExcerpt(excerpt);
        blog.setCategory(category);
        blog.setStatus(status);

        boolean success = dao.updateBlog(blog);

        if (success) {
            response.sendRedirect("blog?msg=update_success");
        } else {
            request.setAttribute("error", "Không thể cập nhật blog!");
            showEditForm(request, response);
        }
    }

    private void deleteBlog(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Long id = Long.parseLong(request.getParameter("id"));
        boolean success = dao.deleteBlog(id);

        response.sendRedirect("blog?msg=" + (success ? "delete_success" : "delete_failed"));
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
}
