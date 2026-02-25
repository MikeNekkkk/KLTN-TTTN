<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />

<title>Chỉnh Sửa Blog | Quản trị Admin</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<link href="https://cdn.quilljs.com/1.3.7/quill.snow.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
#editor-container {
	height: 400px;
	background: white;
}

.ql-editor {
	font-size: 16px;
	min-height: 350px;
}

.preview-image {
	max-width: 200px;
	max-height: 200px;
	margin-top: 10px;
	border-radius: 8px;
}
</style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<ul class="app-nav">
			<li><a class="app-nav__item"
				href="${pageContext.request.contextPath}/logout"> <i
					class='bx bx-log-out bx-rotate-180'></i>
			</a></li>
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
			<li><a class="app-menu__item" href="stock-management">
					<i class="fa-solid fa-cart-flatbed "
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
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item"><a href="blog"><b>Quản lý
							Blog</b></a></li>
				<li class="breadcrumb-item active"><a href="#"><b>Chỉnh
							sửa</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<h3 class="tile-title">Chỉnh Sửa Blog</h3>

					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>

					<div class="tile-body">
						<form method="post" action="blog" enctype="multipart/form-data"
							id="blogForm">
							<input type="hidden" name="action" value="update"> <input
								type="hidden" name="id" value="${blog.id}"> <input
								type="hidden" name="oldThumbnail" value="${blog.thumbnailUrl}">

							<div class="row">
								<!-- Tiêu đề -->
								<div class="form-group col-md-12">
									<label class="control-label">Tiêu đề <span
										class="text-danger">*</span></label> <input class="form-control"
										type="text" name="title" value="${blog.title}" required
										maxlength="500">
								</div>

								<!-- Danh mục -->
								<div class="form-group col-md-6">
									<label class="control-label">Danh mục</label> <select
										class="form-control" name="category">
										<option value="">-- Chọn danh mục --</option>
										<option value="Congthuc"
											${blog.category == 'Congthuc' ? 'selected' : ''}>Công
											thức</option>
										<option value="Quangcao"
											${blog.category == 'Quangcao' ? 'selected' : ''}>Quảng
											cáo</option>
										<option value="Chuongtrinh"
											${blog.category == 'Chuongtrinh' ? 'selected' : ''}>Chương
											trình</option>
										<option value="News"
											${blog.category == 'News' ? 'selected' : ''}>Tin tức</option>
									</select>
								</div>

								<!-- Trạng thái -->
								<div class="form-group col-md-6">
									<label class="control-label">Trạng thái</label> <select
										class="form-control" name="status">
										<option value="DRAFT"
											${blog.status == 'DRAFT' ? 'selected' : ''}>Nháp</option>
										<option value="PUBLISHED"
											${blog.status == 'PUBLISHED' ? 'selected' : ''}>Đã
											đăng</option>
									</select>
								</div>

								<!-- Ảnh bìa -->
								<div class="form-group col-md-12">
									<label class="control-label">Ảnh bìa</label> <input
										class="form-control" type="file" name="thumbnail"
										accept="image/*" onchange="previewImage(this)">
									<c:if test="${blog.thumbnailUrl != null}">
										<img
											src="${pageContext.request.contextPath}/${blog.thumbnailUrl}"
											class="preview-image" id="currentImage" alt="Current">
									</c:if>
									<img id="preview" class="preview-image" style="display: none;">
								</div>

								<!-- Tóm tắt -->
								<div class="form-group col-md-12">
									<label class="control-label">Tóm tắt</label>
									<textarea class="form-control" name="excerpt" rows="3"
										maxlength="500">${blog.excerpt}</textarea>
								</div>

								<!-- Nội dung -->
								<div class="form-group col-md-12">
									<label class="control-label">Nội dung <span
										class="text-danger">*</span></label>
									<div id="editor-container"></div>
									<input type="hidden" name="content" id="content-input">
								</div>
							</div>

							<div class="tile-footer mt-3">
								<button class="btn btn-primary" type="submit">
									<i class="fa fa-fw fa-lg fa-check-circle"></i> Cập nhật
								</button>
								<a class="btn btn-secondary" href="blog"> <i
									class="fa fa-fw fa-lg fa-times-circle"></i> Hủy bỏ
								</a>
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
	<script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
		var quill = new Quill('#editor-container', {
			theme : 'snow',
			modules : {
				toolbar : [ [ {
					'header' : [ 1, 2, 3, 4, 5, 6, false ]
				} ], [ {
					'font' : []
				} ], [ 'bold', 'italic', 'underline', 'strike' ], [ {
					'color' : []
				}, {
					'background' : []
				} ], [ {
					'list' : 'ordered'
				}, {
					'list' : 'bullet'
				} ], [ {
					'align' : []
				} ], [ 'blockquote', 'code-block' ], [ 'link', 'image' ],
						[ 'clean' ] ]
			},
			placeholder : 'Nhập nội dung bài viết tại đây...'
		});

		// Load nội dung có sẵn
		var existingContent = `${blog.content}`;
		if (existingContent) {
			quill.root.innerHTML = existingContent;
		}

		document.getElementById('blogForm').addEventListener(
				'submit',
				function(e) {
					const content = quill.root.innerHTML;

					if (quill.getText().trim().length === 0) {
						e.preventDefault();
						swal("Cảnh báo!", "Vui lòng nhập nội dung bài viết!",
								"warning");
						return false;
					}

					document.getElementById('content-input').value = content;
				});

		function previewImage(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
					document.getElementById('preview').style.display = 'block';

					var currentImg = document.getElementById('currentImage');
					if (currentImg) {
						currentImg.style.display = 'none';
					}
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function time() {
			var today = new Date();
			var weekday = [ "Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư",
					"Thứ Năm", "Thứ Sáu", "Thứ Bảy" ];
			var day = weekday[today.getDay()];
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0');
			var yyyy = today.getFullYear();
			var h = String(today.getHours()).padStart(2, '0');
			var m = String(today.getMinutes()).padStart(2, '0');
			var s = String(today.getSeconds()).padStart(2, '0');

			var nowTime = h + " giờ " + m + " phút " + s + " giây";
			var currentDate = day + ', ' + dd + '/' + mm + '/' + yyyy;

			document.getElementById("clock").innerHTML = '<span class="date">'
					+ currentDate + ' - ' + nowTime + '</span>';
			setTimeout(time, 1000);
		}
	</script>
</body>
</html>