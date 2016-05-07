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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

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
<link rel="stylesheet" id="colormag_googlefonts-css" href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C600&amp;ver=4.3.1" type="text/css" media="all">

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
				<a class="navbar-brand" href="index"><span
					class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span>
					Pinfilms <span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">Phim mới</a></li>
					<li><a href="#">Xem nhiều</a></li>
					<li><a href="Videos/showAlls/1">Tất cả</a></li>
					<li><a href="#">Thể loại</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Quản lý<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="Videos/upload">Upload</a></li>
							<li><a href="Videos/listVideos">Movies</a></li>
							<li><a href="#">Users</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Admin Page</a></li>


						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">Tìm</button>
						</form></li>
					<li>
					
					<script type="text/javascript">
						// This is called with the results from from FB.getLoginStatus().
						  function statusChangeCallback(response) {
						    console.log('statusChangeCallback');
						    console.log(response);
						    // The response object is returned with a status field that lets the
						    // app know the current login status of the person.
						    // Full docs on the response object can be found in the documentation
						    // for FB.getLoginStatus().
						    if (response.status === 'connected') {
						      // Logged into your app and Facebook.
						      testAPI();
						    } else if (response.status === 'not_authorized') {
						      // The person is logged into Facebook, but not your app.
						      document.getElementById('status').innerHTML = 'Please log ' +
						        'into this app.';
						    } else {
						      // The person is not logged into Facebook, so we're not sure if
						      // they are logged into this app or not.
						      document.getElementById('status').innerHTML = 'Please log ' +
						        'into Facebook.';
						    }
						  }
						
						  // This function is called when someone finishes with the Login
						  // Button.  See the onlogin handler attached to it in the sample
						  // code below.
						  function checkLoginState() {
						    FB.getLoginStatus(function(response) {
						      statusChangeCallback(response);
						    });
						  }
						
						  window.fbAsyncInit = function() {
						  FB.init({
						    appId      : '1400518590255894',
						    cookie     : true,  // enable cookies to allow the server to access 
						                        // the session
						    xfbml      : true,  // parse social plugins on this page
						    version    : 'v2.5' // use graph api version 2.5
						  });
						
						  // Now that we've initialized the JavaScript SDK, we call 
						  // FB.getLoginStatus().  This function gets the state of the
						  // person visiting this page and can return one of three states to
						  // the callback you provide.  They can be:
						  //
						  // 1. Logged into your app ('connected')
						  // 2. Logged into Facebook, but not your app ('not_authorized')
						  // 3. Not logged into Facebook and can't tell if they are logged into
						  //    your app or not.
						  //
						  // These three cases are handled in the callback function.
						
						  FB.getLoginStatus(function(response) {
						    statusChangeCallback(response);
						  });
						
						  };
						
						  // Load the SDK asynchronously
						  (function(d, s, id) {
						    var js, fjs = d.getElementsByTagName(s)[0];
						    if (d.getElementById(id)) return;
						    js = d.createElement(s); js.id = id;
						    js.src = "//connect.facebook.net/en_US/sdk.js";
						    fjs.parentNode.insertBefore(js, fjs);
						  }(document, 'script', 'facebook-jssdk'));
						
						  // Here we run a very simple test of the Graph API after login is
						  // successful.  See statusChangeCallback() for when this call is made.
						  function testAPI() {
						    console.log('Welcome!  Fetching your information.... ');
						    FB.api('/me', function(response) {
						      console.log('Successful login for: ' + response.name);
						      document.getElementById('status').innerHTML =
						        'Thanks for logging in, ' + response.name + '!';
						    });
						  }
						</script>
						
						<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"  >
						</fb:login-button>
						
						<div id="status">
						</div>
						
					</li>
					<jsp:include page="_user-nav.jsp"></jsp:include>
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
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>