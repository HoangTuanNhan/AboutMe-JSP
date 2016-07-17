<%@page import="bean.AboutMe"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
	<div id="body">
		<div class="content">
			<div id="section">
				<%
					AboutMe alAboutme=(AboutMe)request.getAttribute("alAboutme");
				%>
				<h2><%=alAboutme.getName() %></h2>
				<p>
					<%=alAboutme.getDetailText() %>
				</p>
				<img src="<%=request.getContextPath() %>/templates/public/images/anhdep.jpg" alt="" style="width: 570px;height: 347px;">
				<div class="article">
					<div>
						<h3>Vài nét về Tuấn Nhân</h3>
						<p>
						- Họ tên: Hoàng Tuấn Nhân<br />
						- Địa chỉ:Nại Cửu-Triệu Đông-Triệu Phong-Quảng Trị<br />
						- Email: Hoangtuannhanbk@gmail.com - Phone: 0166.300.2735
						</p>
						
						<h3>Khả năng của tôi</h3>
						<p>
						- Phát triển web Front-End<br />
						- Phát triển Web Back-End<br />
						- Kỹ năng làm việc nhóm và thuyết trình tốt
						</p>
					</div>
					
					<div>
						<h3>Kỹ năng chuyên ngành</h3>
						<p>
						- Html, Css, Javascript, Jquery<br />
						- PHP, MySQL, Ajax<br />
						- Javacore, Jsp-servlet, Swing, .NET
						</p>
						
						<h3>Mục tiêu của tôi</h3>
						<p>
						- Làm việc trong môi trường chuyên nghiệp<br />
						- Nâng cao kỹ năng chuyên môn với nhiều dự án khó<br />
						- Góp phần phát triển phòng công nghệ của công ty
						</p>
					</div>
				</div>
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