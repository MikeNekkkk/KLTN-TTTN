<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.chatbot-widget {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 9999;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
}

/* Nút mở chat */
.chatbot-button {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: linear-gradient(135deg, #2c5530 0%, #1a3a1f 100%);
    border: none;
    box-shadow: 0 4px 12px rgba(44, 85, 48, 0.4);
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    position: relative;
    animation: pulse-button 2s infinite;
}

.chatbot-button:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 20px rgba(44, 85, 48, 0.6);
}

.chatbot-button i {
    font-size: 28px;
    color: white;
}

@keyframes pulse-button {
    0%, 100% { box-shadow: 0 4px 12px rgba(44, 85, 48, 0.4); }
    50% { box-shadow: 0 4px 20px rgba(44, 85, 48, 0.6); }
}

/* Badge thông báo */
.chatbot-badge {
    position: absolute;
    top: -5px;
    right: -5px;
    background: #ff4757;
    color: white;
    border-radius: 50%;
    width: 22px;
    height: 22px;
    font-size: 11px;
    font-weight: bold;
    display: none;
    align-items: center;
    justify-content: center;
    animation: pulse-badge 2s infinite;
}

@keyframes pulse-badge {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
}

/* Cửa sổ chat */
.chatbot-window {
    display: none;
    position: fixed;
    bottom: 90px;
    right: 20px;
    width: 380px;
    height: 450px;
    background: white;
    border-radius: 16px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
    flex-direction: column;
    overflow: hidden;
    animation: slideUp 0.3s ease;
}

.chatbot-window.active {
    display: flex;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Header */
.chatbot-header {
    background: linear-gradient(135deg, #2c5530 0%, #1a3a1f 100%);
    color: white;
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.chatbot-header-content {
    display: flex;
    align-items: center;
    gap: 12px;
}

.chatbot-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}

.chatbot-info h4 {
    margin: 0;
    font-size: 16px;
    font-weight: 600;
}

.chatbot-info p {
    margin: 2px 0 0 0;
    font-size: 12px;
    opacity: 0.9;
}

.chatbot-close {
    background: rgba(255, 255, 255, 0.2);
    border: none;
    color: white;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.3s;
}

.chatbot-close:hover {
    background: rgba(255, 255, 255, 0.3);
}

/* Messages area */
.chatbot-messages {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
    background: #f8f9fa;
}

.chatbot-message {
    margin-bottom: 16px;
    display: flex;
    animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

.chatbot-message.user {
    justify-content: flex-end;
}

.chatbot-message-content {
    max-width: 75%;
    padding: 12px 16px;
    border-radius: 12px;
    word-wrap: break-word;
    line-height: 1.5;
    font-size: 14px;
}

.chatbot-message.bot .chatbot-message-content {
    background: white;
    color: #333;
    border: 1px solid #e0e0e0;
    border-radius: 12px 12px 12px 4px;
}

.chatbot-message.user .chatbot-message-content {
    background: linear-gradient(135deg, #2c5530 0%, #1a3a1f 100%);
    color: white;
    border-radius: 12px 12px 4px 12px;
}

/* Typing indicator */
.typing-indicator {
    display: none;
    padding: 12px 16px;
    background: white;
    border-radius: 12px;
    width: fit-content;
    border: 1px solid #e0e0e0;
    margin-bottom: 16px;
}

.typing-indicator.active {
    display: block;
}

.typing-indicator span {
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #2c5530;
    margin: 0 2px;
    animation: typing 1.4s infinite;
}

.typing-indicator span:nth-child(2) {
    animation-delay: 0.2s;
}

.typing-indicator span:nth-child(3) {
    animation-delay: 0.4s;
}

@keyframes typing {
    0%, 60%, 100% { transform: translateY(0); }
    30% { transform: translateY(-10px); }
}

/* Input area */
.chatbot-input-area {
    padding: 16px 20px;
    background: white;
    border-top: 1px solid #e0e0e0;
    display: flex;
    gap: 10px;
}

.chatbot-input {
    flex: 1;
    padding: 12px 16px;
    border: 1px solid #e0e0e0;
    border-radius: 24px;
    font-size: 14px;
    outline: none;
    transition: border-color 0.3s;
    font-family: inherit;
}

.chatbot-input:focus {
    border-color: #2c5530;
}

.chatbot-send-btn {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: linear-gradient(135deg, #2c5530 0%, #1a3a1f 100%);
    border: none;
    color: white;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s;
}

.chatbot-send-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(44, 85, 48, 0.4);
}

.chatbot-send-btn:disabled {
    opacity: 0.5;
    cursor: not-allowed;
    transform: scale(1);
}

/* Quick replies */
.quick-replies {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-top: 12px;
}

.quick-reply-btn {
    padding: 8px 16px;
    background: white;
    border: 1px solid #2c5530;
    border-radius: 20px;
    color: #2c5530;
    font-size: 13px;
    cursor: pointer;
    transition: all 0.3s;
}

.quick-reply-btn:hover {
    background: #2c5530;
    color: white;
}

/* Welcome screen */
.chatbot-welcome {
    text-align: center;
    padding: 40px 20px;
}

.chatbot-welcome-icon {
    font-size: 48px;
    margin-bottom: 16px;
}

.chatbot-welcome h3 {
    color: #333;
    margin: 0 0 8px 0;
    font-size: 18px;
}

.chatbot-welcome p {
    color: #666;
    margin: 0 0 20px 0;
    font-size: 14px;
    line-height: 1.6;
}

/* Scrollbar */
.chatbot-messages::-webkit-scrollbar {
    width: 6px;
}

.chatbot-messages::-webkit-scrollbar-track {
    background: #f1f1f1;
}

.chatbot-messages::-webkit-scrollbar-thumb {
    background: #2c5530;
    border-radius: 3px;
}

.chatbot-messages::-webkit-scrollbar-thumb:hover {
    background: #1a3a1f;
}

/* Responsive */
@media (max-width: 480px) {
    .chatbot-window {
        width: calc(100vw - 40px);
        height: calc(100vh - 120px);
        right: 20px;
        bottom: 90px;
    }
    
    .chatbot-button {
        width: 55px;
        height: 55px;
    }
}
</style>

<!-- HTML Structure -->
<div class="chatbot-widget">
    <!-- Nút mở chat -->
    <button class="chatbot-button" id="chatbotToggle" title="Chat với chúng tôi">
        <i class="fa fa-comments"></i>
        <span class="chatbot-badge" id="chatbotBadge">1</span>
    </button>
    
    <!-- Cửa sổ chat -->
    <div class="chatbot-window" id="chatbotWindow">
        <!-- Header -->
        <div class="chatbot-header">
            <div class="chatbot-header-content">
                <div class="chatbot-avatar">☕</div>
                <div class="chatbot-info">
                    <h4>Trợ Lý Café</h4>
                    <p>Luôn sẵn sàng hỗ trợ bạn</p>
                </div>
            </div>
            <button class="chatbot-close" id="chatbotClose" title="Đóng">
                <i class="fa fa-times"></i>
            </button>
        </div>
        
        <!-- Messages area -->
        <div class="chatbot-messages" id="chatbotMessages">
            <!-- Welcome message -->
            <div class="chatbot-welcome" id="chatbotWelcome">
                <div class="chatbot-welcome-icon">☕</div>
                <h3>Xin chào!</h3>
                <p>Tôi là trợ lý ảo của Trung Nguyên Legend.<br>Tôi có thể giúp gì cho bạn hôm nay?</p>
                
                <!-- Quick replies -->
                <div class="quick-replies">
                    <button class="quick-reply-btn" onclick="sendQuickReply('Tôi muốn xem menu')">
                        📋 Xem menu
                    </button>
                    <button class="quick-reply-btn" onclick="sendQuickReply('Sản phẩm nào đang khuyến mãi?')">
                        🎁 Khuyến mãi
                    </button>
                    <button class="quick-reply-btn" onclick="sendQuickReply('Giới thiệu cà phê hòa tan')">
                        ☕ Cà phê hòa tan
                    </button>
                    <button class="quick-reply-btn" onclick="sendQuickReply('Cà phê nào phù hợp cho văn phòng?')">
                        💼 Cho văn phòng
                    </button>
                </div>
            </div>
            
            <!-- Typing indicator -->
            <div class="typing-indicator" id="typingIndicator">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
        
        <!-- Input area -->
        <div class="chatbot-input-area">
            <input 
                type="text" 
                class="chatbot-input" 
                id="chatbotInput" 
                placeholder="Nhập tin nhắn..."
                autocomplete="off"
                maxlength="500"
            >
            <button class="chatbot-send-btn" id="chatbotSend" title="Gửi">
                <i class="fa fa-paper-plane"></i>
            </button>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script>
// ═══════════════════════════════════════════════════════════════
// CHATBOT WIDGET JAVASCRIPT
// ═══════════════════════════════════════════════════════════════

(function() {
    'use strict';
    
    // ═══════════════════════════════════════════════════════════
    // DOM ELEMENTS
    // ═══════════════════════════════════════════════════════════
    const chatbotToggle = document.getElementById('chatbotToggle');
    const chatbotWindow = document.getElementById('chatbotWindow');
    const chatbotClose = document.getElementById('chatbotClose');
    const chatbotInput = document.getElementById('chatbotInput');
    const chatbotSend = document.getElementById('chatbotSend');
    const chatbotMessages = document.getElementById('chatbotMessages');
    const typingIndicator = document.getElementById('typingIndicator');
    const chatbotBadge = document.getElementById('chatbotBadge');
    const chatbotWelcome = document.getElementById('chatbotWelcome');
  let isOpen = false;
    let isWelcomeShown = true;
    let isProcessing = false;
  
    chatbotToggle.addEventListener('click', function() {
        toggleChatWindow();
    });
    
    chatbotClose.addEventListener('click', function() {
        closeChatWindow();
    });
    
    chatbotSend.addEventListener('click', function() {
        sendMessage();
    });
    
    chatbotInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            sendMessage();
        }
    });
    
    // Prevent form submission on Enter
    chatbotInput.addEventListener('keydown', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
        }
    });
    function toggleChatWindow() {
        if (isOpen) {
            closeChatWindow();
        } else {
            openChatWindow();
        }
    }
    function openChatWindow() {
        chatbotWindow.classList.add('active');
        isOpen = true;
        chatbotInput.focus();
        
        // Hide badge
        chatbotBadge.style.display = 'none';
        
        console.log('✅ Chatbot opened');
    }
    
    function closeChatWindow() {
        chatbotWindow.classList.remove('active');
        isOpen = false;
        
        console.log('❌ Chatbot closed');
    }
   
    function sendMessage() {
        const message = chatbotInput.value.trim();
        
        // Validate
        if (message === '') {
            return;
        }
        
        if (isProcessing) {
            console.log('⚠️ Already processing a message');
            return;
        }
        
        // Hide welcome screen
        if (isWelcomeShown) {
            chatbotWelcome.style.display = 'none';
            isWelcomeShown = false;
        }
        
        // Add user message to chat
        addMessage(message, 'user');
        
        // Clear input
        chatbotInput.value = '';
        
        // Disable send button
        isProcessing = true;
        chatbotSend.disabled = true;
        chatbotInput.disabled = true;
        
        // Show typing indicator
        typingIndicator.classList.add('active');
        scrollToBottom();
        
        console.log('📤 Sending message:', message);
        
        // Send to server
        fetch('chatbot', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            },
            body: 'message=' + encodeURIComponent(message)
        })
        .then(response => response.json())
        .then(data => {
            console.log('📥 Response received:', data);
            
            typingIndicator.classList.remove('active');
            
            isProcessing = false;
            chatbotSend.disabled = false;
            chatbotInput.disabled = false;
            chatbotInput.focus();
            
            if (data.success) {
                addMessage(data.message, 'bot');
            } else {
                addMessage('Xin lỗi, có lỗi xảy ra. Vui lòng thử lại. 🙏', 'bot');
                console.error('❌ Server error:', data.error);
            }
        })
        .catch(error => {
            console.error('❌ Network error:', error);
            
            // Hide typing indicator
            typingIndicator.classList.remove('active');
            
            // Enable send button
            isProcessing = false;
            chatbotSend.disabled = false;
            chatbotInput.disabled = false;
            chatbotInput.focus();
            
            // Add error message
            addMessage('Không thể kết nối đến server. Vui lòng kiểm tra kết nối mạng. 🔌', 'bot');
        });
    }
    
    /**
     * Add message to chat
     */
    function addMessage(text, sender) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'chatbot-message ' + sender;
        
        const contentDiv = document.createElement('div');
        contentDiv.className = 'chatbot-message-content';
        contentDiv.textContent = text;
        
        messageDiv.appendChild(contentDiv);
        
        // Insert before typing indicator
        chatbotMessages.insertBefore(messageDiv, typingIndicator);
        
        // Scroll to bottom
        scrollToBottom();
        
        console.log('💬 Message added:', sender, text.substring(0, 50) + '...');
    }
    function scrollToBottom() {
        setTimeout(function() {
            chatbotMessages.scrollTop = chatbotMessages.scrollHeight;
        }, 100);
    }
  
    window.sendQuickReply = function(text) {
        chatbotInput.value = text;
        sendMessage();
    };
 
    setTimeout(function() {
        if (!isOpen) {
            chatbotBadge.style.display = 'flex';
            console.log('🔔 Badge shown');
        }
    }, 3000);
    
    setTimeout(function() {
        if (!isOpen) {
            chatbotBadge.style.display = 'none';
        }
    }, 13000);
    
    console.log('✅ Chatbot widget initialized');
    
})();
</script>