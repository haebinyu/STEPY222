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
				<c:forEach var="planList" items="${planList}">
					<tr>
						<td><a href="pPlanFrm?planNum=${planList.t_plannum}">${planList.t_planname}</a></td>
						<td>${planList.t_spot}</td>
						<td class="hidden-xs">${planList.t_stdate}</td>
						<td class="hidden-xs">${planList.t_bkdate}</td>
					</tr>
				</c:forEach>
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