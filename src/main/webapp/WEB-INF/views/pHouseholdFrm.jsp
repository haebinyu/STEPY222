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
		<div class="dayList">
			<c:set var="daycnt" value="0"/>
			<c:set var="daynum" value="${days}"/>
			<c:set var="totalCost" value="0"/>
			<c:forEach begin="1" end="${daynum + 2}">
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
					  <div class="panel-body h-list" onclick="location.href='pModHouseholdFrm?planNum=${curPlan}&days=${days}&dayCnt=${daycnt}&householdCnt=${householdCnt}'">
					  	<div class="h-category-box">${list.h_category}</div>
					 	<div class="h-contents-box">${list.h_contents}</div>
					 	<div class="h-cost-box">${list.h_cost}</div>
					 	<c:set var="totalCost" value="${totalCost + list.h_cost}"/>
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
			onclick="location.href='pWriteHousehold?householdCnt=${householdCnt}&days=${days}&dayCnt=${daycnt}'">
			<c:set var="daycnt" value="${daycnt + 1}"/>
			
			</div>
			</c:forEach>
		</div>
		<!-- 예산 및 지출 확인창 -->
		<div class="balance-wrap">
			<div class="balance-contents">
				<div class="balance-title">
					<div class="page-header text-center">
					  <h3>내 예산 확인하기</h3>
					</div>
				</div>
				<div class="balance-area">
					<form>
						<input type="text" class="form-control input-budget" value="${plan.t_budget}" placeholder="예산 입력" onkeyup="numberCheck(this)"/>
						<input class="btn btn-default btn-block add-party-btn" type="button" value="저장" onclick="budgetSubmit()">
					</form>
					<div class="balance-spent text-right">
						<h4 class="bs">${totalCost}</h4>
					</div>
					<div class="balance-result text-right">
						<h4 class="br">${plan.t_budget - totalCost}</h4>
					</div>
				</div>
			</div>
			<div class="balance-toggle">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true" onclick="toggleBalance()" style="color: #999;"></span>
			</div>
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
	//항목별 금액
	var beforeCost = $(".h-cost-box");

	for(var i = 0; i < beforeCost.length; i++){
		var cost = beforeCost[i].innerText.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		
		beforeCost[i].innerHTML = "&#8361; " + cost;
	}
	//예산 및 잔액창 금액
	//예산
	var beforeBudget = $(".input-budget").val();
	console.log(beforeBudget);
	beforeBudget = beforeBudget.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
	console.log(beforeBudget);
	$(".input-budget").val(beforeBudget);
	
	//지출금액 & 남은 예산
	var beforeBalance = $("h4")
	for(var i = 0; i < beforeBalance.length; i++){
		//console.log(beforeBalance[i].innerText);
		var balance = beforeBalance[i].innerText.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		//console.log(balance);
		if(i == 0){
			beforeBalance[i].innerHTML = "<div class='pull-left'>지출금액:</div>" + balance + "원";	
		}
		else {
			beforeBalance[i].innerHTML = "<div class='pull-left'>남은예산:</div>" +  balance + "원";
		}
	}
	//console.log(${plan.t_budget - totalCost});
	if(${plan.t_budget - totalCost} < 0){
		$(".balance-result").css("background", "#d9534f");
	}
})

//금액 숫자 입력 제한, 콤마추가
function numberCheck(inputFrm){
	var cost = inputFrm.value;
	//console.log(cost);
	cost = cost.replace(/,/gi,"");
	
	var check = /^[0-9]*$/;
	if(!check.test(cost)){
		$(inputFrm).val("");
		alert("숫자만 입력해주세요")
	} else {
		cost = cost.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
		$(inputFrm).val(cost);
	}
}

//예산 및 잔액창 토글
var isClose = true;
function toggleBalance() {
	//console.log(isClose);
	if(isClose){
		$(".balance-wrap").css("left", "0");
		$(".glyphicon-chevron-right").css("transform", "rotate(180deg)");
		isClose = false;
	}
	else {
		$(".balance-wrap").css("left", "-300px");
		$(".glyphicon-chevron-right").css("transform", "rotate(0deg)");
		isClose = true;
	}
}
//예산 입력 저장
function budgetSubmit() {
	var budget = $(".input-budget").val().replace(/,/g,"");
	//console.log(budget);
	var planNum = ${curPlan}
	
	var obj = {"planNum": planNum, "budget": budget};
	//console.log(obj);
	$.ajax({
		url: "pRegBudget",
		type: "get",
		data: obj,
		dataType: "json",
		success: function(data){
			
			var str = '<form><input type="text" class="form-control input-budget" value="' + data.budget + '" placeholder="예산 입력" onkeyup="numberCheck(this)"/>' +
					'<input class="btn btn-default btn-block add-party-btn" type="button" value="저장" onclick="budgetSubmit()">' +
					'</form><div class="balance-spent text-right"><h4 class="bs">' + data.totalCost + '</h4></div><div class="balance-result text-right">' +
					'<h4 class="br">' + data.balance + '</h4></div>';
			$(".balance-area").html(str);
			//형식 변환
			//console.log(cost);
			var beforeBalance = $("h4")
			for(var i = 0; i < beforeBalance.length; i++){
				//console.log(beforeBalance[i].innerText);
				var balance = beforeBalance[i].innerText.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
				//console.log(balance);
				if(i == 0){
					beforeBalance[i].innerHTML = "<div class='pull-left'>지출금액:</div>" + balance + "원";	
				}
				else {
					beforeBalance[i].innerHTML = "<div class='pull-left'>남은예산:</div>" +  balance + "원";
				}
			}
			if(data.balance < 0){
				$(".balance-result").css("background", "#d9534f");
			}
			var beforeBudget = $(".input-budget").val();
			beforeBudget = beforeBudget.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
			$(".input-budget").val(beforeBudget);
		},
		error: function(error){
			//console.log(error)
			alert("예산 등록 실패");
		}
	});
}
</script>
</html>