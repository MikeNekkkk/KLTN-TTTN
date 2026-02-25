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
<title>Chi tiết sản phẩm - ${detail.name}</title>

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
.product_img {
    overflow: hidden;
    max-height: 450px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.product_img img {
    width: 100%;
    height: auto;
    object-fit: contain;
    transition: all 300ms ease;
}

/* Style cho notification */
@keyframes slideInRight {
    from { transform: translateX(400px); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
}

@keyframes slideOutRight {
    from { transform: translateX(0); opacity: 1; }
    to { transform: translateX(400px); opacity: 0; }
}

.cart-notification {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
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

.view-more-section {
    text-align: center;
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid #eee;
}

.view-more-btn {
    display: inline-block;
    padding: 12px 40px;
    background: #f195b2;
    color: #fff;
    border-radius: 25px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
}

.view-more-btn:hover {
    background: #e67396;
    color: #fff;
    text-decoration: none;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(241, 149, 178, 0.3);
}

@media (max-width: 768px) {
    .cart-notification {
        right: 10px;
        left: 10px;
        min-width: auto;
        font-size: 13px;
        padding: 12px 20px;
    }
}
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<section class="banner_area">
    <div class="container">
        <div class="banner_text">
            <h3>Product Details</h3>
            <ul>
                <li><a href="home">Home</a></li>
                <li><a href="product-details.jsp">Product Details</a></li>
            </ul>
        </div>
    </div>
</section>

<!--================Product Details Area =================-->
<section class="product_details_area p_100">
    <div class="container">
        <div class="row product_d_price">
            <div class="col-lg-6">
                <div class="product_img1">
                    <img class="img-fluid" src="${detail.imageUrl}" alt="${detail.name}">
                </div>
            </div>
            <div class="col-lg-6">
                <div class="product_details_text">
                    <h4>${detail.name}</h4>
                    <p>${detail.detailDescription}</p>
                    <h5>Price: <span>${String.format("%,.0f", detail.price)}₫</span></h5>
                    <div class="quantity_box">
                        <label for="quantity">Quantity:</label>
                        <input type="text" placeholder="1" id="quantity" value="1">
                    </div>
                    <a class="pink_more add-to-cart-btn" href="#" data-id="${detail.id}">Thêm vào giỏ</a>
                </div>
            </div>
        </div>
        
        <div class="product_tab_area">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" 
                       href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Mô tả</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" 
                       href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Thông số</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" 
                       href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Đánh giá (0)</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <p>${detail.detailDescription}</p>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <p>Thông tin chi tiết về sản phẩm sẽ được cập nhật sớm.</p>
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                    <p>Chưa có đánh giá nào cho sản phẩm này.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!--================Similar Product Area =================-->
<section class="similar_product_area p_100">
    <div class="container">
        <div class="main_title">
            <h2>Sản Phẩm Tương Tự</h2>
        </div>
        <div class="row similar_product_inner">
            <c:forEach var="p1" items="${de1}">
                <div class="col-lg-3 col-md-4 col-6">
                    <div class="cake_feature_item product_link" data-id="${p1.id}" data-category-id="${p1.categoryId}">
                        <div class="product_img cake_img">
                            <a href="detail?pid=${p1.id}&categoryId=${p1.categoryId}">
                                <img src="${pageContext.request.contextPath}/${p1.imageUrl}" alt="${p1.name}">
                            </a>
                        </div>
                        <div class="cake_text">
                            <h4>${String.format("%,.0f", p1.price)}₫</h4>
                            <a href="detail?pid=${p1.id}&categoryId=${p1.categoryId}">
                                <h3>${p1.name}</h3>
                            </a>
                            <a class="pest_btn add-to-cart-btn" href="#" data-id="${p1.id}">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- ✅ NÚT XEM THÊM -->
        <div class="view-more-section">
            <a href="category?cid=${categoryId}" class="view-more-btn">
                <i class="fa fa-th-large"></i> Xem Thêm Sản Phẩm
            </a>
        </div>
    </div>
</section>

<!--================Newsletter Area =================-->
<section class="newsletter_area">
    <div class="container">
        <div class="row newsletter_inner">
            <div class="col-lg-6">
                <div class="news_left_text">
                    <h4>Đăng ký nhận bản tin để nhận ưu đãi mới nhất</h4>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="newsletter_form">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Nhập email của bạn">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">Đăng ký</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--================Footer Area =================-->
<footer class="footer_area">
    <div class="footer_widgets">
        <div class="container">
            <div class="row footer_wd_inner">
                <div class="col-lg-3 col-6">
                    <aside class="f_widget f_about_widget">
                        <img src="img/footer-logo.png" alt="">
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui bland itiis praesentium voluptatum deleniti atque corrupti.</p>
                        <ul class="nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-3 col-6">
                    <aside class="f_widget f_link_widget">
                        <div class="f_title"><h3>Quick links</h3></div>
                        <ul class="list_style">
                            <li><a href="#">Your Account</a></li>
                            <li><a href="#">View Order</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-3 col-6">
                    <aside class="f_widget f_link_widget">
                        <div class="f_title"><h3>Work Times</h3></div>
                        <ul class="list_style">
                            <li><a href="#">Mon. : Fri.: 8 am - 8 pm</a></li>
                            <li><a href="#">Sat. : 9am - 4pm</a></li>
                            <li><a href="#">Sun. : Closed</a></li>
                        </ul>
                    </aside>
                </div>
                <div class="col-lg-3 col-6">
                    <aside class="f_widget f_contact_widget">
                        <div class="f_title"><h3>Contact Info</h3></div>
                        <h4>(1800) 574 9687</h4>
                        <p>Justshop Store <br/>256, Baker Street, New York, 5245</p>
                        <h5>cakebakery@contact.co.in</h5>
                    </aside>
                </div>
            </div>
        </div>
    </div>
    <div class="footer_copyright">
        <div class="container">
            <div class="copyright_inner">
                <div class="float-left">
                    <h5><a target="_blank" href="https://www.templatespoint.net">Templates Point</a></h5>
                </div>
                <div class="float-right">
                    <a href="#">Purchase Now</a>
                </div>
            </div>
        </div>
    </div>
</footer>

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
<script>
$(document).ready(function() {
    // ==================== XỬ LÝ THÊM VÀO GIỎ HÀNG ====================
    $(document).on('click', '.add-to-cart-btn', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var $btn = $(this);
        var productId = $btn.data('id');
        var originalText = $btn.text().trim();

        $btn.prop('disabled', true).text('Đang thêm...');

        $.ajax({
            url: 'addToCart',
            type: 'GET',
            data: { id: productId },
            success: function(response) {
                showNotification('success', '✔ Đã thêm sản phẩm vào giỏ hàng!');
                updateCartCount();
                setTimeout(function() {
                    $btn.prop('disabled', false).text(originalText);
                }, 500);
            },
            error: function(xhr, status, error) {
                showNotification('error', '✗ Có lỗi xảy ra, vui lòng thử lại!');
                $btn.prop('disabled', false).text(originalText);
            }
        });
    });

    // ==================== XỬ LÝ CLICK VÀO SẢN PHẨM ====================
    $('.product_link').click(function(event) {
        if (!$(event.target).closest('.add-to-cart-btn, a').length) {
            var productId = $(this).data('id');
            var categoryId = $(this).data('category-id');
            window.location.href = 'detail?pid=' + productId + '&categoryId=' + categoryId;
        }
    });

    // ==================== HÀM HIỂN THỊ THÔNG BÁO ====================
    function showNotification(type, message) {
        $('.cart-notification').remove();
        var bgColor = type === 'success' ? '#4CAF50' : '#f44336';
        var notification = $('<div class="cart-notification"></div>');
        notification.text(message);
        notification.css({
            'position': 'fixed',
            'top': '80px',
            'right': '20px',
            'background': bgColor,
            'color': '#fff',
            'padding': '15px 25px',
            'border-radius': '8px',
            'box-shadow': '0 4px 12px rgba(0,0,0,0.15)',
            'z-index': '99999',
            'font-weight': '500',
            'font-size': '14px',
            'animation': 'slideInRight 0.4s ease-out',
            'min-width': '280px'
        });
        $('body').append(notification);
        setTimeout(function() {
            notification.css('animation', 'slideOutRight 0.4s ease-in');
            setTimeout(function() { notification.remove(); }, 400);
        }, 3000);
    }

    // ==================== CẬP NHẬT SỐ LƯỢNG GIỎ HÀNG ====================
    function updateCartCount() {
        $.ajax({
            url: 'getCartCount',
            type: 'GET',
            success: function(count) {
                var $cartLink = $('.shop_cart a');
                if (count > 0) {
                    $cartLink.attr('data-cart-count', count);
                } else {
                    $cartLink.removeAttr('data-cart-count');
                }
            },
            error: function() {
                console.log('Không thể cập nhật số lượng giỏ hàng');
            }
        });
    }
});
</script>

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
<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script src="vendors/isotope/isotope.pkgd.min.js"></script>
<script src="vendors/datetime-picker/js/moment.min.js"></script>
<script src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
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