<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Chi tiết Liên Hệ | TRUNG NGUYÊN ADMIN</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Main CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
.contact-detail {
	background: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.contact-header {
	border-bottom: 2px solid #f0f0f0;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.contact-info-row {
	margin-bottom: 15px;
	padding: 10px 0;
	border-bottom: 1px solid #f5f5f5;
}

.contact-info-label {
	font-weight: 600;
	color: #333;
	width: 150px;
	display: inline-block;
}

.contact-message {
	background: #f8f9fa;
	padding: 20px;
	border-radius: 5px;
	margin-top: 20px;
	line-height: 1.6;
}

.status-badge {
	padding: 5px 15px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
}

.status-new {
	background: #ffc107;
	color: #000;
}

.status-read {
	background: #17a2b8;
	color: #fff;
}

.status-replied {
	background: #28a745;
	color: #fff;
}
</style>
</head>

<body class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<ul class="app-nav">
			<li><a class="app-nav__item" href="/index.jsp"><i
					class='bx bx-log-out bx-rotate-180'></i></a></li>
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
			<li><a class="app-menu__item " href="AdminHome"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>

			<li><a class="app-menu__item" href="doc/table-data-table.jsp"><i
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
			<li><a class="app-menu__item haha" href="listContacts"><i
					class='app-menu__icon bx bx-envelope'></i><span
					class="app-menu__label">Quản lý liên hệ</span></a></li>

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
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="../listContacts">Danh
						sách liên hệ</a></li>
				<li class="breadcrumb-item active">Chi tiết liên hệ
					#${contact.id}</li>
			</ul>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="contact-detail">
						<div class="contact-header">
							<h3>Chi tiết liên hệ #${contact.id}</h3>
							<span class="status-badge status-${contact.status.toLowerCase()}">
								<c:choose>
									<c:when test="${contact.status == 'NEW'}">Mới</c:when>
									<c:when test="${contact.status == 'READ'}">Đã đọc</c:when>
									<c:when test="${contact.status == 'REPLIED'}">Đã trả lời</c:when>
								</c:choose>
							</span>
						</div>

						<div class="contact-info-row">
							<span class="contact-info-label"><i class="fa fa-user"></i>
								Tên khách hàng:</span> <span>${contact.name}</span>
						</div>

						<div class="contact-info-row">
							<span class="contact-info-label"><i class="fa fa-envelope"></i>
								Email:</span> <span><a href="mailto:${contact.email}">${contact.email}</a></span>
						</div>

						<div class="contact-info-row">
							<span class="contact-info-label"><i class="fa fa-tag"></i>
								Chủ đề:</span> <span>${contact.subject}</span>
						</div>

						<div class="contact-info-row">
							<span class="contact-info-label"><i class="fa fa-calendar"></i>
								Ngày gửi:</span> <span><fmt:formatDate
									value="${contact.createdAt}" pattern="dd/MM/yyyy HH:mm:ss" /></span>
						</div>

						<div class="contact-info-row">
							<span class="contact-info-label"><i class="fa fa-clock-o"></i>
								Cập nhật:</span> <span><fmt:formatDate
									value="${contact.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss" /></span>
						</div>

						<h4 style="margin-top: 30px; margin-bottom: 15px;">
							<i class="fa fa-comment"></i> Nội dung tin nhắn:
						</h4>
						<div class="contact-message">${contact.message}</div>

						<div style="margin-top: 30px;">
							<a href="listContacts" class="btn btn-secondary"> <i
								class="fa fa-arrow-left"></i> Quay lại
							</a>
							<button type="button" class="btn btn-success"
								onclick="markAsReplied(${contact.id})">
								<i class="fa fa-check"></i> Đánh dấu đã trả lời
							</button>
							<button type="button" class="btn btn-danger"
								onclick="deleteContact(${contact.id})">
								<i class="fa fa-trash"></i> Xóa
							</button>
						</div>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
        function markAsReplied(id) {
            swal({
                title: "Xác nhận",
                text: "Đánh dấu liên hệ này là đã trả lời?",
                buttons: ["Hủy", "Đồng ý"],
            }).then((willUpdate) => {
                if (willUpdate) {
                    window.location.href = 'updateContactStatus?id=' + id + '&status=REPLIED';
                }
            });
        }
        
        function deleteContact(id) {
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn muốn xóa liên hệ này?",
                icon: "warning",
                buttons: ["Hủy", "Xóa"],
                dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    window.location.href = 'deleteContact?id=' + id;
                }
            });
        }
    </script>
</body>
</html>