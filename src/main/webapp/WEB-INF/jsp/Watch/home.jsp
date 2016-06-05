<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="<c:url value='/resources/js/jssor.slider.mini.js'/>"></script>

<style>


.carousel-inner img {
	width: 100%
} 

.carousel-inner {
	width: 80%;
	height: 30%;
	text-align: center;
	margin-left: 10%;
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
 <script>
        jQuery(document).ready(function ($) {
            
            var jssor_1_options = {
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Cols: 15,
                $SpacingX: 3,
                $SpacingY: 3,
                $Align: 455
              }
            };
            
            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
            
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 980);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
</script>

<style>
        
        /* jssor slider arrow navigator skin 07 css */
        /*
        .jssora07l                  (normal)
        .jssora07r                  (normal)
        .jssora07l:hover            (normal mouseover)
        .jssora07r:hover            (normal mouseover)
        .jssora07l.jssora07ldn      (mousedown)
        .jssora07r.jssora07rdn      (mousedown)
        */
        .jssora07l, .jssora07r {
            display: block;
            position: absolute;
            /* size of arrow element */
            width: 50px;
            height: 50px;
            cursor: pointer;
            background: url('img/a07.png') no-repeat;
            overflow: hidden;
        }
        .jssora07l { background-position: -5px -35px; }
        .jssora07r { background-position: -65px -35px; }
        .jssora07l:hover { background-position: -125px -35px; }
        .jssora07r:hover { background-position: -185px -35px; }
        .jssora07l.jssora07ldn { background-position: -245px -35px; }
        .jssora07r.jssora07rdn { background-position: -305px -35px; }
/* jssor slider thumbnail navigator skin 04 css *//*.jssort04 .p            (normal).jssort04 .p:hover      (normal mouseover).jssort04 .pav          (active).jssort04 .pav:hover    (active mouseover).jssort04 .pdn          (mousedown)*/.jssort04 .p {    position: absolute;    top: 0;    left: 0;    width: 62px;    height: 32px;}.jssort04 .t {    position: absolute;    top: 0;    left: 0;    width: 100%;    height: 100%;    border: none;}.jssort04 .w, .jssort04 .pav:hover .w {    position: absolute;    width: 60px;    height: 30px;    border: #0099FF 1px solid;    box-sizing: content-box;}.jssort04 .pdn .w, .jssort04 .pav .w {    border-style: dashed;}.jssort04 .c {    position: absolute;    top: 0;    left: 0;    width: 62px;    height: 32px;    background-color: #000;    filter: alpha(opacity=45);    opacity: .45;    transition: opacity .6s;    -moz-transition: opacity .6s;    -webkit-transition: opacity .6s;    -o-transition: opacity .6s;}.jssort04 .p:hover .c, .jssort04 .pav .c {    filter: alpha(opacity=0);    opacity: 0;}.jssort04 .p:hover .c {    transition: none;    -moz-transition: none;    -webkit-transition: none;    -o-transition: none;}* html .jssort04 .w {    width /**/: 62px;    height /**/: 32px;}
        
</style>
    
    
    
<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<!-- <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<!-- <div class="item active">
			<img
				src="http://media.melty.es/article-2654440-fb-f1452162572/capitan-america-3-civil-war.jpg"
				alt="...">
			<div class="carousel-caption"></div>
		</div> -->
		<div class="item active">
			<img
				src="<c:url value='/resources/banners/Cover-01.jpg'/>"
				alt="...">
			<div class="carousel-caption"></div>
		</div>
		<%-- <div class="item">
			<img
				src="<c:url value='/resources/banners/FINDING-DORY-Wallpaper-uSd8e.jpg'/>"
				alt="...">
			<div class="carousel-caption"></div>
		</div> --%>
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
