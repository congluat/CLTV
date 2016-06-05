<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style>
.movieBox {
	margin: 1.5%;
	height: 700px;
	background-color: #e5e5e5;
	padding: 0px;
	overflow: hidden;
}

.movieBox img {
	width: 100%;
	height: 85%;
	padding: 0px;
	margin: 0px;
}

.hoverMe {
	z-index: 20;
}

.playBtn {
	font-size: 40px;
	text-align: center;
	vertical-align: middle;
	color: black;
	/* opacity: 1; */
}

.playBtnDiv {
	width: 100%;
	height: 400px;
	padding: 0px;
	margin: 0px;
	/* opacity: 0; */
	display: none;
	overflow: hidden;
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
	console.log("mouse");
	$(function() {
		$(".hoverMe").mouseenter(function() {
			console.log("mouse");
			$(this).find(".playBtnDiv").show("slide", {
				direction : "up"
			}, 100);

		}).mouseleave(function() {
			$(this).find(".playBtnDiv").hide("slide", {
				direction : "up"
			}, 100);
		});
	});
</script>

<%-- <form class="form-inline" action="Videos/search" method="GET">
	<div class="form-group">
		<div class="input-group">
			<input class="form-control" type="text" id="search"
				name="key" placeholder="Search..." value="${key}">
			
		</div>
	</div>
</form> --%>

<div class="container">
	<form class="form-inline" action="Videos/search" method="GET">
	  <div class="form-group">
	    <h3 class="control-label">Tìm kiếm </h3>
		<input class="form-control" type="text" id="search" name="key" placeholder="Search..." value="${key}">
	      	<button type="submit" class="btn btn-default">
					<i class="fa fa-search"></i></button>
		
	  </div>
	</form>
	<br>
	<c:if test="${videos.size()==0}">Không tìm thấy dữ liệu</c:if>
</div>


<div class="container-fluid col-xs-12 col-sm-12 col-md-12">
	
	<c:forEach items="${videos}" var="video">
		<a class="hoverMe" href="Theater/play/${video.id}">
			<div class="movieBox col-xs-4 col-sm-4 col-md-2 ">
				<div class="playBtnDiv">
					<span class="glyphicon glyphicon-play-circle playBtn"
						aria-hidden="true"></span>
				</div>
				<img alt="" src="<c:url value='/resources/poster/${video.poster}'/>">
				<div class="name">${video.name}</div>
			</div>
		</a>
	</c:forEach>
</div>