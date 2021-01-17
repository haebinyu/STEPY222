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
			<c:set var="daycnt" value="0"/>
			<c:set var="daynum" value="${days}"/>
			<c:forEach begin="1" end="${daynum + 1}">
			<div class="dayList-sub">
				<c:choose>
					<c:when test="${daycnt == 0}">
					<div class="page-header">
					  <h1>여행 준비</h1>
					</div>
					</c:when>
					<c:when test="${daycnt > 0}">
					<div class="page-header">
					  <h1>DAY ${daycnt}</h1>
					</div>
					</c:when>
				</c:choose>
			<c:set var="householdCnt" value="1"/>		
			<c:forEach var="list" items="${hList}">
				<c:if test="${list.h_day == daycnt}">
					<div class="panel panel-default">
					  <div class="panel-body">
					  	<div class="h-category-box">${list.h_category}</div>
					 	<div class="h-contents-box">${list.h_contents}</div>
					 	<div class="h-cost-box">${list.h_cost}</div>
					 	<c:choose>
					 		<c:when test="${empty list.h_sname}">
					 			<div class="h-sname-box"><span class="glyphicon glyphicon-map-marker" aria-hidden="true">&nbsp;-</span></div>
					 		</c:when>
					 		<c:when test="${!empty list.h_sname}">
					 			<div class="h-sname-box"><span class="glyphicon glyphicon-map-marker" aria-hidden="true">&nbsp;${list.h_sname}</span></div>
					 		</c:when>
					 	</c:choose>
					  </div>
					</div>
					<c:set var="householdCnt" value="${householdCnt + 1}"/>
				</c:if>
			</c:forEach>
			<input class="btn btn-default btn-lg btn-block add-day-plan-btn" id="add-day-plan-btn" type="button" value="비용추가" 
			onclick="location.href='pWriteHousehold?householdCnt=${householdCnt}&days=${days}'">
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
<script type="text/javascript">
//금액 콤마 표시
$(function(){
	var beforeCost = $(".h-cost-box");
	//console.log(cost);
	for(var i = 0; i < beforeCost.length; i++){
		console.log(beforeCost[i].innerText);
		var cost = beforeCost[i].innerText.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		console.log(cost);
		beforeCost[i].innerHTML = "&#8361; " + cost;
	}
})
</script>
</html>