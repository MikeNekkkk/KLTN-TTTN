<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Quản lý Báo cáo | Quản trị Admin</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!-- or -->
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">


			<!-- User Menu-->
			<li><a class="app-nav__item" href="/index.html"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<img class="app-sidebar__user-avatar"
				src="${pageContext.request.contextPath}/img/fav-icon.png"
				width="50px" alt="User Image">
			<div>
				<div class="f_title">
					<h4>Mai Huyền</h4>
				</div>
				<div class="f_title">
					<h5>Chào mừng bạn trở lại</h5>
				</div>
			</div>
		</div>
		<hr>
		<ul class="app-menu">
			<li><a class="app-menu__item" href="AdminHome"> <i
					class='app-menu__icon bx bx-tachometer'></i> <span
					class="app-menu__label">Bảng điều khiển</span>
			</a></li>
			<li><a class="app-menu__item" href="HTU"> <i
					class='app-menu__icon bx bx-user-voice'></i> <span
					class="app-menu__label">Quản lý khách hàng</span>
			</a></li>
			<li><a class="app-menu__item" href="HTSP"> <i
					class='app-menu__icon bx bx-purchase-tag-alt'></i> <span
					class="app-menu__label">Quản lý sản phẩm</span>
			</a></li>
			<li><a class="app-menu__item" href="listOrders"> <i
					class='app-menu__icon bx bx-task'></i> <span
					class="app-menu__label">Quản lý đơn hàng</span>
			</a></li>
			<li><a class="app-menu__item" href="stock-management"> <i
					class="fa-solid fa-cart-flatbed "
					style="color:; margin-right: 15px;"></i><span
					class="app-menu__label">Quản lý Nhập Xuất Kho</span>
			</a></li>
			<li><a class="app-menu__item haha" href="blog"> <i
					class='app-menu__icon bx bx-run'></i> <span class="app-menu__label">Quản
						lý Blog</span>
			</a></li>
			<li><a class="app-menu__item" href="listContacts"> <i
					class='app-menu__icon bx bx-envelope'></i> <span
					class="app-menu__label">Quản lý liên hệ</span>
			</a></li>
			<li><a class="app-menu__item" href="doc/quan-ly-bao-cao.jsp">
					<i class='app-menu__icon bx bx-pie-chart-alt-2'></i> <span
					class="app-menu__label">Báo cáo doanh thu</span>
			</a></li>
			<li><a class="app-menu__item" href="doc/page-calendar.jsp">
					<i class='app-menu__icon bx bx-calendar-check'></i> <span
					class="app-menu__label">Lịch công tác</span>
			</a></li>
		</ul>
	</aside>
	<main class="app-content">
		<div class="row">
			<div class="col-md-12">
				<div class="app-title">
					<ul class="app-breadcrumb breadcrumb">
						<li class="breadcrumb-item"><a href="#"><b>Báo cáo
									doanh thu </b></a></li>
					</ul>
					<div id="clock"></div>
				</div>
			</div>
		</div>
		<div class="row">

			<div class="col-md-6 col-lg-3">
				<div class="widget-small info coloured-icon">
					<i class='icon bx bxs-purchase-tag-alt fa-3x'></i>
					<div class="info">
						<h4>Tổng sản phẩm</h4>
						<p>
							<b>${totalProducts} sản phẩm</b>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="widget-small warning coloured-icon">
					<i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
					<div class="info">
						<h4>Tổng đơn hàng</h4>
						<p>
							<b>${totalOrders} đơn hàng</b>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="widget-small danger coloured-icon">
					<i class='icon fa-3x bx bxs-receipt'></i>
					<div class="info">
						<h4>Đơn hàng hủy</h4>
						<p>
							<b>2 đơn hàng</b>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-3">
				<div class="widget-small primary coloured-icon">
					<i class='icon fa-3x bx bxs-chart'></i>
					<div class="info">
						<h4>Tổng thu nhập</h4>
						<p>
							<b>104.890.000 đ</b>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="widget-small info coloured-icon">
					<i class='icon fa-3x bx bxs-user-badge'></i>
					<div class="info">
						<h4>Tổng Khách hàng</h4>
						<p>
							<b>${totalCustomers} Khách hàng</b>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="widget-small warning coloured-icon">
					<i class='icon fa-3x bx bxs-tag-x'></i>
					<div class="info">
						<h4>Hết hàng</h4>
						<p>
							<b>${lowStockProducts} sản phẩm</b>
						</p>
					</div>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div>
						<h3 class="tile-title">SẢN PHẨM BÁN CHẠY</h3>
					</div>
					<div class="tile-body">
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Giá tiền</th>
									<th>Danh mục</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>71309005</td>
									<td>Bàn ăn gỗ Theresa</td>
									<td>5.600.000 đ</td>
									<td>Bàn ăn</td>
								</tr>
								<tr>
									<td>62304003</td>
									<td>Bàn ăn Vitali mặt đá</td>
									<td>33.235.000 đ</td>
									<td>Bàn ăn</td>
								</tr>
								<tr>
									<td>72109004</td>
									<td>Ghế làm việc Zuno</td>
									<td>3.800.000 đ</td>
									<td>Ghế gỗ</td>
								</tr>
								<tr>
									<td>83826226</td>
									<td>Tủ ly - tủ bát</td>
									<td>2.450.000 đ</td>
									<td>Tủ</td>
								</tr>
								<tr>
									<td>71304041</td>
									<td>Bàn ăn mở rộng Vegas</td>
									<td>21.550.000 đ</td>
									<td>Bàn thông minh</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div>
						<h3 class="tile-title">TỔNG ĐƠN HÀNG</h3>
					</div>
					<div class="tile-body">
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th>ID đơn hàng</th>
									<th>Khách hàng</th>
									<th>Đơn hàng</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${getallorder}">
									<tr>
										<td>${order.id}</td>
										<td>${order.firstName}</td>
										<td>Ghế làm việc Zuno, Bàn ăn gỗ Theresa</td>
										<td>2 sản phẩm</td>
										<td>9.400.000 đ</td>
									</tr>
								</c:forEach>
								<tr>
									<td>MĐ8265</td>
									<td>Nguyễn Thị Ngọc Cẩm</td>
									<td>Ghế ăn gỗ Lucy màu trắng</td>
									<td>1 sản phẩm</td>
									<td>3.800.000 đ</td>
								</tr>
								<tr>
									<td>MT9835</td>
									<td>Đặng Hoàng Phúc</td>
									<td>Giường ngủ Jimmy, Bàn ăn mở rộng cao cấp Dolas, Ghế
										làm việc Zuno</td>
									<td>3 sản phẩm</td>
									<td>40.650.000 đ</td>
								</tr>
								<tr>
									<td>ER3835</td>
									<td>Nguyễn Thị Mỹ Yến</td>
									<td>Bàn ăn mở rộng Gepa</td>
									<td>1 sản phẩm</td>
									<td>16.770.000 đ</td>
								</tr>
								<tr>
									<td>AL3947</td>
									<td>Phạm Thị Ngọc</td>
									<td>Bàn ăn Vitali mặt đá, Ghế ăn gỗ Lucy màu trắng</td>
									<td>2 sản phẩm</td>
									<td>19.770.000 đ</td>
								</tr>
								<tr>
									<td>QY8723</td>
									<td>Ngô Thái An</td>
									<td>Giường ngủ Kara 1.6x2m</td>
									<td>1 sản phẩm</td>
									<td>14.500.000 đ</td>
								</tr>
								<tr>
									<th colspan="4">Tổng cộng:</th>
									<td>104.890.000 đ</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div>
						<h3 class="tile-title">SẢN PHẨM ĐÃ HẾT</h3>
					</div>
					<div class="tile-body">
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Ảnh</th>
									<th>Số lượng</th>
									<th>Tình trạng</th>
									<th>Giá tiền</th>
									<th>Danh mục</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sd" items="${ProductsSoldout}">

									<tr>
										<td>${sd.id}</td>
										<td>${sd.name}</td>
										<td><img src="${sd.imageUrl}" alt="" width="100px;"></td>
										<td>${sd.stockQuantity}</td>
										<td><span class="badge bg-danger">Hết hàng</span></td>
										<td>${sd.price}đ</td>
										<td>${sd.categoryName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div>
						<h3 class="tile-title">NHÂN VIÊN MỚI</h3>
					</div>
					<div class="tile-body">
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th>Họ và tên</th>
									<th>Địa chỉ</th>
									<th>Ngày sinh</th>
									<th>Giới tính</th>
									<th>SĐT</th>
									<th>Chức vụ</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Hồ Thị Thanh Ngân</td>
									<td>155-157 Trần Quốc Thảo, Quận 3, Hồ Chí Minh</td>
									<td>12/02/1999</td>
									<td>Nữ</td>
									<td>0926737168</td>
									<td>Bán hàng</td>
								</tr>
								<tr>
									<td>Trần Khả Ái</td>
									<td>6 Nguyễn Lương Bằng, Tân Phú, Quận 7, Hồ Chí Minh</td>
									<td>22/12/1999</td>
									<td>Nữ</td>
									<td>0931342432</td>
									<td>Bán hàng</td>
								</tr>
								<tr>
									<td>Nguyễn Đặng Trọng Nhân</td>
									<td>59C Nguyễn Đình Chiểu, Quận 3, Hồ Chí Minh</td>
									<td>23/07/1996</td>
									<td>Nam</td>
									<td>0846881155</td>
									<td>Dịch vụ</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="tile">
					<h3 class="tile-title">DỮ LIỆU HÀNG THÁNG</h3>
					<div class="embed-responsive embed-responsive-16by9">
						<canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="tile">
					<h3 class="tile-title">THỐNG KÊ DOANH SỐ</h3>
					<div class="embed-responsive embed-responsive-16by9">
						<canvas class="embed-responsive-item" id="barChartDemo"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="text-right" style="font-size: 12px">
			<p>
				<b>Hệ thống quản lý V2.0 | Code by Trường</b>
			</p>
		</div>
	</main>
	<!-- Essential javascripts for application to work-->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/popper.min.js"></script>
	<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/main.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/pace.min.js"></script>
	<!--===============================================================================================-->

	<script type="text/javascript">
		var data = {
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10",
					"Tháng 11", "Tháng 12" ],
			datasets : [ {
				label : "Dữ liệu đầu tiên",
				fillColor : "rgba(255, 255, 255, 0.158)",
				strokeColor : "black",
				pointColor : "rgb(220, 64, 59)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "green",
				data : [ 20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81 ]
			}, {
				label : "Dữ liệu kế tiếp",
				fillColor : "rgba(255, 255, 255, 0.158)",
				strokeColor : "rgb(220, 64, 59)",
				pointColor : "black",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "green",
				data : [ 48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90 ]
			} ]
		};

		var ctxl = $("#lineChartDemo").get(0).getContext("2d");
		var lineChart = new Chart(ctxl).Line(data);

		var ctxb = $("#barChartDemo").get(0).getContext("2d");
		var barChart = new Chart(ctxb).Bar(data);
	</script>
	<!-- Google analytics script-->
	<script type="text/javascript">
		if (document.location.hostname == 'pratikborsadiya.in') {
			(function(i, s, o, g, r, a, m) {
				i['GoogleAnalyticsObject'] = r;
				i[r] = i[r] || function() {
					(i[r].q = i[r].q || []).push(arguments)
				}, i[r].l = 1 * new Date();
				a = s.createElement(o), m = s.getElementsByTagName(o)[0];
				a.async = 1;
				a.src = g;
				m.parentNode.insertBefore(a, m)
			})(window, document, 'script',
					'//www.google-analytics.com/analytics.js', 'ga');
			ga('create', 'UA-72504830-1', 'auto');
			ga('send', 'pageview');
		}
	</script>
</body>

</html>