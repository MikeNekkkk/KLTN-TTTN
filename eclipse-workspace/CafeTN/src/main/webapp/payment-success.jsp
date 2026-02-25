<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<title>Thanh toán thành công - Trung Nguyên Legend</title>

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
.success-container {
    max-width: 700px;
    margin: 50px auto;
    padding: 40px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
    text-align: center;
}

.success-icon {
    width: 80px;
    height: 80px;
    background: #4CAF50;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 30px;
    animation: scaleIn 0.5s ease-out;
}

.success-icon i {
    font-size: 40px;
    color: #fff;
}

@keyframes scaleIn {
    0% { transform: scale(0); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

.success-container h2 {
    color: #4CAF50;
    margin-bottom: 10px;
}

.success-container .subtitle {
    color: #666;
    font-size: 16px;
    margin-bottom: 30px;
}

.order-info {
    background: #f9f9f9;
    padding: 25px;
    border-radius: 8px;
    margin: 30px 0;
    text-align: left;
}

.order-info h4 {
    color: #333;
    margin-bottom: 20px;
    border-bottom: 2px solid rgb(254, 209, 56);
    padding-bottom: 10px;
}

.info-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 12px;
    padding: 10px 0;
    border-bottom: 1px solid #e0e0e0;
}

.info-row:last-child {
    border-bottom: none;
}

.info-row label {
    color: #666;
    font-weight: 500;
}

.info-row span {
    color: #333;
    font-weight: 600;
}

.order-total {
    background: #fff5f8;
    padding: 15px;
    border-radius: 5px;
    margin-top: 15px;
}

.order-total .total-row {
    display: flex;
    justify-content: space-between;
    font-size: 18px;
    font-weight: bold;
    color: rgb(254, 209, 56);
}

.order-items {
    margin-top: 20px;
}

.order-items h5 {
    margin-bottom: 15px;
    color: #333;
}

.item-row {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #e0e0e0;
}

.action-buttons {
    margin-top: 30px;
    display: flex;
    gap: 15px;
    justify-content: center;
}

.btn-action {
    padding: 12px 30px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s;
}

.btn-primary {
    background: rgb(254, 209, 56);
    color: #fff;
}

.btn-primary:hover {
    background: rgb(128, 64, 0);
    color: #fff;
}

.btn-secondary {
    background: #fff;
    color: rgb(254, 209, 56);
    border: 2px solid rgb(254, 209, 56);
}

.btn-secondary:hover {
    background: rgb(254, 209, 56);
    color: #fff;
}

.payment-method-badge {
    display: inline-block;
    padding: 5px 15px;
    background: #e3f2fd;
    color: #1976d2;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 500;
}
</style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <section class="banner_area">
        <div class="container">
            <div class="banner_text">
                <h3>Thanh toán thành công</h3>
                <ul>
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="payment-success.jsp">Thanh toán thành công</a></li>
                </ul>
            </div>
        </div>
    </section>

    <div class="success-container">
        <div class="success-icon">
            <i class="fa fa-check"></i>
        </div>
        
        <h2>Thanh toán thành công!</h2>
        <p class="subtitle">Cảm ơn bạn đã đặt hàng tại Trung Nguyên Legend Café</p>
        
        <c:set var="order" value="${sessionScope.completedOrder}" />
        
        <div class="order-info">
            <h4><i class="fa fa-file-text-o"></i> Thông tin đơn hàng #${order.id}</h4>
            
            <div class="info-row">
                <label>Người nhận:</label>
                <span>${order.fullName}</span>
            </div>
            
            <div class="info-row">
                <label>Số điện thoại:</label>
                <span>${order.phone}</span>
            </div>
            
            <div class="info-row">
                <label>Email:</label>
                <span>${order.email}</span>
            </div>
            
            <div class="info-row">
                <label>Địa chỉ giao hàng:</label>
                <span>${order.address}, miền ${order.state}</span>
            </div>
            
            <div class="info-row">
                <label>Phương thức thanh toán:</label>
                <span>
                    <c:choose>
                        <c:when test="${order.paymentMethod == 'BANK_CARD'}">
                            <span class="payment-method-badge">
                                <i class="fa fa-credit-card"></i> Thẻ ngân hàng
                            </span>
                        </c:when>
                        <c:when test="${order.paymentMethod == 'MOMO'}">
                            <span class="payment-method-badge">
                                <i class="fa fa-mobile"></i> MoMo
                            </span>
                        </c:when>
                    </c:choose>
                </span>
            </div>
            
            <c:if test="${not empty order.notes}">
                <div class="info-row">
                    <label>Ghi chú:</label>
                    <span>${order.notes}</span>
                </div>
            </c:if>
            
            <!-- Danh sách sản phẩm -->
            <div class="order-items">
                <h5><i class="fa fa-shopping-bag"></i> Sản phẩm đã đặt:</h5>
                <c:forEach var="item" items="${order.orderItems}">
                    <div class="item-row">
                        <span>${item.productName} × ${item.quantity}</span>
                        <strong><fmt:formatNumber value="${item.subtotal}" pattern="#,##0" />₫</strong>
                    </div>
                </c:forEach>
            </div>
            
            <div class="order-total">
                <div class="total-row">
                    <span>Tổng cộng:</span>
                    <span><fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" />₫</span>
                </div>
            </div>
        </div>
        
        <div style="background: #e8f5e9; padding: 15px; border-radius: 5px; margin: 20px 0;">
            <p style="margin: 0; color: #2e7d32;">
                <i class="fa fa-info-circle"></i>
                Đơn hàng của bạn đang được xử lý. Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất!
            </p>
        </div>
        
        <div class="action-buttons">
            <a href="home" class="btn-action btn-primary">
                <i class="fa fa-home"></i> Về trang chủ
            </a>
            <a href="#" class="btn-action btn-secondary" onclick="window.print(); return false;">
                <i class="fa fa-print"></i> In đơn hàng
            </a>
        </div>
    </div>


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script>
        window.addEventListener('load', function() {
            document.querySelector('.success-icon').style.opacity = '1';
        });
    </script>
    
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