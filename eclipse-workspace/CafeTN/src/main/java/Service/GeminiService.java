package Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import Dao.Dao;
import Entity.Product;
import Entity.ProductAI;

import java.util.List;

public class GeminiService {
    
    private Dao dao;
    private Gson gson;
    
    public GeminiService() {
        this.dao = new Dao();
        this.gson = new Gson();
    }
    
    /**
     * Gọi Gemini API để lấy response
     */
    public String getChatResponse(String userMessage, String sessionId) {
        try {
        	IntentType intent = IntentDetector.detect(userMessage);

        	String productContext = "";
        	String knowledgeContext = "";

        	if (intent == IntentType.PRODUCT_RECOMMEND) {
        	    List<ProductAI> aiProducts = dao.getProductsForAI();
        	    productContext = buildProductContextWithProfile(aiProducts);
        	} else {
        	    List<Product> products = dao.getAllProducts();
        	    productContext = buildProductContext(products);
        	}

            
            // Bước 3: Tạo system prompt
            String systemPrompt = buildSystemPrompt(productContext);
            
            // Bước 4: Kết hợp prompt + user message
            String fullPrompt = systemPrompt + "\n\nKhách hàng hỏi: " + userMessage;
            
            // Bước 5: Gọi Gemini API
            String apiResponse = callGeminiAPI(fullPrompt);
            
            // Bước 6: Parse response
            String botReply = parseGeminiResponse(apiResponse);
            
            return botReply;
            
        } catch (Exception e) {
            e.printStackTrace();
            return "Xin lỗi, tôi đang gặp sự cố kỹ thuật. Vui lòng thử lại sau. ☕";
        }
    }
    
    /**
     * Tạo context từ danh sách sản phẩm
     */
    private String buildProductContext(List<Product> products) {
        StringBuilder context = new StringBuilder();
        context.append("DANH SÁCH SẢN PHẨM CÀ PHÊ TRUNG NGUYÊN LEGEND:\n\n");
        
        int count = 0;
        for (Product p : products) {
            // Chỉ lấy tối đa 20 sản phẩm để tránh vượt quá token limit
            if (count >= 20) break;
            
            context.append("━━━━━━━━━━━━━━━━━━━━\n");
            context.append("ID: ").append(p.getId()).append("\n");
            context.append("Tên: ").append(p.getName()).append("\n");
            context.append("Giá: ").append(String.format("%,.0f", p.getPrice())).append(" VNĐ\n");
            
            if (p.getDetailDescription() != null && !p.getDetailDescription().isEmpty()) {
                String shortDesc = p.getDetailDescription();
                if (shortDesc.length() > 200) {
                    shortDesc = shortDesc.substring(0, 200) + "...";
                }
                context.append("Mô tả: ").append(shortDesc).append("\n");
            }
            
            context.append("Còn hàng: ").append(p.getStockQuantity()).append(" sản phẩm\n");
            count++;
        }
        
        return context.toString();
    }
 // ====== AI PRODUCT CONTEXT ======
    private String buildProductContextWithProfile(List<ProductAI> products) {
        StringBuilder sb = new StringBuilder();

        sb.append("DANH SÁCH SẢN PHẨM (PHÂN TÍCH KHẨU VỊ):\n");

        for (ProductAI p : products) {
            sb.append("━━━━━━━━━━━━━━\n");
            sb.append("ID: ").append(p.getId()).append("\n");
            sb.append("Tên: ").append(p.getName()).append("\n");
            sb.append("Giá: ").append(p.getPrice()).append(" VNĐ\n");
            sb.append("Độ đậm: ").append(p.getFlavorIntensity()).append("/5\n");
            sb.append("Độ đắng: ").append(p.getBitternessLevel()).append("/5\n");
            sb.append("Độ chua: ").append(p.getAcidityLevel()).append("/5\n");
            sb.append("Mức rang: ").append(p.getRoastLevel()).append("\n");
            sb.append("Hương vị: ").append(p.getTasteNotes()).append("\n");
        }

        return sb.toString();
    }

    /**
     * Tạo system prompt cho Gemini
     */
    private String buildSystemPrompt(String productContext) {
        return "Bạn là trợ lý ảo thông minh của Trung Nguyên Legend Café, " +
               "chuyên gia tư vấn về sản phẩm cà phê.\n\n" +
               
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "VAI TRÒ CỦA BẠN:\n" +
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "• Tư vấn sản phẩm cà phê phù hợp với nhu cầu khách hàng\n" +
               "• Trả lời câu hỏi về giá cả, mô tả, đặc điểm sản phẩm\n" +
               "• Đề xuất combo hoặc sản phẩm liên quan\n" +
               "• Giải đáp thắc mắc về đặt hàng, thanh toán, vận chuyển\n" +
               "• Chia sẻ kiến thức về cà phê và văn hóa thưởng thức\n\n" +
               
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "QUY TẮC QUAN TRỌNG:\n" +
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "1. LUÔN dựa vào thông tin sản phẩm được cung cấp bên dưới\n" +
               "2. Nếu khách hỏi về sản phẩm KHÔNG CÓ trong danh sách → Thông báo lịch sự\n" +
               "3. Trả lời NGẮN GỌN (2-4 câu), Dễ HIỂU, THÂN THIỆN\n" +
               "4. Khi giới thiệu sản phẩm → GHI RÕ: TÊN + GIÁ + ID\n" +
               "5. Khuyến khích khách hàng thêm sản phẩm vào giỏ hàng\n" +
               "6. Sử dụng emoji phù hợp (☕ 💚 ✨ 🎁)\n" +
               "7. Giữ giọng điệu chuyên nghiệp nhưng ấm áp, gần gũi\n\n" +
               
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "THÔNG TIN SẢN PHẨM:\n" +
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               productContext + "\n\n" +
               
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "MẪU TRẢ LỜI:\n" +
               "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n" +
               "Khi giới thiệu sản phẩm:\n" +
               "\"Tôi xin giới thiệu [TÊN SẢN PHẨM] (ID: [ID]) với giá [GIÁ] VNĐ. \" +\n" +
               "\"[MÔ TẢ NGẮN 1-2 CÂU]. Bạn có muốn thêm vào giỏ hàng không? ☕\"\n\n" +
               
               "Khi không tìm thấy sản phẩm:\n" +
               "\"Xin lỗi, hiện tại chúng tôi chưa có sản phẩm này. \" +\n" +
               "\"Tôi có thể giới thiệu cho bạn những sản phẩm tương tự không? 💚\"\n\n" +
               
               "HÃY TRẢ LỜI BẰNG TIẾNG VIỆT, THÂN THIỆN VÀ CHUYÊN NGHIỆP! ☕✨";
    }

    private String callGeminiAPI(String prompt) throws Exception {
        String finalKey = GeminiConfig.API_KEY.trim();
        
        String finalUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=" + finalKey;
        JsonObject requestBody = new JsonObject();
        JsonArray contents = new JsonArray();
        JsonObject content = new JsonObject();
        JsonArray parts = new JsonArray();
        JsonObject part = new JsonObject();
        part.addProperty("text", prompt);
        parts.add(part);
        content.add("parts", parts);
        contents.add(content);
        requestBody.add("contents", contents);
        
        JsonObject generationConfig = new JsonObject();
        generationConfig.addProperty("temperature", 0.7);
        generationConfig.addProperty("maxOutputTokens", 800);
        requestBody.add("generationConfig", generationConfig);
        
        // Gửi HTTP Request
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(finalUrl); // Dùng URL đã xử lý
            
            httpPost.setHeader("Content-Type", "application/json; charset=UTF-8");
            httpPost.setEntity(new StringEntity(requestBody.toString(), "UTF-8"));
            
            try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
                String responseBody = EntityUtils.toString(response.getEntity(), "UTF-8");
                
                // In phản hồi thô từ Google để debug lỗi
                System.out.println("Raw Response: " + responseBody);
                
                return responseBody;
            }
        }
    }
    
    /**
     * Parse Gemini response
     */
    private String parseGeminiResponse(String apiResponse) {
        try {
            JsonObject jsonResponse = gson.fromJson(apiResponse, JsonObject.class);
            
            // Kiểm tra lỗi
            if (jsonResponse.has("error")) {
                JsonObject error = jsonResponse.getAsJsonObject("error");
                String errorMessage = error.get("message").getAsString();
                System.err.println("Gemini API Error: " + errorMessage);
                return "Xin lỗi, có lỗi xảy ra khi kết nối AI. Vui lòng thử lại sau. ";
            }
            
            // Lấy text từ response
            JsonArray candidates = jsonResponse.getAsJsonArray("candidates");
            if (candidates != null && candidates.size() > 0) {
                JsonObject candidate = candidates.get(0).getAsJsonObject();
                JsonObject content = candidate.getAsJsonObject("content");
                JsonArray parts = content.getAsJsonArray("parts");
                if (parts != null && parts.size() > 0) {
                    String text = parts.get(0).getAsJsonObject().get("text").getAsString();
                    return text.replace("**", "").replace("*", "").trim();                }
            }
            
            return "Xin lỗi, tôi không thể tạo phản hồi lúc này. Vui lòng thử lại. 🙏";
            
        } catch (Exception e) {
            e.printStackTrace();
            return "Lỗi khi xử lý phản hồi từ AI. Vui lòng thử lại sau. 🔧";
        }
    }
    
    /**
     * Tìm kiếm sản phẩm theo từ khóa
     */
    public List<Product> searchProducts(String keyword) {
        try {
            return dao.searchProductsByName(keyword);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}