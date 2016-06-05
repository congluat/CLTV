<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.request.contextPath}/">
<title>${title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!--========================= JQUERY=================== -->
<script src="<c:url value='/resources/js/jquery-1.12.0.min.js'/>"></script>

<!-- ========================JQUERY UI============================ -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/>">
<script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<!-- ==================BOOTSTRAP================= -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<link>

<!-- Bootstrap Select -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

<!-- ============================AngularJS Library===========-->

<!-- Angular Material requires Angular.js Libraries -->
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-cookies.js">
	
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>

<!-- ============================MY ANGULARJS=========================== -->
<script type="text/javascript"
	src="<c:url value='/resources/angular/myapp.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/angular/userController.js'/>"></script>

<!-- =========================Angular Material Library ==============-->
<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.js">
</script> -->



<link rel="stylesheet" href="<c:url value='/resources/css/mycss.css'/>">
<link rel="stylesheet" id="colormag_googlefonts-css"
	href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C600&amp;ver=4.3.1"
	type="text/css" media="all">
<style type="text/css">
	body{
		background-color: #FFF;
	}
</style>
</head>
<body ng-app="myApp">
	<nav class="navbar navbar-default">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="Admin">ADMIN</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<!-- Manage Users STARTS -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">User<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="Admin/listUsers">Users</a></li>
							<li><a href="Admin/listPermissions">Permission</a></li>
							<li><a href="Admin/listUPs">User-Permission</a></li>
						</ul>
					</li>
					<!-- Manage Users ENDS -->
					
					<!-- Manage Videos STARTS -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Videos<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="Admin/upload">Upload</a></li>
							<li><a href="Admin/listVideos">Videos</a></li>
							<li><a href="Admin/listTypes">Types</a></li>
							<li><a href="Admin/listGenres">Genres</a></li>
						</ul>
					</li>
					<!-- Manage Videos ENDS -->
					
					<li><a href="Admin/statistic">Statistic</a></li>
					<li><a href="Admin/job">Jobs</a></li>
					
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<jsp:include page="../Watch/_user-nav.jsp"></jsp:include>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<article>
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
	</article>
	<footer>
		<jsp:include page="../Watch/footer.jsp"></jsp:include>
	</footer>
</body>
</html>