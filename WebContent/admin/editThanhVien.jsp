<%@page import="bean.ThanhVien"%>
<%@page import="bean.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<%
			if ("0".equals(request.getParameter("msg"))) {
		%>
		<p style="color: red; font-weight: bold">Không thể thêm khi trùng tên</p>
		<%
			}
		%>
	<div class="module">
		 <h2><span>Thêm dự án</span></h2>
		<%
			int idT = Integer.parseInt(request.getParameter("idT"));
			ThanhVien thanhvien=(ThanhVien)request.getAttribute("thanhvien");
		%>
		 <div class="module-body">
			<form
				action="<%=request.getContextPath()%>/admin/editThanhVien?idT=<%=idT%>&type=submit"
				enctype="multipart/form-data" method="post" id="frm">
				<p>
					<label>NickName</label>
					<input type="text" name="nickname" value="<%=thanhvien.getNickname() %>" class="input-medium" required pattern="^[\s a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$" />
				</p>
				<p>
					<label>FullName</label>
					<input type="text" name="fullname" value="<%=thanhvien.getFullname() %>" class="input-medium" required pattern="^[\s a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$" />
				</p>
				<p>
					<label>Địa chỉ</label>
					<input type="text" name="diachi" value="<%=thanhvien.getDiachi() %>" class="input-medium" required />
				<p>
					<label>Địện thoại</label>
					<input type="text" name="dienthoai" value="<%=thanhvien.getDienthoai() %>" class="input-medium" required  />
				</p>
				<p>
					<label>Công việc</label>
					<input type="text" name="congviec" value="<%=thanhvien.getCongviec() %>" class="input-medium" required  />
				</p>
				<p>
					<label>Hình ảnh</label> 
					<%
						if (thanhvien.getHinhanh() != null) {
					%>
					<img id="previewImg"
						src="<%=request.getContextPath()%>/files/<%=thanhvien.getHinhanh()%>"
						alt="img" height="108" width="180" />
					<%
						} else {
					%>
					<img id="previewImg" src="#" alt="img" height="108" width="180" />
					<%
						}
					%>
					<br/>
					<input type="file" name="picture" value=""
						id="imgInp" style="margin-bottom: 10px"/>
					<label><a href="<%=request.getContextPath()%>/admin/editThanhVien?idT=<%=thanhvien.getIdGroup()%>&type=load&delImage=true" class="button">
						<span>Bỏ chọn <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Bỏ chọn"></span>
					</a></label>
				</p>
				<br/>
				<p>
					<label>Email</label>
					<input type="text" name="email" value="<%=thanhvien.getEmail() %>" class="input-medium" required />
				</p>
				<p>
					<label>Link</label>
					<input type="text" name="link" value="<%=thanhvien.getLink() %>" class="input-medium" required />
				</p>
				
				
				<fieldset>
					<input class="submit-green" name="submit" type="submit" value="Sửa" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
			
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
	<script>
	
	$(document)
			.ready(
					function() {
						$("#frm")
								.validate(
										{
											ignore : [],
											debug : false,
											rules : {
												name : {
													required : true,
												},
												mota : {
													required : function() {
														CKEDITOR.instances.preview_text
																.updateElement();
													},
													minlength : 10,
												},
											
											},
											messages : {
												name : {
													required : "<span style=\"color: red; font-weight: bold;\">Vui lòng nhập tên tin</span>",
												},
												mota : {
													required : "<span style=\"color: red; font-weight: bold;\">Vui lòng nhập mô tả</span>",
													minlength : "<span style=\"color: red; font-weight: bold;\">Độ dài ít nhất 10</span>"
												},
												
											}
										});
					});

	function readURL(input) {

		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#previewImg').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imgInp").change(function() {
		readURL(this);
	});
</script>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 