<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="container">
	<!-- <div class="table-responsive"> -->
		<table class="table table-striped">
			<tr>
				<th>Id</th>
				<th>Tên</th>
				<th>Chi tiết</th>
			</tr>
			<tr>
				<td></td>
				<td><a href="Admin/addT/${type.id}" class="btn btn-info">Thêm mới</a></td>
				<td></td>
			</tr>
			<c:forEach items="${types}" var="type">
			<tr>
				<td>${type.id}</td>
				<td>${type.name}</td>
				<td><a href="Admin/editT/${type.id}" class="btn btn-info">Sửa</a></td>
			</tr>
			</c:forEach>
		</table>
	<!-- </div> -->
</div>