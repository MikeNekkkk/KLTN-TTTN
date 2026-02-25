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
<title>Cake - Bakery</title>

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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>

	<!--================Main Header Area =================-->
	<header class="main_header_area">
		<div class="top_header_area row m0">
			<div class="container">
				<div class="float-left">
					<a href="tell:+18004567890"><i class="fa fa-phone"
						aria-hidden="true"></i> + (1800) 456 7890</a> <a
						href="mainto:info@cakebakery.com"><i class="fa fa-envelope-o"
						aria-hidden="true"></i> info@cakebakery.com</a>
				</div>
				<div class="float-right">
					<ul class="h_social list_style">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					</ul>
					<ul class="h_search list_style">
						<li class="shop_cart"><a href="#"><i class="lnr lnr-cart"></i></a></li>
						<li><a class="popup-with-zoom-anim" href="#test-search"><i
								class="fa fa-search"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_menu_area">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="index.html"> <img
						src="img/logo.png" alt=""> <img src="img/logo-2.png" alt="">
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
							<li class="dropdown submenu"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false">Home</a>
								<ul class="dropdown-menu">
									<li><a href="index.html">Home 1</a></li>
									<li><a href="index-2.html">Home 2</a></li>
									<li><a href="index-3.html">Home 3</a></li>
									<li><a href="index-4.html">Home 4</a></li>
									<li><a href="index-5.html">Home 5</a></li>
								</ul></li>
							<li><a href="cake.html">Our Cakes</a></li>
							<li><a href="menu.html">Menu</a></li>
							<li class="dropdown submenu"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false">About Us</a>
								<ul class="dropdown-menu">
									<li><a href="about-us.html">About Us</a></li>
									<li><a href="our-team.html">Our Chefs</a></li>
									<li><a href="testimonials.html">Testimonials</a></li>
								</ul></li>
						</ul>
						<ul class="navbar-nav justify-content-end">
							<li class="dropdown submenu active"><a
								class="dropdown-toggle" data-toggle="dropdown" href="#"
								role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
								<ul class="dropdown-menu">
									<li><a href="service.html">Services</a></li>
									<li class="dropdown submenu"><a class="dropdown-toggle"
										data-toggle="dropdown" href="#" role="button"
										aria-haspopup="true" aria-expanded="false">Gallery</a>
										<ul class="dropdown-menu">
											<li><a href="portfolio.html">- Gallery Classic</a></li>
											<li><a href="portfolio-full-width.html">- Gallery
													Full width</a></li>
										</ul></li>
									<li><a href="faq.html">Faq</a></li>
									<li><a href="what-we-make.html">What we make</a></li>
									<li><a href="special.html">Special Recipe</a></li>
									<li><a href="404.html">404 page</a></li>
									<li><a href="comming-soon.html">Coming Soon page</a></li>
								</ul></li>
							<li class="dropdown submenu"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false">Blog</a>
								<ul class="dropdown-menu">
									<li><a href="blog.html">Blog with sidebar</a></li>
									<li><a href="blog-2column.html">Blog 2 column</a></li>
									<li><a href="single-blog.html">Blog details</a></li>
								</ul></li>
							<li class="dropdown submenu"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
									<li><a href="shop.html">Main shop</a></li>
									<li><a href="product-details.html">Product Details</a></li>
									<li><a href="cart.html">Cart Page</a></li>
									<li><a href="checkout.html">Checkout Page</a></li>
								</ul></li>
							<li><a href="contact.html">Contact Us</a></li>
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
				<h3>Special</h3>
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="special.html">Special</a></li>
				</ul>
			</div>
		</div>
	</section>
	<!--================End Main Header Area =================-->

	<!--================Special Area =================-->
	<section class="special_area p_100">
		<div class="container">
			<div class="" style= "padding-botton: opx">
				<h2>Hướng Dẫn Pha Chế CÀ PHÊ DỪA</h2>
				<h5>
					<br>Cà Phê Dừa không chỉ mang đến bạn nguồn năng lượng sáng tạo dồi dào mà còn cung cấp thêm nhiều dưỡng chất tốt cho sức khỏe, hỗ trợ làm đẹp cho mái tóc và làn da.

				</h5>
			</div>
			<div class="special_item_inner">
				<div class="specail_item">
					<div class="row">
						<div class="col-lg-4">
							<div class="s_left_img">
								<img class="" style="position: relative; width: 65%; padding-bottom: 0%;left: 76px; " src="img/recipe/recipe-2.png" alt="">
							</div>
						</div>
						<div class="col-lg-8">
							<div class="special_item_text">
								<h4>CÀ PHÊ DỪA</h4>
								<p>Là sự kết hợp tuyệt hảo giữa hương vị của cà phê pha phin hảo hạng đậm chất truyền thống cùng sự béo bùi của Nước Cốt Dừa, hòa quyện với hương Lá Nếp nồng ấm.</p>
								<!-- <a class="pink_btn" href="#">Purchase now</a> -->
							</div>
						</div>
					</div>
				</div>
				<div class="specail_item">
					<div class="row">
						<div class="col-lg-6">
							<div class="s_item_left">
								<div class="main_title">
									<h2>Các nguyên liệu cần chuẩn bị:</h2>
								</div>
								<ul class="list_style">
									<li><a href="#">Cà Phê Sáng Tạo hoặc Chế Phin (lượng vừa phải theo sở thích)</a></li>
									<li><a href="#">50ml nước cốt dừa</a></li>
									<li><a href="#">40ml sữa đặc có đường Brothers</a></li>
									<li><a href="#">20ml kem béo Rich</a></li>
									<li><a href="#">10ml syrup lá nếp (lá dứa)</a></li>
									<li><a href="#">1 ít dừa sấy khô</a></li>
									<li><a href="#">Nước sôi và đá viên</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="s_right_img">
								<img class="img-fluid" src="img/special/special-2.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Special Area =================-->

	<!--================Our Bakery Area =================-->
	<section class="our_bakery_area making_area">
		<div class="container">
			<div class="main_title">
				<h2>Hãy cùng xem video hướng dẫn và thử ngay bạn nhé!

</h2>

			</div>
			<!-- <div class="row our_bakery_image">
        			<div class="col-lg-4 col-6">
        				<img class="img-fluid" src="img/our-bakery/bakery-1.jpg" alt="">
        			</div>
        			<div class="col-lg-4 col-6">
        				<img class="img-fluid" src="img/our-bakery/bakery-2.jpg" alt="">
        			</div>
        			<div class="col-lg-4 col-6">
        				<img class="img-fluid" src="img/our-bakery/bakery-3.jpg" alt="">
        			</div>
        		</div> -->
		
			<div style="position: relative; width: 100%; padding-bottom: 56.25%;">
				<iframe src="https://www.youtube.com/embed/3ihwfspniO0"
					frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen=""
					style="position: absolute; top: 0; left: 180px; width: 70%; height: 70%;">
				</iframe>
			</div>
		</div>
	</section>
	<!--================End Our Bakery Area =================-->

	<!--================Newsletter Area =================-->
	
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
	<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="vendors/isotope/isotope.pkgd.min.js"></script>
	<script src="vendors/datetime-picker/js/moment.min.js"></script>
	<script
		src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery-ui/jquery-ui.min.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>

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

	<script src="js/theme.js"></script>
</body>

</html>