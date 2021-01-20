<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STEPY - 관리자 페이지</title>
<!-- 스크립트 - jquery 임포트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS
부트스트랩 min 버전 임포트 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 스크립트 - 부트스트랩용 스크립트 임포트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 메일&이벤트&신고 공통 스타일 -->
<link rel="stylesheet"
	href="resources/css/aGroupMail&Event&ReportStyle.css">
<!-- 이벤트 페이지들 전용 스타일-->
<link rel="stylesheet" href="resources/css/aEventStyle.css">

</head>
<body>
	<!-- header,footer는 공통 양식으로 include 처리 -->
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container">
		<div class="row">
			<jsp:include page="aSideBar.jsp" />
			<div class="mailSelect col-sm-8">
				<div class="mailBtns">
					<a class="eventBtn col-sm-3" href="aEventList">진행중<br>이벤트
					</a>
					<!--  -->
					<a class="eventBtn col-sm-3" href="aWriteEventFrm">이벤트<br>목록
					</a>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>