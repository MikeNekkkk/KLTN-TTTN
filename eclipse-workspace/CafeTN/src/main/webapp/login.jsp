<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<title>Đăng nhập - Trung Nguyên Legend</title>

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
.login-container {
    max-width: 450px;
    margin: 80px auto;
    padding: 40px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 30px rgba(0,0,0,0.1);
}

.login-header {
    text-align: center;
    margin-bottom: 30px;
}

.login-header h2 {
    color: #333;
    font-weight: 600;
    margin-bottom: 10px;
}

.login-header p {
    color: #777;
    font-size: 14px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: #333;
}

.form-group input {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    transition: border-color 0.3s;
}

.form-group input:focus {
    outline: none;
    border-color: rgb(254, 209, 56);
}

.remember-forgot {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    font-size: 14px;
}

.remember-forgot label {
    margin: 0;
    font-weight: normal;
    cursor: pointer;
}

.remember-forgot a {
    color: rgb(254, 209, 56);
    text-decoration: none;
}

.remember-forgot a:hover {
    text-decoration: underline;
}

.btn-login {
    width: 100%;
    padding: 12px;
    background: rgb(254, 209, 56);
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s;
}

.btn-login:hover {
    background: rgb(128, 64, 0);
}

.register-link {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
}

.register-link a {
    color: rgb(254, 209, 56);
    font-weight: 600;
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
}

.alert {
    padding: 12px 15px;
    border-radius: 5px;
    margin-bottom: 20px;
}

.alert-danger {
    background: #ffebee;
    color: #c62828;
    border: 1px solid #ffcdd2;
}

.alert-success {
    background: #e8f5e9;
    color: #2e7d32;
    border: 1px solid #c8e6c9;
}

.guest-checkout {
    text-align: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #eee;
}

.guest-checkout a {
    color: #666;
    font-size: 13px;
}

.guest-checkout a:hover {
    color: rgb(254, 209, 56);
}
</style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <section class="banner_area">
        <div class="container">
            <div class="banner_text">
                <h3>Đăng nhập</h3>
                <ul>
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="login.jsp">Đăng nhập</a></li>
                </ul>
            </div>
        </div>
    </section>

    <div class="login-container">
        <div class="login-header">
            <h2>Đăng nhập</h2>
            <p>Chào mừng bạn quay trở lại!</p>
        </div>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-circle"></i> ${errorMessage}
            </div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <i class="fa fa-check-circle"></i> ${successMessage}
            </div>
        </c:if>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Tên đăng nhập *</label>
                <input type="text" id="username" name="username" 
                       value="${username}" required 
                       placeholder="Nhập tên đăng nhập">
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu *</label>
                <input type="password" id="password" name="password" 
                       required placeholder="Nhập mật khẩu">
            </div>

            <div class="remember-forgot">
                <label>
                    <input type="checkbox" name="remember"> Ghi nhớ đăng nhập
                </label>
                <a href="#">Quên mật khẩu?</a>
            </div>

            <button type="submit" class="btn-login">
                <i class="fa fa-sign-in"></i> Đăng nhập
            </button>
        </form>

        <div class="register-link">
            Chưa có tài khoản? <a href="register">Đăng ký ngay</a>
        </div>
        
        <c:if test="${not empty sessionScope.returnUrl && sessionScope.returnUrl.contains('checkout')}">
            <div class="guest-checkout">
                <a href="checkout">
                    <i class="fa fa-arrow-left"></i> Tiếp tục mua hàng không cần đăng nhập
                </a>
            </div>
        </c:if>
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