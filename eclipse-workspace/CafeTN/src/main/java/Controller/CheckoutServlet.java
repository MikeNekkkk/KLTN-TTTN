package Controller;

import Entity.CartItem;
import Entity.Order;
import Entity.OrderItem;
import Entity.User;
import Dao.Dao;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	private Dao dao;

	@Override
	public void init() throws ServletException {
		dao = new Dao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart == null || cart.isEmpty()) {
			response.sendRedirect("cart.jsp");
			return;
		}

		BigDecimal totalAmount = BigDecimal.ZERO;
		for (CartItem item : cart) {
			BigDecimal itemTotal = item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity()));
			totalAmount = totalAmount.add(itemTotal);
		}

		User user = (User) session.getAttribute("user");
		if (user != null) {
			String fullName = user.getFullName();
			if (fullName != null && !fullName.trim().isEmpty()) {
				String[] nameParts = fullName.trim().split("\\s+", 2);
				request.setAttribute("firstName", nameParts[0]); // Họ (hoặc tên đầu)
				if (nameParts.length > 1) {
					request.setAttribute("lastName", nameParts[1]); // Tên (phần còn lại)
				}
			} else {
				request.setAttribute("firstName", "");
				request.setAttribute("lastName", "");
			}
			request.setAttribute("email", user.getEmail());
			request.setAttribute("phone", user.getPhone());
			request.setAttribute("address", user.getAddress());
		}

		request.getRequestDispatcher("checkout.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName"); 
		String fullName = firstName + " " + lastName;

		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String notes = request.getParameter("notes");

		String streetAddress = request.getParameter("address");
		String ward = request.getParameter("ward");
		String district = request.getParameter("district");
		String city = request.getParameter("city");
		String region = request.getParameter("region");

		String fullAddress = streetAddress + ", Phường " + ward + ", Quận " + district + ", Thành Phố " + city;
		String createAccount = request.getParameter("createAccount");
		String accountPassword = request.getParameter("accountPassword");
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			response.sendRedirect("cart.jsp");
			return;
		}

		BigDecimal totalAmount = BigDecimal.ZERO;
		for (CartItem item : cart) {
			BigDecimal itemTotal = item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity()));
			totalAmount = totalAmount.add(itemTotal);
		}
		User user = (User) session.getAttribute("user");
		if (user == null && "on".equals(createAccount)) {
			try {
				if (dao.isEmailExists(email)) {
					request.setAttribute("errorMessage", "Email này đã được đăng ký!");
					request.getRequestDispatcher("checkout.jsp").forward(request, response);
					return;
				}
				if (dao.isUsernameExists(email)) {
					request.setAttribute("errorMessage", "Tài khoản đã tồn tại!");
					request.getRequestDispatcher("checkout.jsp").forward(request, response);
					return;
				}

				User newUser = new User();
				newUser.setUsername(email);
				newUser.setPassword(accountPassword); 
				newUser.setEmail(email);
				newUser.setFullName(fullName);
				newUser.setPhone(phone);
				newUser.setAddress(fullAddress);
				newUser.setRole("USER");
				newUser.setStatus("ACTIVE");

				boolean isRegistered = dao.register(newUser);

				if (isRegistered) {
					User loggedInUser = dao.login(email, accountPassword);

					if (loggedInUser != null) {
						session.setAttribute("user", loggedInUser); // Lưu vào session
						user = loggedInUser; 
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", "Lỗi khi tạo tài khoản: " + e.getMessage());
				request.getRequestDispatcher("checkout.jsp").forward(request, response);
				return;
			}
		}

		Order order = new Order();
		if (user != null) {
			order.setUserId(user.getId()); 
		}

		order.setFirstName(firstName);
		order.setLastName(lastName);
		order.setAddress(fullAddress);
		order.setCity(city);
		order.setState(region); 
		order.setEmail(email);
		order.setPhone(phone);
		order.setNotes(notes); 
		order.setTotalAmount(totalAmount);
		order.setStatus("PENDING");
		order.setPaymentMethod("PENDING"); 

		List<OrderItem> orderItems = new ArrayList<>();
		for (CartItem cartItem : cart) {
			OrderItem orderItem = new OrderItem();
			orderItem.setProductId(cartItem.getProduct().getId());
			orderItem.setProductName(cartItem.getProduct().getName());
			orderItem.setPrice(cartItem.getProduct().getPrice());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setSubtotal(cartItem.getProduct().getPrice().multiply(new BigDecimal(cartItem.getQuantity())));
			orderItems.add(orderItem);
		}
		order.setOrderItems(orderItems);

		try {
			Long orderId = dao.createOrder(order, orderItems);
			order.setId(orderId);

			session.setAttribute("pendingOrder", order);

			response.sendRedirect("payment-method.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Có lỗi xảy ra khi tạo đơn hàng!");
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}
	}
}