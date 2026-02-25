package Service;

/**
 * Trích xuất thông tin từ tin nhắn người dùng để xây dựng context
 */
public class ContextExtractor {
    
    /**
     * Phân tích và cập nhật context từ tin nhắn người dùng
     */
    public static void extractAndUpdate(String message, ConversationContext context) {
        if (message == null || context == null) return;
        
        String msg = message.toLowerCase();
        
        // Trích xuất MỤC ĐÍCH
        if (msg.contains("tỉnh táo") || msg.contains("tỉnh ngủ") || msg.contains("sảng khoái")) {
            context.setUserInfo("purpose", "Tỉnh táo, tăng năng lượng");
        } else if (msg.contains("thư giãn") || msg.contains("nghỉ ngơi") || msg.contains("relax")) {
            context.setUserInfo("purpose", "Thư giãn");
        } else if (msg.contains("thưởng thức") || msg.contains("thử") || msg.contains("trải nghiệm")) {
            context.setUserInfo("purpose", "Thưởng thức, khám phá hương vị");
        }
        
        // Trích xuất THỜI ĐIỂM
        if (msg.contains("sáng") || msg.contains("buổi sáng") || msg.contains("morning")) {
            context.setUserInfo("time_of_day", "Sáng");
        } else if (msg.contains("trưa") || msg.contains("buổi trưa")) {
            context.setUserInfo("time_of_day", "Trưa");
        } else if (msg.contains("chiều") || msg.contains("buổi chiều") || msg.contains("afternoon")) {
            context.setUserInfo("time_of_day", "Chiều");
        } else if (msg.contains("tối") || msg.contains("buổi tối") || msg.contains("evening")) {
            context.setUserInfo("time_of_day", "Tối");
        }
        
        // Trích xuất KINH NGHIỆM
        if (msg.contains("mới uống") || msg.contains("lần đầu") || msg.contains("chưa uống bao giờ")) {
            context.setUserInfo("experience", "Người mới bắt đầu");
        } else if (msg.contains("thường xuyên") || msg.contains("hay uống") || msg.contains("uống nhiều")) {
            context.setUserInfo("experience", "Người uống thường xuyên");
        } else if (msg.contains("chuyên") || msg.contains("sành") || msg.contains("am hiểu")) {
            context.setUserInfo("experience", "Người sành cà phê");
        }
        
        // Trích xuất KHẨU VỊ
        StringBuilder taste = new StringBuilder();
        
        if (msg.contains("đậm") || msg.contains("đậm đà") || msg.contains("mạnh")) {
            taste.append("Thích vị đậm, ");
        } else if (msg.contains("nhẹ") || msg.contains("nhẹ nhàng")) {
            taste.append("Thích vị nhẹ, ");
        } else if (msg.contains("cân bằng") || msg.contains("vừa phải")) {
            taste.append("Thích vị cân bằng, ");
        }
        
        if (msg.contains("đắng")) {
            taste.append("chấp nhận vị đắng, ");
        } else if (msg.contains("ngọt")) {
            taste.append("thích vị ngọt, ");
        }
        
        if (msg.contains("chua") || msg.contains("acid")) {
            taste.append("thích vị chua nhẹ");
        }
        
        if (taste.length() > 0) {
            String tasteStr = taste.toString();
            if (tasteStr.endsWith(", ")) {
                tasteStr = tasteStr.substring(0, tasteStr.length() - 2);
            }
            context.setUserInfo("taste_preference", tasteStr);
        }
        
        // Trích xuất TÌNH TRẠNG SỨC KHỎE
        StringBuilder health = new StringBuilder();
        
        if (msg.contains("tim") || msg.contains("tim mạch") || msg.contains("huyết áp")) {
            health.append("Có vấn đề tim mạch/huyết áp, ");
        }
        if (msg.contains("dạ dày") || msg.contains("dày") || msg.contains("tiêu hóa")) {
            health.append("Có vấn đề dạ dày, ");
        }
        if (msg.contains("mang thai") || msg.contains("có thai") || msg.contains("pregnant")) {
            health.append("Đang mang thai, ");
        }
        if (msg.contains("nhạy cảm") || msg.contains("dễ kích thích")) {
            health.append("Nhạy cảm với caffeine, ");
        }
        if (msg.contains("khỏe") || msg.contains("bình thường") || msg.contains("không có vấn đề")) {
            health.append("Sức khỏe bình thường");
        }
        
        if (health.length() > 0) {
            String healthStr = health.toString();
            if (healthStr.endsWith(", ")) {
                healthStr = healthStr.substring(0, healthStr.length() - 2);
            }
            context.setUserInfo("health_condition", healthStr);
        }
    }
    
    /**
     * Phân tích độ ưu tiên của câu hỏi
     * Trả về true nếu user đang hỏi rõ ràng về tư vấn
     */
    public static boolean isConsultationRequest(String message) {
        if (message == null) return false;
        
        String msg = message.toLowerCase();
        
        return msg.contains("gợi ý") || 
               msg.contains("tư vấn") || 
               msg.contains("nên uống") ||
               msg.contains("phù hợp") ||
               msg.contains("dùng loại nào") ||
               msg.contains("chọn loại nào") ||
               msg.contains("recommend");
    }
}