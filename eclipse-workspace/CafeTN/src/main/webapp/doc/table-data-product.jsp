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

<title>Danh sách Sản phẩm | Quản trị Admin</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!-- or -->
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
	<header class="app-header">
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<ul class="app-nav">


			<li><a class="app-nav__item" href="/index.html"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
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
			<li><a class="app-menu__item " href="AdminHome"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>

			<li><a class="app-menu__item" href="HTU"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item haha" href=HTSP><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label ">Quản lý sản phẩm</span></a></li>
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

			<li><a class="app-menu__item" href="doc/quan-ly-bao-cao.jsp"><i
					class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
					class="app-menu__label">Báo cáo doanh thu</span></a></li>
			<li><a class="app-menu__item" href="doc/page-calendar.jsp"><i
					class='app-menu__icon bx bx-calendar-check'></i><span
					class="app-menu__label">Lịch công tác </span></a></li>

		</ul>
	</aside>
	<main class="app-content">
		<div class="app-title">
			<ul class="app-breadcrumb breadcrumb side">
				<li class="breadcrumb-item active"><a href="#"><b>Danh
							sách sản phẩm</b></a></li>
			</ul>
			<div id="clock"></div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<div class="row element-button">
							<div class="col-sm-2">

								<a class="btn btn-add btn-sm" href="addProduct" title="Thêm"><i
									class="fas fa-plus"></i> Tạo mới sản phẩm</a>
							</div>

							<div class="col-sm-2">
								<a class="btn btn-delete btn-sm pdf-file" type="button"
									title="In" onclick="myFunction(this)"><i
									class="fas fa-file-pdf"></i> Xóa</a>
							</div>

						</div>
						<table class="table table-hover table-bordered" id="sampleTable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" id="all"></th>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Ảnh</th>
									<th>Số lượng</th>
									<th>Tình trạng</th>
									<th>Giá tiền</th>
									<th>Danh mục</th>
									<th>Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${listP}">
									<tr>
										<td width="10"><input type="checkbox" name="check1"
											value="1"></td>
										<td>${p.id}</td>
										<td>${p.name}</td>
										<td><img
											src="${pageContext.request.contextPath}/${p.imageUrl}"
											alt="${p.name}" width="100px;"></td>
										<td>${p.stockQuantity}</td>
										<td><span class="badge bg-success">Còn hàng</span></td>
										<td><fmt:formatNumber value="${p.price}" type="number"
												pattern="#,##0" />đ</td>
										<td>${p.categoryName}</td>
										<td>
											<button class="btn btn-primary btn-sm trash" type="button"
												title="Xóa" onclick="deleteProduct(${p.id})">
												<i class="fas fa-trash-alt"></i>
											</button>
											<button class="btn btn-primary btn-sm edit"
												onclick="editProduct(this)" data-id="${p.id}"
												data-name="${p.name}" data-price="${p.price}"
												data-stock="${p.stockQuantity}"
												data-category="${p.categoryId}"
												data-image="${pageContext.request.contextPath}/${p.imageUrl}">

												<i class="fas fa-edit"></i>
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

	<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="form-group col-md-12">
							<span class="thong-tin-thanh-toan">
								<h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>
							</span>
						</div>
					</div>

					<form id="updateProductForm" enctype="multipart/form-data">
						<input type="hidden" id="productId" name="productId"> <input
							type="hidden" id="oldImageUrl" name="oldImageUrl">

						<div class="row">
							<div class="form-group col-md-6">
								<label class="control-label">Mã sản phẩm</label> <input
									class="form-control" type="text" id="productCode" readonly>
							</div>

							<div class="form-group col-md-6">
								<label class="control-label">Tên sản phẩm</label> <input
									class="form-control" type="text" id="productName"
									name="productName" required>
							</div>

							<div class="form-group col-md-6">
								<label class="control-label">Số lượng</label> <input
									class="form-control" type="number" id="stockQuantity"
									name="stockQuantity" required min="0">
							</div>

							<div class="form-group col-md-6">
								<label class="control-label">Tình trạng sản phẩm</label> <select
									class="form-control" id="productStatus" name="status">
									<option value="available">Còn hàng</option>
									<option value="out_of_stock">Hết hàng</option>
									<option value="importing">Đang nhập hàng</option>
								</select>
							</div>

							<div class="form-group col-md-6">
								<label class="control-label">Giá bán</label> <input
									class="form-control" type="number" id="price" name="price"
									required min="0" step="1000">
							</div>

							<div class="form-group col-md-6">
								<label class="control-label">Danh mục</label> <select
									class="form-control" id="categoryId" name="categoryId" required>
									<c:forEach var="cat" items="${listC}">
										<option value="${cat.id}">${cat.name}</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group col-md-12">
								<label class="control-label">Ảnh sản phẩm</label>

								<div id="currentImageContainer" style="margin-bottom: 15px;">
									<label
										style="font-weight: 600; color: #333; margin-bottom: 8px; display: block;">Ảnh
										hiện tại:</label> <img id="currentImage" src="" alt="Current Image"
										style="max-width: 200px; max-height: 200px; border: 2px solid #ddd; padding: 5px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
								</div>

								<input class="form-control" type="file" id="productImage"
									name="productImage" accept="image/*"> <small
									class="form-text text-muted"> Để trống nếu không muốn
									thay đổi ảnh. Chấp nhận: JPG, PNG, GIF (tối đa 10MB) </small>

								<div id="newImagePreview"
									style="margin-top: 15px; display: none;">
									<label
										style="font-weight: 600; color: #007bff; margin-bottom: 8px; display: block;">
										<i class="fas fa-sync-alt"></i> Ảnh thay đổi:
									</label> <img id="previewImage" src="" alt="Preview"
										style="max-width: 200px; max-height: 200px; border: 2px solid #007bff; padding: 5px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 123, 255, 0.2);">
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<button class="btn btn-save" type="submit">Lưu lại</button>
							<button class="btn btn-cancel" type="button" data-dismiss="modal">Hủy
								bỏ</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/popper.min.js"></script>
	<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/pace.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/chart.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/dataTables.bootstrap.min.js"></script>


	<script>
	function deleteProduct(productId) {
	    Swal.fire({
	        title: 'Cảnh báo',
	        text: 'Bạn có chắc chắn muốn xóa sản phẩm này?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: 'Đồng ý',
	        cancelButtonText: 'Hủy',
	        confirmButtonColor: '#d33'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            Swal.fire({
	                title: 'Đang xóa...',
	                allowOutsideClick: false,
	                didOpen: () => Swal.showLoading()
	            });

	            $.ajax({
	                url: 'deleteProduct',
	                type: 'GET',
	                data: { id: productId },
	                dataType: 'json',
	                success: function (res) {
	                    if (res.success) {
	                        Swal.fire('Thành công!', res.message, 'success')
	                            .then(() => location.reload());
	                    } else {
	                        Swal.fire('Lỗi!', res.message, 'error');
	                    }
	                },
	                error: function () {
	                    Swal.fire('Lỗi!', 'Không thể kết nối server!', 'error');
	                }
	            });
	        }
	    });
	}

	function editProduct(btn) {
	    const id = $(btn).data('id');
        var priceRaw = $(btn).data('price');
        $('#price').val(parseInt(priceRaw));
	    $('#productId').val(id);

	    $('#productCode').val(id);

	    $('#productName').val($(btn).data('name'));
	    $('#stockQuantity').val($(btn).data('stock'));
	    $('#categoryId').val($(btn).data('category'));

	    const imageUrl = $(btn).data('image');
	    $('#currentImage').attr('src', imageUrl);
	    $('#oldImageUrl').val(imageUrl);

	    $('#ModalUP').modal('show');
	}

	$('#updateProductForm').submit(function (e) {
	    e.preventDefault();

	    Swal.fire({
	        title: 'Xác nhận',
	        text: 'Bạn có muốn cập nhật sản phẩm?',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonText: 'Cập nhật'
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	Swal.fire({
	        	    title: 'Đang cập nhật...',
	        	    allowOutsideClick: false,
	        	    didOpen: () => Swal.showLoading()
	        	});


	            let formData = new FormData(this);

	            $.ajax({
	                url: 'updateProduct',
	                type: 'POST',
	                data: formData,
	                processData: false,
	                contentType: false,
	                success: function (res) {
	                    if (res.success) {
	                        Swal.fire('Thành công!', res.message, 'success')
	                            .then(() => location.reload());
	                    } else {
	                        Swal.fire('Lỗi!', res.message, 'error');
	                    }
	                },
	                error: function () {
	                    Swal.fire('Lỗi!', 'Không thể kết nối server!', 'error');
	                }
	            });
	        }
	    });
	});


$('#ModalUP').on('hidden.bs.modal', function () {
    const form = document.getElementById('updateProductForm');
    if (form) {
        form.reset();
    }
    document.getElementById('newImagePreview').style.display = 'none';
    isSubmitting = false;
});

function time() {
    var today = new Date();
    var weekday = ["Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"];
    var day = weekday[today.getDay()];
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    if (dd < 10) dd = '0' + dd;
    if (mm < 10) mm = '0' + mm;
    document.getElementById("clock").innerHTML = '<span class="date">' + day + ', ' + dd + '/' + mm + '/' + yyyy + ' - ' + h + " giờ " + m + " phút " + s + " giây</span>";
    setTimeout("time()", 1000);
    
    function checkTime(i) {
        return i < 10 ? "0" + i : i;
    }
}

$('#all').click(function (e) {
    $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
    e.stopImmediatePropagation();
});

$('#productImage').change(function (event) {
    const input = event.target; 
    
    if (input.files && input.files[0]) {
        const reader = new FileReader(); 
        reader.onload = function (e) {
            $('#previewImage').attr('src', e.target.result);
            
            $('#newImagePreview').show(); 
        }

        reader.readAsDataURL(input.files[0]);
    } else {
        $('#newImagePreview').hide();
    }
});
</script>
</body>

</html>