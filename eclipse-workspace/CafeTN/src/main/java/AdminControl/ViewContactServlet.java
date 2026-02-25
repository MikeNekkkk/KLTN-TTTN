package AdminControl;

import Dao.Dao;
import Entity.Contact;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewContact")
public class ViewContactServlet extends HttpServlet {
    
    private Dao dao;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        
        try {
            Long id = Long.parseLong(idParam);
            
            Contact contact = dao.getContactById(id);
            
            if (contact != null) {
                if ("NEW".equals(contact.getStatus())) {
                    dao.updateContactStatus(id, "READ");
                    contact.setStatus("READ");
                }
                
                request.setAttribute("contact", contact);
                request.getRequestDispatcher("doc/view-contact.jsp").forward(request, response);
            } else {
                response.sendRedirect("listContacts");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect("listContacts");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                               "Có lỗi xảy ra khi xem liên hệ.");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}