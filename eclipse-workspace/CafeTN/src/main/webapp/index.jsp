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
<title>NÕN CAFÉ</title>

<!-- Đặt TẤT CẢ CSS Ở ĐÂY -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/linearicons/style.css" rel="stylesheet">
<link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="vendors/revolution/css/settings.css" rel="stylesheet">
<link href="vendors/revolution/css/layers.css" rel="stylesheet">
<link href="vendors/revolution/css/navigation.css" rel="stylesheet">
<link href="vendors/animate-css/animate.css" rel="stylesheet">

<link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="vendors/magnifc-popup/magnific-popup.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="header.jsp" />

	<section class="main_slider_area">
		<div id="main_slider" class="rev_slider" data-version="5.3.1.6">
			<ul>
				<li data-index="rs-1587" data-transition="fade"
					data-slotamount="default" data-hideafterloop="0"
					data-hideslideonmobile="off" data-easein="default"
					data-easeout="default" data-masterspeed="300"
					data-thumb="img/home-slider/trang.jpg" data-rotate="0"
					data-saveperformance="off" data-title="Creative" data-param1="01"
					data-param2="" data-param3="" data-param4="" data-param5=""
					data-param6="" data-param7="" data-param8="" data-param9=""
					data-param10="" data-description=""><img
					src="img/home-slider/trang.jpg" alt=""
					data-bgposition="center center" data-bgfit="cover"
					data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg"
					data-no-retina></li>
				<li data-index="rs-1588" data-transition="fade"
					data-slotamount="default" data-hideafterloop="0"
					data-hideslideonmobile="off" data-easein="default"
					data-easeout="default" data-masterspeed="300"
					data-thumb="img/home-slider/xamtragnnhiu.jpg" data-rotate="0"
					data-saveperformance="off" data-title="Creative" data-param1="01"
					data-param2="" data-param3="" data-param4="" data-param5=""
					data-param6="" data-param7="" data-param8="" data-param9=""
					data-param10="" data-description=""><img
					src="img/home-slider/xamtragnnhiu.jpg" alt=""
					data-bgposition="center center" data-bgfit="cover"
					data-bgrepeat="no-repeat" data-bgparallax="5" class="rev-slidebg"
					data-no-retina></li>
			</ul>
		</div>
	</section>
	<section class="welcome_bakery_area">
		<div class="container">
			<div class="welcome_bakery_inner p_100">
				<div class="row">
					<div class="col-lg-6">
						<div class="main_title">
							<h2>NÕN CAFÉ</h2>
							<p>Không gian Trung Nguyên Legend là điểm hẹn văn hóa của
								những người yêu và đam mê cà phê.</p>
						</div>
						<div class="welcome_left_text">
							<p>Đến với Trung Nguyên Legend Café, bạn được thưởng thức
								những ly cà phê năng lượng tuyệt hảo bên những cuốn sách nền
								tảng đổi đời được chọn lọc từ tinh hoa tri thức nhân loại. Cùng
								với năng lượng thực dưỡng từ ổ bánh mì ngon nhất thế gian đem
								đến nguồn năng lượng hài hòa, giúp thanh lọc và cân bằng cơ thể.</p>
							<a class="pink_btn" href="about-us.jsp">Know more about us</a>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="welcome_img">
							<img class="img-fluid" src="img/banner/bannerquaycafe.jpg" alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="cake_feature_inner">
				<div class="main_title">
					<h2>Khám Phá Thế Giới Cà Phê</h2>
					<h5>Tuyển Chọn Sản Phẩm Độc Đáo</h5>
				</div>

				<div class="cake_feature_slider owl-carousel">
					<c:forEach var="p" items="${listP}">
						<div class="item product_link" data-id="${p.id}"
							data-category="${p.categoryId}">
							<div class="cake_feature_item">
								<div class="cake_img">
									<a href="detail?pid=${p.id}&categoryId=${p.categoryId}"> <img
										src="${pageContext.request.contextPath}/${p.imageUrl}"
										alt="${p.name}">
									</a>
								</div>
								<div class="cake_text">
									<h4>${String.format("%,.0f", p.price)}₫</h4>
									<a href="detail?pid=${p.id}&categoryId=${p.categoryId}">
										<h3>${p.name}</h3>
									</a> <a class="pest_btn add-to-cart-btn" href="#" data-id="${p.id}">Thêm
										vào giỏ</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<section class="special_recipe_area">
		<div class="container">
			<div class="special_recipe_slider owl-carousel">
				<div class="item">
					<div class="media">
						<div class="d-flex">
							<img src="img/recipe/recipe-1.png" alt="">
						</div>
						<div class="media-body">
							<h4>CÀ PHÊ PHIN GIẤY SƠRI CAM SẢ</h4>
							<p>Sơ Ri – loại trái cây nhiệt đới có hàm lượng Vitamin C cao
								gấp hơn 20 lần quả chanh, cùng với nhiều dưỡng chất giúp tăng
								cường hệ miễn dịch, làm đẹp và chống lão hóa.</p>
							<a class="w_view_btn" href="#">Xem chi tiết</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="media">
						<div class="d-flex">
							<img src="img/recipe/recipe-2.png" alt="">
						</div>
						<div class="media-body">
							<h4>CÀ PHÊ DỪA</h4>
							<p>
								Là sự kết hợp tuyệt hảo giữa hương vị của <Strong>cà
									phê pha phin hảo hạng</Strong>> đậm chất truyền thống cùng sự béo bùi
								của Nước Cốt Dừa, hòa quyện với hương Lá Nếp nồng ấm.
							</p>
							<a class="w_view_btn" href="special.jsp">Xem chi tiết</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="media">
						<div class="d-flex">
							<img src="img/recipe/recipe-3.png" alt="">
						</div>
						<div class="media-body">
							<h4>Cà phê Năng Lượng Legend Passiona với khổ qua</h4>
							<p>Cà Phê Legend Passiona – cà phê dành riêng cho phái đẹp –
								được sáng tạo từ những hạt Robusta thơm ngon nhất.</p>
							<a class="w_view_btn" href="special2.jsp">Xem chi tiết</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<section class="">
		<div style="position: relative; width: 100%; padding-bottom: 40%;">
			<img src="img/menu9.png" alt=""
				style="position: absolute; width: 90%; left: 74px; top: 21px; height: 90%; object-fit: cover; margin: 0px 0;">
		</div>


	</section>
	<section class="">
		<div class="container">

			<span
				style="font-size: 180%; font-family: 'Times New Roman', Times, serif; font-weight: 900; display: block; text-align: center; margin: 35px 0; color: black;">
				SHOW TRẢI NGHIỆM 3 NỀN VĂN MINH CÀ PHÊ </span>
			<p>Với mong muốn đưa ngành cà phê Việt Nam lên một tầm cao mới,
				nâng cao giá trị cà phê không chỉ là một thức uống thông thường mà
				còn ở tầm mức cà phê văn hóa, cà phê nghệ thuật, cà phê tinh thần…
				đến cà phê triết đạo, xứng đáng với vị thế của cường quốc cà phê của
				thế giới.</p>
			<p>Tập đoàn Trung Nguyên Legend đã dành thời gian và tâm huyết
				trong nhiều năm để nghiên cứu lịch sử, văn hóa, nghệ thuật… cà phê
				trong mọi lĩnh vực đời sống của nhân loại để cà phê trở thành “Cà
				Phê Triết Đạo” và cho ra mắt show thưởng lãm cà phê kết hợp công
				nghệ, nghệ thuật trình diễn đặc biệt theo 3 Nền Văn Minh Cà Phê duy
				nhất tại không gian Trung Nguyên Legend Café.</p>
			<p>Lần đầu tiên trên thế giới, 3 nền văn minh cà phê điển hình,
				đặc biệt nhất được hội tụ!</p>
			<br>
			<div class="row latest_news_inner">
				<div class="col-lg-4 col-md-6">
					<div class="l_news_item">
						<div class="l_news_img">
							<img class="img-fluid" src="img/blog/main-blog/id1.jpg" alt="">
						</div>
						<div class="l_news_text">
							<a href="#"><h5>Oct 15, 2016</h5></a>
							<h4>OTTOMAN</h4>

						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="l_news_item">
						<div class="l_news_img">
							<img class="img-fluid" src="img/blog/main-blog/id2.jpg" alt="">
						</div>
						<div class="l_news_text">
							<a href="#"><h5>Oct 15, 2016</h5></a>
							<h4>THIỀN</h4>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="l_news_item">
						<div class="l_news_img">
							<img class="img-fluid" src="img/blog/main-blog/id3.jpg" alt="">
						</div>
						<div class="l_news_text">
							<a href="#"><h5>Oct 15, 2016</h5></a>
							<h4>ROMAN</h4>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<section class="latest_news_area p_100">
		<div class="container">
			<div class="main_title">
				<h2>Tin nổi bật</h2>

			</div>
			<div class="row latest_news_inner">
				<div class="col-lg-4 col-md-6">
					<div class="l_news_item">
						<div class="l_news_img">
							<img class="img-fluid" src="img/blog/latest-news/l-news-1.jpg"
								alt="">
						</div>
						<div class="l_news_text">
							<a href="/blogDetail?id=4"><h5>Oct 15, 2016</h5></a> <a
								href="blogDetail?id=4"><h4>RA MẮT HỘP QUÀ CÀ PHÊ NĂNG
									LƯỢNG YÊU THƯƠNG</h4></a>
							<p>Trung Nguyên Legend Café ra mắt Hộp quà cà phê Năng Lượng
								Yêu Thương – món quà tinh tế và ý nghĩa...</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="l_news_item">
						<div class="l_news_img">
							<img class="img-fluid" src="img/blog/latest-news/l-news-2.jpg"
								alt="">
						</div>
						<div class="l_news_text">
							<a href="#"><h5>Oct 15, 2016</h5></a> <a href="blogDetail?id=5"><h4>GỢI
									Ý QUÀ TINH TẾ – TRAO LỜI TRI ÂN ĐẾN “NGƯỜI THẦY ĐẦU TIÊN</h4></a>
							<p>Ngày 20/11 – dịp để mỗi người nhớ về những người thầy cô
								đáng kính và “Người thầy đầu tiên” trong cuộc đời ....</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="l_news_item">
						<div class="l_news_img">
							<img class="img-fluid" src="img/blog/latest-news/l-news-3.jpg"
								alt="">
						</div>
						<div class="l_news_text">
							<a href="#"><h5>Oct 15, 2016</h5></a> <a href="blogDetail?id=6"><h4>THẾ
									GIỚI CÀ PHÊ TRUNG NGUYÊN LEGEND 164 PASTEUR – ĐIỂM HẸN CÀ PHÊ &
									CẢM HỨNG MỚI GIỮA TRUNG TÂM SÀI GÒN</h4></a>
							<p>Thế Giới Cà Phê Trung Nguyên Legend 164 Pasteur chính thức
								hiện diện tại trái tim Sài Gòn – khu vực hành chính, ...</p>
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
					<button class="btn btn-default" type="button">
						<i class="icon icon-Search"></i>
					</button>
				</span>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.2.1.min.js"></script>

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
																		'x Có lỗi xảy ra, vui lòng thử lại!');
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
															.data('category');

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
								notification.text(message);
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

}
.cart-notification {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Arial, sans-serif;
}

.cart-notification .notif-icon {
	font-size: 20px;
	font-weight: bold;
}

.pest_btn.add-to-cart-btn {
	transition: all 0.3s ease;
}

.pest_btn.add-to-cart-btn:disabled {
	opacity: 0.7;
	cursor: not-allowed;
	background: #ccc !important;
}

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
	<footer class="footer_area">
	</footer>

	<div class="search_area zoom-anim-dialog mfp-hide" id="test-search">
	</div>

	<%@ include file="chatbot-widget.jsp"%>
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
	<script src="vendors/datetime-picker/js/moment.min.js"></script>
	<script
		src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>

	<script src="js/theme.js"></script>

</body>

</html>