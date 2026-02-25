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
<title>Thanh toán - Trung Nguyên Legend</title>

<!-- CSS Links -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/linearicons/style.css" rel="stylesheet">
<link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
<link href="vendors/stroke-icon/style.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="vendors/revolution/css/settings.css" rel="stylesheet">
<link href="vendors/revolution/css/layers.css" rel="stylesheet">
<link href="vendors/revolution/css/navigation.css" rel="stylesheet">
<link href="vendors/animate-css/animate.css" rel="stylesheet">
<link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="vendors/magnifc-popup/magnific-popup.css" rel="stylesheet">
<link href="vendors/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="vendors/nice-select/css/nice-select.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
/* User Menu Styles */
.user-menu {
	position: relative;
	display: inline-block;
	margin-left: 10px;
}

.user-menu-toggle {
	background: none;
	border: none;
	color: #fff;
	cursor: pointer;
	padding: 8px 12px;
	font-size: 13px;
	transition: all 0.3s;
	border-radius: 4px;
}

.user-menu-toggle:hover {
	background: rgba(255, 255, 255, 0.1);
	color: rgb(128, 64, 0);
}

.user-menu-toggle i.fa-user-circle {
	font-size: 16px;
	margin-right: 5px;
}

.user-dropdown {
	display: none;
	position: absolute;
	right: 0;
	top: calc(100% + 10px);
	background: #fff;
	min-width: 220px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
	border-radius: 8px;
	z-index: 9999;
	overflow: hidden;
}

.user-dropdown.active {
	display: block;
	animation: fadeInDown 0.3s ease;
}

@
keyframes fadeInDown {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.user-dropdown::before {
	content: '';
	position: absolute;
	top: -8px;
	right: 20px;
	width: 0;
	height: 0;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
	border-bottom: 8px solid #fff;
}

.user-info {
	padding: 15px 20px;
	border-bottom: 2px solid #f0f0f0;
	font-weight: 600;
	color: #2c3e50;
	background: #f8f9fa;
}

.user-info i {
	margin-right: 8px;
	color: rgb(128, 64, 0);
}

.user-dropdown a {
	display: block;
	padding: 12px 20px;
	color: #555;
	text-decoration: none;
	transition: all 0.3s;
	border-bottom: 1px solid #f5f5f5;
}

.user-dropdown a:last-child {
	border-bottom: none;
}

.user-dropdown a:hover {
	background: #f8f9fa;
	color: rgb(128, 64, 0);
	padding-left: 25px;
}

.user-dropdown a i {
	margin-right: 10px;
	width: 18px;
	text-align: center;
}

/* Auth Links Styles */
.auth-links {
	display: inline-block;
	margin-left: 10px;
}

.auth-links a {
	color: #fff !important;
	padding: 8px 15px;
	margin-left: 5px;
	border-radius: 4px;
	transition: all 0.3s;
	font-size: 13px;
	text-decoration: none;
	display: inline-block;
}

.auth-links a:hover {
	background: rgba(255, 255, 255, 0.1);
	color: rgb(128, 64, 0) !important;
}

.auth-links a i {
	margin-right: 5px;
}

.auth-links a.btn-register {
	background: #rgb(128, 64, 0);
	color: #fff !important;
}

.auth-links a.btn-register:hover {
	background: #e67e9f;
}

/* Responsive */
@media ( max-width : 768px) {
	.user-menu {
		margin-left: 0;
		margin-top: 10px;
	}
	.user-dropdown {
		right: auto;
		left: 0;
	}
	.user-dropdown::before {
		right: auto;
		left: 20px;
	}
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
					<li><a href="checkout.jsp">Thanh toán</a></li>
				</ul>
			</div>
		</div>
	</section>

	<!--================Billing Details Area =================-->
	<section class="billing_details_area p_100">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<c:if test="${empty sessionScope.user}">
						<div class="login-prompt">
							<p>
								<i class="fa fa-info-circle"></i> Bạn có thể mua hàng mà không
								cần tài khoản
							</p>
							<p>
								Bạn đã có tài khoản? <a href="login?returnUrl=checkout">Đăng
									nhập ngay</a> để được hỗ trợ tốt hơn
							</p>
						</div>
					</c:if>

					<c:if test="${not empty sessionScope.user}">
						<div class="user-info-box">
							<h5>
								<i class="fa fa-user-circle"></i> Xin chào,
								${sessionScope.user.fullName}!
							</h5>
							<p>Thông tin của bạn đã được tự động điền vào form. Vui lòng
								kiểm tra và bổ sung nếu cần.</p>
						</div>
					</c:if>

					<div class="main_title">
						<h2>Thông tin thanh toán</h2>
					</div>
					<div class="billing_form_area">
						<form class="billing_form row" action="checkout" method="post"
							id="checkoutForm">

							<div class="row">
								<div class="col-md-6 form-group">
									<label>Họ *</label> <input type="text" class="form-control"
										name="firstName" value="${firstName}" placeholder="Họ"
										required>
								</div>
								<div class="col-md-6 form-group">
									<label>Tên *</label> <input type="text" class="form-control"
										name="lastName" value="${lastName}" placeholder="Tên" required>
								</div>

								<div class="col-md-6 form-group">
									<label>Số điện thoại *</label> <input type="text"
										class="form-control" name="phone" value="${phone}"
										placeholder="Số điện thoại của bạn" required>
								</div>
								<div class="col-md-6 form-group">
									<label>Địa chỉ email *</label> <input type="email"
										class="form-control" name="email" value="${email}"
										placeholder="Email của bạn" required>
								</div>

								<div class="col-md-12 form-group">
									<label>Khu vực *</label> <select class="form-control"
										id="regionSelect" name="region" onchange="loadCities()"
										required>
										<option value="">Chọn khu vực</option>
										<option value="Bac">Miền Bắc</option>
										<option value="Trung">Miền Trung</option>
										<option value="Nam">Miền Nam</option>
									</select>
								</div>

								<div class="col-md-6 form-group">
									<label>Tỉnh/Thành phố *</label> <select class="form-control"
										id="citySelect" name="city" onchange="loadDistricts()"
										disabled required>
										<option value="">Chọn Tỉnh/Thành phố</option>
									</select>
								</div>

								<div class="col-md-6 form-group">
									<label>Quận/Huyện *</label> <select class="form-control"
										id="districtSelect" name="district" onchange="loadWards()"
										disabled required>
										<option value="">Chọn quận huyện</option>
									</select>
								</div>

								<div class="col-md-12 form-group">
									<label>Xã/Phường *</label> <select class="form-control"
										id="wardSelect" name="ward" disabled required>
										<option value="">Chọn xã/phường</option>
									</select>
								</div>

								<div class="col-md-12 form-group">
									<label>Địa chỉ cụ thể *</label> <input type="text"
										class="form-control" name="address" value="${address}"
										placeholder="Ví dụ: Số 20, ngõ 90" required>
								</div>

								<c:if test="${empty sessionScope.user}">
									<div class="col-md-12 form-group">
										<div class="creat_account">
											<input type="checkbox" id="f-option2" name="createAccount"
												onchange="togglePassword()"> <label for="f-option2">Tạo
												tài khoản mới?</label>
										</div>
									</div>
									<div class="col-md-12 form-group" id="passwordBox"
										style="display: none;">
										<label>Mật khẩu đăng nhập *</label> <input type="password"
											class="form-control" name="accountPassword"
											placeholder="Nhập mật khẩu">
									</div>
								</c:if>

								<div class="col-md-12 form-group">
									<div class="creat_account">
										<h3>Thông tin bổ sung</h3>
									</div>
									<label>Ghi chú đơn hàng</label>
									<textarea class="form-control" name="notes" rows="4"
										placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn."></textarea>
								</div>
							</div>
					</div>
				</div>

				<div class="col-lg-5">
					<div class="order_box_price">
						<div class="main_title">
							<h2>Đơn hàng của bạn</h2>
						</div>
						<div class="payment_list">
							<div class="price_single_cost">
								<h5>
									Sản phẩm <span>Tổng</span>
								</h5>

								<c:set var="cart" value="${sessionScope.cart}" />
								<c:set var="totalAmount" value="${0}" />

								<c:forEach var="item" items="${cart}">
									<c:set var="p" value="${item.product}" />
									<c:set var="itemTotal" value="${p.price * item.quantity}" />
									<c:set var="totalAmount" value="${totalAmount + itemTotal}" />
									<h5>${p.name}
										x ${item.quantity} <span><fmt:formatNumber
												value="${itemTotal}" pattern="#,##0" />₫</span>
									</h5>
								</c:forEach>

								<h4>
									Tạm tính <span><fmt:formatNumber value="${totalAmount}"
											pattern="#,##0" />₫</span>
								</h4>
								<h5>
									Phí vận chuyển <span class="text_f">Miễn phí</span>
								</h5>
								<h3>
									Tổng cộng <span><fmt:formatNumber value="${totalAmount}"
											pattern="#,##0" />₫</span>
								</h3>
							</div>

							<button type="button" class="btn pest_btn"
								onclick="proceedToPayment()"
								style="width: 100%; margin-top: 20px;">Tiến hành thanh
								toán</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="newsletter_area">
		<div class="container">
			<div class="row newsletter_inner">
				<div class="col-lg-6">
					<div class="news_left_text">
						<h4>Đăng ký nhận tin để nhận các ưu đãi mới nhất</h4>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="newsletter_form">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Nhập email của bạn">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button">Đăng
									ký</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- jQuery and JS -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="js/theme.js"></script>
	<script>
        // --- 1. DỮ LIỆU ĐỊA CHÍNH (MẪU) ---
        // Bạn cần thêm dữ liệu đầy đủ hoặc gọi API để lấy full
        const locationData = {
            "Bac": {
                "Hà Nội": {
                    "Ba Đình": ["Phúc Xá", "Trúc Bạch", "Vĩnh Phúc"],
                    "Hoàn Kiếm": ["Hàng Bạc", "Hàng Gai", "Tràng Tiền"]
                },
                "Hải Phòng": {
                    "Hồng Bàng": ["Hoàng Văn Thụ", "Minh Khai"],
                    "Lê Chân": ["An Biên", "An Dương"]
                }
            },
            "Trung": {
                "Đà Nẵng": {
                    "Hải Châu": ["Thạch Thang", "Hải Châu 1", "Hòa Cường Bắc"],
                    "Thanh Khê": ["Vĩnh Trung", "Tân Chính", "Thạc Gián"]
                },
                "Thừa Thiên Huế": {
                    "Huế": ["Vỹ Dạ", "Xuân Phú", "Trường An"]
                }
            },
            "Nam": {
                "Hồ Chí Minh": {
                    "Quận 1": ["Bến Nghé", "Bến Thành", "Đa Kao"],
                    "Quận 3": ["Võ Thị Sáu", "Phường 4", "Phường 9"]
                },
                "Cần Thơ": {
                    "Ninh Kiều": ["Tân An", "An Cư", "An Phú"]
                }
            }
        };

        // --- 2. HÀM XỬ LÝ CHỌN ĐỊA CHỈ ---
        
        function loadCities() {
            const region = document.getElementById("regionSelect").value;
            const citySelect = document.getElementById("citySelect");
            const districtSelect = document.getElementById("districtSelect");
            const wardSelect = document.getElementById("wardSelect");

            // Reset dropdowns
            citySelect.innerHTML = '<option value="">Chọn Tỉnh/Thành phố</option>';
            districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
            wardSelect.innerHTML = '<option value="">Chọn Xã/Phường</option>';
            
            districtSelect.disabled = true;
            wardSelect.disabled = true;

            // Load dữ liệu
            if (region && locationData[region]) {
                citySelect.disabled = false;
                for (let city in locationData[region]) {
                    let option = document.createElement("option");
                    option.value = city;
                    option.text = city;
                    citySelect.add(option);
                }
            } else {
                citySelect.disabled = true;
            }
            // Cập nhật lại giao diện nice-select (nếu dùng template này)
            $('select').niceSelect('update');
        }

        function loadDistricts() {
            const region = document.getElementById("regionSelect").value;
            const city = document.getElementById("citySelect").value;
            const districtSelect = document.getElementById("districtSelect");
            const wardSelect = document.getElementById("wardSelect");

            districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
            wardSelect.innerHTML = '<option value="">Chọn Xã/Phường</option>';
            wardSelect.disabled = true;

            if (city && locationData[region][city]) {
                districtSelect.disabled = false;
                for (let district in locationData[region][city]) {
                    let option = document.createElement("option");
                    option.value = district;
                    option.text = district;
                    districtSelect.add(option);
                }
            } else {
                districtSelect.disabled = true;
            }
            $('select').niceSelect('update');
        }

        function loadWards() {
            const region = document.getElementById("regionSelect").value;
            const city = document.getElementById("citySelect").value;
            const district = document.getElementById("districtSelect").value;
            const wardSelect = document.getElementById("wardSelect");

            wardSelect.innerHTML = '<option value="">Chọn Xã/Phường</option>';

            if (district && locationData[region][city][district]) {
                wardSelect.disabled = false;
                const wards = locationData[region][city][district];
                wards.forEach(ward => {
                    let option = document.createElement("option");
                    option.value = ward;
                    option.text = ward;
                    wardSelect.add(option);
                });
            } else {
                wardSelect.disabled = true;
            }
            $('select').niceSelect('update');
        }

        // --- 3. ẨN HIỆN PASSWORD ---
        function togglePassword() {
            var checkBox = document.getElementById("f-option2");
            var passBox = document.getElementById("passwordBox");
            var passInput = passBox.querySelector("input");

            if (checkBox.checked) {
                passBox.style.display = "block";
                passInput.required = true;
            } else {
                passBox.style.display = "none";
                passInput.required = false;
            }
        }

		function proceedToPayment() {
			var form = document.getElementById('checkoutForm');
			if (!form.checkValidity()) {
				form.reportValidity();
				return;
			}

			form.submit();
		}

		$(document).ready(function() {
			$('select').niceSelect();
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