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

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * GeminiService cải tiến với quy trình tư vấn chuyên nghiệp
 * Tuân thủ nguyên tắc: Hỏi → Hiểu → Loại trừ → So sánh → Giải thích
 */
public class GeminiServiceImproved {
    
    private Dao dao;
    private Gson gson;
    
    // Lưu context cho từng session
    private Map<String, ConversationContext> sessionContexts;
    
    public GeminiServiceImproved() {
        this.dao = new Dao();
        this.gson = new Gson();
        this.sessionContexts = new HashMap<>();
    }
    
    /**
     * Xử lý chat với quy trình tư vấn chuyên nghiệp
     */
    public String getChatResponse(String userMessage, String sessionId) {
        try {
            // Lấy hoặc tạo context cho session
            ConversationContext context = sessionContexts.computeIfAbsent(
                sessionId, 
                k -> new ConversationContext()
            );
            
            // Lưu tin nhắn người dùng
            context.addMessage("USER", userMessage);
            
            // Trích xuất thông tin từ tin nhắn
            ContextExtractor.extractAndUpdate(userMessage, context);
            
            // Phát hiện ý định
            IntentType intent = IntentDetector.detect(userMessage);
            
            // Xử lý theo intent
            String response;
            
            if (intent == IntentType.PRODUCT_RECOMMEND) {
                // Tư vấn sản phẩm - cần quy trình đầy đủ
                response = handleProductConsultation(userMessage, context);
            } else if (intent == IntentType.PRODUCT_DETAIL) {
                // Hỏi chi tiết sản phẩm - trả lời trực tiếp
                response = handleProductDetail(userMessage);
            } else {
                // Các câu hỏi khác - dùng prompt cơ bản
                response = handleGeneralQuery(userMessage, context);
            }
            
            // Lưu response vào context
            context.addMessage("AI", response);
            
            return response;
            
        } catch (Exception e) {
            e.printStackTrace();
            return "Xin lỗi, tôi đang gặp sự cố kỹ thuật. Vui lòng thử lại sau. ☕";
        }
    }
    
    /**
     * Xử lý tư vấn sản phẩm với quy trình 5 bước
     */
    private String handleProductConsultation(String userMessage, ConversationContext context) 
            throws Exception {
        
        // Lấy danh sách sản phẩm AI
        List<ProductAI> aiProducts = dao.getProductsForAI();
        
        // Xây dựng prompt chuyên nghiệp
        String systemPrompt = ConsultantPromptBuilder.buildConsultantPrompt(aiProducts, context);
        
        // Kết hợp với tin nhắn người dùng
        String fullPrompt = systemPrompt + "\n\n" +
                           "═══════════════════════════════════════════════════════════════\n" +
                           "TIN NHẮN TỪ KHÁCH HÀNG:\n" +
                           "═══════════════════════════════════════════════════════════════\n" +
                           userMessage + "\n\n" +
                           "HÃY TRẢ LỜI THEO QUY TRÌNH 5 BƯỚC ĐÃ NÊU. " +
                           "NẾU CHƯA ĐỦ THÔNG TIN → HỎI THÊM, KHÔNG TRẢ LỜI VỘI!";
        
        // Gọi Gemini API
        String apiResponse = callGeminiAPI(fullPrompt);
        
        // Parse và trả về
        return parseGeminiResponse(apiResponse);
    }
    
    /**
     * Xử lý câu hỏi chi tiết sản phẩm
     */
    private String handleProductDetail(String userMessage) throws Exception {
        List<Product> products = dao.getAllProducts();
        String productContext = buildSimpleProductContext(products);
        
        String prompt = "Bạn là trợ lý tư vấn cà phê Trung Nguyên Legend.\n\n" +
                       "DANH SÁCH SẢN PHẨM:\n" +
                       productContext + "\n\n" +
                       "Khách hàng hỏi: " + userMessage + "\n\n" +
                       "Hãy trả lời NGẮN GỌN, RÕ RÀNG về thông tin sản phẩm. " +
                       "Ghi rõ: TÊN + GIÁ + ID nếu giới thiệu sản phẩm.";
        
        String apiResponse = callGeminiAPI(prompt);
        return parseGeminiResponse(apiResponse);
    }
    
    /**
     * Xử lý câu hỏi chung
     */
    private String handleGeneralQuery(String userMessage, ConversationContext context) 
            throws Exception {
        
        List<Product> products = dao.getAllProducts();
        String productContext = buildSimpleProductContext(products);
        
        String prompt = "Bạn là trợ lý ảo của Trung Nguyên Legend Café.\n\n" +
                       "DANH SÁCH SẢN PHẨM:\n" +
                       productContext + "\n\n" +
                       "Khách hàng hỏi: " + userMessage + "\n\n" +
                       "Hãy trả lời THÂN THIỆN, HỮU ÍCH, NGẮN GỌN (2-4 câu).";
        
        String apiResponse = callGeminiAPI(prompt);
        return parseGeminiResponse(apiResponse);
    }
    
    /**
     * Xây dựng product context đơn giản
     */
    private String buildSimpleProductContext(List<Product> products) {
        StringBuilder context = new StringBuilder();
        
        int count = 0;
        for (Product p : products) {
            if (count >= 15) break;
            
            context.append("──────────────────────\n");
            context.append("ID: ").append(p.getId()).append("\n");
            context.append("Tên: ").append(p.getName()).append("\n");
            context.append("Giá: ").append(String.format("%,.0f", p.getPrice())).append(" VNĐ\n");            
            if (p.getDetailDescription() != null && !p.getDetailDescription().isEmpty()) {
                String shortDesc = p.getDetailDescription();
                if (shortDesc.length() > 150) {
                    shortDesc = shortDesc.substring(0, 150) + "...";
                }
                context.append("Mô tả: ").append(shortDesc).append("\n");
            }
            
            context.append("Còn hàng: ").append(p.getStockQuantity()).append("\n");
            count++;
        }
        
        return context.toString();
    }
    
    /**
     * Gọi Gemini API
     */
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
        generationConfig.addProperty("maxOutputTokens", 1000);
        generationConfig.addProperty("topP", 0.9);
        requestBody.add("generationConfig", generationConfig);
        
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(finalUrl);
            httpPost.setHeader("Content-Type", "application/json; charset=UTF-8");
            httpPost.setEntity(new StringEntity(requestBody.toString(), "UTF-8"));
            
            try (CloseableHttpResponse response = httpClient.execute(httpPost)) {
                String responseBody = EntityUtils.toString(response.getEntity(), "UTF-8");
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
            
            if (jsonResponse.has("error")) {
                JsonObject error = jsonResponse.getAsJsonObject("error");
                String errorMessage = error.get("message").getAsString();
                System.err.println("Gemini API Error: " + errorMessage);
                return "Xin lỗi, có lỗi xảy ra khi kết nối AI. Vui lòng thử lại sau.";
            }
            
            JsonArray candidates = jsonResponse.getAsJsonArray("candidates");
            if (candidates != null && candidates.size() > 0) {
                JsonObject candidate = candidates.get(0).getAsJsonObject();
                JsonObject content = candidate.getAsJsonObject("content");
                JsonArray parts = content.getAsJsonArray("parts");
                if (parts != null && parts.size() > 0) {
                    String text = parts.get(0).getAsJsonObject().get("text").getAsString();
                    return text.replace("**", "").replace("*", "").trim();
                }
            }
            
            return "Xin lỗi, tôi không thể tạo phản hồi lúc này. Vui lòng thử lại. 🙏";
            
        } catch (Exception e) {
            e.printStackTrace();
            return "Lỗi khi xử lý phản hồi từ AI. Vui lòng thử lại sau. 🔧";
        }
    }
    
    /**
     * Reset context cho session (nếu cần)
     */
    public void resetContext(String sessionId) {
        sessionContexts.remove(sessionId);
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