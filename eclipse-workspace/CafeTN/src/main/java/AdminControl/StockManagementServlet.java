package AdminControl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Dao;
import Entity.Product;
import Entity.StockMovementLog;
import Entity.User;

@WebServlet("/stock-management")
public class StockManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Dao dao;

	@Override
	public void init() throws ServletException {
		dao = new Dao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!isAdmin(request)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		try {
			String action = request.getParameter("action");

			if ("view-log".equals(action)) {
				viewStockLog(request, response);
			} else if ("low-stock".equals(action)) {
				viewLowStock(request, response);
			} else {
				viewStockManagement(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi: " + e.getMessage());
			request.getRequestDispatcher("doc/table-data-QLXuatNhap.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		if (!isAdmin(request)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		try {
			String action = request.getParameter("action");

			if ("import".equals(action)) {
				handleImportStock(request, response);
			} else if ("export".equals(action)) {
				handleExportStock(request, response);
			} else if ("adjust".equals(action)) {
				handleAdjustStock(request, response);
			} else {
				response.sendRedirect("table-data-QLXuatNhap");
			}

		} catch (Exception e) {
			e.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("error", "Lỗi: " + e.getMessage());
			response.sendRedirect("table-data-QLXuatNhap");
		}
	}

	
	private void viewStockManagement(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// Lấy danh sách sản phẩm
		List<Product> products = dao.getAllProducts();
		request.setAttribute("products", products);

		// Lấy lịch sử gần đây (20 bản ghi)
		List<StockMovementLog> recentLogs = dao.getStockMovementLog(null, 20);
		request.setAttribute("recentLogs", recentLogs);

		// Forward đến JSP
		request.getRequestDispatcher("doc/table-data-QLXuatNhap.jsp").forward(request, response);
	}

	/**
	 * Xem lịch sử nhập xuất kho
	 */
	private void viewStockLog(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String productIdStr = request.getParameter("productId");
		Long productId = productIdStr != null ? Long.parseLong(productIdStr) : null;

		int limit = 100;
		String limitStr = request.getParameter("limit");
		if (limitStr != null) {
			limit = Integer.parseInt(limitStr);
		}

		List<StockMovementLog> logs = dao.getStockMovementLog(productId, limit);
		request.setAttribute("logs", logs);

		if (productId != null) {
			Product product = dao.getProductById(productIdStr);
			request.setAttribute("product", product);
		}

		request.getRequestDispatcher("/doc/stock-log.jsp").forward(request, response);
	}

	private void viewLowStock(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int lowStockProducts = dao.getLowStockProducts();
		request.setAttribute("lowStockProducts", lowStockProducts);

		request.getRequestDispatcher("/doc/low-stock.jsp").forward(request, response);
	}

	private void handleImportStock(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Long productId = Long.parseLong(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String note = request.getParameter("note");

		User admin = (User) request.getSession().getAttribute("user");
		String createdBy = admin.getUsername();

		if (quantity <= 0) {
			throw new IllegalArgumentException("Số lượng phải lớn hơn 0");
		}

		boolean success = dao.updateProductStock(productId, quantity, note, createdBy);

		HttpSession session = request.getSession();
		if (success) {
			session.setAttribute("success", "Nhập kho thành công: +" + quantity + " sản phẩm");
		} else {
			session.setAttribute("error", "Nhập kho thất bại");
		}

		response.sendRedirect("stock-management");
	}

	/**
	 * Xử lý xuất kho
	 */
	private void handleExportStock(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Long productId = Long.parseLong(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String note = request.getParameter("note");

		User admin = (User) request.getSession().getAttribute("user");
		String createdBy = admin.getUsername();

		// Validation
		if (quantity <= 0) {
			throw new IllegalArgumentException("Số lượng phải lớn hơn 0");
		}

		// Kiểm tra tồn kho
		int currentStock = dao.getProductStock(productId);
		if (currentStock < quantity) {
			throw new IllegalArgumentException("Không đủ hàng trong kho (Còn: " + currentStock + ")");
		}

		// Xuất kho (số âm)
		boolean success = dao.updateProductStock(productId, -quantity, note, createdBy);

		HttpSession session = request.getSession();
		if (success) {
			session.setAttribute("success", "Xuất kho thành công: -" + quantity + " sản phẩm");
		} else {
			session.setAttribute("error", "Xuất kho thất bại");
		}

		response.sendRedirect("stock-management");
	}

	private void handleAdjustStock(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Long productId = Long.parseLong(request.getParameter("productId"));
		int newStock = Integer.parseInt(request.getParameter("newStock"));
		String note = request.getParameter("note");

		User admin = (User) request.getSession().getAttribute("user");
		String createdBy = admin.getUsername();

		// Validation
		if (newStock < 0) {
			throw new IllegalArgumentException("Số lượng không được âm");
		}

		// Lấy tồn kho hiện tại
		int currentStock = dao.getProductStock(productId);
		int difference = newStock - currentStock;

		if (difference == 0) {
			HttpSession session = request.getSession();
			session.setAttribute("info", "Không có thay đổi");
			response.sendRedirect("stock-management");
			return;
		}

		// Cập nhật
		boolean success = dao.updateProductStock(productId, difference, "Điều chỉnh tồn kho: " + note, createdBy);

		HttpSession session = request.getSession();
		if (success) {
			session.setAttribute("success", "Điều chỉnh thành công: " + currentStock + " → " + newStock);
		} else {
			session.setAttribute("error", "Điều chỉnh thất bại");
		}

		response.sendRedirect("stock-management");
	}

	/**
	 * Kiểm tra quyền admin
	 */
	private boolean isAdmin(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return false;
		}

		User user = (User) session.getAttribute("user");
		return user != null && "ADMIN".equals(user.getRole());
	}
}