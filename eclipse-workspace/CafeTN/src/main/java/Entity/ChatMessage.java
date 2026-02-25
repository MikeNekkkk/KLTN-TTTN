package Entity;

import java.util.Date;

public class ChatMessage {
	private Long id;
	private String sessionId;
	private Long userId;
	private String userMessage;
	private String botResponse;
	private Date createdAt;

	// Constructor rỗng
	public ChatMessage() {
	}

	// Constructor đầy đủ
	public ChatMessage(String sessionId, Long userId, String userMessage, String botResponse) {
		this.sessionId = sessionId;
		this.userId = userId;
		this.userMessage = userMessage;
		this.botResponse = botResponse;
	}

	// Getters and Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserMessage() {
		return userMessage;
	}

	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}

	public String getBotResponse() {
		return botResponse;
	}

	public void setBotResponse(String botResponse) {
		this.botResponse = botResponse;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}