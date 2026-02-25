<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<title>Thanh toán thất bại - Trung Nguyên Legend</title>

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
.result-container {
    max-width: 600px;
    margin: 80px auto;
    padding: 40px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 30px rgba(0,0,0,0.1);
    text-align: center;
}

.result-icon {
    font-size: 80px;
    color: #f44336;
    margin-bottom: 20px;
    animation: shake 0.5s;
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-10px); }
    75% { transform: translateX(10px); }
}

.result-title {
    font-size: 28px;
    font-weight: 600;
    color: #333;
    margin-bottom: 15px;
}

.result-message {
    font-size: 16px;
    color: #666;
    margin-bottom: 30px;
    line-height: 1.6;
}

.error-details {
    background: #ffebee;
    border: 1px solid #ffcdd2;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 30px;
    text-align: left;
}

.error-details h4 {
    color: #c62828;
    margin-bottom: 15px;
    font-size: 16px;
}

.error-details p {
    margin: 8px 0;
    color: #666;
}

.error-details strong {
    color: #333;
}

.action-buttons {
    display: flex;
    gap: 15px;
    justify-content: center;
}

.btn-action {
    padding: 12px 30px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s;
    border: none;
    cursor: pointer;
}

.btn-retry {
    background: #f195b2;
    color: #fff;
}

.btn-retry:hover {
    background: #e67e9f;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(241, 149, 178, 0.3);
}

.btn-home {
    background: #fff;
    color: #333;
    border: 2px solid #ddd;
}

.btn-home:hover {
    background: #f9f9f9;
    border-color: #bbb;
}

.support-info {
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid #e0e0e0;
}

.support-info p {
    color: #777;
    font-size: 14px;
    margin-bottom: 10px;
}

.support-info a {
    color: #f195b2;
    text-decoration: none;
    font-weight: 600;
}

.support-info a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <section class="banner_area">
        <div class="container">
            <div class="banner_text">
                <h3>Thanh toán thất bại</h3>
                <ul>
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="payment-failed.jsp">Thanh toán thất bại</a></li>
                </ul>
            </div>
        </div>
    </section>

    <div class="result-container">
        <div class="result-icon">
            <i class="fa fa-times-circle"></i>
        </div>
        
        <h1 class="result-title">Thanh toán thất bại!</h1>
        
        <p class="result-message">
            Rất tiếc, giao dịch của bạn không thể hoàn tất. Vui lòng kiểm tra lại thông tin và thử lại.
        </p>

        <div class="error-details">
            <h4><i class="fa fa-exclamation-triangle"></i> Chi tiết lỗi:</h4>
            <p><strong>Lý do:</strong> ${errorMessage}</p>
            <c:if test="${not empty vnp_ResponseCode}">
                <p><strong>Mã lỗi:</strong> ${vnp_ResponseCode}</p>
            </c:if>
        </div>

        <div class="action-buttons">
            <a href="payment-method.jsp" class="btn-action btn-retry">
                <i class="fa fa-refresh"></i> Thử lại
            </a>
            <a href="home" class="btn-action btn-home">
                <i class="fa fa-home"></i> Về trang chủ
            </a>
        </div>

        <div class="support-info">
            <p>Cần hỗ trợ? Liên hệ với chúng tôi:</p>
            <p>
                <i class="fa fa-phone"></i> Hotline: <a href="tel:1800574687">1800 574 687</a><br>
                <i class="fa fa-envelope"></i> Email: <a href="mailto:support@cake.com">support@cake.com</a>
            </p>
        </div>
    </div>


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	<script>
		function toggleUserMenu() {
			var dropdown = document.getElementById('userDropdown');
			if (dropdown) {
				dropdown.classList.toggle('active');
			}
		}

		document.addEventListener('click', function(event) {
			var userMenu = document.querySelector('.user-menu');
			var dropdown = document.getElementById('userDropdown');

			if (userMenu && dropdown && !userMenu.contains(event.target)) {
				dropdown.classList.remove('active');
			}
		});
	</script>
    
</body>
</html>