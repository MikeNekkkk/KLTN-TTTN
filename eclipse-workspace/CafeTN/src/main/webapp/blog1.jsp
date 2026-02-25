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
<title>${blog.title}- TRUNG NGUYÊN LEGEND CAFÉ</title>

<link rel="icon"
	href="${pageContext.request.contextPath}/img/fav-icon.png"
	type="image/x-icon" />
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/linearicons/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive.css"
	rel="stylesheet">

<style>
/* Style cho nội dung blog */
.blog-content {
	font-size: 16px;
	line-height: 1.8;
	color: #333;
	overflow-x: hidden;
}

.blog-content img {
	max-width: 100% !important;
	width: auto !important;
	height: auto !important;
	display: block;
	margin: 20px auto;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* Đảm bảo tất cả elements không tràn */
.blog-content * {
	max-width: 100%;
	word-wrap: break-word;
}

.blog-content h1, .blog-content h2, .blog-content h3 {
	margin-top: 30px;
	margin-bottom: 15px;
	color: #2c3e50;
	font-weight: 600;
}

.blog-content h1 {
	font-size: 32px;
}

.blog-content h2 {
	font-size: 28px;
}

.blog-content h3 {
	font-size: 24px;
}

.blog-content p {
	margin-bottom: 15px;
	text-align: justify;
}

.blog-content ul, .blog-content ol {
	margin: 15px 0;
	padding-left: 30px;
}

.blog-content li {
	margin-bottom: 8px;
}

.blog-content blockquote {
	border-left: 4px solid #ff4081;
	padding: 15px 20px;
	margin: 20px 0;
	background: #f9f9f9;
	font-style: italic;
}

.blog-content code {
	background: #f4f4f4;
	padding: 2px 6px;
	border-radius: 3px;
	font-family: 'Courier New', monospace;
}

.blog-content pre {
	background: #f4f4f4;
	padding: 15px;
	border-radius: 5px;
	overflow-x: auto;
}

.blog-content a {
	color: #ff4081;
	text-decoration: underline;
}

.blog-content a:hover {
	color: #e91e63;
}

.blog-header-image {
	width: 100%;
	height: 400px;
	object-fit: cover;
	border-radius: 10px;
	margin-bottom: 30px;
}

.blog-meta {
	display: flex;
	align-items: center;
	gap: 20px;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 2px solid #f0f0f0;
}

.blog-meta-item {
	display: flex;
	align-items: center;
	gap: 8px;
	color: #666;
}

.blog-meta-item i {
	color: #ff4081;
}

.blog-title {
	font-size: 36px;
	font-weight: 700;
	color: #2c3e50;
	margin-bottom: 20px;
	line-height: 1.3;
}

.blog-excerpt {
	font-size: 18px;
	color: #555;
	font-style: italic;
	margin-bottom: 30px;
	padding: 15px;
	background: #f8f9fa;
	border-left: 4px solid #ff4081;
	border-radius: 4px;
}

<
style> /* User Menu Styles */ .user-menu {
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

					<li><a class="popup-with-zoom-anim" href="#test-search"> <i
							class="fa fa-search"></i>
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
					<img src="${pageContext.request.contextPath}/img/logo-2.png" alt="">
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
						<li><a href="${pageContext.request.contextPath}/CakeControl">
								Sản phẩm</a></li>
						<li><a href="${pageContext.request.contextPath}/about-us.jsp">Về
								chúng tôi</a></li>
					</ul>
					<ul class="navbar-nav justify-content-end">



						<li class="dropdown submenu active"><a
							href="${pageContext.request.contextPath}/blogList">Bài Viết</a></li>


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

<!-- Banner -->
<section class="banner_area">
	<div class="container">
		<div class="banner_text">
			<h3>Blog Detail</h3>
			<ul>
				<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/blogList">Blog</a></li>
				<li><a href="#">Detail</a></li>
			</ul>
		</div>
	</div>
</section>

<!-- Blog Detail Content -->
<section class="main_blog_area p_100">
	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<div class="blog_details_area">
					<!-- Ảnh bìa -->
					<c:if test="${not empty blog.thumbnailUrl}">
						<img src="${pageContext.request.contextPath}/${blog.thumbnailUrl}"
							alt="${blog.title}" class="blog-header-image">
					</c:if>

					<!-- Tiêu đề -->
					<h1 class="blog-title">${blog.title}</h1>

					<!-- Meta info -->
					<div class="blog-meta">
						<div class="blog-meta-item">
							<i class="fa fa-user"></i> <span>Bởi: <strong>${blog.authorName}</strong></span>
						</div>
						<div class="blog-meta-item">
							<i class="fa fa-calendar"></i> <span>${blog.publishedAt}</span>
						</div>
						<c:if test="${not empty blog.category}">
							<div class="blog-meta-item">
								<i class="fa fa-folder"></i> <span>${blog.category}</span>
							</div>
						</c:if>
					</div>

					<!-- Tóm tắt -->
					<c:if test="${not empty blog.excerpt}">
						<div class="blog-excerpt">${blog.excerpt}</div>
					</c:if>

					<!-- Nội dung chính - hiển thị HTML với ảnh cố định -->
					<div class="blog-content">${blog.content}</div>

					<!-- Share buttons -->
					<div class="blog_share mt-5">
						<h5>Chia sẻ bài viết:</h5>
						<ul class="list_style">
							<li><a
								href="https://www.facebook.com/sharer.php?u=${pageContext.request.requestURL}"
								target="_blank"> <i class="fa fa-facebook"></i>
							</a></li>
							<li><a
								href="https://twitter.com/share?url=${pageContext.request.requestURL}&text=${blog.title}"
								target="_blank"> <i class="fa fa-twitter"></i>
							</a></li>
							<li><a
								href="mailto:?subject=${blog.title}&body=${pageContext.request.requestURL}">
									<i class="fa fa-envelope"></i>
							</a></li>
						</ul>
					</div>

					<!-- Back button -->
					<div class="mt-4">
						<a href="${pageContext.request.contextPath}/blogList"
							class="btn btn-secondary"> <i class="fa fa-arrow-left"></i>
							Quay lại danh sách
						</a>
					</div>
				</div>
			</div>

			<!-- Sidebar -->
		<!-- 	<div class="col-lg-3">
				<div class="right_sidebar_area">
					Categories
					<aside class="r_widget categories_widget">
						<div class="r_title">
							<h3>Danh mục</h3>
						</div>
						<ul class="list_style">
							<li><a href="#">Công thức <i class="fa fa-angle-right"></i></a></li>
							<li><a href="#">Quảng cáo <i class="fa fa-angle-right"></i></a></li>
							<li><a href="#">Chương trình <i
									class="fa fa-angle-right"></i></a></li>
							<li><a href="#">Tin tức <i class="fa fa-angle-right"></i></a></li>
						</ul>
					</aside>

					Tags
					<aside class="r_widget tags_widget">
						<div class="r_title">
							<h3>Tags</h3>
						</div>
						<ul class="list_style">
							<li><a href="#">Coffee</a></li>
							<li><a href="#">Trung Nguyên</a></li>
							<li><a href="#">Legend</a></li>
							<li><a href="#">Cà phê</a></li>
						</ul>
					</aside>
				</div>
			</div> -->
		</div>
	</div>
</section>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/theme.js"></script>
</body>
</html>