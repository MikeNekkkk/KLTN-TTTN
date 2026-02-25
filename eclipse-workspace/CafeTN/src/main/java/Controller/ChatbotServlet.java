package Controller;

import Service.GeminiService;
import Service.GeminiServiceImproved;
import Entity.ChatMessage;
import Entity.User;
import Dao.Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/chatbot")  // ✅ ANNOTATION NÀY PHẢI CÓ
public class ChatbotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private GeminiServiceImproved geminiService;
    private Dao dao;
    private Gson gson;
    
    @Override
    public void init() throws ServletException {
        try {
            geminiService = new GeminiServiceImproved();
            dao = new Dao();
            gson = new Gson();
            System.out.println("✅ ChatbotServlet initialized successfully!");
        } catch (Exception e) {
            System.err.println("❌ ChatbotServlet initialization failed!");
            e.printStackTrace();
            throw new ServletException("Failed to initialize ChatbotServlet", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Lấy user message từ request
            String userMessage = request.getParameter("message");
            
            if (userMessage == null || userMessage.trim().isEmpty()) {
                sendErrorResponse(response, "Tin nhắn không được để trống");
                return;
            }
            
            HttpSession session = request.getSession();
            String sessionId = session.getId();
            
            User user = (User) session.getAttribute("acc");
            Long userId = (user != null) ? user.getId() : null;
            
            System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            System.out.println("☕ CHATBOT REQUEST");
            System.out.println("Session ID: " + sessionId);
            System.out.println("User ID: " + (userId != null ? userId : "Guest"));
            System.out.println("Message: " + userMessage);
            System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            
            // Gọi Gemini API
            String botResponse = geminiService.getChatResponse(userMessage, sessionId);
            
            // Log response
            System.out.println("🤖 Bot Response: " + botResponse);
            System.out.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
            
            // Lưu lịch sử chat vào database
            ChatMessage chatMessage = new ChatMessage(sessionId, userId, userMessage, botResponse);
            boolean saved = dao.saveChatMessage(chatMessage);
            
            if (!saved) {
                System.err.println("⚠️ Warning: Failed to save chat history to database");
            }
            
            // Trả về JSON response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("message", botResponse);
            jsonResponse.addProperty("timestamp", System.currentTimeMillis());
            
            response.getWriter().write(gson.toJson(jsonResponse));
            
        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(response, "Có lỗi xảy ra: " + e.getMessage());
        }
    }
    private void sendErrorResponse(HttpServletResponse response, String errorMessage) 
            throws IOException {
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", false);
        jsonResponse.addProperty("error", errorMessage);
        response.getWriter().write(gson.toJson(jsonResponse));
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        sendErrorResponse(response, "Method GET not supported. Please use POST.");
    }
}