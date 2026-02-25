<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Danh sách đơn hàng | Quản trị Admin</title>
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
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">

<script src="http://code.jquery.com/jquery.min.js"
	type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style type="text/css">
	.key {
		padding: 10px;
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
					class='bx bx-log-out bx-rotate-180'></i></a></li>
		</ul>
	</header>

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
			<li><a class="app-menu__item" href="AdminHome"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item" href="HTU"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item" href="HTSP"><i
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
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách đơn hàng</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<div class="row mb-3">
							<div class="col-md-4">
								<div class="widget-small primary">
									<i class='icon bx bx-package fa-3x'></i>
									<div class="info">
										<h4>Tổng đơn</h4>
										<p>
											<b>${totalOrders}</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small warning">
									<i class='icon bx bx-time fa-3x'></i>
									<div class="info">
										<h4>Chờ xử lý</h4>
										<p>
											<b>${pendingOrders}</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small info">
									<i class='icon bx bx-check-circle fa-3x'></i>
									<div class="info">
										<h4>Hoàn thành</h4>
										<p>
											<b>${completedOrders}</b>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="row element-button">
							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm print-file" type="button"
									title="In" onclick="printTable()"> <i class="fas fa-print"></i>
									In dữ liệu
								</a>
							</div>
						</div>

						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" id="all"></th>
									<th>ID</th>
									<th>Khách hàng</th>
									<th>Email</th>
									<th>Tổng tiền</th>
									<th>Trạng thái</th>
									<th>Thanh toán</th>
									<th>Ngày tạo</th>
									<th>Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${orders}">
									<tr onclick="viewOrderDetail(${order.id}, event)">
										<td width="10" onclick="event.stopPropagation();"><input
											type="checkbox" name="check1" value="1"></td>
										<td>${order.id}</td>
										<td>${order.firstName}${order.lastName}</td>
										<td>${order.email}</td>
										<td><fmt:formatNumber value="${order.totalAmount}"
												pattern="#,###" />đ</td>
										<td><c:choose>
												<c:when test="${order.status == 'PENDING'}">
													<span class="badge badge-warning">Chờ xử lý</span>
												</c:when>
												<c:when
													test="${order.status == 'PROCESSING' || order.status == 'CONFIRMED'}">
													<span class="badge badge-info">Đang xử lý</span>
												</c:when>
												<c:when test="${order.status == 'PAID'}">
													<span class="badge bg-info">Đã thanh toán</span>
												</c:when>
												<c:when test="${order.status == 'COMPLETED'}">
													<span class="badge badge-success">Hoàn thành</span>
												</c:when>
												<c:when test="${order.status == 'CANCELLED'}">
													<span class="badge badge-danger">Đã hủy</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-secondary">${order.status}</span>
												</c:otherwise>
											</c:choose></td>
										<td><c:choose>
												<c:when test="${order.paymentMethod == 'PENDING'}">
													<span class="badge badge-warning">Chưa thanh toán</span>
												</c:when>
												<c:when test="${order.paymentMethod == 'COD'}">
													<span class="badge badge-info">COD</span>
												</c:when>
												<c:when test="${order.paymentMethod == 'VNPAY'}">
													<span class="badge badge-primary">VNPay</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-secondary">${order.paymentMethod}</span>
												</c:otherwise>
											</c:choose></td>
										<td><fmt:formatDate value="${order.createdAt}"
												pattern="dd/MM/yyyy HH:mm" /></td>
										<td class="table-td-center" onclick="event.stopPropagation();">
											<button class="btn btn-primary btn-sm edit" type="button"
												title="Sửa" data-id="${order.id}"
												data-status="${order.status}"
												data-payment="${order.paymentMethod}"
												data-firstname="${order.firstName}"
												data-lastname="${order.lastName}"
												data-email="${order.email}" data-phone="${order.phone}"
												data-address="${order.address}" data-city="${order.city}"
												data-total="${order.totalAmount}"
												onclick="openEditModal(this); event.stopPropagation();">
												<i class="fas fa-edit"></i>
											</button>

											<button class="btn btn-primary btn-sm trash" type="button"
												title="Xóa"
												onclick="deleteOrder(${order.id}); event.stopPropagation();">
												<i class="fas fa-trash-alt"></i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>

	<div class="modal fade" id="updateStatusModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title">
						<i class="fas fa-edit"></i> Cập nhật đơn hàng #<span
							id="displayOrderId"></span>
					</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card mb-3">
						<div class="card-header bg-light">
							<strong><i class="fas fa-user"></i> Thông Tin Khách Hàng</strong>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<p class="mb-2">
										<strong>Họ tên:</strong> <span id="customerName"
											class="text-primary"></span>
									</p>
									<p class="mb-2">
										<strong>Email:</strong> <span id="customerEmail"></span>
									</p>
									<p class="mb-2">
										<strong>Số điện thoại:</strong> <span id="customerPhone"></span>
									</p>
								</div>
								<div class="col-md-6">
									<p class="mb-2">
										<strong>Địa chỉ:</strong> <span id="customerAddress"></span>
									</p>
									<p class="mb-2">
										<strong>Thành phố:</strong> <span id="customerCity"></span>
									</p>
									<p class="mb-2">
										<strong>Tổng tiền:</strong> <span id="orderTotal"
											class="text-danger font-weight-bold"></span>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header bg-light">
							<strong><i class="fas fa-cog"></i> Cập Nhật Trạng Thái</strong>
						</div>
						<div class="card-body">
							<form id="updateStatusForm">
								<input type="hidden" id="orderId" name="orderId">

								<div class="form-group">
									<label for="orderStatus"> <i class="fas fa-info-circle"></i>
										Trạng thái đơn hàng <span class="text-danger">*</span></label> <select
										class="form-control" id="orderStatus" name="status" required>
										<option value="PENDING">Chờ xử lý</option>
										<option value="PROCESSING">Đang xử lý</option>
										<option value="COMPLETED">Hoàn thành</option>
										<option value="PAID">Đã thanh toán</option>
										<option value="CANCELLED">Đã hủy</option>
									</select> <small class="form-text text-muted"> Lưu ý: Đơn hàng
										đã HOÀN THÀNH không thể chỉnh sửa</small>
								</div>

								<div class="form-group">
									<label for="paymentMethod"><i
										class="fas fa-credit-card"></i> Phương thức thanh toán</label> <select
										class="form-control" id="paymentMethod" name="paymentMethod">
										<option value="PENDING">Chưa thanh toán</option>
										<option value="VNPAY">VNPay</option>
										<option value="COD">COD (Thanh toán khi nhận hàng)</option>
									</select> <small class="form-text text-muted"> Lưu ý: Đơn hàng
										đã THANH TOÁN (VNPAY) không thể đổi phương thức</small>
								</div>

								<div id="validationAlert" class="alert alert-warning"
									style="display: none;">
									<i class="fas fa-exclamation-triangle"></i> <span
										id="validationMessage"></span>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<i class="fas fa-times"></i> Hủy
					</button>
					<button type="button" class="btn btn-primary"
						onclick="submitUpdateStatus()">
						<i class="fas fa-save"></i> Cập nhật
					</button>
				</div>
			</div>
		</div>
	</div>

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
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

	<script type="text/javascript">
        $(document).ready(function() {
            $('#sampleTable').DataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Vietnamese.json"
                }
            });
        });

        $('#all').click(function (e) {
            $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
            e.stopImmediatePropagation();
        });

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

        let originalStatus = '';
        let originalPayment = '';

        function openEditModal(button) {
            const orderId = button.getAttribute('data-id');
            const status = button.getAttribute('data-status');
            const payment = button.getAttribute('data-payment');
            const firstName = button.getAttribute('data-firstname');
            const lastName = button.getAttribute('data-lastname');
            const email = button.getAttribute('data-email');
            const phone = button.getAttribute('data-phone');
            const address = button.getAttribute('data-address');
            const city = button.getAttribute('data-city');
            const total = button.getAttribute('data-total');

            originalStatus = status;
            originalPayment = payment;

            document.getElementById('displayOrderId').textContent = orderId;
            document.getElementById('customerName').textContent = firstName + ' ' + lastName;
            document.getElementById('customerEmail').textContent = email;
            document.getElementById('customerPhone').textContent = phone;
            document.getElementById('customerAddress').textContent = address;
            document.getElementById('customerCity').textContent = city;
            document.getElementById('orderTotal').textContent = formatCurrency(total);
            
            document.getElementById('orderId').value = orderId;
            document.getElementById('orderStatus').value = status;
            document.getElementById('paymentMethod').value = payment;
            document.getElementById('validationAlert').style.display = 'none';

            checkOrderRestrictions(status, payment);
            
            $('#updateStatusModal').modal('show');
        }

        function checkOrderRestrictions(status, payment) {
            const statusSelect = document.getElementById('orderStatus');
            const paymentSelect = document.getElementById('paymentMethod');
            const validationAlert = document.getElementById('validationAlert');
            const validationMessage = document.getElementById('validationMessage');
            validationAlert.style.display = 'none';
            
            statusSelect.disabled = false;
            paymentSelect.disabled = false;

            if (status === 'COMPLETED') {
                statusSelect.disabled = true;
                paymentSelect.disabled = true;
                validationAlert.style.display = 'block'; // khối
                validationMessage.textContent = 'Đơn hàng đã hoàn thành, không thể chỉnh sửa!';
                return;
            }

            if (payment === 'VNPAY') {
                paymentSelect.disabled = true;
                validationAlert.style.display = 'block';
                validationMessage.textContent = 'Đơn hàng đã thanh toán bằng vnpay, không thể thay đổi phương thức thanh toán!';
            }
        }

        function submitUpdateStatus() {
            const orderId = document.getElementById('orderId').value;
            const status = document.getElementById('orderStatus').value;
            const paymentMethod = document.getElementById('paymentMethod').value;

            if (status === originalStatus && paymentMethod === originalPayment) {
                Swal.fire({
                    icon: 'info',
                    title: 'Không có thay đổi',
                    text: 'Bạn chưa thay đổi thông tin nào!'
                });
                return;
            }

            Swal.fire({
                title: 'Xác nhận cập nhật',
                text: 'Bạn có chắc chắn muốn cập nhật đơn hàng này?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Cập nhật',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({ title: "Đang cập nhật...", buttons: false, closeOnClickOutside: false });

                    $.ajax({
                        url: '${pageContext.request.contextPath}/admin/updateOrder',
                        type: 'POST',
                        data: {
                            orderId: orderId,
                            status: status,
                            paymentMethod: paymentMethod
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Thành công!',
                                    text: response.message,
                                    timer: 2000,
                                    showConfirmButton: false
                                }).then(() => {
                                    $('#updateStatusModal').modal('hide');
                                    location.reload();
                                });
                            } else {
                                Swal.fire({icon: 'error', title: 'Lỗi!', text: response.message});
                            }
                        },
                        error: function() {
                            Swal.fire({icon: 'error', title: 'Lỗi kết nối!', text: 'Không thể kết nối đến server.'});
                        }
                    });
                }
            });
        }

        $('#updateStatusModal').on('hidden.bs.modal', function () {
            document.getElementById('updateStatusForm').reset();
            document.getElementById('orderStatus').disabled = false;
            document.getElementById('paymentMethod').disabled = false;
            document.getElementById('validationAlert').style.display = 'none';
        });

        document.getElementById('orderStatus').addEventListener('change', function() {
            const newStatus = this.value;
            if (newStatus === 'COMPLETED' && originalStatus !== 'COMPLETED') {
                Swal.fire({
                    icon: 'warning',
                    title: 'Cảnh báo!',
                    text: 'Sau khi chuyển sang HOÀN THÀNH, bạn sẽ không thể sửa đơn hàng này nữa!',
                    showCancelButton: true,
                    confirmButtonText: 'Tôi đã hiểu',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (!result.isConfirmed) {
                        this.value = originalStatus;
                    }
                });
            }
        });

      
        function deleteOrder(orderId) {
            Swal.fire({
                title: 'Cảnh báo',
                text: 'Bạn có chắc chắn muốn xóa đơn hàng này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy bỏ',
                confirmButtonColor: '#d33'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Đang xóa...',
                        allowOutsideClick: false,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    });

                    $.ajax({
                        url: '${pageContext.request.contextPath}/admin/deleteOrder',
                        type: 'GET',
                        data: { id: orderId },
                        dataType: 'json',
                        success: function(data) {
                            if (data.success) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Đã xóa!',
                                    text: data.message,
                                    timer: 1500,
                                    showConfirmButton: false
                                }).then(() => {
                                    location.reload();
                                });
                            } else {
                                Swal.fire('Lỗi!', data.message, 'error');
                            }
                        },
                        error: function() {
                            Swal.fire('Lỗi!', 'Không thể kết nối server!', 'error');
                        }
                    });
                }
            });
        }



        function viewOrderDetail(orderId, event) {
            if (event.target.tagName === 'INPUT' || 
                event.target.tagName === 'BUTTON' || 
                event.target.tagName === 'I' ||
                event.target.tagName === 'SPAN' ||
                event.target.closest('button') ||
                event.target.closest('.badge')) {
                return;
            }
            
            const url = window.location.pathname.includes('/doc/') 
                ? '../viewOrder?id=' + orderId
                : 'viewOrder?id=' + orderId;
            window.location.href = url;
        }

        function formatCurrency(amount) {
            if (!amount) return '0đ';
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        }

        function printTable() {
            var divToPrint = document.getElementById('sampleTable');
            var newWin = window.open('', '', 'height=700,width=700');
            newWin.document.write('<html><head><title>Danh sách đơn hàng</title>');
            newWin.document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">');
            newWin.document.write('</head><body>');
            newWin.document.write('<h2>Danh sách đơn hàng</h2>');
            newWin.document.write(divToPrint.outerHTML);
            newWin.document.write('</body></html>');
            newWin.document.close();
            newWin.print();
        }
    </script>
</body>
</html>