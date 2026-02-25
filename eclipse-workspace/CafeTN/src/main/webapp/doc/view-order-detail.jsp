<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Chi tiết đơn hàng #${order.id} | Quản trị Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
.info-box {
	background: #f8f9fa;
	padding: 15px;
	border-radius: 5px;
	margin-bottom: 20px;
}

.info-label {
	font-weight: bold;
	color: #333;
}

.info-value {
	color: #666;
	margin-left: 10px;
}

.status-badge {
	padding: 5px 15px;
	border-radius: 20px;
	font-size: 14px;
}
</style>
</head>

<body class="app sidebar-mini rtl">
	<!-- Navbar-->
	<header class="app-header">
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"></a>
		<ul class="app-nav">
			<li><a class="app-nav__item"
				href="${pageContext.request.contextPath}/logout"> <i
					class='bx bx-log-out bx-rotate-180'></i></a></li>
		</ul>
	</header>

	<!-- Sidebar -->
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
			<li><a class="app-menu__item haha" href="listOrders"><i
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
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}/admin/listOrders">Đơn
						hàng</a></li>
				<li class="breadcrumb-item active">Chi tiết #${order.id}</li>
			</ul>
			<a href="${pageContext.request.contextPath}/listOrders"
				class="btn btn-primary"> <i class="fa fa-arrow-left"></i> Quay
				lại
			</a>
		</div>

		<div class="row">
			<!-- Thông tin đơn hàng -->
			<div class="col-md-8">
				<div class="tile">
					<h3 class="tile-title">Đơn hàng #${order.id}</h3>
					<div class="tile-body">
						<div class="info-box">
							<div class="row">
								<div class="col-md-6">
									<p>
										<span class="info-label">Ngày đặt:</span> <span
											class="info-value"><fmt:formatDate
												value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm:ss" /></span>
									</p>
									<p>
										<span class="info-label">Trạng thái:</span>
										<c:choose>
											<c:when test="${order.status == 'PENDING'}">
												<span class="badge bg-warning">Chờ xử lý</span>
											</c:when>
											<c:when
												test="${order.status == 'PROCESSING' || order.status == 'CONFIRMED'}">
												<span class="badge badge-info">Đang xử lý</span>
											</c:when>
											<c:when test="${order.status == 'PAID'}">
												<span class="badge bg-info">Đã thanh toán</span>
											</c:when>
											<c:when test="${order.status == 'COMPLETED'}">
												<span class="badge bg-success">Hoàn thành</span>
											</c:when>
											<c:when test="${order.status == 'CANCELLED'}">
												<span class="badge bg-danger">Đã hủy</span>
											</c:when>
										</c:choose>
									</p>
								</div>
								<div class="col-md-6">
									<p>
										<span class="info-label">Thanh toán:</span>
										<c:choose>
											<c:when test="${order.paymentMethod == 'VNPAY'}">
												<span class="badge bg-primary">VNPay</span>
											</c:when>
											<c:when test="${order.paymentMethod == 'COD'}">
												<span class="badge bg-secondary">COD</span>
											</c:when>
											<c:otherwise>
												<span class="badge bg-warning">Chưa thanh toán</span>
											</c:otherwise>
										</c:choose>
									</p>
									<p>
										<span class="info-label">Cập nhật lần cuối:</span> <span
											class="info-value"><fmt:formatDate
												value="${order.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss" /></span>
									</p>
								</div>
							</div>
						</div>

						<!-- Danh sách sản phẩm -->
						<h4 class="mt-4 mb-3">Sản phẩm đã đặt</h4>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>STT</th>
									<th width="250">Tên sản phẩm</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Thành tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${order.orderItems}" var="item"
									varStatus="status">
									<tr>
										<td>${status.index + 1}</td>
										<td>${item.productName}</td>
										<td><fmt:formatNumber value="${item.price}" type="number"
												pattern="#,##0" /> đ</td>
										<td>${item.quantity}</td>
										<td><fmt:formatNumber value="${item.subtotal}"
												type="number" pattern="#,##0" /> đ</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="4" class="text-right">Tổng cộng:</th>
									<th><fmt:formatNumber value="${order.totalAmount}"
											type="number" pattern="#,##0" /> đ</th>
								</tr>
							</tfoot>
						</table>

						<!-- Ghi chú -->
						<c:if test="${not empty order.notes}">
							<div class="mt-3">
								<h5>Ghi chú:</h5>
								<p class="text-muted">${order.notes}</p>
							</div>
						</c:if>
					</div>
				</div>
			</div>

			<!-- Thông tin khách hàng -->
			<div class="col-md-4">
				<div class="tile">
					<h3 class="tile-title">Thông tin khách hàng</h3>
					<div class="tile-body">
						<p>
							<span class="info-label">Họ tên:</span><br> <span
								class="info-value">${order.firstName} ${order.lastName}</span>
						</p>
						<p>
							<span class="info-label">Email:</span><br> <span
								class="info-value">${order.email}</span>
						</p>
						<p>
							<span class="info-label">Điện thoại:</span><br> <span
								class="info-value">${order.phone}</span>
						</p>
						<c:if test="${not empty order.company}">
							<p>
								<span class="info-label">Công ty:</span><br> <span
									class="info-value">${order.company}</span>
							</p>
						</c:if>
						<p>
							<span class="info-label">Địa chỉ:</span><br> <span
								class="info-value">${order.address}</span>
						</p>
						<%-- <p><span class="info-label">Thành phố:</span><br>
              <span class="info-value">${order.city}, ${order.state}</span>
            </p> --%>
					</div>
				</div>
				<%-- 
        <!-- Hành động -->
        <div class="tile">
          <h3 class="tile-title">Hành động</h3>
          <div class="tile-body">
            <button class="btn btn-primary btn-block mb-2" onclick="updateStatus(${order.id})">
              <i class="fa fa-edit"></i> Cập nhật trạng thái
            </button>
            <button class="btn btn-info btn-block mb-2" onclick="window.print()">
              <i class="fa fa-print"></i> In đơn hàng
            </button>
            <button class="btn btn-danger btn-block" onclick="deleteOrder(${order.id})">
              <i class="fa fa-trash"></i> Xóa đơn hàng
            </button>
          </div>
        </div> --%>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
    function updateStatus(orderId) {
      window.location.href = '${pageContext.request.contextPath}/admin/listOrders';
    }

    function deleteOrder(orderId) {
      swal({
        title: "Cảnh báo",
        text: "Bạn có chắc chắn muốn xóa đơn hàng này?",
        icon: "warning",
        buttons: ["Hủy", "Xóa"],
        dangerMode: true,
      }).then((willDelete) => {
        if (willDelete) {
          $.ajax({
            url: '${pageContext.request.contextPath}/admin/deleteOrder',
            type: 'GET',
            data: { id: orderId },
            success: function(response) {
              if (response.success) {
                swal("Thành công!", response.message, "success")
                  .then(() => {
                    window.location.href = '${pageContext.request.contextPath}/admin/listOrders';
                  });
              } else {
                swal("Lỗi!", response.message, "error");
              }
            },
            error: function() {
              swal("Lỗi!", "Không thể kết nối đến server!", "error");
            }
          });
        }
      });
    }
  </script>
</body>
</html>