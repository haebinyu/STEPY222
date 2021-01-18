<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 여행 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style_hj.css" rel="stylesheet">
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
<div class="container">
	<div>
	<button class="btn btn-default btn-lg" type="button" onclick="location.href='./'">
	<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"> 메인으로&nbsp;</span>
	</button>
	<button class="btn btn-default btn-lg add-party-btn pull-right" type="button" onclick="location.href='./pMakePlanFrm'">새 여행 만들기</button>
	</div>
	<div class="page-header">
	  <h1>내 여행 목록</h1>
	</div>
	<div class="contents-box">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="col-sm-6">여행 이름</th>
					<th class="col-sm-2">장소</th>
					<th class="col-sm-2 hidden-xs">출발일</th>
					<th class="col-sm-2 hidden-xs">도착일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty planList}">
						<td colspan="4">계획된 여행이 없습니다. 새로운 여행을 준비해보세요</td>
					</c:when>
					<c:when test="${!empty planList}">
						<c:forEach var="planList" items="${planList}">
							<tr>
								<td><a href="pPlanFrm?planNum=${planList.t_plannum}">${planList.t_planname}</a></td>
								<td>${planList.t_spot}</td>
								<td class="hidden-xs">${planList.t_stdate}</td>
								<td class="hidden-xs">${planList.t_bkdate}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>