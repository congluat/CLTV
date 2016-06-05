<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="container" >
	<form:form class="form-horizontal" modelAttribute="type" method="POST">
		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" path="user.id" id="userid" />
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">Tên
				loại</label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control"
					placeholder="Nhập tên loại" path="name" required="required"
					maxlength="200"></form:input>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-2 control-label">Photo</label>
			<div class="col-md-10">
				<form:input type="url" class="form-control" path="photo"
					maxlength="200"></form:input>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4 col-md-6">
				<a href="Admin/listTypes" class="btn btn-default">Cancel</a>
			</div>
			<div class="col-sm-4 col-md-4">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>

	</form:form>
</div>