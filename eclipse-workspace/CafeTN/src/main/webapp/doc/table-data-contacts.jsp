<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<link rel="icon" href="img/fav-icon.png" type="image/x-icon" />

<title>Quản lý Liên Hệ | TRUNG NGUYÊN ADMIN</title>
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
			<li><a class="app-menu__item haha" href="listContacts"><i
					class='app-menu__icon bx bx-envelope'></i><span
					class="app-menu__label">Quản lý liên hệ</span></a></li>

			<li><a class="app-menu__item" href="doc/page-calendar.jsp"><i
					class='app-menu__icon bx bx-calendar-check'></i><span
					class="app-menu__label">Lịch công tác </span></a></li>

		</ul>
	</aside>

	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách liên hệ</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<div class="row element-button">
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" href="form-add-nhan-vien.html"
									title="Thêm"> <i class="fas fa-plus"></i> Tạo mới liên hệ
								</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm print-file" type="button"
									title="In" onclick="myApp.printTable()"> <i
									class="fas fa-print"></i> In dữ liệu
								</a>
							</div>
						</div>

						<!-- Hiển thị thống kê -->
						<div class="row" style="margin-bottom: 20px;">
							<div class="col-md-6">
								<div class="alert alert-info">
									<strong>Tổng liên hệ:</strong> ${totalContacts}
								</div>
							</div>
							<div class="col-md-6">
								<div class="alert alert-warning">
									<strong>Liên hệ mới:</strong> ${newContacts}
								</div>
							</div>
						</div>

						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" id="all"></th>
									<th>ID</th>
									<th>Tên</th>
									<th>Email</th>
									<th>Chủ đề</th>
									<th>Tin nhắn</th>
									<th>Trạng thái</th>
									<th>Ngày gửi</th>
									<th>Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty listContacts}">
										<tr>
											<td colspan="9" style="text-align: center;">Chưa có liên
												hệ nào</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="contact" items="${listContacts}">
											<tr>
												<td width="10"><input type="checkbox" name="check1"
													value="${contact.id}"></td>
												<td>#${contact.id}</td>
												<td>${contact.name}</td>
												<td>${contact.email}</td>
												<td>${contact.subject}</td>
												<td><c:choose>
														<c:when test="${contact.message.length() > 50}">
                                                            ${contact.message.substring(0, 50)}...
                                                        </c:when>
														<c:otherwise>
                                                            ${contact.message}
                                                        </c:otherwise>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${contact.status == 'NEW'}">
															<span class="badge bg-warning">Mới</span>
														</c:when>
														<c:when test="${contact.status == 'READ'}">
															<span class="badge bg-info">Đã đọc</span>
														</c:when>
														<c:when test="${contact.status == 'REPLIED'}">
															<span class="badge bg-success">Đã trả lời</span>
														</c:when>
													</c:choose></td>
												<td><fmt:formatDate value="${contact.createdAt}"
														pattern="dd/MM/yyyy HH:mm" /></td>
												<td>
													<button class="btn btn-primary btn-sm view" type="button"
														title="Xem" onclick="viewContact(${contact.id})">
														<i class="fas fa-eye"></i>
													</button>
													<button class="btn btn-primary btn-sm trash" type="button"
														title="Xóa" onclick="deleteContact(${contact.id})">
														<i class="fas fa-trash-alt"></i>
													</button>
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
	</main>

	<!-- Essential javascripts for application to work-->
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/pace.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

	<script type="text/javascript">
        // Clock function
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

        function viewContact(id) {
            window.location.href = 'viewContact?id=' + id;
        }

        function deleteContact(id) {
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn muốn xóa liên hệ này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            }).then((willDelete) => {
                if (willDelete) {
                    window.location.href = 'deleteContact?id=' + id;
                }
            });
        }

        $("#all").change(function() {
            $("input[name='check1']").prop('checked', $(this).prop("checked"));
        });
    </script>
</body>
</html>