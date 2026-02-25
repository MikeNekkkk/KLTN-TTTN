<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
    <title>Liên Hệ - TRUNG NGUYÊN LEGEND CAFÉ</title>

    <!-- Icon css link -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="vendors/linearicons/style.css" rel="stylesheet">
    <link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
    <link href="vendors/stroke-icon/style.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Rev slider css -->
    <link href="vendors/revolution/css/settings.css" rel="stylesheet">
    <link href="vendors/revolution/css/layers.css" rel="stylesheet">
    <link href="vendors/revolution/css/navigation.css" rel="stylesheet">
    <link href="vendors/animate-css/animate.css" rel="stylesheet">
    
    <!-- Extra plugin css -->
    <link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="vendors/magnifc-popup/magnific-popup.css" rel="stylesheet">
    
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <style>
        .login-prompt {
            background: #fff3cd;
            border: 1px solid #ffc107;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }

        .login-prompt p {
            margin: 0 0 8px 0;
            color: #856404;
            font-size: 14px;
        }

        .login-prompt a {
            color: rgb(254, 209, 56);
            font-weight: 600;
            text-decoration: none;
            font-size: 14px;
        }

        .login-prompt a:hover {
            text-decoration: underline;
        }

        .user-info-box {
            background: #e8f5e9;
            border: 1px solid #4caf50;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .user-info-box h5 {
            margin: 0 0 5px 0;
            color: #2e7d32;
            font-size: 16px;
        }

        .user-info-box p {
            margin: 0;
            font-size: 13px;
            color: #555;
        }

        .success-message {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }

        .error-message {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>

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
<header class="main_header_area">
		<div class="top_header_area row m0">
			<div class="container">
				<div class="float-left">
					<a href="tel:+0901957365"><i class="fa fa-phone"
						aria-hidden="true"></i> + 0915 493 322</a> <a
						href="mailto:info@cakebakery.com"><i class="fa fa-envelope-o"
						aria-hidden="true"></i> trungnguyenlegend.com</a>
				</div>
				<div class="float-right">
					<ul class="h_social list_style">
						<li><a
							href="https://www.facebook.com/sharer.php?u=https://trungnguyenlegendcafe.net/ca-phe-dua-nang-luong-thanh-mat-tu-san-vat-nhiet-doi-2/"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href=""
							https://twitter.com/share?url=https://trungnguyenlegendcafe.net/ca-phe-dua-nang-luong-thanh-mat-tu-san-vat-nhiet-doi-2/""><i
								class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a
							href="mailto:?subject=C%C3%80%20PH%C3%8A%20D%E1%BB%AAA%20%7C%20N%C4%83ng%20l%C6%B0%E1%BB%A3ng%20thanh%20m%C3%A1t%20t%E1%BB%AB%20s%E1%BA%A3n%20v%E1%BA%ADt%20nhi%E1%BB%87t%20%C4%91%E1%BB%9Bi.&amp;body=Xem%20n%C3%A0y%3A%20https%3A%2F%2Ftrungnguyenlegendcafe.net%2Fca-phe-dua-nang-luong-thanh-mat-tu-san-vat-nhiet-doi-2%2F"><i
								class="fa fa-linkedin"></i></a></li>
					</ul>

					<!-- Menu User / Auth Links -->
					<c:choose>
						<c:when test="${not empty sessionScope.user}">
							<div class="user-menu">
								<button class="user-menu-toggle" onclick="toggleUserMenu()">
									<i class="fa fa-user-circle"></i> ${sessionScope.user.fullName}
									<i class="fa fa-angle-down"></i>
								</button>
								<div class="user-dropdown" id="userDropdown">
									<div class="user-info">
										<i class="fa fa-user"></i> ${sessionScope.user.fullName}
									</div>
									<c:if test="${sessionScope.user.isAdmin()}">
										<a href="${pageContext.request.contextPath}/AdminHome"> <i
											class="fa fa-dashboard"></i> Quản trị
										</a>
									</c:if>
									<c:if test="${!sessionScope.user.isAdmin()}">
										<a href="${pageContext.request.contextPath}/my-orders"> <i
											class="fa fa-shopping-bag"></i> Đơn hàng của tôi
										</a>
										<a href="${pageContext.request.contextPath}/my-account"> <i
											class="fa fa-user"></i> Tài khoản
										</a>
									</c:if>
									<a href="${pageContext.request.contextPath}/logout"> <i
										class="fa fa-sign-out"></i> Đăng xuất
									</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="auth-links">
								<a href="${pageContext.request.contextPath}/login"> <i
									class="fa fa-sign-in"></i> Đăng nhập
								</a> <a href="${pageContext.request.contextPath}/register"> <i
									class="fa fa-sign-in"></i> Đăng ký
								</a>
								
							</div>
						</c:otherwise>
					</c:choose>

					<ul class="h_search list_style">
						<li class="shop_cart">
							<%
							List<Entity.CartItem> cart = (List<Entity.CartItem>) session.getAttribute("cart");
							int cartCount = (cart != null) ? cart.size() : 0;
							%> <a href="${pageContext.request.contextPath}/cart.jsp"
							title="Xem giỏ hàng" data-cart-count="<%= cartCount %>"> <i
								class="lnr lnr-cart"></i>
						</a>
						</li>

						<li><a class="popup-with-zoom-anim" href="#test-search">
								<i class="fa fa-search"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_menu_area">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/home"> <img
						src="${pageContext.request.contextPath}/img/logo.png" alt="">
						<img src="${pageContext.request.contextPath}/img/logo-2.png"
						alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="my_toggle_menu"> <span></span> <span></span> <span></span>
						</span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">

							<li><a
								href="${pageContext.request.contextPath}/home">Trang
									chủ</a></li>
							<li><a
								href="${pageContext.request.contextPath}/CakeControl"> Sản
									phẩm</a></li>
							<li><a
								href="${pageContext.request.contextPath}/about-us.jsp">Về
									chúng tôi</a></li>
						</ul>
						<ul class="navbar-nav justify-content-end">



							<li><a href="${pageContext.request.contextPath}/blogList">Bài
									Viết</a></li>


							<li><a
								href="${pageContext.request.contextPath}/ProductCategories">Mua
									Sắm</a></li>

							<li class="dropdown submenu active"><a href="${pageContext.request.contextPath}/contact.jsp">Contact
									Us</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
    <section class="banner_area">
        <div class="container">
            <div class="banner_text">
                <h3>Liên Hệ Chúng Tôi</h3>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="contact.jsp">Liên Hệ</a></li>
                </ul>
            </div>
        </div>
    </section>
    
    <section class="contact_form_area p_100">
        <div class="container">
            <div class="main_title">
                <h2>Get In Touch</h2>
                <h5>Do you have anything in your mind to let us know? Kindly don't delay to connect to us by means of our contact form.</h5>
            </div>
            
            <div class="row">
                <div class="col-lg-7">
                    <c:if test="${not empty sessionScope.successMessage}">
                        <div class="success-message">
                            <i class="fa fa-check-circle"></i> ${sessionScope.successMessage}
                        </div>
                        <c:remove var="successMessage" scope="session"/>
                    </c:if>
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="error-message">
                            <i class="fa fa-exclamation-triangle"></i> ${errorMessage}
                        </div>
                    </c:if>
                    
                    <c:if test="${empty sessionScope.user}">
                        <div class="login-prompt">
                            <p><i class="fa fa-info-circle"></i> Bạn có thể gửi liên hệ mà không cần tài khoản</p>
                            <p>Bạn đã có tài khoản? <a href="login?returnUrl=contact.jsp">Đăng nhập ngay</a> để được hỗ trợ tốt hơn</p>
                        </div>
                    </c:if>

                    <c:if test="${not empty sessionScope.user}">
                        <div class="user-info-box">
                            <h5><i class="fa fa-user-circle"></i> Xin chào, ${sessionScope.user.fullName}!</h5>
                            <p>Thông tin của bạn đã được tự động điền vào form. Vui lòng kiểm tra và bổ sung nếu cần.</p>
                        </div>
                    </c:if>
                    
                    <form class="row contact_us_form" action="submitContact" method="post" id="contactForm">
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" id="name" name="name" 
                                   placeholder="Your name" 
                                   value="${sessionScope.user.fullName}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <input type="email" class="form-control" id="email" name="email" 
                                   placeholder="Email address" 
                                   value="${sessionScope.user.email}" required>
                        </div>
                        <div class="form-group col-md-12">
                            <input type="text" class="form-control" id="subject" name="subject" 
                                   placeholder="Subject" required>
                        </div>
                        <div class="form-group col-md-12">
                            <textarea class="form-control" name="message" id="message" rows="5" 
                                      placeholder="Write message" required></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <button type="submit" class="btn order_s_btn form-control">Submit Now</button>
                        </div>
                    </form>
                </div>
                
                <div class="col-lg-4 offset-md-1">
                    <div class="contact_details">
                        <div class="contact_d_item">
                            <h3>Địa chỉ :</h3>
                            <p>87A Cách Mạng Tháng 8 <br />Phường Bến Thành, Quận 1, Hồ Chí Minh</p>
                        </div>
                        <div class="contact_d_item">
                            <h5>Điện thoại : <a href="tel:0915493322">0915 493 322</a></h5>
                            <h5>Email : <a href="mailto:trungnguyenfranchising@gmail.com">trungnguyenfranchising@gmail.com</a></h5>
                        </div>
                        <div class="contact_d_item">
                            <h3>Thời gian mở cửa :</h3>
                            <p>8:00 AM – 8:00 PM</p>
                            <p>Thứ 2 – Chủ Nhật</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    <jsp:include page="footer.jsp" />

    <div class="search_area zoom-anim-dialog mfp-hide" id="test-search">
        <div class="search_box_inner">
            <h3>Search</h3>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="icon icon-Search"></i></button>
                </span>
            </div>
        </div>
    </div>
    
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
    <script src="vendors/datetime-picker/js/moment.min.js"></script>
    <script src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="vendors/jquery-ui/jquery-ui.min.js"></script>
    <script src="vendors/lightbox/simpleLightbox.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="js/gmaps.min.js"></script>
    <script src="js/map-active.js"></script>
    
    <script src="js/theme.js"></script>
</body>
</html>