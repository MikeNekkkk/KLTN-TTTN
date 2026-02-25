<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Thêm sản phẩm | Quản trị Admin</title>
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script src="http://code.jquery.com/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
.Choicefile {
	display: block;
	background: #14142B;
	border: 1px solid #fff;
	color: #fff;
	width: 150px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	padding: 5px 0px;
	border-radius: 5px;
	font-weight: 500;
}

.Choicefile:hover {
	text-decoration: none;
	color: white;
}

#uploadfile, .removeimg {
	display: none;
}

#thumbbox {
	position: relative;
	width: 100%;
	margin-bottom: 20px;
}

.removeimg {
	height: 25px;
	position: absolute;
	top: 5px;
	left: 5px;
	width: 25px;
	border-radius: 50%;
	background: red;
	cursor: pointer;
}
</style>

<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#thumbimage").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
		$("#thumbimage").show();
		$('.filename').text($("#uploadfile").val());
		$(".removeimg").show();
	}

	$(document).ready(function() {
		$(".Choicefile").bind('click', function() {
			$("#uploadfile").click();
		});

		$(".removeimg").click(function() {
			$("#thumbimage").attr('src', '').hide();
			$("#uploadfile").val('');
			$(".removeimg").hide();
			$(".filename").text("");
		});

		<c:if test="${not empty error}">
		swal("Lỗi!", "${error}", "error");
		</c:if>
	});
</script>
</head>

<body class="app sidebar-mini rtl">
	<header class="app-header">
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"></a>
		<ul class="app-nav">
			<li><a class="app-nav__item" href="/index.html"><i
					class='bx bx-log-out bx-rotate-180'></i></a></li>
		</ul>
	</header>

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
			<li><a class="app-menu__item haha" href="HTSP"> <i
					class='app-menu__icon bx bx-purchase-tag-alt'></i> <span
					class="app-menu__label">Quản lý sản phẩm</span>
			</a></li>
			<li><a class="app-menu__item" href="listOrders"> <i
					class='app-menu__icon bx bx-task'></i> <span
					class="app-menu__label">Quản lý đơn hàng</span>
			</a></li>
			<li><a class="app-menu__item " href="blog"> <i
					class='app-menu__icon bx bx-run'></i> <span class="app-menu__label">Quản
						lý Blog</span>
			</a></li>
			<li><a class="app-menu__item" href="stock-management"> <i
					class="fa-solid fa-cart-flatbed "
					style="color: rgb(0, 28, 64); margin-right: 15px;"></i><span
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

			<li><a class="app-menu__item" href="doc/page-calendar.jsp">
					<i class='app-menu__icon bx bx-calendar-check'></i> <span
					class="app-menu__label">Lịch công tác</span>
			</a></li>
		</ul>
	</aside>

	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item">Danh sách sản phẩm</li>
				<li class="breadcrumb-item"><a href="#">Thêm sản phẩm</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<h3 class="tile-title">Tạo mới sản phẩm</h3>
					<div class="tile-body">

						<form action="addProduct" method="POST"
							enctype="multipart/form-data" class="row">

							<div class="form-group col-md-6">
								<label class="control-label">Tên sản phẩm <span
									style="color: red">*</span></label> <input class="form-control"
									type="text" name="productName" required>
							</div>

							<div class="form-group col-md-3">
								<label class="control-label">Giá bán <span
									style="color: red">*</span></label> <input class="form-control"
									type="number" name="price" required min="0" step="1000">
							</div>

							<div class="form-group col-md-3">
								<label class="control-label">Số lượng <span
									style="color: red">*</span></label> <input class="form-control"
									type="number" name="stockQuantity" required min="0">
							</div>

							<div class="form-group col-md-6">
								<label for="categoryId" class="control-label">Danh mục <span
									style="color: red">*</span></label> <select class="form-control"
									id="categoryId" name="categoryId" required>
									<option value="">-- Chọn danh mục --</option>
									<c:forEach var="cat" items="${listC}">
										<option value="${cat.id}">${cat.name}</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group col-md-12">
								<label class="control-label">Ảnh sản phẩm</label>
								<div id="myfileupload">
									<input type="file" id="uploadfile" name="productImage"
										accept="image/*" onchange="readURL(this);" />
								</div>
								<div id="thumbbox">
									<img height="450" width="400" alt="Thumb image" id="thumbimage"
										style="display: none" /> <a class="removeimg"
										href="javascript:"></a>
								</div>
								<div id="boxchoice">
									<a href="javascript:" class="Choicefile"><i
										class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
									<p class="filename" style="margin-top: 10px;"></p>
								</div>
							</div>

							<div class="form-group col-md-12">
								<label class="control-label">Mô tả sản phẩm</label>
								<textarea class="form-control" name="description"
									id="description" rows="5"></textarea>
							</div>

							<div class="col-md-12">
								<button class="btn btn-save" type="submit">Lưu lại</button>
								<a class="btn btn-cancel" href="HTSP">Hủy bỏ</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/main.js"></script>
</body>
</html>