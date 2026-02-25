package Dao;

import connection.DatabaseConnection;
import Entity.Product;
import Entity.ProductAI;
import Entity.StockMovementLog;
import Entity.User;
import Entity.Blog;
import Entity.Category;
import Entity.ChatMessage;
import Entity.Contact;
import Entity.Order;
import Entity.OrderItem;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao {
	private Connection connection;
	private static final String Product = null;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private Connection getConnection() throws Exception {
		return DatabaseConnection.getConnection();
	}

	public List<Category> getAllCategories() throws Exception {
		List<Category> list = new ArrayList<>();
		String query = "SELECT id, name FROM category";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				Category category = new Category(rs.getLong("id"), rs.getString("name"));
				list.add(category);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT p.id, p.category_id, c.name AS category_name, p.name, "
				+ "p.price, p.detail_description, p.image_url, p.stock_quantity, p.status " + "FROM product p "
				+ "LEFT JOIN category c ON p.category_id = c.id " + "WHERE p.status = 'ACTIVE' " + "ORDER BY p.id DESC";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("id"));
				product.setCategoryId(rs.getLong("category_id"));
				product.setCategoryName(rs.getString("category_name"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getBigDecimal("price"));
				product.setDetailDescription(rs.getString("detail_description"));
				product.setImageUrl(rs.getString("image_url"));
				product.setStockQuantity(rs.getInt("stock_quantity"));
				product.setStatus(rs.getString("status"));
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public Product getProductById(String id) {
		String sql = "SELECT p.id, p.category_id, c.name AS category_name, p.name, "
				+ "p.price, p.detail_description, p.image_url, p.stock_quantity, p.status " + "FROM product p "
				+ "LEFT JOIN category c ON p.category_id = c.id " + "WHERE p.id = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id); // ✅ Dùng setString thay vì setLong
			rs = ps.executeQuery();

			if (rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("id"));
				product.setCategoryId(rs.getLong("category_id"));
				product.setCategoryName(rs.getString("category_name"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getBigDecimal("price"));
				product.setDetailDescription(rs.getString("detail_description"));
				product.setImageUrl(rs.getString("image_url"));
				product.setStockQuantity(rs.getInt("stock_quantity"));
				product.setStatus(rs.getString("status"));
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean isProductInAnyOrder(String productId) {
		String sql = "SELECT COUNT(*) FROM order_items WHERE product_id = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, productId); // ✅ setString
			rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean softDeleteProduct(String productId) {
		String sql = "UPDATE product SET status = 'INACTIVE' WHERE id = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, productId);

			int rows = ps.executeUpdate();
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean deleteProduct(String productId) {
		if (isProductInAnyOrder(productId)) {
			return softDeleteProduct(productId);
		} else {
			String sql = "DELETE FROM product WHERE id = ?";
			try {
				conn = getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, productId);

				int rows = ps.executeUpdate();
				return rows > 0;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (ps != null)
						ps.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	public boolean isProductNameExistsExcept(String productName, String productId) throws Exception {
		String query = "SELECT id FROM product WHERE name = ? AND id != ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, productName);
			ps.setString(2, productId);
			rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<Product> getSimilarProducts(String currentProductId, String categoryId, int limit) {
		List<Product> list = new ArrayList<>();
		String query = """
				SELECT
				    p.id, p.category_id, c.name AS category_name,
				    p.name, p.price, p.detail_description,
				    p.image_url, p.stock_quantity
				FROM
				    product p
				JOIN
				    category c ON p.category_id = c.id
				WHERE
				    p.category_id = ? AND p.id != ?
				ORDER BY RAND()
				LIMIT ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, categoryId);
			ps.setString(2, currentProductId);
			ps.setInt(3, limit);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getLong("id"));
				p.setCategoryId(rs.getLong("category_id"));
				p.setCategoryName(rs.getString("category_name"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setDetailDescription(rs.getString("detail_description"));
				p.setImageUrl(rs.getString("image_url"));
				p.setStockQuantity(rs.getInt("stock_quantity"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public List<Product> getProductsByCategoryId(String categoryId) {
		List<Product> list = new ArrayList<>();
		String query = """
				SELECT
				    p.id, p.category_id, c.name AS category_name,
				    p.name, p.price, p.detail_description,
				    p.image_url, p.stock_quantity
				FROM
				    product p
				JOIN
				    category c ON p.category_id = c.id
				WHERE
				    p.category_id = ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, categoryId);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setCategoryId(rs.getLong("category_id"));
				p.setCategoryName(rs.getString("category_name"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setDetailDescription(rs.getString("detail_description"));
				p.setImageUrl(rs.getString("image_url"));
				p.setStockQuantity(rs.getInt("stock_quantity"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public boolean addProduct(Product product) throws Exception {
		String sql = """
				INSERT INTO product (name, category_id, price, stock_quantity,
				                   detail_description, image_url)
				VALUES (?, ?, ?, ?, ?, ?)
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setLong(2, product.getCategoryId());
			ps.setBigDecimal(3, product.getPrice());
			ps.setInt(4, product.getStockQuantity());
			ps.setString(5, product.getDetailDescription());
			ps.setString(6, product.getImageUrl());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean updateProduct(Product product) {
		String sql = "UPDATE product SET name = ?, category_id = ?, price = ?, "
				+ "stock_quantity = ?, image_url = ?, detail_description = ?, status = ? " + "WHERE id = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setLong(2, product.getCategoryId());
			ps.setBigDecimal(3, product.getPrice());
			ps.setInt(4, product.getStockQuantity());
			ps.setString(5, product.getImageUrl());
			ps.setString(6, product.getDetailDescription());
			ps.setString(7, product.getStatus() != null ? product.getStatus() : "ACTIVE");
			ps.setLong(8, product.getId());

			int rows = ps.executeUpdate();
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean isProductNameExists(String productName) throws Exception {
		String query = "SELECT id FROM product WHERE name = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, productName);
			rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean updateProductStock(String productId, int quantity) throws Exception {
		String sql = "UPDATE product SET stock_quantity = ? WHERE id = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, quantity);
			ps.setString(2, productId); // ✅ setString

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<Product> searchProductsByName(String keyword) throws Exception {
		List<Product> list = new ArrayList<>();
		String query = """
				SELECT
				    p.id, p.category_id, c.name AS category_name,
				    p.name, p.price, p.detail_description,
				    p.image_url, p.stock_quantity
				FROM
				    product p
				JOIN
				    category c ON p.category_id = c.id
				WHERE
				    p.name LIKE ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + keyword + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getLong("id"));
				p.setCategoryId(rs.getLong("category_id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setDetailDescription(rs.getString("detail_description"));
				p.setImageUrl(rs.getString("image_url"));
				p.setStockQuantity(rs.getInt("stock_quantity"));
				p.setCategoryName(rs.getString("category_name"));
				list.add(p);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	public List<Product> ProductsSoldout() throws Exception {
		List<Product> list = new ArrayList<>();
		String query = """
				SELECT
				    p.id, p.category_id, c.name AS category_name,
				    p.name, p.price, p.detail_description,
				    p.image_url, p.stock_quantity
				FROM
				    product p
				JOIN
				    category c ON p.category_id = c.id
				WHERE
				    p.stock_quantity = 0
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getLong("id"));
				p.setCategoryId(rs.getLong("category_id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setDetailDescription(rs.getString("detail_description"));
				p.setImageUrl(rs.getString("image_url"));
				p.setStockQuantity(rs.getInt("stock_quantity"));
				p.setCategoryName(rs.getString("category_name"));
				list.add(p);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	public List<Order> getOrdersbyiduser(long id) throws Exception {
		List<Order> list = new ArrayList<>();
		String query = """
				SELECT orders.id, orders.user_id, first_name, last_name, orders.email, orders.phone, orders.address,
				       orders.city, orders.state, total_amount, orders.status, payment_method,
				       orders.created_at, orders.updated_at
				FROM orders
				            join users us on us.id =  orders.user_id
				where orders.user_id = ? ;
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("id"));
				order.setFirstName(rs.getString("first_name"));
				order.setLastName(rs.getString("last_name"));
				order.setEmail(rs.getString("email"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setState(rs.getString("state"));
				order.setTotalAmount(rs.getBigDecimal("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setCreatedAt(rs.getTimestamp("created_at"));
				order.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(order);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<Order> getAllOrders() throws Exception {
		List<Order> list = new ArrayList<>();
		String query = """
				SELECT id, first_name, last_name, email, phone, address,
				       city, state, total_amount, status, payment_method,
				       created_at, updated_at
				FROM orders
				ORDER BY created_at DESC
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("id"));
				order.setFirstName(rs.getString("first_name"));
				order.setLastName(rs.getString("last_name"));
				order.setEmail(rs.getString("email"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setState(rs.getString("state"));
				order.setTotalAmount(rs.getBigDecimal("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setCreatedAt(rs.getTimestamp("created_at"));
				order.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(order);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<OrderItem> getOrderItemsByOrderId(Long orderId) throws Exception {
		List<OrderItem> list = new ArrayList<>();
		String query = """
				SELECT id, order_id, product_id, product_name,
				       price, quantity, subtotal
				FROM order_items
				WHERE order_id = ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setLong(1, orderId);
			rs = ps.executeQuery();

			while (rs.next()) {
				OrderItem item = new OrderItem();
				item.setId(rs.getLong("id"));
				item.setOrderId(rs.getLong("order_id"));
				item.setProductId(rs.getLong("product_id"));
				item.setProductName(rs.getString("product_name"));
				item.setPrice(rs.getBigDecimal("price"));
				item.setQuantity(rs.getInt("quantity"));
				item.setSubtotal(rs.getBigDecimal("subtotal"));
				list.add(item);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean deleteOrder(Long orderId) {
		try {
			Order order = getOrderById(orderId);

			if (order == null) {
				throw new RuntimeException("Đơn hàng không tồn tại!");
			}

			if ("COMPLETED".equals(order.getStatus())) {
				throw new RuntimeException("Không thể xóa đơn hàng đã hoàn thành!");
			}

			String sql = "DELETE FROM orders WHERE id = ?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, orderId);

			int rows = ps.executeUpdate();
			return rows > 0;

		} catch (RuntimeException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Lỗi xóa đơn hàng: " + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Tìm kiếm đơn hàng theo từ khóa
	 */
	public List<Order> searchOrders(String keyword) throws Exception {
		List<Order> list = new ArrayList<>();
		String query = """
				SELECT id, first_name, last_name, email, phone, address,
				       city, state, total_amount, status, payment_method,
				       created_at, updated_at
				FROM orders
				WHERE first_name LIKE ? OR last_name LIKE ?
				   OR email LIKE ? OR phone LIKE ?
				ORDER BY created_at DESC
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			String searchPattern = "%" + keyword + "%";
			ps.setString(1, searchPattern);
			ps.setString(2, searchPattern);
			ps.setString(3, searchPattern);
			ps.setString(4, searchPattern);
			rs = ps.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("id"));
				order.setFirstName(rs.getString("first_name"));
				order.setLastName(rs.getString("last_name"));
				order.setEmail(rs.getString("email"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setState(rs.getString("state"));
				order.setTotalAmount(rs.getBigDecimal("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setCreatedAt(rs.getTimestamp("created_at"));
				order.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(order);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public int getProductStock(Long productId) throws Exception {
	    String sql = "SELECT stock_quantity FROM product WHERE id = ?";
	    
	    try (Connection conn = getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setLong(1, productId);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            return rs.getInt("stock_quantity");
	        }
	        
	        return 0;
	    }
	}

	public Long createOrder(Order order, List<OrderItem> orderItems) throws Exception {

		try {
			PreparedStatement psCheckStock = null;
			conn = getConnection();
			conn.setAutoCommit(false);
			String checkStockSQl = "SELECT id, name, stock_quanlity from product where id=? and status 'ACTIVE' for update";
			for (OrderItem item : orderItems) {
				psCheckStock.setLong(1, item.getProductId());
				rs = psCheckStock.executeQuery();
				if (rs.next()) {
					int currentStock = rs.getInt("stock_quality");
					String ProductName = rs.getNString("name");
					if (currentStock < item.getQuantity()) {
						conn.rollback();

					}
				} else {
					conn.rollback();
					throw new Exception("Sản phẩm ID " + item.getProductId() + " không tồn tại hoặc đã ngưng bán");

				}
				rs.close();

			}
			String orderQuery = """
					INSERT INTO orders (user_id,first_name, last_name, company, address, city,
					                   state, email, phone, notes, total_amount,
					                   status, payment_method, created_at)
					VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
					""";

			Long orderId = null;
			ps = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
			ps.setString(2, order.getFirstName());
			ps.setString(3, order.getLastName());
			ps.setString(4, order.getCompany());
			ps.setString(5, order.getAddress());
			ps.setString(6, order.getCity());
			ps.setString(7, order.getState());
			ps.setString(8, order.getEmail());
			ps.setString(9, order.getPhone());
			ps.setString(10, order.getNotes());
			ps.setBigDecimal(11, order.getTotalAmount());
			ps.setString(12, order.getStatus());
			ps.setString(13, order.getPaymentMethod());
			if (order.getUserId() != null) {
				ps.setLong(1, order.getUserId());
			} else {
				ps.setNull(1, java.sql.Types.INTEGER);
			}
			int affectedRows = ps.executeUpdate();
			if (affectedRows == 0) {
				throw new SQLException("Tạo đơn hàng thất bại!");
			}

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				orderId = rs.getLong(1);
			} else {
				throw new SQLException("Không lấy được order_id!");
			}

			ps.close();
			if (orderId == null) {
				throw new SQLException("orderId is NULL - cannot create order items!");
			}
			String orderItemQuery = """
					INSERT INTO order_items ( order_id, product_id, product_name,
					                        price, quantity, subtotal)
					VALUES (?, ?, ?, ?, ?, ?)
					""";
			String updateStockSQL = "UPDATE product " + "SET stock_quantity = stock_quantity - ? " + "WHERE id = ?";

			PreparedStatement psUpdateStock = null;
			ps = conn.prepareStatement(orderItemQuery);
			psUpdateStock = conn.prepareStatement(updateStockSQL);

			for (OrderItem item : order.getOrderItems()) {

				ps.setLong(1, orderId);
				ps.setLong(2, item.getProductId());
				ps.setString(3, item.getProductName());
				ps.setBigDecimal(4, item.getPrice());
				ps.setInt(5, item.getQuantity());
				ps.setBigDecimal(6, item.getSubtotal());
				psUpdateStock.setInt(1, item.getQuantity());
				psUpdateStock.setLong(2, item.getProductId());
				psUpdateStock.addBatch();
			}
			ps.executeBatch();
			psUpdateStock.executeBatch();

			conn.commit();
			return orderId;

		} catch (Exception e) {
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null) {
					conn.setAutoCommit(true);
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean updateOrderStatus(Long orderId, String status, String paymentMethod) {
		try {
			Order currentOrder = getOrderById(orderId);

			if (currentOrder == null) {
				throw new RuntimeException("Đơn hàng không tồn tại!");
			}

			StringBuilder sql = new StringBuilder(
					"UPDATE orders SET status = ?, payment_method = ?, updated_at = NOW() WHERE id = ?");
			conn = getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, status);
			ps.setString(2, paymentMethod);
			ps.setLong(3, orderId);
			int rows = ps.executeUpdate();
			return rows > 0;

		} catch (RuntimeException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Lỗi cập nhật đơn hàng: " + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public Order getOrderById(Long orderId) {
		String sql = "SELECT * FROM orders WHERE id = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, orderId);
			rs = ps.executeQuery();

			if (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("id"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setTotalAmount(rs.getBigDecimal("total_amount"));
				order.setFirstName(rs.getString("first_name"));
				order.setLastName(rs.getString("last_name"));
				order.setEmail(rs.getString("email"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setState(rs.getString("state"));
				order.setNotes(rs.getString("notes"));
				order.setCreatedAt(rs.getTimestamp("created_at"));
				return order;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public List<Product> getProductsByCategoryId4() {

		List<Product> list = new ArrayList<>();

		String query = """

				SELECT

				    p.id, p.category_id, c.name AS category_name,
				    p.name, p.price, p.detail_description,
				    p.image_url, p.stock_quantity
				FROM
				    product p
				JOIN
				    category c ON p.category_id = c.id

				WHERE
				    p.category_id = 4

				""";
		try {

			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getLong("id"));
				p.setCategoryId(rs.getLong("category_id"));
				p.setCategoryName(rs.getString("category_name"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setDetailDescription(rs.getString("detail_description"));
				p.setImageUrl(rs.getString("image_url"));
				p.setStockQuantity(rs.getInt("stock_quantity"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// user
	public static String md5(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] hash = md.digest(password.getBytes("UTF-8"));
			StringBuilder sb = new StringBuilder();
			for (byte b : hash) {
				sb.append(String.format("%02x", b & 0xff));
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Đăng nhập user
	 */
	public User login(String username, String password) throws Exception {
		String query = """
				SELECT * FROM users
				WHERE username = ? AND password = ? AND status = 'ACTIVE'
				""";

		User user = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, md5(password)); // Mã hóa password
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getLong("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setFullName(rs.getString("full_name"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				user.setCreatedAt(rs.getTimestamp("created_at"));
				user.setUpdatedAt(rs.getTimestamp("updated_at"));
			}

			return user;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean addUser(User user) throws Exception {
		String query = """
				INSERT INTO users (username, password, email, full_name, phone,
				                  address, role, status)
				VALUES (?, ?, ?, ?, ?, ?, 'USER', 'ACTIVE')
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, md5(user.getPassword()));
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getFullName());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getAddress());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Cập nhật thông tin user
	 */
	public boolean updateUser(User user) throws Exception {
		String sql = """
				UPDATE users
				SET username = ?, email = ?, full_name = ?, phone = ?,
				    address = ?, updated_at = NOW()
				WHERE id = ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getAddress());
			ps.setLong(6, user.getId());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<User> AllUser() throws Exception {
		List<User> list = new ArrayList<>();

		String query = """
				SELECT * FROM users where role = 'USER'
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getLong("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setFullName(rs.getString("full_name"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				user.setCreatedAt(rs.getTimestamp("created_at"));
				user.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(user);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Đăng ký user mới
	 */
	public boolean register(User user) throws Exception {
		String query = """
				INSERT INTO users (username, password, email, full_name, phone,
				                  address, role, status)
				VALUES (?, ?, ?, ?, ?, ?, 'USER', 'ACTIVE')
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, md5(user.getPassword())); // Mã hóa password
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getFullName());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getAddress());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean deleteUser(Long userId) throws Exception {
		String sql = "DELETE FROM users WHERE id = ? AND role = 'USER'";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, userId);

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean isUsernameExistsExcept(String username, Long userId) throws Exception {
		String query = "SELECT id FROM users WHERE username = ? AND id != ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setLong(2, userId);
			rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Kiểm tra email tồn tại (trừ user hiện tại)
	 */
	public boolean isEmailExistsExcept(String email, Long userId) throws Exception {
		String query = "SELECT id FROM users WHERE email = ? AND id != ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setLong(2, userId);
			rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Kiểm tra username đã tồn tại chưa
	 */
	public boolean isUsernameExists(String username) throws Exception {
		String query = "SELECT id FROM users WHERE username = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean isEmailExists(String email) throws Exception {
		String query = "SELECT id FROM users WHERE email = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public User getUserById(Long userId) throws Exception {
		String query = "SELECT * FROM users WHERE id = ?";
		User user = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setLong(1, userId);
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getLong("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setFullName(rs.getString("full_name"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				user.setCreatedAt(rs.getTimestamp("created_at"));

			}

			return user;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int getTotalCustomers() throws Exception {
		String query = "SELECT COUNT(*) AS total FROM users WHERE role = 'USER'";
		int total = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt("total");
			}

			return total;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Đếm tổng số sản phẩm
	 */
	public int getTotalProducts() throws Exception {
		String query = "SELECT COUNT(*) AS total FROM product";
		int total = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt("total");
			}

			return total;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Đếm tổng số đơn hàng
	 */
	public int getTotalOrders() throws Exception {
		String query = "SELECT COUNT(*) AS total FROM orders";
		int total = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt("total");
			}

			return total;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Đếm số sản phẩm sắp hết hàng (stock_quantity < 10)
	 */
	public int getLowStockProducts() throws Exception {
		String query = "SELECT COUNT(*) AS total FROM product WHERE stock_quantity < 10";
		int total = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt("total");
			}

			return total;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public List<User> getRecentCustomers(int limit) throws Exception {
		List<User> list = new ArrayList<>();
		String query = """
				SELECT id, username, full_name, phone, email, created_at
				FROM users
				WHERE role = 'USER'
				ORDER BY created_at DESC
				LIMIT ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, limit);
			rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getLong("id"));
				user.setUsername(rs.getString("username"));
				user.setFullName(rs.getString("full_name"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(user);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<Order> getRecentOrders(int limit) throws Exception {
		List<Order> list = new ArrayList<>();
		String query = """
				SELECT id, first_name, last_name, total_amount, status, created_at
				FROM orders
				ORDER BY created_at DESC
				LIMIT ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, limit);
			rs = ps.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("id"));
				order.setFirstName(rs.getString("first_name"));
				order.setLastName(rs.getString("last_name"));
				order.setTotalAmount(rs.getBigDecimal("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(order);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// ==================== BLOG METHODS (THÊM VÀO DAO.JAVA) ====================

	public List<Blog> getAllBlogs() throws Exception {
		List<Blog> list = new ArrayList<>();
		String query = """
				SELECT * FROM blog  where status ='PUBLISHED'
				ORDER BY published_at DESC
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				Blog blog = new Blog();
				blog.setId(rs.getLong("id"));
				blog.setTitle(rs.getString("title"));
				blog.setSlug(rs.getString("slug"));
				blog.setThumbnailUrl(rs.getString("thumbnail_url"));
				blog.setContent(rs.getString("content"));
				blog.setExcerpt(rs.getString("excerpt"));
				blog.setAuthorId(rs.getLong("author_id"));
				blog.setAuthorName(rs.getString("author_name"));
				blog.setCategory(rs.getString("category"));
				blog.setViewCount(rs.getInt("view_count"));
				blog.setStatus(rs.getString("status"));
				blog.setPublishedAt(rs.getTimestamp("published_at"));
				blog.setCreatedAt(rs.getTimestamp("created_at"));
				blog.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(blog);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<Blog> getAllBlogsAD() throws Exception {
		List<Blog> list = new ArrayList<>();
		String query = """
				SELECT * FROM blog
				ORDER BY published_at DESC
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				Blog blog = new Blog();
				blog.setId(rs.getLong("id"));
				blog.setTitle(rs.getString("title"));
				blog.setSlug(rs.getString("slug"));
				blog.setThumbnailUrl(rs.getString("thumbnail_url"));
				blog.setContent(rs.getString("content"));
				blog.setExcerpt(rs.getString("excerpt"));
				blog.setAuthorId(rs.getLong("author_id"));
				blog.setAuthorName(rs.getString("author_name"));
				blog.setCategory(rs.getString("category"));
				blog.setViewCount(rs.getInt("view_count"));
				blog.setStatus(rs.getString("status"));
				blog.setPublishedAt(rs.getTimestamp("published_at"));
				blog.setCreatedAt(rs.getTimestamp("created_at"));
				blog.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(blog);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Lấy blog theo ID
	 */
	public Blog getBlogById(Long id) throws Exception {
		String query = "SELECT * FROM blog WHERE id = ?";
		Blog blog = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				blog = new Blog();
				blog.setId(rs.getLong("id"));
				blog.setTitle(rs.getString("title"));
				blog.setSlug(rs.getString("slug"));
				blog.setThumbnailUrl(rs.getString("thumbnail_url"));
				blog.setContent(rs.getString("content"));
				blog.setExcerpt(rs.getString("excerpt"));
				blog.setAuthorId(rs.getLong("author_id"));
				blog.setAuthorName(rs.getString("author_name"));
				blog.setCategory(rs.getString("category"));
				blog.setViewCount(rs.getInt("view_count"));
				blog.setStatus(rs.getString("status"));
				blog.setPublishedAt(rs.getTimestamp("published_at"));
				blog.setCreatedAt(rs.getTimestamp("created_at"));
				blog.setUpdatedAt(rs.getTimestamp("updated_at"));
			}

			return blog;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Thêm blog mới
	 */
	public boolean addBlog(Blog blog) throws Exception {
		String sql = """
				INSERT INTO blog (title, slug, thumbnail_url, content, excerpt,
				                 author_id, author_name, category, status)
				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, blog.getTitle());
			ps.setString(2, blog.getSlug());
			ps.setString(3, blog.getThumbnailUrl());
			ps.setString(4, blog.getContent());
			ps.setString(5, blog.getExcerpt());
			ps.setLong(6, blog.getAuthorId());
			ps.setString(7, blog.getAuthorName());
			ps.setString(8, blog.getCategory());
			ps.setString(9, blog.getStatus());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Cập nhật blog
	 */
	public boolean updateBlog(Blog blog) throws Exception {
		String sql = """
				UPDATE blog
				SET title = ?, slug = ?, thumbnail_url = ?, content = ?,
				    excerpt = ?, category = ?, status = ?
				WHERE id = ?
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, blog.getTitle());
			ps.setString(2, blog.getSlug());
			ps.setString(3, blog.getThumbnailUrl());
			ps.setString(4, blog.getContent());
			ps.setString(5, blog.getExcerpt());
			ps.setString(6, blog.getCategory());
			ps.setString(7, blog.getStatus());
			ps.setLong(8, blog.getId());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Xóa blog
	 */
	public boolean deleteBlog(Long id) throws Exception {
		String sql = "DELETE FROM blog WHERE id = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, id);

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static String createSlug(String title) {
		String slug = title.toLowerCase();
		slug = slug.replaceAll("[àáạảãâầấậẩẫăằắặẳẵ]", "a");
		slug = slug.replaceAll("[èéẹẻẽêềếệểễ]", "e");
		slug = slug.replaceAll("[ìíịỉĩ]", "i");
		slug = slug.replaceAll("[òóọỏõôồốộổỗơờớợởỡ]", "o");
		slug = slug.replaceAll("[ùúụủũưừứựửữ]", "u");
		slug = slug.replaceAll("[ỳýỵỷỹ]", "y");
		slug = slug.replaceAll("đ", "d");
		slug = slug.replaceAll("[^a-z0-9\\s-]", "");
		slug = slug.trim().replaceAll("\\s+", "-");
		return slug;
	}

	public List<Blog> searchBlogs(String keyword) throws Exception {
		List<Blog> list = new ArrayList<>();
		String query = """
				SELECT * FROM blog
				WHERE title LIKE ? OR content LIKE ? OR category LIKE ?
				ORDER BY published_at DESC
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			String searchPattern = "%" + keyword + "%";
			ps.setString(1, searchPattern);
			ps.setString(2, searchPattern);
			ps.setString(3, searchPattern);
			rs = ps.executeQuery();

			while (rs.next()) {
				Blog blog = new Blog();
				blog.setId(rs.getLong("id"));
				blog.setTitle(rs.getString("title"));
				blog.setSlug(rs.getString("slug"));
				blog.setThumbnailUrl(rs.getString("thumbnail_url"));
				blog.setContent(rs.getString("content"));
				blog.setExcerpt(rs.getString("excerpt"));
				blog.setAuthorName(rs.getString("author_name"));
				blog.setCategory(rs.getString("category"));
				blog.setStatus(rs.getString("status"));
				blog.setPublishedAt(rs.getTimestamp("published_at"));
				list.add(blog);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

//    contact
	public boolean createContact(Contact contact) throws Exception {
		String sql = """
				INSERT INTO contacts (user_id, name, email, subject, message, status)
				VALUES (?, ?, ?, ?, ?, ?)
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);

			if (contact.getUserId() != null) {
				ps.setLong(1, contact.getUserId());
			} else {
				ps.setNull(1, java.sql.Types.BIGINT);
			}

			ps.setString(2, contact.getName());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getSubject());
			ps.setString(5, contact.getMessage());
			ps.setString(6, contact.getStatus() != null ? contact.getStatus() : "NEW");

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Lấy tất cả liên hệ
	 */
	public List<Contact> getAllContacts() throws Exception {
		List<Contact> list = new ArrayList<>();
		String query = """
				SELECT c.*, u.username
				FROM contacts c
				LEFT JOIN users u ON c.user_id = u.id
				ORDER BY c.created_at DESC
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				Contact contact = new Contact();
				contact.setId(rs.getLong("id"));
				contact.setUserId(rs.getLong("user_id"));
				contact.setName(rs.getString("name"));
				contact.setEmail(rs.getString("email"));
				contact.setSubject(rs.getString("subject"));
				contact.setMessage(rs.getString("message"));
				contact.setStatus(rs.getString("status"));
				contact.setCreatedAt(rs.getTimestamp("created_at"));
				contact.setUpdatedAt(rs.getTimestamp("updated_at"));
				list.add(contact);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Lấy liên hệ theo ID
	 */
	public Contact getContactById(Long id) throws Exception {
		String query = "SELECT * FROM contacts WHERE id = ?";
		Contact contact = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				contact = new Contact();
				contact.setId(rs.getLong("id"));
				contact.setUserId(rs.getLong("user_id"));
				contact.setName(rs.getString("name"));
				contact.setEmail(rs.getString("email"));
				contact.setSubject(rs.getString("subject"));
				contact.setMessage(rs.getString("message"));
				contact.setStatus(rs.getString("status"));
				contact.setCreatedAt(rs.getTimestamp("created_at"));
				contact.setUpdatedAt(rs.getTimestamp("updated_at"));
			}

			return contact;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Cập nhật trạng thái liên hệ
	 */
	public boolean updateContactStatus(Long id, String status) throws Exception {
		String sql = "UPDATE contacts SET status = ?, updated_at = NOW() WHERE id = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ps.setLong(2, id);

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Xóa liên hệ
	 */
	public boolean deleteContact(Long id) throws Exception {
		String sql = "DELETE FROM contacts WHERE id = ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setLong(1, id);

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Đếm tổng số liên hệ
	 */
	public int getTotalContacts() throws Exception {
		String query = "SELECT COUNT(*) AS total FROM contacts";
		int total = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt("total");
			}

			return total;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Đếm số liên hệ mới (chưa đọc)
	 */
	public int getNewContactsCount() throws Exception {
		String query = "SELECT COUNT(*) AS total FROM contacts WHERE status = 'NEW'";
		int total = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt("total");
			}

			return total;

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Lưu tin nhắn chat vào database
	 */
	public boolean saveChatMessage(ChatMessage chatMessage) {
		String sql = "INSERT INTO chatbot_history (session_id, user_id, user_message, bot_response) "
				+ "VALUES (?, ?, ?, ?)";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);

			ps.setString(1, chatMessage.getSessionId());

			if (chatMessage.getUserId() != null) {
				ps.setLong(2, chatMessage.getUserId());
			} else {
				ps.setNull(2, java.sql.Types.BIGINT);
			}

			ps.setString(3, chatMessage.getUserMessage());
			ps.setString(4, chatMessage.getBotResponse());

			int result = ps.executeUpdate();
			return result > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<ChatMessage> getChatHistory(String sessionId, int limit) {
		List<ChatMessage> history = new ArrayList<>();
		String sql = "SELECT * FROM chatbot_history " + "WHERE session_id = ? " + "ORDER BY created_at DESC LIMIT ?";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);

			ps.setString(1, sessionId);
			ps.setInt(2, limit);

			rs = ps.executeQuery();

			while (rs.next()) {
				ChatMessage msg = new ChatMessage();
				msg.setId(rs.getLong("id"));
				msg.setSessionId(rs.getString("session_id"));
				msg.setUserId(rs.getLong("user_id"));
				msg.setUserMessage(rs.getString("user_message"));
				msg.setBotResponse(rs.getString("bot_response"));
				msg.setCreatedAt(rs.getTimestamp("created_at"));
				history.add(msg);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return history;
	}

	public List<Product> searchProducts(String keyword) {
		List<Product> products = new ArrayList<>();
		String sql = "SELECT * FROM product " + "WHERE status = 'ACTIVE' "
				+ "AND (name LIKE ? OR detail_description LIKE ?) " + "LIMIT 10";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);

			String searchPattern = "%" + keyword + "%";
			ps.setString(1, searchPattern);
			ps.setString(2, searchPattern);

			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getLong("id"));
				p.setCategoryId(rs.getLong("category_id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setDetailDescription(rs.getString("detail_description"));
				p.setImageUrl(rs.getString("image_url"));
				p.setStockQuantity(rs.getInt("stock_quantity"));
				p.setStatus(rs.getString("status"));
				products.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<ProductAI> getProductsForAI() {
		List<ProductAI> list = new ArrayList<>();

		String sql = """
				    SELECT
				        p.id,
				        p.name,
				        p.price,
				        p.detail_description,
				        pp.flavor_intensity,
				        pp.bitterness_level,
				        pp.acidity_level,
				        pp.roast_level,
				        pp.caffeine_level,
				        pp.taste_notes
				    FROM product p
				    JOIN product_profile pp ON p.id = pp.product_id
				    WHERE p.status = 'ACTIVE'
				    LIMIT 20
				""";

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductAI p = new ProductAI();
				p.setId(rs.getLong("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setDetailDescription(rs.getString("detail_description"));

				p.setFlavorIntensity(rs.getInt("flavor_intensity"));
				p.setBitternessLevel(rs.getInt("bitterness_level"));
				p.setAcidityLevel(rs.getInt("acidity_level"));
				p.setRoastLevel(rs.getString("roast_level"));
				p.setCaffeineLevel(rs.getString("caffeine_level"));
				p.setTasteNotes(rs.getString("taste_notes"));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean updateProductStock(Long productId, int quantity, String note, String createdBy) throws Exception {

		Connection conn = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psLog = null;

		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			PreparedStatement psSet = conn.prepareStatement("SET @skip_stock_log = 1");
		    psSet.executeUpdate();
		    String updateSQL = "UPDATE product " + "SET stock_quantity = stock_quantity + ? " + "WHERE id = ?";

			psUpdate = conn.prepareStatement(updateSQL);
			psUpdate.setInt(1, quantity);
			psUpdate.setLong(2, productId);

			int rowsAffected = psUpdate.executeUpdate();

			if (rowsAffected == 0) {
				conn.rollback();
				return false;
			}

// Ghi log
			String movementType = quantity > 0 ? "IN" : "OUT";
			String logSQL = "INSERT INTO stock_movement_log "
					+ "(product_id, movement_type, quantity, note, created_by) " + "VALUES (?, ?, ?, ?, ?)";

			psLog = conn.prepareStatement(logSQL);
			psLog.setLong(1, productId);
			psLog.setString(2, movementType);
			psLog.setInt(3, Math.abs(quantity));
			psLog.setString(4, note);
			psLog.setString(5, createdBy);
			psLog.executeUpdate();

			conn.commit();
			return true;

		} catch (Exception e) {
			if (conn != null) {
				conn.rollback();
			}
			throw e;

		} finally {
			if (conn != null) {
				conn.setAutoCommit(true);
			}

			try {
				if (psUpdate != null)
					psUpdate.close();
				if (psLog != null)
					psLog.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Lấy lịch sử nhập xuất kho
	 * 
	 * @param productId ID sản phẩm (null = tất cả)
	 * @param limit     Số bản ghi tối đa
	 * @return Danh sách log
	 */
	public List<StockMovementLog> getStockMovementLog(Long productId, int limit) throws Exception {

		List<StockMovementLog> logs = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT l.*, p.name as product_name ");
		sql.append("FROM stock_movement_log l ");
		sql.append("JOIN product p ON l.product_id = p.id ");

		if (productId != null) {
			sql.append("WHERE l.product_id = ? ");
		}

		sql.append("ORDER BY l.created_at DESC ");
		sql.append("LIMIT ?");

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {

			int paramIndex = 1;
			if (productId != null) {
				ps.setLong(paramIndex++, productId);
			}
			ps.setInt(paramIndex, limit);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				StockMovementLog log = new StockMovementLog();
				log.setId(rs.getLong("id"));
				log.setProductId(rs.getLong("product_id"));
				log.setProductName(rs.getString("product_name"));
				log.setOrderId(rs.getObject("order_id", Long.class));
				log.setMovementType(rs.getString("movement_type"));
				log.setQuantity(rs.getInt("quantity"));
				log.setNote(rs.getString("note"));
				log.setCreatedBy(rs.getString("created_by"));
				log.setCreatedAt(rs.getTimestamp("created_at"));

				logs.add(log);
			}

			return logs;
		}
	}
}
