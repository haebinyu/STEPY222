<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>체크리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style_hjk.css" rel="stylesheet">
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
	  <li role="presentation"><a href="pHouseholdFrm?planNum=${curPlan}">가계부</a></li>
	  <li role="presentation" class="active"><a href="pCheckSupFrm?planNum=${curPlan}">체크리스트</a></li>
	</ul>
	<div class="contents-box">
		<div class="dayList">
			${categoryNum}
			<c:forEach var="cvList" items="${cvList}">
				<div class="page-header">
					<h1>${cvList.cl_categoryname}</h1>
				</div>
				<div class="dayList-sub">
					<c:set var="itemCnt" value="1"/>
					<c:forEach var="checklist" items="${checklist}">
					  	<c:if test="${cvList.cl_category == checklist.cl_category}">
					  	<div class="panel panel-default">
							<div class="panel-body">
								<c:choose>
									<c:when test="${checklist.cl_check == 1}">
									<div id="ajax-box${checklist.cl_category}${itemCnt}">
										<input class="inp-cbx" id="cbx${checklist.cl_category}${itemCnt}" type="checkbox" style="display: none" checked/>
										<label class="cbx" for="cbx${checklist.cl_category}${itemCnt}" onclick="checkItem(${checklist.cl_category}, ${itemCnt}, ${checklist.cl_check})">
											<span>
												<svg width="12px" height="9px" viewbox="0 0 12 9">
												<polyline points="1 5 4 8 11 1"></polyline>
												 </svg>
											 </span>
											 <span>${checklist.cl_item}</span>
										 </label>
									</div>
									</c:when>
									<c:when test="${checklist.cl_check == 0}">
									<div id="ajax-box${checklist.cl_category}${itemCnt}">
										<input class="inp-cbx" id="cbx${checklist.cl_category}${itemCnt}" type="checkbox" style="display: none"/>
										<label class="cbx" for="cbx${checklist.cl_category}${itemCnt}" onclick="checkItem(${checklist.cl_category}, ${itemCnt}, ${checklist.cl_check})">
											<span>
												<svg width="12px" height="9px" viewbox="0 0 12 9">
												<polyline points="1 5 4 8 11 1"></polyline>
												 </svg>
											 </span>
											 <span>${checklist.cl_item}</span>
										 </label>
										</div>
									</c:when>
								</c:choose>
							</div>
						</div>
						<c:set var="itemCnt" value="${itemCnt + 1}"/>
					  	</c:if>
					</c:forEach>
				</div>
			<input class="btn btn-default btn-block btn-lg add-party-btn" type="button" value="준비물 추가 +" onclick="location.href='pAddCheckItemFrm?category=${cvList.cl_category}&categoryName=${cvList.cl_categoryname}&itemCnt=${itemCnt}'">
			</c:forEach>
			<div class="page-header"></div>
			<input class="btn btn-default btn-block btn-lg add-party-btn" type="button" value="카테고리 추가 +" onclick="location.href='pAddCheckCategoryFrm?category=${categoryNum + 1}'">
	  </div>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
<script type="text/javascript">
function checkItem(category, itemCnt, check){
	var planNum =${curPlan}
	//console.log($("#ajax-box" + category + itemCnt));	
	if(check == 0) check = 1;
	else if(check == 1) check = 0;
	
	var obj = {"planNum": planNum, "category": category, "itemCnt": itemCnt, "check": check};
	console.log(obj);
	$.ajax({
		url: "pChangeCheck",
		type: "post",
		data: obj,
		dataType: "json",
		success: function(data){
			//console.log(data);
			var str = null;
			if(check == 0){
				str = '<input class="inp-cbx" id="cbx' + category + itemCnt + '" type="checkbox" style="display: none"/>'
			}
			else if(check == 1){
				str = '<input class="inp-cbx" id="cbx' + category + itemCnt + '" type="checkbox" style="display: none" checked/>'
			}
			str += '<label class="cbx" for="cbx' + category + itemCnt + 
					'" onclick="checkItem(' + category + ', ' + itemCnt + ', ' + check + ')">' +
					'<span><svg width="12px" height="9px" viewbox="0 0 12 9"><polyline points="1 5 4 8 11 1"></polyline></svg></span>' +
					'<span>' + data.cl_item + '</span></label>';
			
			$("#ajax-box" + category + itemCnt).html(str);
		},
		error: function(error){
			console.log(error)
		}
	});
}
</script>
</html>