<%@page import="bean.ThanhVien"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
	  	<%
			if ("1".equals(request.getParameter("msg"))) {
		%>
		<p style="color: green; font-weight: bold">Thêm thành công</p>
		<%
			}
		%>
		<%
			if ("1".equals(request.getParameter("emsg"))) {
		%>
		<p style="color: green; font-weight: bold">Sửa thành công</p>
		<%
			}
		%>
		
		 <%
			if ("1".equals(request.getParameter("del"))) {
		%>
		<p style="color: green; font-weight: bold">Xóa thành công</p>
		<%
			}
		%>
		<%
			if ("0".equals(request.getParameter("del"))) {
		%>
		<p style="color: green; font-weight: bold">Xóa không thành công</p>
		<%
			}
		%>
		  <a href="<%=request.getContextPath() %>/admin/addThanhVien?type=load" class="button">
			<span>Thêm Thành Viên <img src="<%=request.getContextPath() %>/templates/admin/images/plus-small.gif" alt="Thêm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách Thành Viên</span></h2>
		
		<div class="module-table-body">
			<form action="">
			<%
				ArrayList<ThanhVien> alThanhVien=(ArrayList<ThanhVien>)request.getAttribute("alThanhVien");
					
			%>
			<table id="myTable" class="tablesorter">
				<thead>
					
					<tr>
						<th style="width:4%; text-align: center;">ID_Group</th>
						<th>NickName</th>
						<th style="width:20%">FullName</th>
						<th style="width:20%">Địa chỉ</th>
						<th style="width:20%">Điện thoại</th>
						<th style="width:20%">Công việc</th>
						<th style="width:16%; text-align: center;">Hình ảnh</th>
						<th style="width:20%">Email</th>
						<th style="width:20%">Link</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				
				</thead>
				<tbody>
					<%
					if(alThanhVien!=null){
						for(ThanhVien objThanhVien: alThanhVien){
					
					%>
					<tr>
						<td class="align-center"><%=objThanhVien.getIdGroup()%></td>
						<td><%=objThanhVien.getNickname()%></td>
						<td><a href="<%=request.getContextPath() %>/admin/editThanhVien?idT=<%=objThanhVien.getIdGroup()%>"><%=objThanhVien.getFullname() %></a></td>
						<td><%=objThanhVien.getDiachi()%></td>
						<td><%=objThanhVien.getDienthoai() %></td>
						<td><%=objThanhVien.getCongviec()%></td>
						<td align="center"><img src="<%=request.getContextPath() %>/files/<%=objThanhVien.getHinhanh() %>" class="hoa" /></td>
						<td><%=objThanhVien.getEmail() %></td>
						<td><%=objThanhVien.getLink()%></td>
						<td align="center">
							<a href="<%=request.getContextPath() %>/admin/editThanhVien?idT=<%=objThanhVien.getIdGroup()%>">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<a href="<%=request.getContextPath() %>/admin/delThanhVien?idT=<%=objThanhVien.getIdGroup()%>" onclick="return confirm('Are you sure?')">Xóa<img src="<%=request.getContextPath() %>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
						</td>
					</tr>
						<%}} %>
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
		 <div class="pagination">           
			<div class="numbers">
				<%
				int numberOfPage = (Integer) request.getAttribute("numberOfPage");
				int currentPage = (Integer) request.getAttribute("currentPage");
			%>
			<span>Trang:</span>
			<%
				for (int i = 1; i <= numberOfPage; i++) {
					if(i!=currentPage){
			%>
			<a href="<%=request.getContextPath()%>/admin/duanthuchien?page=<%=i%>"><%=i%></a> 
				<%if(i!=numberOfPage){ %>
				<span>|</span>
				<%} %>
			<%
				} else {
			%>
			<a href="<%=request.getContextPath()%>/admin/duanthuchien?page=<%=i%>" class="current"><%=i%></a> <span>|</span>
			<%}} %>
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 