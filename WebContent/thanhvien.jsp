<%@page import="bean.ThanhVien"%>
<%@page import="bean.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
	
	<div id="body">
		<div class="content">
			
			<div id="blog">
				<h2>Các thành viên của group</h2>
				<%
					ArrayList<ThanhVien> alThanhVien=(ArrayList<ThanhVien>)request.getAttribute("alThanhVien");
						if(alThanhVien!=null){
							for(ThanhVien objThanhVien:alThanhVien){
					
				%>
				<ul>
					<li>
						<div class="article">
							<h3><%=objThanhVien.getFullname()%></h3>
							<p>
								<label>Công việc: </label>
								<strong style="color: #d4651c"><%=objThanhVien.getCongviec() %></strong>
							</p>
							<p>
								<label>Địa chỉ: </label>
								<strong style="color: #d4651c"><%=objThanhVien.getCongviec() %></strong>
							</p>
							<a href="<%=objThanhVien.getLink() %>" class="more" target="_blank">Truy cập trang này</a>
						</div>
						<div class="stats">
							<a href="http://vinaenter.edu.vn" class="more" target="_blank"><img src="<%=request.getContextPath() %>/files/<%=objThanhVien.getHinhanh()%>" alt="" /></a>
						</div>
					</li>
					
				</ul>
				<%}} %>
				<ul class="paging">
					<%	
						String active="";
						int numberOfPage=(Integer)(request.getAttribute("numberOfPage"));
						int currentPage=(Integer)(request.getAttribute("currentPage"));
						for(int i=1;i<=numberOfPage;i++){
							if(currentPage==i){
								active="'return false;'";
							}else{
								active="";
								
							}
							if(i==1){
					%>
							<li>
								<a href=" <%=request.getContextPath()%>/project?page=1" onclick =<%=active %>>Đầu</a>
							</li>
							<li >
								<a href=" <%=request.getContextPath()%>/project?page=<%=currentPage-1%>" onclick=<%=active %> >Trước</a>
							</li>
							<%} %>
							<li>		
								<%
									if(i==currentPage){
								%>
										<a href="<%=request.getContextPath()%>/project?page=<%=i%>" onclick=<%=active %>><%=currentPage %></a>
								<%
									}
								%>	
							</li>
							<%if(i==numberOfPage) {%>
							<li >
								<a href="<%=request.getContextPath()%>/project?page=<%=currentPage+1%>" onclick=<%=active %>>Sau</a>
							</li>
							<li >
								<a href="<%=request.getContextPath()%>/project?page=<%=numberOfPage%>" onclick=<%=active %>>Cuối</a>
							</li>
					<%	
							}
						} 
					%>
				</ul>
			</div>
			<div id="sidebar">
				<%@include file="/templates/public/inc/right-bar.jsp" %>
			</div>
			
			
		</div>
	</div>
	
	
	<div id="footer">
		<%@include file="/templates/public/inc/footer.jsp" %>
	</div>
</body>
</html>