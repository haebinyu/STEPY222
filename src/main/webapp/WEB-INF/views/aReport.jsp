<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STEPY - 관리자 페이지</title>
<!-- 메일&이벤트&신고 공통 스타일 -->
<link rel="stylesheet"
	href="resources/css/aGroupMail&Event&ReportStyle.css">
<!-- 이벤트 페이지들 전용 스타일-->
<link rel="stylesheet" href="resources/css/aGroupMail&Event&ReportStyle.css">

</head>
<body>
	<!-- header,footer는 공통 양식으로 include 처리 -->
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container">
		<div class="row">
			<jsp:include page="aSideBar.jsp" />
			<div class="mailSelect col-md-10 col-sm-9">
				<div class="mailBtns">
					<a class="reportBtn col-sm-3" href="aReportStoreList">신고된 회원 목록
						보기 </a>
					<!--  -->
					<a class="reportBtn col-sm-3" href="aReportPostList">신고된 게시글 목록
						보기 </a>
					<!--  -->
					<a class="reportBtn col-sm-3" href="aReportReplyList">신고된 댓글 목록
						보기 </a>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>