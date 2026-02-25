package AdminControl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/uploadImage")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class UploadImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Part filePart = request.getPart("upload");
            if (filePart == null || filePart.getSize() == 0) {
                out.print("{\"uploaded\":0}");
                return;
            }

            if (!filePart.getContentType().startsWith("image/")) {
                out.print("{\"uploaded\":0}");
                return;
            }

            String fileName = filePart.getSubmittedFileName();
            String ext = fileName.substring(fileName.lastIndexOf("."));
            String newName = "content_" + System.currentTimeMillis() + ext;

            String uploadPath = getServletContext()
                    .getRealPath("/img/blog/content");

            File dir = new File(uploadPath);
            if (!dir.exists()) dir.mkdirs();

            filePart.write(uploadPath + File.separator + newName);

            String imageUrl = request.getContextPath()
                    + "/img/blog/content/" + newName;

            out.print("{\"uploaded\":1,\"url\":\"" + imageUrl + "\"}");

        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"uploaded\":0}");
        }
    }
}
