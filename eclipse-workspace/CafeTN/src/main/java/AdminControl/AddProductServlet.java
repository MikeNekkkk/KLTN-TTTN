package AdminControl;

import Dao.Dao;
import Entity.Product;
import Entity.Category;
import java.io.IOException;
import java.io.File;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,        // 10MB
    maxRequestSize = 1024 * 1024 * 50      // 50MB
)
public class AddProductServlet extends HttpServlet {
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
            List<Category> listCategories = dao.getAllCategories();
            request.setAttribute("listC", listCategories);
            request.getRequestDispatcher("doc/form-add-san-pham.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi khi tải form thêm sản phẩm.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            String name = request.getParameter("productName");
            String priceStr = request.getParameter("price");
            String stockQuantityStr = request.getParameter("stockQuantity");
            String categoryIdStr = request.getParameter("categoryId");
            String description = request.getParameter("description");

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("error", "Tên sản phẩm không được để trống!");
                doGet(request, response);
                return;
            }

            if (priceStr == null || priceStr.trim().isEmpty()) {
                request.setAttribute("error", "Giá sản phẩm không được để trống!");
                doGet(request, response);
                return;
            }

            if (stockQuantityStr == null || stockQuantityStr.trim().isEmpty()) {
                request.setAttribute("error", "Số lượng không được để trống!");
                doGet(request, response);
                return;
            }

            if (categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng chọn danh mục!");
                doGet(request, response);
                return;
            }

            BigDecimal price = new BigDecimal(priceStr);
            int stockQuantity = Integer.parseInt(stockQuantityStr);
            Long categoryId = Long.parseLong(categoryIdStr);

            if (price.compareTo(BigDecimal.ZERO) < 0 || stockQuantity < 0) {
                request.setAttribute("error", "Giá và số lượng phải lớn hơn hoặc bằng 0!");
                doGet(request, response);
                return;
            }

            if (dao.isProductNameExists(name)) {
                request.setAttribute("error", "Tên sản phẩm đã tồn tại!");
                doGet(request, response);
                return;
            }

            Map<Long, String> categoryMap = new HashMap<>();
            categoryMap.put(1L, "HM");     
            categoryMap.put(2L, "HT");     
            categoryMap.put(3L, "RX");     
            categoryMap.put(4L, "SPNew");  

            String categoryFolder = categoryMap.getOrDefault(categoryId, "OTHER");
            String imageUrl = "img/default-product.jpg";
            Part filePart = request.getPart("productImage");

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFileName(filePart);
                if (fileName != null && fileName.contains(".")) {
                String extension = fileName.substring(fileName.lastIndexOf("."));
                String uniqueFileName = System.currentTimeMillis() + extension;
                String appPath = request.getServletContext().getRealPath("");
                String uploadDir = appPath + File.separator + "img" + File.separator + "product" + File.separator + categoryFolder;                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                String filePath = uploadDir + File.separator + uniqueFileName;
                filePart.write(filePath);

                imageUrl = "img/product/" + categoryFolder + "/" + uniqueFileName;
                }
            }

            Product product = new Product();
            product.setName(name);
            product.setPrice(price);
            product.setStockQuantity(stockQuantity);
            product.setCategoryId(categoryId);
            product.setDetailDescription(description != null ? description : "");
            product.setImageUrl(imageUrl);

            boolean success = dao.addProduct(product);

            if (success) {
                String message = URLEncoder.encode("Thêm sản phẩm thành công!", StandardCharsets.UTF_8);
                response.sendRedirect("HTSP?success=" + message);
            } else {
                request.setAttribute("error", "Không thể thêm sản phẩm!");
                doGet(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            doGet(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
