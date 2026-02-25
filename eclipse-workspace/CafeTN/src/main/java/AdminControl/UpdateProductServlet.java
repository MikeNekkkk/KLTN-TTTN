package AdminControl;

import Dao.Dao;
import Entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/updateProduct")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class UpdateProductServlet extends HttpServlet {

    private Dao dao;
    private static final String UPLOAD_DIR = "img/product/HT";

    @Override
    public void init() {
        dao = new Dao();
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            String stockStr = request.getParameter("stockQuantity");
            String priceStr = request.getParameter("price");
            String categoryId = request.getParameter("categoryId");
            Part filePart = request.getPart("productImage");

            if (productName == null || productName.trim().isEmpty())
                throw new IllegalArgumentException("Tên sản phẩm không được để trống!");

            int stock = Integer.parseInt(stockStr);
            if (stock < 0)
                throw new IllegalArgumentException("Số lượng không được âm!");

            BigDecimal price = new BigDecimal(priceStr);
            if (price.compareTo(BigDecimal.ZERO) <= 0)
                throw new IllegalArgumentException("Giá sản phẩm phải lớn hơn 0!");

            Product oldProduct = dao.getProductById(productId);
            if (oldProduct == null)
                throw new IllegalArgumentException("Sản phẩm không tồn tại!");

            if (dao.isProductNameExistsExcept(productName.trim(), productId))
                throw new IllegalArgumentException("Tên sản phẩm đã tồn tại!");

            String imageUrl = oldProduct.getImageUrl();

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && fileName.contains(".")) {

                    String ext = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = System.currentTimeMillis() + ext;

                    String appPath = request.getServletContext().getRealPath("");
                    String uploadPath = appPath + File.separator + UPLOAD_DIR;

                    File dir = new File(uploadPath);
                    if (!dir.exists()) dir.mkdirs();

                    filePart.write(uploadPath + File.separator + newFileName);
                    imageUrl = UPLOAD_DIR + "/" + newFileName;

                    if (oldProduct.getImageUrl() != null) {
                        File oldImg = new File(appPath + File.separator + oldProduct.getImageUrl());
                        if (oldImg.exists()) oldImg.delete();
                    }
                }
            }

            Product product = new Product();
            product.setId(Long.parseLong(productId));
            product.setName(productName.trim());
            product.setStockQuantity(stock);
            product.setPrice(price);
            product.setCategoryId(Long.parseLong(categoryId));
            product.setDetailDescription(oldProduct.getDetailDescription());
            product.setStatus(oldProduct.getStatus());
            product.setImageUrl(imageUrl);

            boolean success = dao.updateProduct(product);

            if (success) {
                response.getWriter().write(
                        "{\"success\":true,\"message\":\"Cập nhật sản phẩm thành công!\"}"
                );
            } else {
                response.getWriter().write(
                        "{\"success\":false,\"message\":\"Không thể cập nhật sản phẩm!\"}"
                );
            }

        } catch (NumberFormatException e) {
            response.getWriter().write(
                    "{\"success\":false,\"message\":\"Dữ liệu số không hợp lệ!\"}"
            );
        } catch (IllegalArgumentException e) {
            response.getWriter().write(
                    "{\"success\":false,\"message\":\"" + escapeJson(e.getMessage()) + "\"}"
            );
        } catch (Exception e) {
            response.getWriter().write(
                    "{\"success\":false,\"message\":\"Lỗi hệ thống!\"}"
            );
        }
    }

    private String escapeJson(String text) {
        if (text == null) return "";
        return text.replace("\\", "\\\\")
                   .replace("\"", "\\\"");
    }
}
