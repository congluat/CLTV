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
				<th>Source</th>
				<th>Thể loại</th>
				<th>Uploader</th>
				<th>Like</th>
				<th>View</th>
				<th>Status</th>
				<th>Chi tiết</th>
			</tr>
			<c:forEach items="${videos}" var="video">
			<tr>
				<td>${video.id}</td>
				<td><a href="Theater/play/${video.id}">${video.name}</a></td>
				<td>
					<c:if test="${!video.isYoutube}">
						${video.filename}
					</c:if>
					<c:if test="${video.isYoutube}">
						<a href="${video.filename}">Link</a>
					</c:if>
				</td>
				<td>${video.genre.name}</td>
				<td>${video.user.username}</td>
				<td>${video.tLike}</td>
				<td>${video.tView}</td>
				<td>
				
				<select disabled="disabled" name="slectStatus_${video.id}" id="slectStatus_${video.id}" class="selectpicker">		
					<option value="0" >Đang chờ</option>
					<option value="1" >Đang xử lý</option>
					<option value="2" >Thành công</option>
					<option value="3"  style="color: red" >Thất bại</option>
					<option value="4" >Đã xóa</option>
				</select>	
				<script type="text/javascript" >
				//change status of video from 0 to current using javascript
					$('#slectStatus_${video.id} option[value=${video.status}]').attr('selected','selected');
				</script>			
				</td>
				<td><a href="Admin/edit/${video.id}" class="btn btn-info">Chi tiết</a></td>
			</tr>
			</c:forEach>
		</table>
	<!-- </div> -->
</div>