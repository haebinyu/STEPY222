<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
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
	width: 1020px;
	height: 580px;
	object-fit: cover;
}

.best-review-wrap {
	width: 1020px;
	height: 580px;
	margin-bottom: 100px;
}
</style>

<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			speed : 500,
			pause : 4000,
			touchEnabled : false,
			captions : true
		});

		var x = document.getElementsByClassName("my-rating");
		console.log(x);
		console.log(x.length);
		console.log(x[0].id);

		$(".my-rating").starRating({
			totalStars : 5,
			initialRating : x[0].id,
			ratedColor : 'orange',
			activeColor : 'orange',
			readOnly : true
		});

		for (var i = 0; i < x.length; i++) {
			var y = x[i].id;
			var e1 = document.getElementById(y);

			$(e1).starRating('setRating', y, false);
		}

		$('#example').barrating({
			theme : 'fontawesome-stars-o'
		});

	});
</script>
</head>
<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>

	<div class="container-fluid trip-wrap"
		style="background-image: url('resources/images/rainbow-bridge.jpg');"
	>
		<div class="container">
			<div class="trip-btns">
				<div class="trip-btn" onclick="location.href='pMakePlanFrm'">
					<p class="trip">새로운 여행</p>
				</div>
				<div class="trip-btn" onclick="location.href='./pPlanList?id=${member.m_id}'">
					<p class="trip">내 여행</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container text-center center-block">
		<br> <br>
		<p style="font-size: 30px;">
			<span style="color: red;">평점 4점</span> 이상!<br>여행객들이 최근 방문하고 있는 스토어를 소개합니다 !
		</p>


		<c:forEach var="bs" items="${bss}">

			<div class="storerate">
				<div class="my-rating jq-stars" id="${bs.rou }"></div>
				<span class="counter"></span><br> <span id="test">5</span>
				<p>${bs.rou },${bs.sr_cnum}</p>

			</div>
		</c:forEach>

		<br> <br>
		<div class="best-review-wrap center-block text-center">
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

		<div class="container-fluid community-wrap">
			<div class="community-box-wrap">
				<div class="community-box">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="350"><a href="./bFreeList" class="board-name">자유게시판</a></th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="h" items="${homeList_2}">
								<tr>
									<td>${h.ptitle}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="community-box">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="350"><a href="./bMateList" class="board-name">여행 동행</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="h" items="${homeList_1}">
								<tr>
									<td>${h.ptitle}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="community-box">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="350"><a href="./bReviewList" class="board-name">여행 리뷰</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="h" items="${homeList_3}">
								<tr>
									<td>${h.ptitle}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div class="container-fluid reserve-wrap"
		style="background-image: url('resources/images/burano.jpg');"
	>
		<div class="container">
			<div class="reserve-btns">
				<div class="reserve-btn" onclick="location.href='#'">
					<p class="reserve">음식</p>
				</div>
				<div class="reserve-btn" onclick="location.href='#'">
					<p class="reserve">숙소</p>
				</div>
				<div class="reserve-btn" onclick="location.href='#'">
					<p class="reserve">시설</p>
				</div>
			</div>
		</div>
	</div>

	<main class="container">
		<ul>
			<li><a href="./sSearchFrm">검색</a></li>
			<li><a href="./aLoginFrm">어드민 전용</a></li>
			<li><a href="./bCommunity">게시판</a></li>
			<li><a href="./stAuthMail">업체 메일인증</a></li>
		</ul>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>
