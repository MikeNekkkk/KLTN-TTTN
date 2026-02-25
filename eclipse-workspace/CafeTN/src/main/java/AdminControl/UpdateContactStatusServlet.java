package AdminControl;

import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateContactStatus")
public class UpdateContactStatusServlet extends HttpServlet {
    
    private Dao dao;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        String status = request.getParameter("status");
        HttpSession session = request.getSession();
        
        try {
            Long id = Long.parseLong(idParam);
            
            if (!status.equals("NEW") && !status.equals("READ") && !status.equals("REPLIED")) {
                session.setAttribute("errorMessage", "Trạng thái không hợp lệ!");
                response.sendRedirect("listContacts");
                return;
            }
            
            boolean success = dao.updateContactStatus(id, status);
            
            if (success) {
                session.setAttribute("successMessage", "Cập nhật trạng thái thành công!");
            } else {
                session.setAttribute("errorMessage", "Không thể cập nhật trạng thái!");
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