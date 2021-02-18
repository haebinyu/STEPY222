<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 후기 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/homeStyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="resources/css/star-rating-svg.css">
<script src="resources/js/jquery.star-rating-svg.min.js"></script>


<!-- bar-rating -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
>
<link rel="stylesheet" href="resources/css/fontawesome-stars.css">
<script type="text/javascript" src="resources/js/jquery.barrating.min.js"></script>
<link rel="stylesheet" href="resources/css/fontawesome-stars-o.css">


<style>
img {
	width: 1280px;
	height: 580px;
	object-fit: cover;
}

.best-review-wrap {
	width: 1280px;
	height: 580px;
	margin-bottom: 100px;
}
</style>

</head>
<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container" style="margin-top: 100px; margin-bottom: 200px;">
		<div class="container text-center">
			<br> <br>
			<p style="font-size: 30px;">${member.m_nickname } 님, 여행은 어떠셨나요?<br>STEPY는 여러분의 피드백을 환영합니다.</p>
			<br>
			<br>

			<form id="mud" action="mPostReview" method="post" enctype="multipart/form-data">
				<div class="storerate">
					<div class="my-rating jq-stars"></div>
					<br> <span class="counter">0</span><br>
				</div>
				<br>
				<br>
				
				<textarea class="form-control" name="sr_contents" rows="3" placeholder="500자 이내로 작성해주세요"
					maxlength="500" onPaste="return false" id="text"
				></textarea>
				
				<input type="hidden" name="sr_rate" id="inputrate" value="0"> <input type="hidden" name="sr_cnum"
					value="${param.cnum }"
				> <input type="hidden" name="sr_mid" value="${member.m_id }">
				
				<span id="written">(0</span> <span id="space">/ 500)</span> <br> <br>
				<span id="require"></span><br>
				<br>
				<input type="button" id="forsubmit" value="제출"></input>

				
			</form>
			<div class="container best-review-wrap">
				<ul class="slider">
					<c:if test="${!empty bss}">
						<c:forEach var="bi" items="${bss }">

							<a href="./plProductList?c_num=${bi.sr_cnum }"><li><img
									src="resources/upload${bi.f_sysname }" title="이미지를 클릭하면  스토어로 이동합니다 "
								></li></a>
						</c:forEach>
					</c:if>
				</ul>
			</div>

		</div>

	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>

<script src="resources/js/jquery.serializeObject.js"></script>
<script>

	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			speed : 500,
			pause : 4000,
			touchEnabled : false,
			captions : true
		});
	
		
		$(".my-rating").starRating({
			totalStars : 5,
			initialRating : 0,
			ratedColor : 'orange',
			activeColor : 'orange',
			onHover : function(currentIndex, currentRating, $el) {
				var x = $('#inputrate').val();
				$(".my-rating").starRating('setRating', x, false);
				$('.counter').text(currentIndex);
				$('#inputrate').val(currentIndex);
			}
		});
		
		
		$('#forsubmit').click(function(){
		
			var x = $('#inputrate').val();
			var y = $('#text').val().length;
			if(x == 0 || y == 0){
				if(x == 0){
					$('#require').text('0점은 입력이 불가합니다');
				} else if(y == 0){
					$('#require').text('내용을 입력해주세요!');
				}
			}else{
				
			}
		});

	});

	
	$('textarea').keyup(function() {

		var counter = $(this).val().length;
		var current = $('#written');
		current.text("(" + counter);

		if (counter > 500) {
			$("#btn").prop("disabled", true);
			$("#alarm").css("display", "block");

		} else {
			$("#btn").prop("disabled", false);
			$("#alarm").css("display", "none");
		}

	});
</script>
</html>
