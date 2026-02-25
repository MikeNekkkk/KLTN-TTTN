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

<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>TRUNG NGUYÊN LEGEND CAFÉ</title>

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
<link href="vendors/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="vendors/nice-select/css/nice-select.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

</head>
<body>

	<!--================Main Header Area =================-->
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

							<li><a href="${pageContext.request.contextPath}/home">Trang
									chủ</a></li>
							<li><a href="${pageContext.request.contextPath}/CakeControl">
									Sản phẩm</a></li>
							<li><a
								href="${pageContext.request.contextPath}/about-us.jsp">Về
									chúng tôi</a></li>
						</ul>
						<ul class="navbar-nav justify-content-end">



							<li><a href="${pageContext.request.contextPath}/blogList">Bài
									Viết</a></li>


							<li class="dropdown submenu active"><a
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
	<section class="banner_area">
		<div class="container">
			<div class="banner_text">
				<h3>Shop</h3>
				<ul>
					<li><a href="home">Home</a></li>
					<li><a href="shop.html">Shop</a></li>
				</ul>
			</div>
		</div>
	</section>
	<!--================End Main Header Area =================-->

	<!--================Product Area =================-->
	<section class="product_area p_100">
		<div class="container">
			<div class="row product_inner_row">
				<div class="col-lg-9">
					<div class="row m0 product_task_bar">
						<div class="product_task_inner">
							<div class="float-left">
								<a class="active" href="#"><i class="fa fa-th-large"
									aria-hidden="true"></i></a> <a href="#"><i
									class="fa fa-th-list" aria-hidden="true"></i></a> <span>Showing
									1 - 10 of 55 results</span>
							</div>
							<div class="float-right">
								<h4>Sort by :</h4>
								<select class="short">
									<option data-display="Default">Default</option>
									<option value="1">Default</option>
									<option value="2">Default</option>
									<option value="4">Default</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row product_item_inner">
						<c:forEach var="p" items="${listP}">
							<div class="col-lg-4 col-md-6 col-12 mb-4">
								<div class="cake_feature_item">
									<div class="cake_img">
										<a href="detail?pid=${p.id}&categoryId=${p.categoryId}"> <img
											src="${pageContext.request.contextPath}/${p.imageUrl}"
											alt="${p.name}" class="img-fluid">
										</a>
									</div>
									<div class="cake_text">
										<h4>${String.format("%,.0f", p.price)}₫</h4>
										<a href="detail?pid=${p.id}&categoryId=${p.categoryId}">
											<h3>${p.name}</h3>
										</a> <a class="pest_btn add-to-cart-btn" href="#"
											data-id="${p.id}">Thêm vào giỏ</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="product_pagination">
						<div class="left_btn">
							<a href="#"><i class="lnr lnr-arrow-left"></i> New posts</a>
						</div>
						<div class="middle_list">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item active"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">...</a></li>
									<li class="page-item"><a class="page-link" href="#">12</a></li>
								</ul>
							</nav>
						</div>
						<div class="right_btn">
							<a href="#">Older posts <i class="lnr lnr-arrow-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="product_left_sidebar">
						<aside class="left_sidebar search_widget">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Enter Search Keywords">
								<div class="input-group-append">
									<button class="btn" type="button">
										<i class="icon icon-Search"></i>
									</button>
								</div>
							</div>
						</aside>
						<aside class="left_sidebar p_catgories_widget">
							<div class="p_w_title">
								<h3>Product Categories</h3>
							</div>
							<ul class="list_style">
								<c:forEach var="category" items="${listC}">
									<li
										class="${category.id == selectedCategoryId ? 'active' : ''}">
										<a href="category?cid=${category.id}"> ${category.name} </a>
									</li>
								</c:forEach>
							</ul>


						</aside>
						<aside class="left_sidebar p_price_widget">
							<div class="p_w_title">
								<h3>Filter By Price</h3>
							</div>
							<div class="filter_price">
								<div id="slider-range"></div>
								<label for="amount">Price range:</label> <input type="text"
									id="amount" readonly /> <a href="#">Filter</a>
							</div>
						</aside>
						<aside class="left_sidebar p_sale_widget">
							<div class="p_w_title">
								<h3>Sản phẩm mới</h3>
							</div>

							<c:forEach var="p4" items="${listP4}">
								<div class="media mb-3">
									<div class="d-flex">
										<img src="${pageContext.request.contextPath}/${p4.imageUrl}"
											alt="${p4.name}" class="img-fluid"
											style="width: 80px; height: 80px; object-fit: cover;">
									</div>
									<div class="media-body pl-3">
										<a href="#"><h4>${p4.name}</h4></a>
										<ul class="list_style">
											<c:forEach begin="1" end="5" var="i">
												<li><a href="#"><i class="fa fa-star-o"></i></a></li>
											</c:forEach>
										</ul>
										<h5>${String.format("%,.0f", p4.price)}₫</h5>
									</div>
								</div>
							</c:forEach>

							<!-- Nếu không có sản phẩm -->
							<c:if test="${empty listP4}">
								<p>Hiện chưa có sản phẩm mới nào.</p>
							</c:if>

						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Area =================-->

	<!--================Newsletter Area =================-->
	<jsp:include page="footer.jsp" />

	<div class="search_area zoom-anim-dialog mfp-hide" id="test-search">
		<div class="search_box_inner"></div>
	</div>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
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
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
	<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="vendors/isotope/isotope.pkgd.min.js"></script>
	<script src="vendors/datetime-picker/js/moment.min.js"></script>
	<script
		src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="js/theme.js"></script>

	<script>
		$(document)
				.ready(
						function() {
							$(document)
									.on(
											'click',
											'.add-to-cart-btn',
											function(e) {
												e.preventDefault();
												e.stopPropagation();

												var $btn = $(this);
												var productId = $btn.data('id');
												var originalText = $btn.text()
														.trim();

												$btn.prop('disabled', true)
														.text('Đang thêm...');

												$
														.ajax({
															url : 'addToCart',
															type : 'GET',
															data : {
																id : productId
															},
															success : function(
																	response) {
																showNotification(
																		'success',
																		'✓ Đã thêm sản phẩm vào giỏ hàng!');

																updateCartCount();
																setTimeout(
																		function() {
																			$btn
																					.prop(
																							'disabled',
																							false)
																					.text(
																							originalText);
																		}, 500);
															},
															error : function(
																	xhr,
																	status,
																	error) {
																showNotification(
																		'error',
																		'✗ Có lỗi xảy ra, vui lòng thử lại!');

																$btn
																		.prop(
																				'disabled',
																				false)
																		.text(
																				originalText);
															}
														});
											});

							$('.product_link')
									.click(
											function(event) {
												if (!$(event.target).closest(
														'.add-to-cart-btn, a').length) {
													var productId = $(this)
															.data('id');
													var categoryId = $(this)
															.data('category-id');
													window.location.href = 'detail?pid='
															+ productId
															+ '&categoryId='
															+ categoryId;

												}
											});

							function showNotification(type, message) {
								$('.cart-notification').remove();

								var bgColor = type === 'success' ? '#4CAF50'
										: '#f44336';

								var notification = $('<div class="cart-notification"></div>');
								notification.html(message);

								notification
										.css({
											'position' : 'fixed',
											'top' : '80px',
											'right' : '20px',
											'background' : bgColor,
											'color' : '#fff',
											'padding' : '15px 25px',
											'border-radius' : '8px',
											'box-shadow' : '0 4px 12px rgba(0,0,0,0.15)',
											'z-index' : '99999',
											'font-weight' : '500',
											'font-size' : '14px',
											'animation' : 'slideInRight 0.4s ease-out',
											'min-width' : '280px'
										});

								$('body').append(notification);

								// Tự động ẩn sau 3 giây
								setTimeout(function() {
									notification.css('animation',
											'slideOutRight 0.4s ease-in');
									setTimeout(function() {
										notification.remove();
									}, 400);
								}, 3000);
							}
							function updateCartCount() {
								$
										.ajax({
											url : 'getCartCount',
											type : 'GET',
											success : function(count) {
												var $cartLink = $('.shop_cart a');

												if (count > 0) {
													$cartLink.attr(
															'data-cart-count',
															count);
												} else {
													$cartLink
															.removeAttr('data-cart-count');
												}
											},
											error : function() {
												console
														.log('Không thể cập nhật số lượng giỏ hàng');
											}
										});
							}
						});
	</script>

	<style>
@
keyframes slideInRight {from { transform:translateX(400px);
	opacity: 0;
}

to {
	transform: translateX(0);
	opacity: 1;
}

}
@
keyframes slideOutRight {from { transform:translateX(0);
	opacity: 1;
}

to {
	transform: translateX(400px);
	opacity: 0;
}

/* ==================== STYLE CHO NÚT THÊM VÀO GIỎ ==================== */
.pest_btn.add-to-cart-btn {
	transition: all 0.3s ease;
}

.pest_btn.add-to-cart-btn:disabled {
	opacity: 0.7;
	cursor: not-allowed;
	background: #ccc !important;
}

/* ==================== STYLE CHO PRODUCT LINK ==================== */
.product_link {
	cursor: pointer;
}

.product_link .cake_img a, .product_link .cake_text>a {
	pointer-events: auto;
}

@media ( max-width : 768px) {
	.cart-notification {
		right: 10px;
		left: 10px;
		min-width: auto;
		font-size: 13px;
		padding: 12px 20px;
	}
}
</style>
	<script>
		(function($) {
			'use strict';

			$(document)
					.ready(
							function() {
								var $searchInput = $('.search_widget input[type="text"]');
								var $searchBtn = $('.search_widget button');
								var $productItems = $('.product_item_inner .col-lg-4');
								var $filterBtn = $('.filter_price a');
								var $resultText = $('.product_task_bar span');
								var $pagination = $('.pagination');
								var $paginationContainer = $('.product_pagination');

								var filteredProducts = [];
								var currentPage = 1;
								var itemsPerPage = 9;

								function initProducts() {
									filteredProducts = $productItems.toArray();
								}

								function formatCurrency(num) {
									return num.toLocaleString('vi-VN') + '₫';
								}

								function initPriceSlider() {
									if ($("#slider-range").length
											&& typeof $.fn.slider !== 'undefined') {
										$("#slider-range")
												.slider(
														{
															range : true,
															min : 10000,
															max : 500000,
															step : 10000,
															values : [ 10000,
																	500000 ],
															slide : function(
																	event, ui) {
																$("#amount")
																		.val(
																				formatCurrency(ui.values[0])
																						+ " - "
																						+ formatCurrency(ui.values[1]));
															}
														});

										$("#amount")
												.val(
														formatCurrency(10000)
																+ " - "
																+ formatCurrency(500000));
									}
								}

								function filterProducts() {
									var searchTerm = $searchInput.val()
											.toLowerCase().trim();
									var minPrice = 10000;
									var maxPrice = 500000;

									if ($("#slider-range").length
											&& typeof $.fn.slider !== 'undefined') {
										try {
											minPrice = $("#slider-range")
													.slider("values", 0);
											maxPrice = $("#slider-range")
													.slider("values", 1);
										} catch (e) {
											console.log('Slider not ready');
										}
									}

									filteredProducts = [];
									$productItems
											.each(function() {
												var $item = $(this);
												var productName = $item.find(
														'.cake_text h3').text()
														.toLowerCase();
												var priceText = $item
														.find('.cake_text h4')
														.text()
														.replace(/[₫,.\s]/g, '');
												var price = parseFloat(priceText);

												// Kiểm tra điều kiện lọc
												var matchName = searchTerm === ''
														|| productName
																.indexOf(searchTerm) !== -1;
												var matchPrice = !isNaN(price)
														&& price >= minPrice
														&& price <= maxPrice;

												if (matchName && matchPrice) {
													filteredProducts.push(this);
												}
											});

									currentPage = 1;
									displayProducts();
									updatePagination();
								}

								function displayProducts() {
									var startIndex = (currentPage - 1)
											* itemsPerPage;
									var endIndex = startIndex + itemsPerPage;

									$productItems.hide();

									for (var i = startIndex; i < endIndex
											&& i < filteredProducts.length; i++) {
										$(filteredProducts[i]).show();
									}

									// Cập nhật text hiển thị
									if ($resultText.length) {
										var showing = Math.min(endIndex,
												filteredProducts.length);
										if (filteredProducts.length > 0) {
											$resultText.text('Showing '
													+ (startIndex + 1) + ' - '
													+ showing + ' of '
													+ filteredProducts.length
													+ ' results');
										} else {
											$resultText
													.text('Showing 0 results');
										}
									}

									if (filteredProducts.length === 0) {
										showNoResultMessage();
									} else {
										removeNoResultMessage();
									}

									$('html, body').animate({
										scrollTop : 0
									}, 300);
								}

								function updatePagination() {
									if (!$pagination.length)
										return;

									var totalPages = Math
											.ceil(filteredProducts.length
													/ itemsPerPage);

									// Xóa pagination cũ
									$pagination.empty();

									if (totalPages <= 1) {
										$paginationContainer.hide();
										return;
									}

									$paginationContainer.show();

									if (currentPage > 1) {
										var $prevLi = $('<li class="page-item"><a class="page-link" href="#">«</a></li>');
										$prevLi.on('click', function(e) {
											e.preventDefault();
											currentPage--;
											displayProducts();
											updatePagination();
										});
										$pagination.append($prevLi);
									}

									// Tính toán trang hiển thị
									var startPage = Math
											.max(1, currentPage - 2);
									var endPage = Math.min(totalPages,
											currentPage + 2);

									if (currentPage <= 3) {
										endPage = Math.min(5, totalPages);
									}

									if (currentPage >= totalPages - 2) {
										startPage = Math.max(1, totalPages - 4);
									}

									// Trang đầu tiên
									if (startPage > 1) {
										addPageButton(1);
										if (startPage > 2) {
											$pagination
													.append('<li class="page-item disabled"><a class="page-link" href="#">...</a></li>');
										}
									}

									// Các trang ở giữa
									for (var i = startPage; i <= endPage; i++) {
										addPageButton(i);
									}

									// Trang cuối cùng
									if (endPage < totalPages) {
										if (endPage < totalPages - 1) {
											$pagination
													.append('<li class="page-item disabled"><a class="page-link" href="#">...</a></li>');
										}
										addPageButton(totalPages);
									}

									// Nút Next
									if (currentPage < totalPages) {
										var $nextLi = $('<li class="page-item"><a class="page-link" href="#">»</a></li>');
										$nextLi.on('click', function(e) {
											e.preventDefault();
											currentPage++;
											displayProducts();
											updatePagination();
										});
										$pagination.append($nextLi);
									}
								}

								// Thêm nút trang
								function addPageButton(pageNum) {
									var activeClass = pageNum === currentPage ? ' active'
											: '';
									var $li = $('<li class="page-item' + activeClass + '"><a class="page-link" href="#">'
											+ pageNum + '</a></li>');

									$li.on('click', function(e) {
										e.preventDefault();
										currentPage = pageNum;
										displayProducts();
										updatePagination();
									});

									$pagination.append($li);
								}

								function showNoResultMessage() {
									removeNoResultMessage();
									var $noResultDiv = $('<div class="no-result-message text-center py-5"><h4>Không tìm thấy sản phẩm nào!</h4><p>Vui lòng thử từ khóa khác hoặc thay đổi khoảng giá.</p></div>');
									$('.product_item_inner').append(
											$noResultDiv);
								}

								function removeNoResultMessage() {
									$('.no-result-message').remove();
								}

								$searchBtn.on('click', function(e) {
									e.preventDefault();
									filterProducts();
								});

								$searchInput.on('keypress', function(e) {
									if (e.which === 13) {
										e.preventDefault();
										filterProducts();
									}
								});

								$searchInput.on('input', function() {
									if ($(this).val().trim() === '') {
										filterProducts();
									}
								});

								if ($filterBtn.length) {
									$filterBtn.on('click', function(e) {
										e.preventDefault();
										filterProducts();
									});
								}

								$('.product_pagination .left_btn a').on(
										'click', function(e) {
											e.preventDefault();
											if (currentPage > 1) {
												currentPage--;
												displayProducts();
												updatePagination();
											}
										});

								// Nút Older posts (Next page)
								$('.product_pagination .right_btn a')
										.on(
												'click',
												function(e) {
													e.preventDefault();
													var totalPages = Math
															.ceil(filteredProducts.length
																	/ itemsPerPage);
													if (currentPage < totalPages) {
														currentPage++;
														displayProducts();
														updatePagination();
													}
												});

								initProducts();
								initPriceSlider();
								displayProducts();
								updatePagination();

								console.log('Shop script initialized');
								console.log('Total products:',
										$productItems.length);
							});

		})(jQuery);
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

	<style>

#slider-range {
	margin: 15px 0;
	background: #e0e0e0;
}

#amount {
	border: none;
	font-weight: bold;
	color: #333;
	background: transparent;
	padding: 5px 0;
	width: 100%;
}

.ui-slider-horizontal {
	height: 8px;
	background: #e0e0e0;
	border: none;
	border-radius: 4px;
}

.ui-slider-horizontal .ui-slider-range {
	background: #f195b2;
	border-radius: 4px;
}

.ui-slider-horizontal .ui-slider-handle {
	top: -5px;
	width: 18px;
	height: 18px;
	background: #f195b2;
	border: 2px solid #fff;
	border-radius: 50%;
	cursor: pointer;
	outline: none;
}

.ui-slider-horizontal .ui-slider-handle:hover {
	background: #e67a9a;
}

.filter_price a {
	display: inline-block;
	margin-top: 10px;
	padding: 8px 20px;
	background: #f195b2;
	color: #fff !important;
	text-decoration: none;
	border-radius: 3px;
	transition: all 0.3s;
}

.filter_price a:hover {
	background: #e67a9a;
}

.no-result-message {
	grid-column: 1/-1;
	width: 100%;
}

.no-result-message h4 {
	color: #333;
	margin-bottom: 10px;
}

.no-result-message p {
	color: #666;
}
</style>
</body>
</html>