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
				<div class="col-sm-12 col-md-6">
					<form class="form-horizontal" ng-controller="UserController"
						name="registerForm" method="post"
						ng-submit="registerForm.$valid && register()">

						<div class="modal-header">

							<h4 class="modal-title" style="text-align: center;"
								id="myModalLabel">Register</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">Username</label>
								<div class="col-sm-10">
									<input type="text" maxlength="20"
										class="form-control ng-dirty ng-valid" id="username"
										ng-minlength="6" ng-trim="true" ng-model="user.username"
										required="required"
										placeholder="Username (mininum 6 characters)" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" maxlength="40" ng-minlength="6"
										class="form-control ng-dirty ng-valid" id="password"
										required="required"
										placeholder="Password (mininum 6 characters) "
										ng-model="user.password" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="email" size="40"
										class="form-control ng-dirty ng-valid" id="email"
										required="required" placeholder="Email" ng-model="user.email" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">Data
									of Birth</label>
								<div class="col-sm-10">
									<input type="text" maxlength="8"
										class="form-control ng-dirty ng-valid" id="datepicker"
										required="required" placeholder="Date of Birth(ddMMyyy)"
										ng-model="user.doB" />
								</div>
							</div>
							<!-- <div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox"> Remember me
								</label>
							</div>
						</div>
					</div> -->


						</div>
						<div class="result"
							ng-class="{'failed': !result.result , 'successed': result.result}">{{result.cause}}</div>
						<div class="modal-footer">
							
							<input type="submit" class="btn btn-primary" value="Đăng ký" />
						</div>
					</form>
				</div>
				<div class="col-sm-12 col-md-6">
					<form class="form-horizontal" ng-controller="UserController"
						name="loginForm" method="post"
						ng-submit="loginForm.$valid && login()">

						<div class="modal-header">
							<h4 class="modal-title" style="text-align: center;"
								id="myModalLabel">Login</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">User
									name</label>
								<div class="col-sm-10">
									<input type="text" maxlength="20"
										class="form-control ng-dirty ng-valid" id="username"
										ng-model="login.username" required="required"
										placeholder="Username" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" maxlength="40"
										class="form-control ng-dirty ng-valid" id="password"
										required="required" placeholder="Password"
										ng-model="login.password" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<!-- <label> <input type="checkbox" value="false"
								ng-model="login.remember"> Remember me
							</label> -->
									</div>
								</div>
							</div>


						</div>
						<div class="result"
							ng-class="{'failed': !result.result , 'successed': result.result}">{{result.cause}}</div>
						<div class="modal-footer">				
							<input type="submit" class="btn btn-success" value="Đăng nhập" />
						</div>
					</form>
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