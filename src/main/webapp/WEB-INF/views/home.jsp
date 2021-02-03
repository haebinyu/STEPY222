<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">


</head>
<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="container-fluid trip-wrap" style="background-image: url('resources/images/rainbow-bridge.jpg');">
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
	<div class="container best-review-wrap">
		<div class="best-review">
			<p style="line-height: 400px;">BEST REVIEW</p>
		</div>
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
					<tr>
						<td>여기에는</td>
					</tr>
					<tr>
						<td>최신 게시글 순으로</td>
					</tr>
					<tr>
						<td>게시글 데이터를 가져와서</td>
					</tr>
					<tr>
						<td>게시글 제목만</td>
					</tr>
					<tr>
						<td>한 5개 ~ 8개 정도</td>
					</tr>
					<tr>
						<td>띄우면 어떨까 생각해요</td>
					</tr>
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
				<tr>
					<td>여기에는</td>
				</tr>
				<tr>
					<td>최신 게시글 순으로</td>
				</tr>
				<tr>
					<td>게시글 데이터를 가져와서</td>
				</tr>
				<tr>
					<td>게시글 제목만</td>
				</tr>
				<tr>
					<td>한 5개 ~ 8개 정도</td>
				</tr>
				<tr>
					<td>띄우면 어떨까 생각해요</td>
				</tr>
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
				<tr>
					<td>여기에는</td>
				</tr>
				<tr>
					<td>최신 게시글 순으로</td>
				</tr>
				<tr>
					<td>게시글 데이터를 가져와서</td>
				</tr>
				<tr>
					<td>게시글 제목만</td>
				</tr>
				<tr>
					<td>한 5개 ~ 8개 정도</td>
				</tr>
				<tr>
					<td>띄우면 어떨까 생각해요</td>
				</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
	<div class="container-fluid reserve-wrap" style="background-image: url('resources/images/burano.jpg');">
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

