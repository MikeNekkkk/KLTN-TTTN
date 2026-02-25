<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lý Nhập Xuất Kho - Admin</title>

<!-- CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
	background: #f5f5f5;
	font-family: 'Arial', sans-serif;
}

.header {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	padding: 30px 0;
	margin-bottom: 30px;
}

.stats-card {
	background: white;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s;
}

.stats-card:hover {
	transform: translateY(-5px);
}

.stats-card .icon {
	font-size: 40px;
	margin-bottom: 10px;
}

.stats-card.total {
	border-left: 5px solid #3498db;
}

.stats-card.low {
	border-left: 5px solid #e74c3c;
}

.stats-card.ok {
	border-left: 5px solid #2ecc71;
}

.stats-card.value {
	border-left: 5px solid #f39c12;
}

.action-card {
	background: white;
	border-radius: 10px;
	padding: 25px;
	margin-bottom: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.product-table {
	background: white;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.badge-stock {
	padding: 5px 10px;
	border-radius: 15px;
	font-size: 12px;
	font-weight: bold;
}

.stock-out {
	background: #e74c3c;
	color: white;
}

.stock-low {
	background: #f39c12;
	color: white;
}

.stock-medium {
	background: #3498db;
	color: white;
}

.stock-ok {
	background: #2ecc71;
	color: white;
}

.btn-action {
	margin: 2px;
	padding: 5px 15px;
	font-size: 13px;
}

.modal-header {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
}

.log-item {
	border-left: 3px solid #3498db;
	padding: 10px;
	margin-bottom: 10px;
	background: #f8f9fa;
}

.log-in {
	border-left-color: #2ecc71;
}

.log-out {
	border-left-color: #e74c3c;
}
</style>
</head>
<body>

	<!-- Header -->
	<div class="header">
		<div class="container">
			<h1>
				<i class="fa fa-cubes"></i> Quản lý Nhập Xuất Kho
			</h1>
			<p>Theo dõi và quản lý tồn kho sản phẩm</p>
		</div>
	</div>

	<div class="container">
		<!-- Thông báo -->
		<c:if test="${not empty sessionScope.success}">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<i class="fa fa-check-circle"></i> ${sessionScope.success}
			</div>
			<c:remove var="success" scope="session" />
		</c:if>

		<c:if test="${not empty sessionScope.error}">
			<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<i class="fa fa-exclamation-circle"></i> ${sessionScope.error}
			</div>
			<c:remove var="error" scope="session" />
		</c:if>

		<!-- Thống kê -->
		<div class="row">
			<div class="col-md-3">
				<div class="stats-card total">
					<div class="icon">
						<i class="fa fa-cubes text-primary"></i>
					</div>
					<h3>${products.size()}</h3>
					<p>Tổng sản phẩm</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stats-card low">
					<div class="icon">
						<i class="fa fa-exclamation-triangle text-danger"></i>
					</div>
					<h3>
						<c:set var="lowCount" value="0" />
						<c:forEach var="p" items="${products}">
							<c:if test="${p.stockQuantity < 10}">
								<c:set var="lowCount" value="${lowCount + 1}" />
							</c:if>
						</c:forEach>
						${lowCount}
					</h3>
					<p>Sắp hết hàng</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stats-card ok">
					<div class="icon">
						<i class="fa fa-check-circle text-success"></i>
					</div>
					<h3>
						<c:set var="okCount" value="0" />
						<c:forEach var="p" items="${products}">
							<c:if test="${p.stockQuantity >= 50}">
								<c:set var="okCount" value="${okCount + 1}" />
							</c:if>
						</c:forEach>
						${okCount}
					</h3>
					<p>Đủ hàng</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="stats-card value">
					<div class="icon">
						<i class="fa fa-money text-warning"></i>
					</div>
					<h3>
						<c:set var="totalValue" value="0" />
						<c:forEach var="p" items="${products}">
							<c:set var="totalValue"
								value="${totalValue + (p.stockQuantity * p.price)}" />
						</c:forEach>
						<fmt:formatNumber value="${totalValue / 1000000}" pattern="#,##0" />
						M
					</h3>
					<p>Giá trị tồn kho</p>
				</div>
			</div>
		</div>

		<!-- Nút hành động nhanh -->
		<div class="row">
			<div class="col-md-12">
				<div class="action-card">
					<h4>
						<i class="fa fa-bolt"></i> Hành động nhanh
					</h4>
					<hr>
					<button class="btn btn-success" data-toggle="modal"
						data-target="#importModal">
						<i class="fa fa-plus"></i> Nhập kho
					</button>
					<button class="btn btn-warning" data-toggle="modal"
						data-target="#exportModal">
						<i class="fa fa-minus"></i> Xuất kho
					</button>
					<a href="stock-management?action=low-stock" class="btn btn-danger">
						<i class="fa fa-exclamation-triangle"></i> Sản phẩm sắp hết
					</a> <a href="stock-management?action=view-log" class="btn btn-info">
						<i class="fa fa-history"></i> Lịch sử nhập xuất
					</a>
					<button class="btn btn-primary" onclick="exportToExcel()">
						<i class="fa fa-file-excel-o"></i> Xuất Excel
					</button>
				</div>
			</div>
		</div>

		<!-- Bảng sản phẩm -->
		<div class="product-table">
			<h4>
				<i class="fa fa-list"></i> Danh sách sản phẩm
			</h4>
			<hr>

			<!-- Search -->
			<div class="form-group">
				<input type="text" id="searchInput" class="form-control"
					placeholder="🔍 Tìm kiếm sản phẩm...">
			</div>

			<div class="table-responsive">
				<table class="table table-hover" id="productTable">
					<thead style="background: #f8f9fa;">
						<tr>
							<th>ID</th>
							<th>Tên sản phẩm</th>
							<th>Giá</th>
							<th>Tồn kho</th>
							<th>Trạng thái</th>
							<th>Giá trị kho</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${products}">
							<tr>
								<td>${product.id}</td>
								<td><strong>${product.name}</strong></td>
								<td><fmt:formatNumber value="${product.price}"
										pattern="#,##0" />₫</td>
								<td><span style="font-size: 18px; font-weight: bold;">
										${product.stockQuantity} </span></td>
								<td><c:choose>
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
								<td>
									<button class="btn btn-sm btn-success btn-action"
										onclick="openImportModal(${product.id}, '${product.name}')">
										<i class="fa fa-plus"></i> Nhập
									</button>
									<button class="btn btn-sm btn-warning btn-action"
										onclick="openExportModal(${product.id}, '${product.name}', ${product.stockQuantity})">
										<i class="fa fa-minus"></i> Xuất
									</button>
									<button class="btn btn-sm btn-info btn-action"
										onclick="openAdjustModal(${product.id}, '${product.name}', ${product.stockQuantity})">
										<i class="fa fa-edit"></i> Điều chỉnh
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Lịch sử gần đây -->
		<div class="product-table" style="margin-top: 30px;">
			<h4>
				<i class="fa fa-clock-o"></i> Hoạt động gần đây
			</h4>
			<hr>

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

		<!-- Modal Nhập kho -->
		<div class="modal fade" id="importModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form method="post" action="stock-management">
						<input type="hidden" name="action" value="import"> <input
							type="hidden" name="productId" id="importProductId">

						<div class="modal-header">
							<h5 class="modal-title">
								<i class="fa fa-plus"></i> Nhập kho
							</h5>
							<button type="button" class="close text-white"
								data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label>Sản phẩm</label> <select class="form-control"
									name="productId" id="importProductSelect" required>
									<option value="">-- Chọn sản phẩm --</option>
									<c:forEach var="p" items="${products}">
										<option value="${p.id}">${p.name}(Tồn:
											${p.stockQuantity})</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group">
								<label>Số lượng nhập <span class="text-danger">*</span></label>
								<input type="number" class="form-control" name="quantity"
									min="1" required placeholder="Nhập số lượng">
							</div>

							<div class="form-group">
								<label>Ghi chú</label>
								<textarea class="form-control" name="note" rows="3"
									placeholder="Ví dụ: Nhập từ nhà cung cấp ABC"></textarea>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Hủy</button>
							<button type="submit" class="btn btn-success">
								<i class="fa fa-check"></i> Xác nhận nhập
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Modal Xuất kho -->
		<div class="modal fade" id="exportModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form method="post" action="stock-management">
						<input type="hidden" name="action" value="export"> <input
							type="hidden" name="productId" id="exportProductId">

						<div class="modal-header">
							<h5 class="modal-title">
								<i class="fa fa-minus"></i> Xuất kho
							</h5>
							<button type="button" class="close text-white"
								data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label>Sản phẩm</label> <select class="form-control"
									name="productId" id="exportProductSelect" required>
									<option value="">-- Chọn sản phẩm --</option>
									<c:forEach var="p" items="${products}">
										<option value="${p.id}">${p.name}(Tồn:
											${p.stockQuantity})</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group">
								<label>Số lượng xuất <span class="text-danger">*</span></label>
								<input type="number" class="form-control" name="quantity"
									min="1" required placeholder="Nhập số lượng"> <small
									class="form-text text-muted" id="currentStockText"></small>
							</div>

							<div class="form-group">
								<label>Lý do xuất <span class="text-danger">*</span></label>
								<textarea class="form-control" name="note" rows="3" required
									placeholder="Ví dụ: Hàng hư hỏng, khuyến mãi, ..."></textarea>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Hủy</button>
							<button type="submit" class="btn btn-warning">
								<i class="fa fa-check"></i> Xác nhận xuất
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Modal Điều chỉnh -->
		<div class="modal fade" id="adjustModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form method="post" action="stock-management">
						<input type="hidden" name="action" value="adjust"> <input
							type="hidden" name="productId" id="adjustProductId">

						<div class="modal-header bg-info text-white">
							<h5 class="modal-title">
								<i class="fa fa-edit"></i> Điều chỉnh tồn kho
							</h5>
							<button type="button" class="close text-white"
								data-dismiss="modal">
								<span>&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="alert alert-warning">
								<i class="fa fa-exclamation-triangle"></i> Chức năng này dùng để
								điều chỉnh trực tiếp số tồn kho. Chỉ sử dụng khi cần thiết!
							</div>

							<div class="form-group">
								<label>Sản phẩm</label>
								<p id="adjustProductName" style="font-weight: bold;"></p>
							</div>

							<div class="form-group">
								<label>Tồn kho hiện tại</label>
								<p id="adjustCurrentStock"
									style="font-size: 24px; color: #3498db; font-weight: bold;"></p>
							</div>

							<div class="form-group">
								<label>Tồn kho mới <span class="text-danger">*</span></label> <input
									type="number" class="form-control" name="newStock" min="0"
									required placeholder="Nhập số tồn kho mới">
							</div>

							<div class="form-group">
								<label>Lý do điều chỉnh <span class="text-danger">*</span></label>
								<textarea class="form-control" name="note" rows="3" required
									placeholder="Ví dụ: Kiểm kê lại kho, ..."></textarea>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Hủy</button>
							<button type="submit" class="btn btn-info">
								<i class="fa fa-check"></i> Xác nhận điều chỉnh
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Scripts -->
		<script src="../js/jquery-3.2.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script>
    // Search function
    $(document).ready(function(){
        $("#searchInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#productTable tbody tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
    
    // Open import modal
    function openImportModal(productId, productName) {
        $('#importProductSelect').val(productId);
        $('#importModal').modal('show');
    }
    
    // Open export modal
    function openExportModal(productId, productName, currentStock) {
        $('#exportProductSelect').val(productId);
        $('#currentStockText').text('Tồn kho hiện tại: ' + currentStock);
        $('#exportModal').modal('show');
    }
    
    // Open adjust modal
    function openAdjustModal(productId, productName, currentStock) {
        $('#adjustProductId').val(productId);
        $('#adjustProductName').text(productName);
        $('#adjustCurrentStock').text(currentStock);
        $('#adjustModal').modal('show');
    }
    
    // Export to Excel
    function exportToExcel() {
        window.location.href = 'stock-management?action=export-excel';
    }
</script>
</body>
</html>
