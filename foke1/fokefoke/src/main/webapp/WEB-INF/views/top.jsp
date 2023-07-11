<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
</head>
<style>
.quickmenu {
	position: absolute;
	width: 90px;
	top: 95%;
	margin-top: -100px;
	right: 70px;
	z-index: 9999;
	transition: opacity 0.5s ease-in-out;
}

.quickmenu input {
	border-radius: 50px;
	width: 50px;
	height: 50px;
	background: #b3b3b3;
	color: #fff;
	border: none;
}
</style>
<body>

	<div class="quickmenu">
		<input type="button" onclick="moveToTopSmooth()" value="TOP">
	</div>

</body>

<script>
$(document).ready(function(){
	  var currentPosition = $(".quickmenu").position().top;
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	    
	    if (position > 100) {
	        $(".quickmenu").css("opacity", 1);
	      } else {
	        $(".quickmenu").css("opacity", 0);
	      }
	    
	  }).scroll();
	});

		var moveToTopSmooth = function() {
			document.body.scrollIntoView({ behavior: 'smooth' });
			};
		</script>
</html>