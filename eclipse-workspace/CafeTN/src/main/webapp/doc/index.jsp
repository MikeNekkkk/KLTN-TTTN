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
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />

<title>TRUNG NGUYÊN | ADMIN</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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
			<li><a class="app-nav__item" href="/index.jsp"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<img class="app-sidebar__user-avatar" src="img/fav-icon.png"
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
			<li><a class="app-menu__item haha" href="AdminHome"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>

			<li><a class="app-menu__item" href="HTU"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item" href=HTSP><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý sản phẩm</span></a></li>
			<li><a class="app-menu__item" href="listOrders"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản
						lý đơn hàng</span></a></li>
			<li><a class="app-menu__item" href="stock-management">
					<i class="fa-solid fa-cart-flatbed " style = " color: ;margin-right: 15px;"></i><span class="app-menu__label">Quản lý Nhập Xuất Kho</span>
			</a></li>
			<li><a class="app-menu__item" href="blog"><i
					class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản
						lý Bài viết </span></a></li>
			<li><a class="app-menu__item" href="listContacts"><i
					class='app-menu__icon bx bx-envelope'></i><span
					class="app-menu__label">Quản lý liên hệ</span></a></li>

			<li><a class="app-menu__item" href="doc/page-calendar.jsp"><i
					class='app-menu__icon bx bx-calendar-check'></i><span
					class="app-menu__label">Lịch công tác </span></a></li>

		</ul>
	</aside>
	<main class="app-content">
		<div class="row">
			<div class="col-md-12">
				<div class="app-title">
					<ul class="app-breadcrumb breadcrumb">
						<li class="breadcrumb-item"><a href="#"><b>Bảng điều
									khiển</b></a></li>
					</ul>
					<div id="clock"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<!--Left-->
			<div class="col-md-12 col-lg-6">
				<div class="row">
					<!-- col-6 -->
					<!-- Thay thế phần 4 col-6 đầu tiên trong index.jsp -->

					<!-- col-6: Tổng khách hàng -->
					<div class="col-md-6">
						<div class="widget-small primary coloured-icon">
							<i class='icon bx bxs-user-account fa-3x'></i>
							<div class="info">
								<h4>Tổng khách hàng</h4>
								<p>
									<b>${totalCustomers} khách hàng</b>
								</p>
								<p class="info-tong">Tổng số khách hàng được quản lý.</p>
							</div>
						</div>
					</div>

					<!-- col-6: Tổng sản phẩm -->
					<div class="col-md-6">
						<div class="widget-small info coloured-icon">
							<i class='icon bx bxs-data fa-3x'></i>
							<div class="info">
								<h4>Tổng sản phẩm</h4>
								<p>
									<b>${totalProducts} sản phẩm</b>
								</p>
								<p class="info-tong">Tổng số sản phẩm được quản lý.</p>
							</div>
						</div>
					</div>

					<!-- col-6: Tổng đơn hàng -->
					<div class="col-md-6">
						<div class="widget-small warning coloured-icon">
							<i class='icon bx bxs-shopping-bags fa-3x'></i>
							<div class="info">
								<h4>Tổng đơn hàng</h4>
								<p>
									<b>${totalOrders} đơn hàng</b>
								</p>
								<p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
							</div>
						</div>
					</div>

					<!-- col-6: Sắp hết hàng -->
					<div class="col-md-6">
						<div class="widget-small danger coloured-icon">
							<i class='icon bx bxs-error-alt fa-3x'></i>
							<div class="info">
								<h4>Sắp hết hàng</h4>
								<p>
									<b>${lowStockProducts} sản phẩm</b>
								</p>
								<p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
							</div>
						</div>
					</div>
					<!-- col-6 -->
					<div class="col-md-6">
						<div class="widget-small primary coloured-icon">
							<i class='icon bx bx-envelope fa-3x'></i>
							<div class="info">
								<h4>Tổng liên hệ</h4>
								<p>
									<b>${totalContacts} liên hệ</b>
								</p>
								<p class="info-tong">Tổng số liên hệ từ khách hàng.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="widget-small warning coloured-icon">
							<i class='icon bx bx-bell fa-3x'></i>
							<div class="info">
								<h4>Liên hệ mới</h4>
								<p>
									<b>${newContacts} liên hệ</b>
								</p>
								<p class="info-tong">Số liên hệ chưa đọc cần xử lý.</p>
							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="col-md-12 col-lg-6">
				<div class="row">
					<div class="col-md-12">
						<div class="tile">
							<h3 class="tile-title">Tình trạng đơn hàng</h3>
							<div>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>ID đơn hàng</th>
											<th>Tên khách hàng</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty recentOrders}">
												<tr>
													<td colspan="4" style="text-align: center;">Chưa có
														đơn hàng nào</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="order" items="${recentOrders}">
													<tr>
														<td>#${order.id}</td>
														<td>${order.firstName}${order.lastName}</td>
														<td><fmt:formatNumber value="${order.totalAmount}"
																pattern="#,##0" />₫</td>
														<td><c:choose>
																<c:when test="${order.status == 'PENDING'}">
																	<span class="badge bg-info">Chờ xử lý</span>
																</c:when>
																<c:when test="${order.status == 'CONFIRMED'}">
																	<span class="badge bg-primary">Đã xác nhận</span>
																</c:when>
																<c:when test="${order.status == 'PROCESSING'}">
																	<span class="badge bg-warning">Đang xử lý</span>
																</c:when>
																<c:when test="${order.status == 'SHIPPING'}">
																	<span class="badge bg-warning">Đang vận chuyển</span>
																</c:when>
																<c:when test="${order.status == 'PAID'}">
																	<span class="badge bg-success">Đã thanh toán</span>
																</c:when>
																<c:when test="${order.status == 'COMPLETED'}">
																	<span class="badge bg-success">Đã hoàn thành</span>
																</c:when>
																<c:when test="${order.status == 'CANCELLED'}">
																	<span class="badge bg-danger">Đã hủy</span>
																</c:when>
																<c:when test="${order.status == 'FAILED'}">
																	<span class="badge bg-danger">Thất bại</span>
																</c:when>
																<c:otherwise>
																	<span class="badge bg-secondary">${order.status}</span>
																</c:otherwise>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-12 ">
						<div class="tile">
							<h3 class="tile-title">Khách hàng mới</h3>
							<div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên khách hàng</th>
											<th>Email</th>
											<th>Số điện thoại</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty recentCustomers}">
												<tr>
													<td colspan="4" style="text-align: center;">Chưa có
														khách hàng nào</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="customer" items="${recentCustomers}">
													<tr>
														<td>#${customer.id}</td>
														<td>${customer.fullName}</td>
														<td>${customer.email}</td>
														<td><span class="tag tag-success">${customer.phone}</span>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!--END right-->
		</div>


		<!-- <div class="text-center" style="font-size: 13px">
			<p>
				<b>Copyright <script type="text/javascript">
					document.write(new Date().getFullYear());
				</script> Phần mềm quản lý bán hàng | Dev By Huyền
				</b>
			</p>
		</div> -->
	</main>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/chart.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript">
		var data = {
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6" ],
			datasets : [ {
				label : "Dữ liệu đầu tiên",
				fillColor : "rgba(255, 213, 59, 0.767), 212, 59)",
				strokeColor : "rgb(255, 212, 59)",
				pointColor : "rgb(255, 212, 59)",
				pointStrokeColor : "rgb(255, 212, 59)",
				pointHighlightFill : "rgb(255, 212, 59)",
				pointHighlightStroke : "rgb(255, 212, 59)",
				data : [ 20, 59, 90, 51, 56, 100 ]
			}, {
				label : "Dữ liệu kế tiếp",
				fillColor : "rgba(9, 109, 239, 0.651)  ",
				pointColor : "rgb(9, 109, 239)",
				strokeColor : "rgb(9, 109, 239)",
				pointStrokeColor : "rgb(9, 109, 239)",
				pointHighlightFill : "rgb(9, 109, 239)",
				pointHighlightStroke : "rgb(9, 109, 239)",
				data : [ 48, 48, 49, 39, 86, 10 ]
			} ]
		};
		var ctxl = $("#lineChartDemo").get(0).getContext("2d");
		var lineChart = new Chart(ctxl).Line(data);

		var ctxb = $("#barChartDemo").get(0).getContext("2d");
		var barChart = new Chart(ctxb).Bar(data);
	</script>
	<script type="text/javascript">
		//Thời Gian
		function time() {
			var today = new Date();
			var weekday = new Array(7);
			weekday[0] = "Chủ Nhật";
			weekday[1] = "Thứ Hai";
			weekday[2] = "Thứ Ba";
			weekday[3] = "Thứ Tư";
			weekday[4] = "Thứ Năm";
			weekday[5] = "Thứ Sáu";
			weekday[6] = "Thứ Bảy";
			var day = weekday[today.getDay()];
			var dd = today.getDate();
			var mm = today.getMonth() + 1;
			var yyyy = today.getFullYear();
			var h = today.getHours();
			var m = today.getMinutes();
			var s = today.getSeconds();
			m = checkTime(m);
			s = checkTime(s);
			nowTime = h + " giờ " + m + " phút " + s + " giây";
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = day + ', ' + dd + '/' + mm + '/' + yyyy;
			tmp = '<span class="date"> ' + today + ' - ' + nowTime + '</span>';
			document.getElementById("clock").innerHTML = tmp;
			clocktime = setTimeout("time()", "1000", "Javascript");

			function checkTime(i) {
				if (i < 10) {
					i = "0" + i;
				}
				return i;
			}
		}
	</script>
</body>

</html>