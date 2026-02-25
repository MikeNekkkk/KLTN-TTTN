<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${blog != null ? 'Chỉnh sửa' : 'Thêm'}Blog</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin-assets/ADcss/main.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">

<link href="https://cdn.quilljs.com/1.3.7/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
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

<style>
.preview-image {
	max-width: 200px;
	max-height: 200px;
	margin-top: 10px;
	border-radius: 8px;
}

/* Custom Quill Editor Styles */
#editor-container {
	height: 500px;
	background: white;
	border-radius: 4px;
}

.ql-editor {
	font-size: 16px;
	min-height: 450px;
}

.ql-toolbar {
	background: #f8f9fa;
	border-radius: 4px 4px 0 0;
}

.ql-container {
	border-radius: 0 0 4px 4px;
}

.ql-editor img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 20px auto;
	border-radius: 8px;
}
</style>
</head>
<body class="app sidebar-mini rtl">
	<!-- Header -->
	<header class="app-header">
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"></a>
		<ul class="app-nav">
			<li><a class="app-nav__item" href="/index.jsp"><i
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
			<li><a class="app-menu__item" href="stock-management"> <i
					class="fa-solid fa-cart-flatbed "
					style="color: rgb(0, 28, 64); margin-right: 15px;"></i><span
					class="app-menu__label">Quản lý Nhập Xuất Kho</span>
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
				<li class="breadcrumb-item"><a href="blog">Quản lý Blog</a></li>
				<li class="breadcrumb-item">${blog != null ? 'Chỉnh sửa' : 'Thêm mới'}</li>
			</ul>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<h3 class="tile-title">${blog != null ? 'Chỉnh sửa' : 'Thêm mới'}
						Blog</h3>

					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>

					<div class="tile-body">
						<form method="post" action="blog" enctype="multipart/form-data"
							id="blogForm">
							<input type="hidden" name="action"
								value="${blog != null ? 'update' : 'add'}">
							<c:if test="${blog != null}">
								<input type="hidden" name="id" value="${blog.id}">
								<input type="hidden" name="oldThumbnail"
									value="${blog.thumbnailUrl}">
							</c:if>

							<div class="row">
								<!-- Tiêu đề -->
								<div class="form-group col-md-12">
									<label class="control-label">Tiêu đề <span
										class="text-danger">*</span></label> <input class="form-control"
										type="text" name="title"
										value="${blog != null ? blog.title : ''}" required
										maxlength="500">
								</div>
								<div class="form-group col-md-6">
									<label class="control-label">Danh mục</label> <select
										class="form-control" name="category">
										<option value="">-- Chọn danh mục --</option>
										<option value="News"
											${blog != null && blog.category == 'News' ? 'selected' : ''}>Tin
											mới nhất</option>
										<option value="Recipe"
											${blog != null && blog.category == 'Recipe' ? 'selected' : ''}>Công
											thức</option>
									</select>
								</div>

								<div class="form-group col-md-6">
									<label class="control-label">Trạng thái</label> <select
										class="form-control" name="status">
										<option value="DRAFT"
											${blog != null && blog.status == 'DRAFT' ? 'selected' : ''}>Nháp</option>
										<option value="PUBLISHED"
											${blog == null || blog.status == 'PUBLISHED' ? 'selected' : ''}>Đã
											đăng</option>
									</select>
								</div>

								<div class="form-group col-md-12">
									<label class="control-label">Ảnh bìa</label> <input
										class="form-control" type="file" name="thumbnail"
										accept="image/*" onchange="previewImage(this)">
									<c:if test="${blog != null}">
										<img
											src="${pageContext.request.contextPath}/${blog.thumbnailUrl}"
											class="preview-image" id="preview-old">

									</c:if>
									<img id="preview-new" class="preview-image"
										style="display: none;">
								</div>

								<!-- Tóm tắt -->
								<div class="form-group col-md-12">
									<label class="control-label">Tóm tắt</label>
									<textarea class="form-control" name="excerpt" rows="3"
										maxlength="500">${blog != null ? blog.excerpt : ''}</textarea>
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
									<i class="fa fa-save"></i> Lưu lại
								</button>
								<a class="btn btn-secondary" href="blog"> <i
									class="fa fa-times"></i> Hủy bỏ
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
	<script
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/pace.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin-assets/ADjs/plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    // --- 1. Cấu hình Quill Editor (Giữ nguyên) ---
    var quill = new Quill('#editor-container', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                [{ 'font': [] }],
                ['bold', 'italic', 'underline', 'strike'],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                [{ 'align': [] }],
                ['blockquote', 'code-block'],
                ['link', 'image', 'video'],
                ['clean']
            ]
        },
        placeholder: 'Nhập nội dung bài viết tại đây...'
    });

    <c:if test="${blog != null}">
        var existingContent = `${blog.content}`;
        quill.root.innerHTML = existingContent;
    </c:if>

    quill.getModule('toolbar').addHandler('image', function() {
        selectLocalImage();
    });

    function selectLocalImage() {
        const input = document.createElement('input');
        input.setAttribute('type', 'file');
        input.setAttribute('accept', 'image/*');
        input.click();

        $(input).on('change', function() {
            const file = input.files[0];
            if (file) {
                uploadImage(file);
            }
        });
    }

    function uploadImage(file) {
        var formData = new FormData();
        formData.append('upload', file);

        const range = quill.getSelection(true);
        quill.insertText(range.index, 'Đang tải ảnh...');

        $.ajax({
            url: '${pageContext.request.contextPath}/uploadImage',
            type: 'POST',
            data: formData,
            processData: false, 
            contentType: false,
            dataType: 'json', 
            success: function(result) {
                quill.deleteText(range.index, 15);

                if (result.uploaded) {
                    quill.insertEmbed(range.index, 'image', result.url);
                    quill.setSelection(range.index + 1);
                } else {
                    alert('Upload ảnh thất bại: ' + (result.error ? result.error.message : 'Lỗi không xác định'));
                }
            },
            error: function(xhr, status, error) {
                quill.deleteText(range.index, 15);
                console.log(xhr);
                alert('Lỗi server: ' + error);
            }
        });
    }

    $('#blogForm').on('submit', function(e) {
        const content = quill.root.innerHTML;
        
        if (quill.getText().trim().length === 0) {
            e.preventDefault(); 
            alert('Vui lòng nhập nội dung bài viết!');
            return false;
        }
        
        $('#content-input').val(content);
        
    });

    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#preview-old').hide();         
                $('#preview-new').attr('src', e.target.result).show();
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

</script>
</body>
</html>