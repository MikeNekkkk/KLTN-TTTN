package AdminControl;

import Dao.Dao;
import Entity.Contact;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listContacts")
public class ListContactsServlet extends HttpServlet {

	private Dao dao;

	@Override
	public void init() throws ServletException {
		dao = new Dao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Lấy danh sách contacts
			List<Contact> listContacts = dao.getAllContacts();
			request.setAttribute("listContacts", listContacts);

			// Đếm số lượng
			int totalContacts = dao.getTotalContacts();
			int newContacts = dao.getNewContactsCount();

			request.setAttribute("totalContacts", totalContacts);
			request.setAttribute("newContacts", newContacts);
			request.getRequestDispatcher("doc/table-data-contacts.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải dữ liệu liên hệ.");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}