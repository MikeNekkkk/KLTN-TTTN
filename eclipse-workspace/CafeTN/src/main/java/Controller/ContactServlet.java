package Controller;

import Entity.Contact;
import Entity.User;
import Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/submitContact")
public class ContactServlet extends HttpServlet {

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
			request.setAttribute("userName", user.getFullName());
			request.setAttribute("userEmail", user.getEmail());
		}

		request.getRequestDispatcher("contact.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		try {
			Contact contact = new Contact();
			if (user != null) {
				contact.setUserId(user.getId());
			}

			contact.setName(name);
			contact.setEmail(email);
			contact.setSubject(subject);
			contact.setMessage(message);
			contact.setStatus("NEW");

			boolean success = dao.createContact(contact);

			if (success) {
				session.setAttribute("successMessage", "Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi sớm nhất có thể.");
				response.sendRedirect("contact.jsp");
			} else {
				request.setAttribute("errorMessage", "Có lỗi xảy ra. Vui lòng thử lại!");
				request.getRequestDispatcher("contact.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Có lỗi xảy ra khi gửi liên hệ: " + e.getMessage());
			request.getRequestDispatcher("contact.jsp").forward(request, response);
		}
	}
}