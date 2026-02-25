<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<title>Chọn phương thức thanh toán - Trung Nguyên Legend</title>

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
.payment-container {
	max-width: 700px;
	margin: 50px auto;
	padding: 30px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.payment-header {
	text-align: center;
	margin-bottom: 30px;
}

.payment-header h2 {
	color: #333;
	font-weight: 600;
	margin-bottom: 10px;
}

.order-summary {
	background: #f9f9f9;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 30px;
}

.order-summary h4 {
	margin-bottom: 15px;
	color: #333;
}

.summary-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 1px solid #e0e0e0;
}

.summary-total {
	display: flex;
	justify-content: space-between;
	font-size: 20px;
	font-weight: bold;
	color: rgb(254, 209, 56);
	margin-top: 15px;
}

.payment-methods {
	display: grid;
	grid-template-columns: 1fr;
	gap: 20px;
	margin-bottom: 30px;
}

.payment-option {
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	padding: 25px;
	cursor: pointer;
	transition: all 0.3s;
	display: flex;
	align-items: center;
	gap: 20px;
}

.payment-option:hover {
	border-color: rgb(254, 209, 56);
	background: #fff5f8;
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(241, 149, 178, 0.2);
}

.payment-option.active {
	border-color: rgb(254, 209, 56);
	background: #fff5f8;
}

.payment-icon {
	font-size: 40px;
	color: rgb(254, 209, 56);
	min-width: 50px;
	text-align: center;
}

.payment-info {
	flex: 1;
}

.payment-info h4 {
	margin: 0 0 5px 0;
	color: #333;
	font-size: 18px;
}

.payment-info p {
	margin: 0;
	color: #777;
	font-size: 14px;
}

.payment-badge {
	background: #4caf50;
	color: white;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
}

.badge-popular {
	background: #ff9800;
}

.btn-confirm {
	width: 100%;
	padding: 15px;
	background: rgb(254, 209, 56);
	color: #fff;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s;
}

.btn-confirm:hover {
	background: rgb(128, 64, 0);
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(241, 149, 178, 0.3);
}

.btn-confirm:disabled {
	background: #ccc;
	cursor: not-allowed;
	transform: none;
}

.alert {
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 20px;
}

.alert-danger {
	background: #ffebee;
	color: #c62828;
	border: 1px solid #ffcdd2;
}

.security-note {
	text-align: center;
	color: #777;
	font-size: 13px;
	margin-top: 20px;
	padding: 15px;
	background: #f9f9f9;
	border-radius: 8px;
}

.security-note i {
	color: #4caf50;
	margin-right: 5px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<section class="banner_area">
		<div class="container">
			<div class="banner_text">
				<h3>Thanh toán</h3>
				<ul>
					<li><a href="home">Trang chủ</a></li>
					<li><a href="payment-method.jsp">Thanh toán</a></li>
				</ul>
			</div>
		</div>
	</section>

	<div class="payment-container">
		<div class="payment-header">
			<h2>Chọn phương thức thanh toán</h2>
			<p>Vui lòng chọn phương thức thanh toán phù hợp</p>
		</div>

		<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger">
				<i class="fa fa-exclamation-circle"></i> ${errorMessage}
			</div>
		</c:if>

		<c:set var="order" value="${sessionScope.pendingOrder}" />

		<div class="order-summary">
			<h4>
				<i class="fa fa-shopping-cart"></i> Thông tin đơn hàng
			</h4>
			<div class="summary-item">
				<span>Người nhận:</span> <strong>${order.fullName}</strong>
			</div>
			<div class="summary-item">
				<span>Điện thoại:</span> <strong>${order.phone}</strong>
			</div>
			<div class="summary-item">
				<span>Địa chỉ:</span> <strong>${order.address}</strong>
			</div>
			<div class="summary-total">
				<span>Tổng tiền:</span> <span><fmt:formatNumber
						value="${order.totalAmount}" pattern="#,##0" />₫</span>
			</div>
		</div>

		<div class="payment-methods">
			<!-- VNPay -->
			<div class="payment-option" onclick="selectPayment('vnpay')">
				<div class="payment-icon">
					<i class="fa fa-credit-card"></i>
				</div>
				<div class="payment-info">
					<h4>
						VNPay <span class="payment-badge badge-popular">Phổ biến</span>
					</h4>
					<p>Thanh toán qua VNPay - Hỗ trợ tất cả ngân hàng và ví điện tử</p>
				</div>
				<input type="radio" name="paymentMethod" value="vnpay"
					id="vnpayRadio">
			</div>
			<div class="payment-option" onclick="selectPayment('cod')">
				<div class="payment-icon">
					<i class="fa fa-money"></i>
				</div>
				<div class="payment-info">
					<h4>Thanh toán khi nhận hàng (COD)</h4>
					<p>Thanh toán tiền mặt khi nhận hàng</p>
				</div>
				<input type="radio" name="paymentMethod" value="cod" id="codRadio">
			</div>
		</div>

		<button type="button" class="btn-confirm" id="confirmBtn" disabled
			onclick="confirmPayment()">
			<i class="fa fa-lock"></i> Xác nhận thanh toán
		</button>

		<div class="security-note">
			<i class="fa fa-shield"></i> Giao dịch của bạn được bảo mật với mã
			hóa SSL 256-bit
		</div>
	</div>


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
        let selectedMethod = null;
        
        function selectPayment(method) {
            selectedMethod = method;
            
            document.querySelectorAll('.payment-option').forEach(el => {
                el.classList.remove('active');
            });
            
            event.currentTarget.classList.add('active');
            
            document.querySelectorAll('input[name="paymentMethod"]').forEach(el => {
                el.checked = false;
            });
            document.getElementById(method + 'Radio').checked = true;
            
            document.getElementById('confirmBtn').disabled = false;
        }
        
        function confirmPayment() {
            if (!selectedMethod) {
                alert('Vui lòng chọn phương thức thanh toán!');
                return;
            }
            
            if (selectedMethod === 'vnpay') {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'vnpay-payment';
                document.body.appendChild(form);
                form.submit();
            } else if (selectedMethod === 'cod') {
                window.location.href = 'payment?paymentMethod=cod';
            } 
        }
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