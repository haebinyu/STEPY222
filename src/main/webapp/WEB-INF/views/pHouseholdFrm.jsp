<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>가계부</title>
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
	<button class="btn btn-default btn-lg" type="button" onclick="location.href='pPlanList?id=user01'">
	<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"> 목록으로&nbsp;</span>
	</button>
	<div class="page-header">
	  <h1>${plan.t_planname} &nbsp;&nbsp;<small>${plan.t_spot}</small></h1>
	</div>
	<ul class="nav nav-pills nav-justified">
	  <li role="presentation"><a href="pPlanFrm?planNum=${curPlan}">일정</a></li>
	  <li role="presentation" class="active"><a href="pHouseholdFrm?planNum=${curPlan}">가계부</a></li>
	  <li role="presentation"><a href="pCheckSupFrm?planNum=${curPlan}">체크리스트</a></li>
	</ul>
	<div class="contents-box">
		<h2>예산 : ${plan.t_budget}</h2>
		<div class="dayList">
			<c:set var="daycnt" value="1"/>
			<c:set var="daynum" value="${days}"/>
			<c:forEach begin="1" end="${daynum + 1}">
			<div class="dayList-sub">
				<div class="page-header">
				  <h1>DAY ${daycnt}</h1>
				</div>
			<c:set var="householdCnt" value="1"/>		
			<c:forEach var="list" items="${day}">
				<c:if test="${!empty list.ap_contents && list.ap_day == daycnt}">
					<div class="panel panel-default">
					  <div class="panel-body">
					  <span class="glyphicon glyphicon-map-marker" aria-hidden="true">&nbsp;&nbsp;${list.ap_contents}</span>
					  <div class="dayDelBtn pull-right" title="일정 삭제" onclick="location.href='delAccompanyPlan?planNum=${curPlan}&day=${daycnt}&num=${planCnt}'"><img src="resources/images/remove.png"></div>
					  </div>
					</div>
					<c:set var="householdCnt" value="${householdCnt + 1}"/>
				</c:if>
			</c:forEach>
			<input class="btn btn-default btn-lg btn-block add-day-plan-btn" id="add-day-plan-btn" type="button" value="비용추가" 
			onclick="location.href='pWriteHousehold?householdCnt=${householdCnt}'">
			<c:set var="daycnt" value="${daycnt + 1}"/>
			
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<div class="balance-box">
	<div class="top-bar">
		<div class="balance-contents">
		</div>
		<div class="balance-result">
		</div>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>