<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript"
	src="<c:url value='/resources/angular/uploadController.js'/>"></script>

<style>

#imagePreview {
	width: 180px;
	height: 180px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
		/* bkLib.onDomLoaded(function() {
			new nicEditor({
				iconsPath : '<c:url value='/resources/nicEditor/nicEditorIcons.gif'/>',
				uploadURI: 'nic-editor/upload'
			}).panelInstance('description');
		}); */
<%-- 		var link = '<%=request.getContextPath()%>'+ "/resources/logo/${category.logo}";
		
		var link = '<%=request.getContextPath()%>'
								+ "/resources/logo/${category.logo}";
						$("#imagePreview").css("background-image",
								"url(" + link + ")"); --%>
								function inputFileChanged() {
									console.log("changed");
									var files = !!this.files ? this.files
											: [];
									if (!files.length
											|| !window.FileReader)
										return; // no file selected, or no FileReader support

									if (/^image/
											.test(files[0].type)) { // only image file
										var reader = new FileReader(); // instance of the FileReader
										reader
												.readAsDataURL(files[0]); // read the local file

										reader.onloadend = function() { // set image data as background of div
											$("#imagePreview").css("background-image","url("+ this.result+ ")");
										}
									}
								}
						$(function() {
							$("#inputFile").on("change",function() {
												console.log("changed");
												var files = !!this.files ? this.files
														: [];
												if (!files.length
														|| !window.FileReader)
													return; // no file selected, or no FileReader support

												if (/^image/
														.test(files[0].type)) { // only image file
													var reader = new FileReader(); // instance of the FileReader
													reader
															.readAsDataURL(files[0]); // read the local file

													reader.onloadend = function() { // set image data as background of div
														$("#imagePreview").css("background-image","url("+ this.result+ ")");
													}
												}
											});

						});
});
</script>
<div class="container" ng-controller="UploadController" >
	<form:form class="form-horizontal" modelAttribute="video" method="POST"
		enctype="multipart/form-data">
		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" path="user.id" id="userid" />
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Tên
				phim</label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control"
					placeholder="Nhập tên phim" path="name" required="required"
					maxlength="200"></form:input>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2 control-label">Loại phim</label>
			<div class="col-md-10">
				<form:select path="type.id" items="${types}" itemValue="id"
					itemLabel="name" class="selectpicker" id="type.id" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-2 control-label">Thể loại</label>
			<div class="col-md-10">
				<form:select path="genre.id" items="${genres}" itemValue="id"
					itemLabel="name" class="selectpicker" id="genre.id" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Trailer</label>
			<div class="col-sm-10">
				<form:input type="url" class="form-control"
					placeholder="Nhập link Trailer Youtube" path="trailer"
					maxlength="200"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Hình
				thức lưu trữ</label>
			<div class="col-sm-10">
				<div class="col-sm-6">
					<label for="inputEmail3" class="col-sm-6">Youtube</label>
					<form:radiobutton class="col-sm-6" path="isYoutube"
						value="true"  checked="checked" />
				</div>
				<div class="col-sm-6">
					<label for="inputEmail3" class="col-sm-6">Lưu
						trên server</label>
					<form:radiobutton class="col-sm-6" path="isYoutube"
						value="false" />
				</div>

			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Link
				Youtube</label>
			<div class="col-sm-10">
				<form:input type="url" class="form-control"
					placeholder="Nhập link phim trên youtube" path="filename"
					required="required" maxlength="200"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Đạo
				diễn</label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control"
					placeholder="Nhập tên đạo diễn" path="director" maxlength="200"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Diễn
				viên</label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control"
					placeholder="Nhập tên các diễn viên trong phim" path="stars"
					maxlength="200"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Imdb</label>
			<div class="col-sm-10">
				<form:input type="number" step="0.1" class="form-control"
					placeholder="Nhập tên các diễn viên trong phim" path="imdb"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2 control-label">Mô tả</label>

			<div class="col-md-10">
				<form:textarea name="description" path="decrtn" class="form-control"
					rows="3" maxlength="800" />
			</div>
		</div>

		<div class="form-group">
			<label for="inputFile" class="col-sm-2 col-md-2 control-label">Poster</label>
			<div class="col-md-10">
				<div class="col-sm-6 col-md-6">
					
					<input id="inputFile"
						multiple="" name="file" type="file" accept="image/*" onchange="inputFileChanged()"> 
					<form:hidden path="poster" />
				</div>
				<div class="col-sm-6 col-md-6" id="imagePreview"></div>

				<%-- <div>
				<c:if test='${not empty "${error_image}"}'>
					<label style="color: red">${error_image}</label>
				</c:if>
			</div> --%>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Quốc
				gia</label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control"
					placeholder="Nhập quốc gia sản xuất" path="country" maxlength="40"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Ngôn
				ngữ</label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control"
					placeholder="Nhập ngôn ngữ cửa phim" path="language" maxlength="40"></form:input>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4 col-md-6">
				<a href="Admin/listVideos" class="btn btn-default">Cancel</a>
			</div>
			<div class="col-sm-4 col-md-4">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>

	</form:form>
</div>

<script type="text/javascript">
		function inputFileChanged() {
			console.log("changed");
			var files = !!$("#inputFile").files ? $("#inputFile").files
					: [];
			if (!files.length
					|| !window.FileReader)
				return; // no file selected, or no FileReader support

			if (/^image/
					.test(files[0].type)) { // only image file
				var reader = new FileReader(); // instance of the FileReader
				reader
						.readAsDataURL(files[0]); // read the local file

				reader.onloadend = function() { // set image data as background of div
					$("#imagePreview").css("background-image","url("+ $("#inputFile").result+ ")");
				}
			}
		}

</script>