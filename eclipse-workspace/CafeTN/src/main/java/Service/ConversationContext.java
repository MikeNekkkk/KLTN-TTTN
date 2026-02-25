package Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Lưu trữ ngữ cảnh hội thoại để AI có thể tư vấn tốt hơn
 */
public class ConversationContext {
    private Map<String, String> userInfo;
    private StringBuilder conversationHistory;
    
    public ConversationContext() {
        this.userInfo = new HashMap<>();
        this.conversationHistory = new StringBuilder();
    }
    
    /**
     * Lưu thông tin người dùng
     */
    public void setUserInfo(String key, String value) {
        userInfo.put(key, value);
    }
    
    /**
     * Lấy thông tin người dùng
     */
    public String getUserInfo(String key) {
        return userInfo.get(key);
    }
    
    /**
     * Kiểm tra đã có thông tin chưa
     */
    public boolean hasInfo(String key) {
        return userInfo.containsKey(key) && userInfo.get(key) != null;
    }
    
    /**
     * Thêm tin nhắn vào lịch sử
     */
    public void addMessage(String role, String message) {
        conversationHistory.append(role).append(": ").append(message).append("\n");
    }
    
    /**
     * Kiểm tra đã có đủ thông tin để tư vấn chưa
     */
    public boolean hasEnoughInfoToConsult() {
        // Cần ít nhất 2 trong 4 thông tin sau:
        // 1. Mục đích uống (purpose)
        // 2. Khẩu vị (taste_preference)
        // 3. Kinh nghiệm (experience)
        // 4. Tình trạng sức khỏe (health_condition)
        
        int infoCount = 0;
        if (hasInfo("purpose")) infoCount++;
        if (hasInfo("taste_preference")) infoCount++;
        if (hasInfo("experience")) infoCount++;
        if (hasInfo("health_condition")) infoCount++;
        
        return infoCount >= 2;
    }
    
    /**
     * Lấy thông tin còn thiếu
     */
    public String getMissingInfo() {
        StringBuilder missing = new StringBuilder();
        
        if (!hasInfo("purpose")) {
            missing.append("- Mục đích uống cà phê (tỉnh táo/thư giãn/thưởng thức)\n");
        }
        if (!hasInfo("taste_preference")) {
            missing.append("- Khẩu vị ưa thích (đậm/nhẹ/cân bằng, đắng/ngọt/chua)\n");
        }
        if (!hasInfo("experience")) {
            missing.append("- Kinh nghiệm với cà phê (mới uống/thường xuyên/chuyên sâu)\n");
        }
        if (!hasInfo("health_condition")) {
            missing.append("- Tình trạng sức khỏe đặc biệt (nếu có)\n");
        }
        
        return missing.toString();
    }
    
    public boolean isEmpty() {
        return userInfo.isEmpty();
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("📋 THÔNG TIN KHÁCH HÀNG:\n");
        
        if (hasInfo("purpose")) {
            sb.append("• Mục đích: ").append(getUserInfo("purpose")).append("\n");
        }
        if (hasInfo("time_of_day")) {
            sb.append("• Thời điểm: ").append(getUserInfo("time_of_day")).append("\n");
        }
        if (hasInfo("experience")) {
            sb.append("• Kinh nghiệm: ").append(getUserInfo("experience")).append("\n");
        }
        if (hasInfo("taste_preference")) {
            sb.append("• Khẩu vị: ").append(getUserInfo("taste_preference")).append("\n");
        }
        if (hasInfo("health_condition")) {
            sb.append("• Sức khỏe: ").append(getUserInfo("health_condition")).append("\n");
        }
        
        if (conversationHistory.length() > 0) {
            sb.append("\n💬 LỊCH SỬ HỘI THOẠI:\n");
            sb.append(conversationHistory);
        }
        
        return sb.toString();
    }
}