<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">
<style>
	.example-video-dimensions{
		width: 100%;
		height: 600px;
	}
</style>

<!-- If you'd like to support IE8 -->
<script src="//vjs.zencdn.net/ie8/ie8-version/videojs-ie8.min.js"></script>
<div class="container">
	<video id=example-video width="100%"
		class="video-js vjs-default-skin" controls preload="auto"
		data-setup="{}">
		<source src="<c:url value='/resources/thaimovie/playlist.m3u8'/>"
			type='application/x-mpegURL'>
	</video>
	<script src="<c:url value='/resources/js/videojs/videojs.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/videojs/videojs-contrib-hls.js'/>"></script>
	<script>
		$(document).ready(function() {
			var player = videojs('example-video');
			player.play();
		});
	</script>
</div>