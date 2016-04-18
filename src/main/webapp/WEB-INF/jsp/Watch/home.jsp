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
	text-align : center;
	margin-left: 15%;
	text-align: center;
}
</style>

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
	<h1>Hello</h1>
</div>
