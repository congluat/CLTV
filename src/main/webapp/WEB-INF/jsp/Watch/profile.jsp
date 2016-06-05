<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<style>
.result {
	text-align: center;
}

.failed {
	color: red;
}

.successed {
	color: green;
}

.successed-modal {
	display: none;
}

.panel-title {
	text-align: center;
}
</style>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Tài khoản</h3>
		</div>
		<div class="panel-body">
			<div class="container row col-sm-12 col-md-12">
				<div class="col-sm-12 col-md-offset-3 col-md-6" >
					<form:form cssClass="form-horizontal" action="User/Profile"
						modelAttribute="user" method="POST" >
						<form:hidden path="id" />
						<form:hidden path="status" />
						<form:hidden path="doB"/>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Username</label>
							<div class="col-sm-10">
								<form:input cssClass="form-control" readonly="true" path="username" />
							</div>
							
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<form:input cssClass="form-control" maxlength="40" required="required" path="email" />
							</div>
							
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<form:input cssClass="form-control" required="required" maxlength="40" type="password" path="password" />
							</div>
							
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<div style="color: green; font-size: 16px;">${result}</div>
							</div>
							
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
							
						</div>
						
					</form:form>
				</div>
			</div>

		</div>
	</div>

</div>
<script>
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});

		$("#datepicker").datepicker("option", "dateFormat", "ddmmyy");
		$("#datepicker").keydown(false);
		var enforceModalFocusFn = $.fn.modal.Constructor.prototype.enforceFocus;

		$.fn.modal.Constructor.prototype.enforceFocus = function() {
		};

		$confModal
				.on(
						'hidden',
						function() {
							$.fn.modal.Constructor.prototype.enforceFocus = enforceModalFocusFn;
						});

		$confModal.modal({
			backdrop : false
		});
	});
</script>