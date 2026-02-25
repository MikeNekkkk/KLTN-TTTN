<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="icon" href="img/logonhetrang.png" type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Cake - Bakery</title>

<!-- Icon css link -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/linearicons/style.css" rel="stylesheet">
<link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
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

	<!--================Main Header Area =================-->
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
								<%-- <a href="${pageContext.request.contextPath}/register" class="btn-register">
								<i class="fa fa-user-plus"></i> Đăng ký
							</a> --%>
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

							<li><a href="${pageContext.request.contextPath}/home">Trang
									chủ</a></li>
							<li><a
								href="${pageContext.request.contextPath}/CakeControl"> Sản
									phẩm</a></li>
							<li class="dropdown submenu active"><a
								href="${pageContext.request.contextPath}/about-us.jsp">Về
									chúng tôi</a></li>
						</ul>
						<ul class="navbar-nav justify-content-end">



							<li><a href="${pageContext.request.contextPath}/blogList">Bài
									Viết</a></li>


							<li><a
								href="${pageContext.request.contextPath}/ProductCategories">Mua
									Sắm</a></li>

							<li><a href="${pageContext.request.contextPath}/contact.jsp">Contact
									Us</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<!--================End Main Header Area =================-->

	<!--================End Main Header Area =================-->
	<section class="banner_area">
		<div class="container">
			<div class="banner_text">
				<h3>Về Chúng Tôi</h3>
				<ul>
					<li><a href="/home">Trang Chủ</a></li>
					<li><a href="/about-us.jsp"">Về Chúng Tôi</a></li>
				</ul>
			</div>
		</div>
	</section>
	<!--================End Main Header Area =================-->

	<!--================Our Bakery Area =================-->
	<section class="our_bakery_area p_100">
		<div class="container">
			<div class="our_bakery_text">
				<h2>TRUNG NGUYÊN LEGEND CAFÉ</h2>
				<h6>TẦM NHÌN - SỨ MỆNH - GIÁ TRỊ CỐT LÕI.</h6>
				<img src="img/our-bakery/sumenh.jpg" alt="Ảnh minh họa"
					class="center-image">

				<p style="text-align: left;">
					<br>
					<br>Chính thức ra mắt vào năm 2015, đánh dấu hành trình 20 năm
					phụng sự và công bố tầm nhìn – mục tiêu – sứ mạng của Tập Đoàn
					Trung Nguyên Legend – Tập đoàn cà phê số 1 Việt Nam.<br> <br>Với
					hệ sản phẩm cà phê tuyệt ngon tuyệt hảo được chọn lọc khắt khe nhất
					được phục vụ tại không gian chuyên biệt để thưởng lãm cà phê cùng
					các hoạt động sinh hoạt văn hóa nghệ thuật như Cà phê Thứ Bảy, cà
					phê sách… Không gian <strong>Trung Nguyên Legend</strong> đã tạo
					dựng nét văn hóa đặc biệt và duy nhất trong việc thưởng thức cà
					phê, trở thành điểm đến lý tưởng dành cho giới tri thức.<br>
					<br> Gắn liền với giá trị văn hóa, <strong>Trung
						Nguyên Legend Café</strong> với Làng cà phê Buôn Ma Thuột là nơi duy nhất
					được chọn để tổ chức và tiếp đón những đoàn khách của giới tinh hoa
					Quốc tế như: các đoàn Đại sứ ngoại giao, Hoa hậu, người đẹp, các
					cuộc phỏng vấn của các nhân vật nổi tiếng… cũng như hàng trăm đoàn
					sinh viên quốc tế, du lịch đến đây khám phá văn hóa thưởng thức cà
					phê Việt Nam.
				</p>
			</div>
			<!-- <div class="row our_bakery_image">
				<div class="col-md-4 col-6">
					<img class="img-fluid" src="img/our-bakery/bakery-1.jpg" alt="">
				</div>
				<div class="col-md-4 col-6">
					<img class="img-fluid" src="img/our-bakery/bakery-2.jpg" alt="">
				</div>
				<div class="col-md-4 col-6">
					<img class="img-fluid" src="img/our-bakery/bakery-3.jpg" alt="">
				</div>
			</div> -->
		</div>
	</section>
	<!--================End Our Bakery Area =================-->

	<!--================Bakery Video Area =================-->
	<section class="bakery_video_area">
		<div class="container">
			<div class="video_inner">
				<h3>
					🌱 Hương vị cà phê Việt🌱 <br> Hành trình từ nông trại<br>
					đến tách cà phê
				</h3>
				<p>Video này mang đến cái nhìn chân thực và sâu sắc về văn hóa
					cà phê Việt Nam thông qua hành trình khám phá Trung Nguyên Legend –
					thương hiệu cà phê biểu tượng của người Việt.</p>
				<div class="media">
					<div class="d-flex">
						<a class="popup-youtube"
							href="https://www.youtube.com/watch?v=G-iWF5HBh5s"><i
							class="flaticon-play-button"></i></a>
					</div>
					<div class="media-body">
						<h5>
							Xem video giới thiệu <br>về chúng tôi
						</h5>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Bakery Video Area =================-->

	<!--================Our Mission Area =================-->
	<section class="our_mission_area p_100">
		<div class="container">
			<div class="our_mission_inner">
				<div class="single_m_title" style="text-align: center;">
					<h2>Lịch sử phát triển Tập Đoàn Trung Nguyên Legend</h2>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="mission_inner_text"
					style="margin-left: 153px; width: 842px;">

					<br>
					<br>
					<strong>1998</strong>: Thành lập quán cà phê đầu tiên tại Thành phố
					Hồ Chí Minh, khởi đầu hệ thống quán Trung Nguyên tại các tỉnh
					thành. <br>
					<br>
					<strong>2001</strong>: Nhượng quyền thành công tại Nhật Bản,
					Singapore. Công bố khẩu hiệu: “Khơi nguồn Sáng tạo”. <br>
					<br>
					<strong>2003</strong>: Sản phẩm cà phê hòa tan G7 ra đời bằng sự
					kiện “Ngày hội cà phê hòa tan G7” tại dinh Thống Nhất. Kết quả có
					89% người chọn G7 là sản phẩm ưa thích nhất. <br>
					<br>
					<strong>2010</strong>: Sản phẩm cà phê Trung Nguyên xuất khẩu đến
					hơn 60 quốc gia và vùng lãnh thổ trên toàn cầu. <br>
					<br>
					<strong>2012</strong>: Thương hiệu cà phê được người tiêu dùng Việt
					Nam yêu thích nhất. Phát động Hành trình Lập Chí Vĩ Đại – Khởi
					Nghiệp Kiến Quốc với Ngày hội Sáng tạo Vì khát vọng Việt thu hút
					hơn 50.000 người tham gia. <br>
					<br>
					<strong>2013</strong>: G7 kỉ niệm 10 năm ra đời, đánh dấu mốc 3 năm
					dẫn đầu thị phần và được yêu thích nhất. <br>
					<br>
					<strong>2016</strong>: Kỷ niệm 20 năm thành lập, ra mắt không gian
					Trung Nguyên Legend Café The Energy Coffee That Changes Life. Trao
					tặng 2 triệu cuốn sách đổi đời trong Hành trình Lập Chí Vĩ Đại –
					Khởi Nghiệp Kiến Quốc cho Thanh niên Việt. <br>
					<br>
					<strong>2017</strong>: <br>- Trung Nguyên Legend chính thức
					khai trương văn phòng đại diện tại Thượng Hải (Trung Quốc). <br>-
					Ra mắt Mô hình E – Coffee <br>
					<strong>2018</strong>: <br>- Khánh thành Bảo tàng Thế giới Cà
					phê tại Buôn Ma Thuột. <br>- Ra mắt Thương hiệu Trung Nguyên
					Legend và Hệ sản phẩm Khác biệt – Đặc biệt – Duy nhất mới – Thế hệ
					cà phê mới Trung Nguyên Legend. <br>
					<br>
					<strong>2019</strong>: Khởi động Hành trình Từ Trái Tim, Hành trình
					Lập Chí Vĩ Đại – Khởi Nghiệp Kiến Quốc. <br>
					<br>
					<strong>2020</strong>: Ra mắt Show trình diễn nghệ thuật pha chế
					theo 3 Nền Văn Minh Cà phê: Ottoman – Roman – Thiền kết hợp công
					nghệ 3D Mapping. <br>
					<br>
					<strong>2021</strong>: <br>- Kỷ niệm 25 năm thành lập Tập đoàn
					1996 – 2021. <br>- Khánh thành nhà mẫu Tesla, Cantata, các tổ
					hợp tiện ích thuộc khu đô thị Thành phố Cà phê. <br>
					<strong>2022</strong>: <br>- Ra mắt Thế giới Cà phê Trung
					Nguyên Legend tại Việt Nam và Trung Quốc. <br>- Công bố Hành
					trình Trải nghiệm Lối sống Tỉnh thức. <br>- Tạp chí Forbes
					vinh danh Trung Nguyên Legend là “Thương hiệu Tỉnh thức”. <br>-
					Ra mắt vở vũ kịch đầu tiên trên thế giới mang tên “Chuyện kể 3 Nền
					Văn minh Cà phê”. <br>
					<br>
					<strong>2023</strong>: <br>- Khai trương Văn phòng Đại diện
					tại Hàn Quốc. <br>- Đồng hành cùng xây dựng Thành phố Buôn Ma
					Thuột trở thành Thành phố Cà phê của thế giới. <br>- Ra mắt tổ
					hợp khách sạn “La Forêt en ville” và trung tâm hội nghị “The world
					coffee center”, động thổ xây dựng khu trường học “Loving” và
					“Happy” tại khu đô thị Thành phố Cà phê. <br>- Kỷ niệm 20 năm
					thương hiệu G7 chinh phục toàn cầu.
					</h6>
					<br>

				</div>
			</div>
		</div>
	</section>

	<!--================Footer Area =================-->
	<jsp:include page="footer.jsp" />

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Rev slider js -->
	<script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script
		src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script
		src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script
		src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script
		src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<!-- Extra plugin js -->
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
	<script src="vendors/datetime-picker/js/moment.min.js"></script>
	<script
		src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>

	<script src="js/theme.js"></script>
	
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