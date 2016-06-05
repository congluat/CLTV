<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style>
.footerBox a {
	text-decoration: none;
	font: 16px;
	color: white;
}

.footerBox .top{
	text-align: center;
	font: 16px;
	color: white;
}
.footerBox .left{
	text-align:left;
	font: 16px;
	color: white;
}

.footerBox {
	margin-top:50px;
	padding: 20px; 
	background-color : #212020;
}
</style>

<div class="col-md-12 footerBox">
	<div class="col-md-12 top">
		<a href="#">Điều khoản sử dụng</a> |
		<a href="#">Bản quyền</a> |
		<a href="#">Nguyên tắc cộng đồng</a> |
		<a href="#">Đăng phim lên pinfilms</a> |
		<a href="#">Liên hệ Quảng cáo</a>
	</div>
	<div class="container">
		<div class="col-md-7">
			<a href="#">Phim ngắn</a><br>
			<a href="#">Phim ngành QTCNTT</a><br>
			<a href="#">Phim nước ngoài</a><br>
		</div>
		
		<div class="col-md-5">
			<a href="#">TVC</a> <br>
			<a href="#">TVC ngành QNCNTT trong nước</a><br>
			<a href="#">TVC nước ngoài và clip hài</a><br>
		</div>
	</div>
</div>