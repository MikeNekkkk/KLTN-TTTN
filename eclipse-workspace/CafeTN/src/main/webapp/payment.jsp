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
<title>Thanh toán - Trung Nguyên Legend</title>

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
.payment-container {
    max-width: 600px;
    margin: 50px auto;
    padding: 30px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

.payment-method {
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    cursor: pointer;
    transition: all 0.3s;
}

.payment-method:hover {
    border-color: #f195b2;
    background: #fff5f8;
}

.payment-method.active {
    border-color: #f195b2;
    background: #fff5f8;
}

.payment-method input[type="radio"] {
    margin-right: 10px;
}

.payment-form {
    display: none;
    margin-top: 20px;
    padding: 20px;
    background: #f9f9f9;
    border-radius: 8px;
}

.payment-form.active {
    display: block;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: 500;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.order-summary {
    background: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.order-summary h4 {
    margin-bottom: 15px;
    color: #333;
}

.order-summary .summary-item {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    padding-bottom: 10px;
    border-bottom: 1px solid #e0e0e0;
}

.order-summary .summary-total {
    display: flex;
    justify-content: space-between;
    font-size: 18px;
    font-weight: bold;
    color: #f195b2;
    margin-top: 15px;
}

.btn-payment {
    width: 100%;
    padding: 15px;
    background: #f195b2;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-payment:hover {
    background: #e67e9f;
}

.btn-payment:disabled {
    background: #ccc;
    cursor: not-allowed;
}

.error-message {
    background: #ffebee;
    color: #c62828;
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 20px;
}

.payment-icon {
    font-size: 24px;
    margin-right: 10px;
    color: #f195b2;
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
                    <li><a href="payment.jsp">Thanh toán</a></li>
                </ul>
            </div>
        </div>
    </section>

    <div class="payment-container">
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <i class="fa fa-exclamation-circle"></i> ${errorMessage}
            </div>
        </c:if>
        
        <c:set var="order" value="${sessionScope.pendingOrder}" />
        
        <div class="order-summary">
            <h4><i class="fa fa-shopping-cart"></i> Thông tin đơn hàng</h4>
            <div class="summary-item">
                <span>Người nhận:</span>
                <strong>${order.fullName}</strong>
            </div>
            <div class="summary-item">
                <span>Điện thoại:</span>
                <strong>${order.phone}</strong>
            </div>
            <div class="summary-item">
                <span>Địa chỉ:</span>
                <strong>${order.address}, ${order.city}</strong>
            </div>
            <div class="summary-total">
                <span>Tổng tiền:</span>
                <span><fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" />₫</span>
            </div>
        </div>

        <h4 style="margin-bottom: 20px;">Chọn phương thức thanh toán</h4>

        <form action="payment" method="post" id="paymentForm">
            <!-- Thanh toán qua thẻ ngân hàng -->
            <div class="payment-method" onclick="selectPayment('bank')">
                <input type="radio" name="paymentMethod" value="bank" id="bankRadio">
                <label for="bankRadio" style="cursor: pointer; display: inline;">
                    <i class="fa fa-credit-card payment-icon"></i>
                    <strong>Thanh toán qua thẻ ngân hàng</strong>
                </label>
            </div>
            
            <div class="payment-form" id="bankForm">
                <div class="form-group">
                    <label>Số thẻ *</label>
                    <input type="text" name="cardNumber" placeholder="1234 5678 9012 3456" 
                           maxlength="19" pattern="\d{4}\s\d{4}\s\d{4}\s\d{4}" 
                           oninput="formatCardNumber(this)">
                </div>
                <div class="form-group">
                    <label>Tên chủ thẻ *</label>
                    <input type="text" name="cardHolder" placeholder="NGUYEN VAN A">
                </div>
                <div style="display: flex; gap: 15px;">
                    <div class="form-group" style="flex: 1;">
                        <label>Ngày hết hạn *</label>
                        <input type="text" name="expiryDate" placeholder="MM/YY" 
                               maxlength="5" pattern="\d{2}/\d{2}" 
                               oninput="formatExpiryDate(this)">
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>CVV *</label>
                        <input type="text" name="cvv" placeholder="123" 
                               maxlength="3" pattern="\d{3}">
                    </div>
                </div>
            </div>

            <div class="payment-method" onclick="selectPayment('momo')">
                <input type="radio" name="paymentMethod" value="momo" id="momoRadio">
                <label for="momoRadio" style="cursor: pointer; display: inline;">
                    <i class="fa fa-mobile payment-icon"></i>
                    <strong>Thanh toán qua MoMo</strong>
                </label>
            </div>
            
            <div class="payment-form" id="momoForm">
                <div class="form-group">
                    <label>Số điện thoại MoMo *</label>
                    <input type="text" name="momoPhone" placeholder="0901234567" 
                           maxlength="10" pattern="0\d{9}">
                </div>
                <div class="form-group">
                    <label>Tên tài khoản *</label>
                    <input type="text" name="momoName" placeholder="Nguyen Van A">
                </div>
            </div>

            <button type="submit" class="btn-payment" id="submitBtn" disabled>
                <i class="fa fa-lock"></i> Xác nhận thanh toán
            </button>
        </form>
    </div>


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script>
        let selectedMethod = null;
        
        function selectPayment(method) {
            selectedMethod = method;
            
            document.querySelectorAll('.payment-method').forEach(el => {
                el.classList.remove('active');
            });
            document.querySelectorAll('.payment-form').forEach(el => {
                el.classList.remove('active');
            });
            
            if (method === 'bank') {
                document.getElementById('bankRadio').checked = true;
                document.querySelectorAll('.payment-method')[0].classList.add('active');
                document.getElementById('bankForm').classList.add('active');
            } else if (method === 'momo') {
                document.getElementById('momoRadio').checked = true;
                document.querySelectorAll('.payment-method')[1].classList.add('active');
                document.getElementById('momoForm').classList.add('active');
            }
            
            document.getElementById('submitBtn').disabled = false;
        }
        
        function formatCardNumber(input) {
            let value = input.value.replace(/\s/g, '');
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
            input.value = formattedValue;
        }
        
        function formatExpiryDate(input) {
            let value = input.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            input.value = value;
        }
        
        // Validate form trước khi submit
        document.getElementById('paymentForm').addEventListener('submit', function(e) {
            if (!selectedMethod) {
                e.preventDefault();
                alert('Vui lòng chọn phương thức thanh toán!');
                return;
            }
            
            if (selectedMethod === 'bank') {
                const cardNumber = document.querySelector('input[name="cardNumber"]').value;
                const cardHolder = document.querySelector('input[name="cardHolder"]').value;
                const expiryDate = document.querySelector('input[name="expiryDate"]').value;
                const cvv = document.querySelector('input[name="cvv"]').value;
                
                if (!cardNumber || !cardHolder || !expiryDate || !cvv) {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin thẻ!');
                    return;
                }
            } else if (selectedMethod === 'momo') {
                const phone = document.querySelector('input[name="momoPhone"]').value;
                const name = document.querySelector('input[name="momoName"]').value;
                
                if (!phone || !name) {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin MoMo!');
                    return;
                }
            }
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