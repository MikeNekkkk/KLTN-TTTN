package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Dao;
import Entity.Category;
import Entity.Product;

@WebServlet("/ProductCategories")
public class ProductCategories extends HttpServlet {
	private Dao dao;
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		dao = new Dao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			List<Product> listProducts = dao.getAllProducts();
			List<Product> listProducts4 = dao.getProductsByCategoryId4();

			List<Category> listCategories = dao.getAllCategories();
			List<Product> featuredProducts = listProducts.size() > 3 ? listProducts.subList(0, 3) : listProducts;

			request.setAttribute("listP4", listProducts4);
			request.setAttribute("listP", listProducts);
			request.setAttribute("listC", listCategories);
			request.setAttribute("featuredP", featuredProducts);

			request.getRequestDispatcher("shop.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải dữ liệu trang chủ.");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
