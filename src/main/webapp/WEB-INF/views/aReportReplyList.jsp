<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STEPY - 관리자 페이지</title>
<link rel="stylesheet" href="resources/css/aListStyle.css">
</head>
<head>
</head>
<head>
</head>
<body>
	<!-- header,footer는 공통 양식으로 include 처리 -->
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container">
		<jsp:include page="aSideBar.jsp" />
		<jsp:include page="aReportList.jsp">
			<jsp:param value="신고된 댓글" name="type" />
			<jsp:param value="3" name="typeNum" />
		</jsp:include>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>