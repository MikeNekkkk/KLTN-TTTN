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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="http://code.jquery.com/jquery.min.js"
	type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


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
			<li><a class="app-menu__item" href="listOrders"><i
					class='app-menu__icon bx bx-task'></i><span class="app-menu__label">  Quản
						lý đơn hàng</span></a></li>

			<li><a class="app-menu__item haha" href="stock-management">
					<i class="fa-solid fa-cart-flatbed " style = " color: rgb(0, 28, 64);margin-right: 15px;"></i><span class="app-menu__label">Quản lý Nhập Xuất Kho</span>
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
										<h4>Tổng sản phẩm</h4>
										<p>
											<b>${products.size()}</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small warning">
									<i class='icon bx bx-time fa-3x'></i>
									<div class="info">
										<h4>Sắp hết hàng</h4>
										<p>
											<c:set var="lowCount" value="0" />
											<c:forEach var="p" items="${products}">
												<c:if test="${p.stockQuantity < 10}">
													<c:set var="lowCount" value="${lowCount + 1}" />
												</c:if>
											</c:forEach>

											<b>${lowCount}</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small info">
									<i class='icon bx bx-check-circle fa-3x'></i>
									<div class="info">
										<h4>Đủ Hàng</h4>
										<p>
											<c:set var="okCount" value="0" />
											<c:forEach var="p" items="${products}">
												<c:if test="${p.stockQuantity > 100}">
													<c:set var="okCount" value="${okCount + 1}" />
												</c:if>
											</c:forEach>
											<b>${okCount}</b>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-small info">
									<i class='icon bx bx-money fa-3x'></i>
									<div class="info">
										<h4>Giá trị tồn kho</h4>
										<p>
											<c:set var="totalValue" value="0" />

											<c:forEach var="p" items="${products}">
												<c:set var="totalValue"
													value="${totalValue + (p.stockQuantity * p.price)}" />
											</c:forEach>

											<fmt:formatNumber value="${totalValue}" pattern="#,##0" />
											VNĐ
										</p>
									</div>
								</div>
							</div>
						</div>



						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr role="row">
									<th width="10" class="sorting" tabindex="0"
										aria-controls="sampleTable" rowspan="1" colspan="1"
										aria-label=": activate to sort column ascending"
										style="width: 13px;"><input type="checkbox" id="all"></th>
									<th class="sorting_asc" tabindex="0"
										aria-controls="sampleTable" rowspan="1" colspan="1"
										aria-label="ID: activate to sort column descending"
										style="width: 13px;" aria-sort="ascending">ID</th>
									<th class="sorting" tabindex="0" aria-controls="sampleTable"
										rowspan="1" colspan="1"
										aria-label="Tên sản phẩm: activate to sort column ascending"
										style="width: 190px;">Tên sản phẩm</th>
									<th class="sorting text-center" tabindex="0"
										aria-controls="sampleTable" rowspan="1" colspan="1"
										aria-label="Giá: activate to sort column ascending"
										style="width: 55px;">Giá</th>
									<th class="sorting" tabindex="0" aria-controls="sampleTable"
										rowspan="1" colspan="1"
										aria-label="Tồn kho: activate to sort column ascending"
										style="width: 45px;">Tồn kho</th>
									<th class="sorting center-text" tabindex="0"
										aria-controls="sampleTable" rowspan="1" colspan="1"
										aria-label="Trạng thái: activate to sort column ascending"
										style="width: 55px;">Trạng thái</th>
									<th class="sorting text-center" tabindex="0"
										aria-controls="sampleTable" rowspan="1" colspan="1"
										aria-label="Giá trị kho: activate to sort column ascending"
										style="width: 77px;">Giá trị kho</th>
									<th class="sorting" tabindex="0" aria-controls="sampleTable"
										rowspan="1" colspan="1"
										aria-label="Thao tác: activate to sort column ascending"
										style="width: 60px;">Thao tác</th>
							</thead>
							<tbody>
								<c:forEach var="product" items="${products}">
									<tr onclick="viewOrderDetail(${product.id}, event)">
										<td width="10" onclick="event.stopPropagation();"><input
											type="checkbox" name="check1" value="1"></td>
										<td class="text-center">${product.id}</td>
										<td>${product.name}</td>

										<td><fmt:formatNumber value="${product.price}"
												pattern="#,###" />đ</td>
										<td class="text-center">${product.stockQuantity}</td>

										<td class="text-center"><c:choose>
												<c:when test="${product.stockQuantity == 0}">
													<span class="badge-stock stock-out">HẾT HÀNG</span>
												</c:when>
												<c:when test="${product.stockQuantity < 10}">
													<span class="badge-stock stock-low">SẮP HẾT</span>
												</c:when>
												<c:when test="${product.stockQuantity < 50}">
													<span class="badge-stock stock-medium">ÍT</span>
												</c:when>
												<c:otherwise>
													<span class="badge-stock stock-ok">ĐỦ</span>
												</c:otherwise>
											</c:choose></td>
										<td><fmt:formatNumber
												value="${product.stockQuantity * product.price}"
												pattern="#,##0" />₫</td>

										<td class="table-td-center" onclick="event.stopPropagation();">
											<button class="btn btn-primary btn-sm edit" type="button"
												title="Nhap" data-id="${product.id}"
												data-categoryId="${product.categoryId}"
												data-name="${product.name}"
												data-detailDescription="${product.detailDescription}"
												data-imageUrl="${product.imageUrl}"
												data-stockQuantity="${product.stockQuantity}"
												data-categoryName="${product.categoryName}"
												data-status="${product.status}"
												onclick="openEditModal(this); event.stopPropagation();">
												<i class="fas fa-edit"></i>
											</button>

											<button class="btn btn-primary btn-sm trash" type="button"
												title="Xuat" data-id="${product.id}"
												data-categoryId="${product.categoryId}"
												data-name="${product.name}"
												data-detailDescription="${product.detailDescription}"
												data-imageUrl="${product.imageUrl}"
												data-stockQuantity="${product.stockQuantity}"
												data-categoryName="${product.categoryName}"
												data-status="${product.status}"
												onclick="xuat(this); event.stopPropagation();">

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
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Hoạt
							động gần đây</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<c:if test="${empty recentLogs}">
							<p class="text-muted">Chưa có hoạt động nào</p>
						</c:if>
						<c:forEach var="log" items="${recentLogs}">
							<div class="log-item ${log['import'] ? 'log-in' : 'log-out'}">
								<div class="row">
									<div class="col-md-8">
										<strong>${log.productName}</strong>

										<c:if test="${log['import']}">
											<span class="text-success"> <i class="fa fa-arrow-up"></i>
												+${log.quantity}
											</span>
										</c:if>

										<c:if test="${!log['import']}">
											<span class="text-danger"> <i class="fa fa-arrow-down"></i>
												-${log.quantity}
											</span>
										</c:if>
										<br> <small class="text-muted">${log.note}</small>
									</div>
									<div class="col-md-4 text-right">
										<small class="text-muted"> <i class="fa fa-user"></i>
											${log.createdBy}<br> <i class="fa fa-calendar"></i> <fmt:formatDate
												value="${log.createdAt}" pattern="dd/MM/yyyy HH:mm" />
										</small>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</main>

	<div class="modal fade" id="importStockModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title">
						<i class="fas fa-edit"></i> Nhập Kho sản phẩm #<span
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
							<strong><i class="fas fa-user"></i> Thông Tin Sản phẩm</strong>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<p class="mb-2">
										<strong>Id:</strong> <span id="displayOrderId"
											class="text-danger font-weight-bold"></span>
									</p>
									<p class="mb-2">
										<strong>Tên:</strong> <span id="customerName"
											class="text-primary"></span>
									</p>
									<p class="mb-2">
										<strong>Loại sản phẩm:</strong> <span id="customerEmail"></span>
									</p>

								</div>
								<div class="col-md-6">
									<p class="mb-2">
										<strong>Trạng Thái:</strong> <span id="customerCity"></span>
									</p>
									<p class="mb-2">
										<strong>Số lượng tồn kho:</strong> <span id="customerAddress"></span>
									</p>

									<p class="mb-2">
										<strong>Giá:</strong> <span id="orderTotal"
											class="text-danger font-weight-bold"></span>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header bg-light">
							<strong><i class="fas fa-cog"></i>Nhập Kho</strong>
						</div>
						<div class="card-body">
							<form id="updateStatusForm">
								<input type="hidden" id="productId_input" name="productId">

								<div class="form-group">
									<label>Số lượng nhập thêm <span class="text-danger">*</span>:
									</label> <input type="number" class="form-control" name="quantity"
										min="1" required placeholder="Nhập số lượng muốn thêm vào kho">
								</div>

								<div class="form-group">
									<label>Ghi chú:</label>
									<textarea class="form-control" name="note" rows="3"
										placeholder="Ví dụ: Nhập hàng đợt 1..."></textarea>
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
	<div class="modal fade" id="exportStockModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning text-white">
					<h5 class="modal-title">
						<i class="fas fa-file-export"></i> Xuất Kho sản phẩm #<span
							id="displayOrderId_out"></span>
					</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card mb-3">
						<div class="card-header bg-light">
							<strong><i class="fas fa-info-circle"></i> Thông Tin Sản
								phẩm</strong>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<p>
										<strong>ID:</strong> <span id="productId_disp_out"
											class="text-danger font-weight-bold"></span>
									</p>
									<p>
										<strong>Tên:</strong> <span id="productName_out"
											class="text-primary"></span>
									</p>
									<p>
										<strong>Loại:</strong> <span id="categoryName_out"></span>
									</p>
								</div>
								<div class="col-md-6">
									<p>
										<strong>Trạng Thái:</strong> <span id="status_out"></span>
									</p>
									<p>
										<strong>Tồn kho hiện tại:</strong> <span id="stock_out"
											class="font-weight-bold"></span>
									</p>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header bg-light">
							<strong><i class="fas fa-sign-out-alt"></i> Chi tiết
								Xuất Kho</strong>
						</div>
						<div class="card-body">
							<form id="exportForm" method="POST"
								action="stock-management?action=export">
								<input type="hidden" id="productIdInput_out" name="productId">

								<div class="form-group">
									<label>Số lượng xuất <span class="text-danger">*</span>:
									</label> <input type="number" class="form-control" name="quantity"
										min="1" required placeholder="Nhập số lượng xuất">
								</div>

								<div class="form-group">
									<label>Ghi chú:</label>
									<textarea class="form-control" name="note" rows="3"
										placeholder="Ví dụ: Xuất bán hàng, xuất hủy..."></textarea>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<button type="button" class="btn btn-warning"
						onclick="submitExportForm()">
						<i class="fas fa-check"></i> Xác nhận Xuất
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

       

        function openEditModal(button) {
            const id = button.getAttribute('data-id');
            const name = button.getAttribute('data-name');
            const category = button.getAttribute('data-categoryName');
            const stock = button.getAttribute('data-stockQuantity');
            const status = button.getAttribute('data-status');

            $('#displayOrderId').text(id);
            $('#customerPhone').text(id);           
            $('#customerName').text(name);          
            $('#customerEmail').text(category);     
            $('#customerCity').text(status);        
            $('#customerAddress').text(stock);      

            $('#productId_input').val(id); 

            $('#importStockModal').modal('show');
        }

        function submitUpdateStatus() {
            var form = document.getElementById('updateStatusForm');
            form.action = "stock-management?action=import"; 
            form.method = "POST";
            form.submit();
        }
	        function xuat(button) {
	            const id = button.getAttribute('data-id');
	            const name = button.getAttribute('data-name');
	            const category = button.getAttribute('data-categoryName');
	            const stock = button.getAttribute('data-stockQuantity');
	            const status = button.getAttribute('data-status');

	            $('#displayOrderId_out').text(id);
	            $('#productId_disp_out').text(id);
	            $('#productName_out').text(name);
	            $('#categoryName_out').text(category);
	            $('#status_out').text(status);
	            $('#stock_out').text(stock);

	            $('#productIdInput_out').val(id);

	            $('#exportStockModal').modal('show');
	        }

	        function submitExportForm() {
	            var qty = $('#exportForm input[name="quantity"]').val();
	            var currentStock = parseInt($('#stock_out').text());
	            
	            if(!qty || qty <= 0) {
	                alert("Vui lòng nhập số lượng hợp lệ");
	                return;
	            }
	            if(parseInt(qty) > currentStock) {
	                alert("Lỗi: Số lượng xuất lớn hơn tồn kho hiện có (" + currentStock + ")");
	                return;
	            }

	            document.getElementById('exportForm').submit();
	        }      
        function formatCurrency(amount) {
            if (!amount) return '0đ';
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        }

      
    </script>
</body>
</html>