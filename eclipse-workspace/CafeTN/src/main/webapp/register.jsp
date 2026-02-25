<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<title>Đăng ký - Trung Nguyên Legend</title>

<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
.register-container {
    max-width: 600px;
    margin: 80px auto;
    padding: 40px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 30px rgba(0,0,0,0.1);
}

.register-header {
    text-align: center;
    margin-bottom: 30px;
}

.register-header h2 {
    color: #333;
    font-weight: 600;
    margin-bottom: 10px;
}

.register-header p {
    color: #777;
    font-size: 14px;
}

.form-row {
    display: flex;
    gap: 15px;
}

.form-group {
    margin-bottom: 20px;
    flex: 1;
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

.form-group textarea {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    resize: vertical;
    min-height: 80px;
}

.form-group textarea:focus {
    outline: none;
    border-color: rgb(254, 209, 56);
}

.password-hint {
    font-size: 12px;
    color: #777;
    margin-top: 5px;
}

.btn-register {
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

.btn-register:hover {
    background: rgb(254, 209, 56);
}

.login-link {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
}

.login-link a {
    color: rgb(254, 209, 56);
    font-weight: 600;
    text-decoration: none;
}

.login-link a:hover {
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
    border: 1px solid rgb(254, 209, 56);
}

.required {
    color: rgb(254, 209, 56);
}
</style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <section class="banner_area">
        <div class="container">
            <div class="banner_text">
                <h3>Đăng ký</h3>
                <ul>
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="register.jsp">Đăng ký</a></li>
                </ul>
            </div>
        </div>
    </section>

    <div class="register-container">
        <div class="register-header">
            <h2>Đăng ký tài khoản</h2>
            <p>Tạo tài khoản để trải nghiệm dịch vụ tốt hơn</p>
        </div>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-circle"></i> ${errorMessage}
            </div>
        </c:if>

        <form action="register" method="post" id="registerForm">
            <div class="form-group">
                <label for="username">Tên đăng nhập <span class="required">*</span></label>
                <input type="text" id="username" name="username" 
                       value="${username}" required 
                       pattern="[A-Za-z0-9_]{4,20}"
                       placeholder="4-20 ký tự (chữ, số, _)">
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="password">Mật khẩu <span class="required">*</span></label>
                    <input type="password" id="password" name="password" 
                           required minlength="6"
                           placeholder="Ít nhất 6 ký tự">
                    <div class="password-hint">Ít nhất 6 ký tự</div>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Xác nhận mật khẩu <span class="required">*</span></label>
                    <input type="password" id="confirmPassword" name="confirmPassword" 
                           required minlength="6"
                           placeholder="Nhập lại mật khẩu">
                </div>
            </div>

            <div class="form-group">
                <label for="fullName">Họ và tên <span class="required">*</span></label>
                <input type="text" id="fullName" name="fullName" 
                       value="${fullName}" required 
                       placeholder="Nguyễn Văn A">
            </div>

            <div class="form-group">
                <label for="email">Email <span class="required">*</span></label>
                <input type="email" id="email" name="email" 
                       value="${email}" required 
                       placeholder="example@email.com">
            </div>

            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="tel" id="phone" name="phone" 
                       value="${phone}" 
                       pattern="0[0-9]{9}"
                       placeholder="0901234567">
                <div class="password-hint">10 số, bắt đầu bằng 0</div>
            </div>

            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <textarea id="address" name="address" 
                          placeholder="Nhập địa chỉ của bạn">${address}</textarea>
            </div>

            <button type="submit" class="btn-register">
                <i class="fa fa-user-plus"></i> Đăng ký
            </button>
        </form>

        <div class="login-link">
            Đã có tài khoản? <a href="login">Đăng nhập ngay</a>
        </div>
    </div>


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script>
        // Validate password matching
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu xác nhận không khớp!');
                document.getElementById('confirmPassword').focus();
                return false;
            }
        });
        
        // Real-time password matching indicator
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            
            if (confirmPassword && password !== confirmPassword) {
                this.style.borderColor = '#c62828';
            } else if (confirmPassword && password === confirmPassword) {
                this.style.borderColor = '#2e7d32';
            } else {
                this.style.borderColor = '#ddd';
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