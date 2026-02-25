package Controller;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class VNPayConfig {
    
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static String vnp_ReturnUrl = "http://localhost:8080/CafeTN/vnpay-return"; 
    public static String vnp_TmnCode = "4YUP19I4"; 
    public static String vnp_HashSecret = "MDUIFDCRAKLNBPOFIAFNEKFRNMFBYEPX"; 
    public static String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";
    
   
	    public static String hmacSHA512(String key, String data) {
	        try {
	            if (key == null || data == null) {
	                throw new NullPointerException("Key or Data is null");
	            }
	            
	            Mac hmac512 = Mac.getInstance("HmacSHA512");
	            byte[] hmacKeyBytes = key.getBytes(StandardCharsets.UTF_8); // chuẩn 
	            SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
	            hmac512.init(secretKey);
	            
	            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
	            byte[] result = hmac512.doFinal(dataBytes);
	            
	            StringBuilder sb = new StringBuilder(2 * result.length);
	            for (byte b : result) {
	                sb.append(String.format("%02x", b & 0xff));
	            }
	            return sb.toString();
	            
	        } catch (Exception e) {
	            System.err.println("ERROR in hmacSHA512:");
	            e.printStackTrace();
	            return "";
	        }
	    }
    

    public static String hashAllFields(Map<String, String> fields) {
        List<String> fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames);
        
        StringBuilder sb = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = fields.get(fieldName);
            
            if (fieldValue != null && fieldValue.length() > 0) {
                sb.append(fieldName);
                sb.append("=");
                sb.append(fieldValue); 
            }
            if (itr.hasNext()) {
                sb.append("&");
            }
        }
        
        String dataToHash = sb.toString();
        
        System.out.println("Dữ liệu đơn hàng: " + dataToHash);
        System.out.println("Khóa: " + vnp_HashSecret);
        
        String hash = hmacSHA512(vnp_HashSecret, dataToHash);
        
        return hash;
    }
    
   
    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress;
        try {
            ipAddress = request.getHeader("X-FORWARDED-FOR");
            if (ipAddress == null || ipAddress.isEmpty()) {
                ipAddress = request.getRemoteAddr();
            }
        } catch (Exception e) {
            ipAddress = "Invalid IP:" + e.getMessage();
        }
        return ipAddress;
    }
    
    
    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }
}