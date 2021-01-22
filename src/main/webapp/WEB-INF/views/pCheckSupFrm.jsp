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
			<c:forEach var="cvList" items="${cvList}">
				<div class="page-header">
					<h1 style="padding-right: 15px">${cvList.cl_categoryname}
					<div class="dayDelBtn pull-right" title="카테고리 삭제" onclick="if(confirm('카테고리를 삭제하시겠습니까?')) location.href='delCheckCategory?category=${cvList.cl_category}'"><img src="resources/images/remove.png"></div>
					<div class="dayEditBtn pull-right" title="준비물 수정" onclick="categoryPopup(${cvList.cl_category})"><img src="resources/images/edit.png"></div>
					</h1>
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
										 <div class="dayDelBtn pull-right" title="준비물 삭제" onclick="if(confirm('준비물을 삭제하시겠습니까?')) location.href='delCheckItem?category=${checklist.cl_category}&itemCnt=${itemCnt}'"><img src="resources/images/remove.png"></div>
										 <div class="dayEditBtn pull-right" title="준비물 수정" onclick="togglePopup(${checklist.cl_category},${itemCnt})"><img src="resources/images/edit.png"></div>
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
											 <div class="dayDelBtn pull-right" title="준비물 삭제" onclick="if(confirm('준비물을 삭제하시겠습니까?')) location.href='delCheckItem?category=${checklist.cl_category}&itemCnt=${itemCnt}'"><img src="resources/images/remove.png"></div>
											  <div class="dayEditBtn pull-right" title="준비물 수정" onclick="togglePopup(${checklist.cl_category},${itemCnt})"><img src="resources/images/edit.png"></div>
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
	  <div class="popup-wrap">
		<div class="popup-area">
			<div class="popup-close"><img src="resources/images/close.png" width="15"></div>
				<div class="search-box">
					<div class="page-header manual-input-title">
					  <h3>준비물 수정</h3>
					</div>
				</div>
			<div class="add-store-box">
			<form action="pEditCheckItem" id="itemEditFrm">
			<input type="hidden" name="cl_plannum" value="${curPlan}">
			<input type="hidden" name="cl_category" class="inputCategory">
			<input type="hidden" name="cl_cnt" id="inputCnt">
			<textarea class="form-control" rows="8" id="inputItem" name="cl_item" placeholder="수정할 내용을 입력해주세요 (최대 20자)" style="resize: none;" onkeyup="lengthCheck()"></textarea>
			<div class="row" style="margin-top: 30px">
				<div class="col-sm-6">
					<input class="btn btn-default btn-block del-party-btn cancel" type="button" value="취소">
				</div>
				<div class="col-sm-6">
					<input class="btn btn-default btn-block add-party-btn" type="submit" value="완료">
				</div>
			</div>
			</form>
			<form action="pEditCheckCategory" id="categoryEditFrm">
			<input type="hidden" name="cl_plannum" value="${curPlan}">
			<input type="hidden" name="cl_category" class="inputCategory">
			<textarea class="form-control" rows="8" id="inputCategoryName" name="cl_categoryname" placeholder="수정할 내용을 입력해주세요 (최대 20자)" style="resize: none; displany: none;" onkeyup="lengthCheck()"></textarea>
			<div class="row" style="margin-top: 30px">
				<div class="col-sm-6">
					<input class="btn btn-default btn-block del-party-btn cancel" type="button" value="취소">
				</div>
				<div class="col-sm-6">
					<input class="btn btn-default btn-block add-party-btn" type="submit" value="완료">
				</div>
			</div>
			</form>
			</div>
		</div>
		<div class="popup-background"></div>
	</div>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
<script type="text/javascript">
//준비믈 체크 상태 변경
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
					'<span>' + data.cl_item + '</span></label>' +
					'<div class="dayDelBtn pull-right" title="준비물 삭제" onclick="' +
					"if(confirm('준비물을 삭제하시겠습니까?')) location.href='delCheckItem?category=" + category + "&itemCnt=" + itemCnt + "'" +
					'"><img src="resources/images/remove.png"></div>' +
					' <div class="dayEditBtn pull-right" title="준비물 수정" onclick="' +
					'togglePopup(' + category + ',' + itemCnt +')"><img src="resources/images/edit.png"></div>'
			
			$("#ajax-box" + category + itemCnt).html(str);
		},
		error: function(error){
			console.log(error)
		}
	});
}

//팝업창 온오프
function togglePopup(category, itemCnt, categoryName) {
	$(".popup-wrap").css("opacity","1").css("visibility","visible");
	$("#itemEditFrm").css("display", "block");
	$("#categoryEditFrm").css("display", "none");
	
	//폼 value 입력
	$(".inputCategory").val(category);
	$("#inputCnt").val(itemCnt);
}
//카테고리 변경 팝업
function categoryPopup(category){
	$(".popup-wrap").css("opacity","1").css("visibility","visible");
	$("#itemEditFrm").css("display", "none");
	$("#categoryEditFrm").css("display", "block");
	
	//폼 value 입력
	$(".inputCategory").val(category);
}

$(function(){
	$(".cancel").click(function(){
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		$("#inputItem").val("");
		$("#inputCategoryName").val("");
	});
	$(".popup-close").click(function(){
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		$("#inputItem").val("");
		$("#inputCategoryName").val("");
	});
	$(".popup-background").click(function(){
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		$("#inputItem").val("");
		$("#inputCategoryName").val("");
	});
});

//내용 입력 글자수 제한
function lengthCheck(){
	var str = $("#inputItem").val();
	console.log(str);
	
	if(str.length > 20){
		$("#inputItem").val("");
		alert("내용은 20글자 까지만 입력해주세요");
	}
}
</script>
</html>