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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;900&display=swap"
	rel="stylesheet"
>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

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

.table th {
	font-weight: 600;
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
		<br> <br> <br> <br>
		<div class="best-review-wrap center-block text-center">

			<c:if test="${!empty bss}">
			<p style="font-size: 30px;">
						평점 4점 이상!<br> 최근 스테퍼들이 방문한 스토어를 소개합니다! 
					</p>
			</c:if>

			<ul class="slider">
				<c:if test="${!empty bss}">
					<c:forEach var="bi" items="${bss }">
						<a href="./plProductList?c_num=${bi.sr_cnum }"><li><img
								src="resources/upload${bi.f_sysname }" title="이미지를 클릭하면  스토어로 이동합니다 "
							></li></a>
					</c:forEach>
				</c:if>
				<c:if test="${empty bss }">
					<li><img src="resources/images/welcometostepy.jpg"
						title="아직 추천 상품이 없네요! 상품을 구매하고, 평점을 올려주세요!"
					></li>
				</c:if>
			</ul>
		</div>
	</div><br><br><br><br><br>

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

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>
