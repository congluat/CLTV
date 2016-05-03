<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">
<style>
.example-video-dimensions {
	width: 100%;
	height: 600px;
}

.infor {
	padding: 10px;
	border: 1px solid black;
	border-radius: 20px;
	margin-top: 50px;
}

.data {
	color: #BBB;
}

.cmt {
	
}

.title {
	text-align: center;
}
</style>
<!-- 
<script src="//vjs.zencdn.net/ie8/ie8-version/videojs-ie8.min.js"></script>
 -->
<div class="container">
	<%-- <video id=example-video width="100%"
		class="video-js vjs-default-skin" controls preload="auto"
		data-setup="{}">
		<source src="<c:url value='/resources/thaimovie/playlist.m3u8'/>"
			type='application/x-mpegURL'>
	</video> --%>
	<video id="vid1" class="video-js vjs-16-9 vjs-default-skin" controls
		autoplay width="800" height="450"
		data-setup='{ "techOrder": ["youtube"], "sources": [{ "type": "video/youtube", "src": "${video.filename}"}],"youtube": { "iv_load_policy": 3,"cc_load_policy":1,"modestbranding":1 } }'>
	</video>

	<script src="<c:url value='/resources/js/videojs/videojs.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Youtube.js'/>"></script>


	<script type="text/javascript"
		src="<c:url value='/resources/js/videojs/videojs-contrib-hls.js'/>"></script>

	<script>
		videojs('vid1').ready(function() {
			var myPlayer = this;
		});
		var viewed = false;
		(function() {
			var drt = videojs('vid1').duration();
			var crt = videojs('vid1').currentTime();
			console.log("duration: " + drt);
			console.log('the time was updated to: ' + crt);
			if (crt != 0 && drt != 0 && crt >= drt * 0.6 && viewed == false) {
				$.ajax({
					url : "Theater/view/${video.id}",
					context : document.body
				}).done(function() {
					console.log("Add View");
					viewed = true;
				});

			}
			setTimeout(arguments.callee, 5000);
		})();
	</script>
	<div class="col-md-12 infor">
		<h2 class="col-md-12">${video.name}</h2>
		<hr class="divider">
		<div class="col-md-6">
			<h4>
				Đạo diễn: <span class="data">${video.director}</span>
			</h4>
			<h4>
				Diễn viên: <span class="data">${video.stars}</span>
			</h4>
		</div>
		<div class="col-md-6">
			<h5 class="col-md-4">
				Lượt thích: <span class="data">${video.tLike}</span>
			</h5>
			<h5 class="col-md-4">
				Lượt xem: <span class="data">${video.tView}</span>
			</h5>
			<div class="col-md-4">
				<div id="fb-root"></div>
				<script>
					(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id))
							return;
						js = d.createElement(s);
						js.id = id;
						js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
					
					var hrefT = window.location.href;
					console.log(hrefT);
					$('#shFbBtn').attr('data-href',hrefT);
				</script>
				<div class="fb-share-button" id="shFbBtn"
					data-href=""
					data-layout="button" data-mobile-iframe="true"></div>
			</div>
		</div>
	</div>
	<div class="col-md-12 cmt">
		<h1 class="col-md-12 title">Bình luận</h1>
	</div>
	<!-- <script>
		$(document).ready(function() {
			var player = videojs('example-video');
			player.play();
		});
	</script> -->
</div>