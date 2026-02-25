package AdminControl;

import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteContact")
public class DeleteContactServlet extends HttpServlet {
    
    private Dao dao;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        HttpSession session = request.getSession();
        
        try {
            Long id = Long.parseLong(idParam);
            
            boolean success = dao.deleteContact(id);
            
            if (success) {
                session.setAttribute("successMessage", "Xóa liên hệ thành công!");
            } else {
                session.setAttribute("errorMessage", "Không thể xóa liên hệ!");
            }
            
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "ID không hợp lệ!");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
        }
        
        response.sendRedirect("listContacts");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}