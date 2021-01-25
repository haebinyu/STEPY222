<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
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
	<main class="container">
	<ul>
		<li><a href="./pMakePlanFrm">새로운 여행</a></li>
		<!-- 로그인 세션 추가시 변경할것 -->
		<li><a href="./pPlanList?id=${member.m_id}">내 여행</a></li>
		<!--  -->
		<li><a href="./sSearchFrm">검색</a></li>
		<li><a href="./aLoginFrm">어드민 전용</a></li>
		<li><a href="./stHome">사장님 페이지</a></li>
		<li><a href="./bCommunity">게시판</a></li>
	</ul>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>
