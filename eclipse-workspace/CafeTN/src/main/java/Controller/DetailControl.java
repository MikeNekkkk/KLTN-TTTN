package Controller;

import Dao.Dao;
import Entity.Product;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailControl extends HttpServlet {

	private Dao dao;

	@Override
	public void init() throws ServletException {
		dao = new Dao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("pid");
		String categoryId = request.getParameter("categoryId");
		Dao dao = new Dao();

		Product p = null;
		try {
			p = dao.getProductById(id);
			List<Product> listSimilarProducts = dao.getSimilarProducts(id, categoryId, 4);

			request.setAttribute("de1", listSimilarProducts);
			request.setAttribute("detail", p);
			request.setAttribute("categoryId", categoryId); 

			request.getRequestDispatcher("product-details.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}