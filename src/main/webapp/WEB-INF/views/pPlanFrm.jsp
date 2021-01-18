<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행 일정</title>
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
	  <li role="presentation" class="active"><a href="pPlanFrm?planNum=${curPlan}">일정</a></li>
	  <li role="presentation"><a href="pHouseholdFrm?planNum=${curPlan}">가계부</a></li>
	  <li role="presentation"><a href="pCheckSupFrm?planNum=${curPlan}">체크리스트</a></li>
	</ul>
	<div class="contents-box">
	<!-- 
		<p>여행 번호 : ${plan.t_plannum}</p>
		<p>여행 이름 : ${plan.t_planname}</p>
		<p>리더 : ${plan.t_id}</p>
		<p>장소 : ${plan.t_spot}</p>
		<p>출발일 : ${plan.t_stdate}</p>
		<p>도착일 : ${plan.t_bkdate}</p>
		<p>멤버1 : ${plan.t_member1}</p>
		<p>멤버2 : ${plan.t_member2}</p>
		<p>멤버3 : ${plan.t_member3}</p>
		<p>멤버4 : ${plan.t_member4}</p>
		<p>멤버5 : ${plan.t_member5}</p>
		<p>여행 기간: ${days}</p>
	-->
		<div class="dayList">
			<c:set var="daycnt" value="1"/>
			<c:set var="daynum" value="${days}"/>
			<c:forEach begin="1" end="${daynum + 1}">
			<div class="dayList-sub">
				<div class="page-header">
				  <h1>DAY ${daycnt}</h1>
				</div>
			<c:set var="planCnt" value="1"/>		
			<c:forEach var="list" items="${planContentsList}">
				<c:if test="${!empty list.ap_contents && list.ap_day == daycnt}">
					<div class="panel panel-default">
					  <div class="panel-body">
					  <span class="glyphicon glyphicon-map-marker" aria-hidden="true">&nbsp;&nbsp;${list.ap_contents}</span>
					  <div class="dayDelBtn pull-right" title="일정 삭제" onclick="location.href='delAccompanyPlan?planNum=${curPlan}&day=${daycnt}&num=${planCnt}'"><img src="resources/images/remove.png"></div>
					  </div>
					</div>
					<c:set var="planCnt" value="${planCnt + 1}"/>
				</c:if>
			</c:forEach>
			<input class="btn btn-default btn-lg btn-block add-day-plan-btn" id="add-day-plan-btn" type="button" value="일정추가" 
			onclick="location.href='pStoreSearch?day=${daycnt}&planCnt=${planCnt}'">
			<c:set var="daycnt" value="${daycnt + 1}"/>
			
			</div>
			</c:forEach>
		</div>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>