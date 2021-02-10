<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">


</head>
<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container" style="margin-bottom: 200px; margin-top: 100px;">

		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link" href="./mMyPage">myPage</a></li>
			<li class="nav-item"><a class="nav-link" href="./pPlanList?id=${member.m_id}">나의 여행 플랜</a></li>
			<li class="nav-item"><a class="nav-link" href="./mMyLikedPages">좋아요 한 게시글</a></li>
			<li class="nav-item"><a class="nav-link" href="./mMyCartPages">찜한 상품</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">내 결제 내역/쿠폰 확인</a></li>
			<li class="nav-item"><a class="nav-link" href="./mModifyMyinfo">내 정보 수정</a></li>
		</ul>


	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>

<script>

</script>

</html>