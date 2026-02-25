package Controller;

import Entity.Order;
import Dao.Dao;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/vnpay-return")
public class VNPayReturnServlet extends HttpServlet {
    
    private Dao dao;
    
    @Override
    public void init() throws ServletException {
        dao = new Dao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        
        try {
            Map<String, String> fields = new HashMap<>();
            
            for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                
                if (fieldValue != null && fieldValue.length() > 0) {
                    String encodedName = URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString());
                    String encodedValue = URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString());
                    fields.put(encodedName, encodedValue);
                }
            }
            
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            
            if (vnp_SecureHash == null || vnp_SecureHash.isEmpty()) {
                System.err.println("ERROR: vnp_SecureHash is NULL or EMPTY!");
                request.setAttribute("errorMessage", "Thiếu chữ ký từ VNPay!");
                request.getRequestDispatcher("payment-failed.jsp").forward(request, response);
                return;
            }
            
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            
            String signValue = VNPayConfig.hashAllFields(fields);
            
            System.out.println("Đoạn mã mã hóa (từ VNPay): " + vnp_SecureHash);
            System.out.println("Đoạn mã mã hóa (mình mã hóa):" + signValue);
            System.out.println("Trùng: " + signValue.equals(vnp_SecureHash));
            
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
            String vnp_BankCode = request.getParameter("vnp_BankCode");
            String vnp_PayDate = request.getParameter("vnp_PayDate");
            
            if (signValue.equals(vnp_SecureHash)) {
                
                Order order = (Order) session.getAttribute("pendingOrder");
                
                if (order != null) {
                    if ("00".equals(vnp_ResponseCode)) {
                        System.out.println("Đã thanh toán thành công Đơn hàng: " + order.getId());
                        
                        dao.updateOrderStatus(order.getId(), "PAID", "VNPAY");
                        
                        session.removeAttribute("cart");
                        session.removeAttribute("pendingOrder");
                        
                        order.setStatus("PAID");
                        order.setPaymentMethod("VNPAY");
                        session.setAttribute("completedOrder", order);
                        
                        session.setAttribute("vnpay_TxnRef", vnp_TxnRef);
                        session.setAttribute("vnpay_TransactionNo", vnp_TransactionNo);
                        session.setAttribute("vnpay_BankCode", vnp_BankCode);
                        session.setAttribute("vnpay_PayDate", vnp_PayDate);
                        
                        response.sendRedirect("payment-success.jsp");
                        
                    } else {
                        System.err.println("Payment FAILED with code: " + vnp_ResponseCode);
                        
                        String errorMessage = getVNPayErrorMessage(vnp_ResponseCode);
                        request.setAttribute("errorMessage", 0);
                        request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                        request.getRequestDispatcher("payment-failed.jsp").forward(request, response);
                    }
                } else {
                    System.err.println("ERROR: Order not found in session!");
                    response.sendRedirect("cart.jsp");
                }
                
            } else {
                System.err.println("Không có chữ ký");
                
                request.setAttribute("errorMessage", 
                    "Chữ ký không hợp lệ! Vui lòng kiểm tra vnp_HashSecret trong VNPayConfig.java");
                request.getRequestDispatcher("payment-failed.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            System.err.println("EXCEPTION in VNPayReturnServlet:");
            e.printStackTrace();
            
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý kết quả thanh toán!");
            request.getRequestDispatcher("payment-failed.jsp").forward(request, response);
        }
    }
    
   
    private String getVNPayErrorMessage(String responseCode) {
        switch (responseCode) {
            case "07":
                return "Giao dịch bị nghi ngờ gian lận";
            case "09":
                return "Thẻ chưa đăng ký dịch vụ Internet Banking";
            case "10":
                return "Xác thực thông tin thẻ không chính xác quá 3 lần";
            case "11":
                return "Giao dịch đã hết thời gian thanh toán";
            case "12":
                return "Thẻ bị khóa";
            case "13":
                return "Mật khẩu xác thực giao dịch không chính xác";
            case "24":
                return "Giao dịch bị hủy";
            case "51":
                return "Tài khoản không đủ số dư";
            case "65":
                return "Tài khoản đã vượt quá giới hạn giao dịch trong ngày";
            case "75":
                return "Ngân hàng đang bảo trì";
            case "79":
                return "Giao dịch vượt quá số lần nhập sai mật khẩu";
            default:
                return "Giao dịch thất bại. Mã lỗi: " + responseCode;
        }
    }
}