<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Danh sách Blog | Quản trị Admin</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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
.blog-thumbnail {
	width: 80px;
	height: 60px;
	object-fit: cover;
	border-radius: 4px;
}

.blog-excerpt {
	max-width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
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
					<i class="fa-solid fa-cart-flatbed " style = " color: ;margin-right: 15px;"></i><span class="app-menu__label">Quản lý Nhập Xuất Kho</span>
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
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách Blog</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<!-- Thông báo -->
						<c:if test="${param.msg == 'add_success'}">
							<div class="alert alert-success alert-dismissible fade show">
								<i class="fa fa-check-circle"></i> Thêm blog thành công!
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>
						</c:if>
						<c:if test="${param.msg == 'update_success'}">
							<div class="alert alert-success alert-dismissible fade show">
								<i class="fa fa-check-circle"></i> Cập nhật blog thành công!
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>
						</c:if>
						<c:if test="${param.msg == 'delete_success'}">
							<div class="alert alert-success alert-dismissible fade show">
								<i class="fa fa-check-circle"></i> Xóa blog thành công!
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>
						</c:if>
						<c:if test="${param.msg == 'delete_failed'}">
							<div class="alert alert-danger alert-dismissible fade show">
								<i class="fa fa-exclamation-triangle"></i> Xóa blog thất bại!
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>
						</c:if>
						<div class="row mb-3">
							<div class="col-md-4">
								<div class="widget-small primary">
									<i class='icon bx bx-news fa-3x'></i>
									<div class="info">
										<h4>Tổng bài viết</h4>
										<p>
											<b>${listBlogs.size()}</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small info">
									<i class='icon bx bx-check-circle fa-3x'></i>
									<div class="info">
										<h4>Đã đăng</h4>
										<p>
											<b> <c:set var="published" value="0" /> <c:forEach
													var="blog" items="${listBlogs}">
													<c:if test="${blog.status == 'PUBLISHED'}">
														<c:set var="published" value="${published + 1}" />
													</c:if>
												</c:forEach> ${published}
											</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small warning">
									<i class='icon bx bx-edit fa-3x'></i>
									<div class="info">
										<h4>Nháp</h4>
										<p>
											<b> <c:set var="draft" value="0" /> <c:forEach
													var="blog" items="${listBlogs}">
													<c:if test="${blog.status == 'DRAFT'}">
														<c:set var="draft" value="${draft + 1}" />
													</c:if>
												</c:forEach> ${draft}
											</b>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="row element-button">
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" href="blog?action=add"
									title="Thêm"> <i class="fas fa-plus"></i> Tạo mới blog
								</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-excel btn-sm" href="#" title="Xuất Excel">
									<i class="fas fa-file-excel"></i> Xóa
								</a>
							</div>
						</div>

						<!-- Form tìm kiếm -->
						<div class="row mb-3">
							<div class="col-md-12">
								<form method="get" action="blog" class="row">
									<input type="hidden" name="action" value="list">
									<div class="col-md-10">
										<input type="text" name="keyword" class="form-control"
											placeholder="Tìm kiếm theo tiêu đề, nội dung, danh mục..."
											value="${param.keyword}">
									</div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-primary w-100">
											<i class="fas fa-search"></i> Tìm kiếm
										</button>
									</div>
								</form>
							</div>
						</div>

						<!-- Bảng dữ liệu -->
						<table class="table table-hover table-bordered js-copytextarea"
							cellpadding="0" cellspacing="0" border="0" id="sampleTable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" id="all"></th>
									<th>ID</th>
									<th>Ảnh</th>
									<th width="150">Tiêu đề</th>
									<th width="150">Tóm tắt</th>
									<th>Danh mục</th>
									<th>Tác giả</th>
									<th>Trạng thái</th>
									<th>Ngày đăng</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="blog" items="${listBlogs}">
									<tr>
										<td width="10"><input type="checkbox" name="check1"
											value="1"></td>
										<td>${blog.id}</td>
										<td><img
											src="${pageContext.request.contextPath}/${blog.thumbnailUrl}"
											class="blog-thumbnail" alt="${blog.title}"
											onerror="this.src='${pageContext.request.contextPath}/img/blog/default-blog.jpg'">
										</td>
										<td><strong>${blog.title}</strong></td>
										<td>
											<div class="blog-excerpt">${blog.excerpt}</div>
										</td>
										<td>${blog.category}</td>
										<td>${blog.authorName}</td>
										<td><c:choose>
												<c:when test="${blog.status == 'PUBLISHED'}">
													<span class="badge badge-success">Đã đăng</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-warning">Nháp</span>
												</c:otherwise>
											</c:choose></td>
										<td><fmt:formatDate value="${blog.publishedAt}"
												pattern="dd/MM/yyyy HH:mm" /></td>
										<td><a href="blog?action=edit&id=${blog.id}"
											class="btn btn-primary btn-sm edit" title="Sửa"> <i
												class="fas fa-edit"></i>
										</a>
											<button class="btn btn-primary btn-sm trash"
												onclick="deleteBlog(${blog.id})" title="Xóa">
												<i class="fas fa-trash"></i>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/main.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

	<script>
        // Khởi tạo DataTable
        $(document).ready(function() {
            $('#sampleTable').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Vietnamese.json"
                }
            });
        });

        // Checkbox chọn tất cả
        $('#all').click(function (e) {
            $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
            e.stopImmediatePropagation();
        });

        // Xóa blog
        function deleteBlog(blogId) {
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn muốn xóa blog này?",
                icon: "warning",
                buttons: ["Hủy bỏ", "Đồng ý"],
                dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    window.location.href = 'blog?action=delete&id=' + blogId;
                }
            });
        }

        // In dữ liệu
        function printTable() {
            var divToPrint = document.getElementById('sampleTable');
            var newWin = window.open('', '', 'height=700,width=700');
            newWin.document.write('<html><head><title>Danh sách Blog</title>');
            newWin.document.write('<link rel="stylesheet" href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">');
            newWin.document.write('</head><body>');
            newWin.document.write('<h2>Danh sách Blog</h2>');
            newWin.document.write(divToPrint.outerHTML);
            newWin.document.write('</body></html>');
            newWin.document.close();
            newWin.print();
        }

        // Hiển thị đồng hồ
        function time() {
            var today = new Date();
            var weekday = ["Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"];
            var day = weekday[today.getDay()];
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = today.getFullYear();
            var h = String(today.getHours()).padStart(2, '0');
            var m = String(today.getMinutes()).padStart(2, '0');
            var s = String(today.getSeconds()).padStart(2, '0');
            
            var nowTime = h + " giờ " + m + " phút " + s + " giây";
            var currentDate = day + ', ' + dd + '/' + mm + '/' + yyyy;
            
            document.getElementById("clock").innerHTML = '<span class="date">' + currentDate + ' - ' + nowTime + '</span>';
            setTimeout(time, 1000);
        }

        // Auto-hide alerts sau 5 giây
        $(document).ready(function() {
            setTimeout(function() {
                $('.alert').fadeOut('slow');
            }, 5000);
        });
    </script>
</body>
</html>