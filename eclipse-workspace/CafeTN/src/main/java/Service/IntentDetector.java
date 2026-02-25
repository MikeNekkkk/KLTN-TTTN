package Service;

public class IntentDetector {

    public static IntentType detect(String message) {
        if (message == null) return IntentType.UNKNOWN;

        String msg = message.toLowerCase();

        // Tư vấn khẩu vị
        if (msg.contains("đậm") || msg.contains("nhẹ") ||
            msg.contains("gợi ý") || msg.contains("phù hợp")) {
            return IntentType.PRODUCT_RECOMMEND;
        }

        // Hỏi giá / chi tiết
        if (msg.contains("giá") || msg.contains("bao nhiêu")) {
            return IntentType.PRODUCT_DETAIL;
        }

        // Lịch sử - thương hiệu
        if (msg.contains("lịch sử") || msg.contains("thành lập") ||
            msg.contains("trung nguyên")) {
            return IntentType.COMPANY_HISTORY;
        }

        // Hướng dẫn website
        if (msg.contains("thanh toán") || msg.contains("vận chuyển")) {
            return IntentType.WEBSITE_GUIDE;
        }

        return IntentType.UNKNOWN;
    }
}
