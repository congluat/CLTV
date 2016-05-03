<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style>
.carousel-inner img {
	width: 100%
}

.carousel-inner {
	width: 70%;
	text-align: center;
	margin-left: 15%;
	text-align: center;
}
</style>

<style>
.movieBox {
	margin: 1.5%;
	height: 700px;
	background-color: #e5e5e5;
	padding: 0px;
}

.movieBox img {
	width: 100%;
	height: 85%;
	padding: 0px;
	margin: 0px;
}

.movieBox .name {
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
	padding-top: 5px;
	font-weight: 100;
}

.movieBox .name a {
	text-decoration: none;
}

.container-fluid {
	padding-right: 15px;
	padding-left: 15px;
}
</style>

<script>
	//$('.movieBox').height=this.width*2;
	$(window).on('resize load', setHeight);

	function setHeight() {
		$('.movieBox').height($('.movieBox').width() * 1.6);
		var wWidth = $(window).width();
		if (wWidth > 1174) {
			$('.movieBox').css("margin", "1.5%");
		} else {
			$('.movieBox').css("margin", "6%");
		}
	}
</script>
<script type="text/javascript">
	(function() {

		var img = document.getElementClassName('movieBox').firstChild;
		img.onload = function() {
			if (img.height > img.width) {
				img.height = 'auto';
				img.width = '100%';
			}
		};

	}());
</script>

<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img
				src="http://media.melty.es/article-2654440-fb-f1452162572/capitan-america-3-civil-war.jpg"
				alt="...">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<img
				src="<c:url value='/resources/banners/angry-birds-movie-first-look-characters-2.jpg'/>"
				alt="...">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<img
				src="<c:url value='/resources/banners/FINDING-DORY-Wallpaper-uSd8e.jpg'/>"
				alt="...">
			<div class="carousel-caption"></div>
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
<div class="container">
	<h2 class="col-md-12">Phim ngắn của ngành Quản Trị Công Nghệ &
		Truyền Thông</h2>
	<div class="col-md-12">
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<h2 class="col-md-12">Phim ngắn trong nước</h2>
	<div class="col-md-12">
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<h2 class="col-md-12">Phim ngắn nước ngoài</h2>
	<div class="col-md-12">
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<h2 class="col-md-12">TCV ngành Quản Trị Công Nghệ & Truyền Thông</h2>
	<div class="col-md-12">
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<h2 class="col-md-12">TCV và clip hài hay trong nước và ngoài nước</h2>
	<div class="col-md-12">
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
		<c:forEach items="${videos}" var="video">
			<a href="Theater/play/${video.id}">
				<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
					<img alt=""
						src="<c:url value='/resources/poster/${video.poster}'/>">
					<div class="name">${video.name}</div>
				</div>
			</a>
		</c:forEach>
	</div>
</div>
