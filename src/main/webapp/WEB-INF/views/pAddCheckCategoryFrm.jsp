<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카테고리 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style_hjk.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
<div class="container">
	<button class="btn btn-default btn-lg" type="button" onclick="location.href='pCheckSupFrm?planNum=${curPlan}'">
	<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"> 뒤로가기&nbsp;</span>
	</button>
	<div class="page-header">
	  <h1 class="text-center">카테고리 추가</h1>
	</div>
	<div class="search-box col-sm-offset-3 col-sm-6">
		<form action="pAddCheckCategory">
		<p><strong>카테고리 선택</strong></p>
		<input type="hidden" name="cl_plannum" value="${curPlan}">
		<input type="hidden" name="cl_category" value="${category}">
		<input type="hidden" name="cl_cnt" value="1">
		<input type="text" class="form-control" id="categoryName" placeholder="카테고리를 입력해주세요(최대 20자)" name="cl_categoryname" value="관광" required onkeyup="lengthCheck()">
		<select class="form-control" id="categorySelect" onchange="categoryChange()" style="margin: 15px 0;">
		  <option value="직접입력">직접 입력</option>
		  <option value="관광" selected>관광</option>
		  <option value="교통">교통</option>
		  <option value="숙소">숙소</option>
		</select>
		<p><strong>준비물 선택</strong></p>
		<div class="form-group">
			<input type="text" class="form-control" name="cl_item" id="itemSelect" readonly placeholder="준비물을 선택하세요">
			<ul class="list-group itemList">
				<li class="list-group-item"><a href="#" id="manual-input" onclick="manualInput()">직접 입력</a></li>
				<li class="list-group-item">상비약<img src="resources/images/plus.png" class="pull-right add-item" width="20" onclick="addItemClick('상비약')"></li>
				<li class="list-group-item">충전기<img src="resources/images/plus.png" class="pull-right add-item" width="20" onclick="addItemClick('충전기')"></li>
				<li class="list-group-item">신분증<img src="resources/images/plus.png" class="pull-right add-item" width="20" onclick="addItemClick('신분증')"></li>
			</ul>
		</div>
		<div class="form-group">
			<input class="btn btn-default btn-block add-day-plan-btn" type="submit" value="완료">
		</div>
		</form>
	</div>
	<div class="popup-wrap">
		<div class="popup-area">
			<div class="popup-close"><img src="resources/images/close.png" width="15"></div>
				<div class="search-box">
					<div class="page-header manual-input-title">
					  <h3>직접 입력</h3>
					</div>
				</div>
			<div class="add-store-box">
			<form action="pAddCheckItem">
			<textarea class="form-control" rows="8" id="inputItem" name="itemName" placeholder="내용을 입력해주세요 (최대 20자)" style="resize: none;" onkeyup="lengthCheck()"></textarea>
			<div class="row" style="margin-top: 30px">
				<div class="col-sm-6">
					<input class="btn btn-default btn-block del-party-btn" type="button" value="취소">
				</div>
				<div class="col-sm-6">
					<input class="btn btn-default btn-block add-party-btn" type="button" value="완료" onclick="manualItemInput()">
				</div>
			</div>
			</form>
			</div>
		</div>
		<div class="popup-background"></div>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
<script type="text/javascript">
//클릭 체크용 변수
var click = 0;

//내용 입력 글자수 제한
function lengthCheck(){
	var str = $("#categoryName").val();
	console.log(str);
	
	if(str.length > 20){
		$("#categoryName").val("");
		alert("내용은 20글자 까지만 입력해주세요");
	}
}

//카테고리 선택
function categoryChange(){
	//프리셋 선택시
	var category = $("#categorySelect").val();
	$("#categoryName").val(category);
	console.log($("#categorySelect").val());
	
	//직접입력 선택시
	if(category == "직접입력"){
		$("#categoryName").css("display", "block");
		$("#categoryName").val("");
		$("#categoryName").focus();
	}
	if(category != "직접입력"){
		$("#categoryName").css("display", "none");
	}
}

$(function(){
	
	//준비물 선택 클릭
	$("#itemSelect").click(function(){
		if(click == 0){
			$(".itemList").css("display", "block");
			click = 1;
			console.log(click);
		}
		else if(click == 1){
			$(".itemList").css("display", "none");
			click = 0;
			console.log(click);
		}
	});
	
	//준비물 직접 입력시
	$(".add-party-btn").click(function(){
		var item = $("#inputItem").val();
		//준비물 선택창에 전달
		$("#itemSelect").val(item);
		//팝업 닫기
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		//준비물 리스트 닫기
		$(".itemList").css("display", "none");
		//클릭 카운트 초기화
		click = 0;
	});
	
	//취소 버튼 클릭
	$(".del-party-btn").click(function(){
		//팝업창 닫기
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		//내용 초기화
		$("#inputItem").val("");
		//준비물 리스트 닫기
		$(".itemList").css("display", "none");
		//클릭카운트 초기화
		click = 0;
	});
});

//준비물 선택시
function addItemClick(item){
	$("#itemSelect").val(item);
	$(".itemList").css("display", "none");
	click = 0;
}

$(function(){
	
	//팝업창 온오프
	$("#manual-input").click(function(){
		$(".popup-wrap").css("opacity","1").css("visibility","visible");
	});
	$(".popup-close").click(function(){
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		$("#inputItem").val("");
	});
	$(".popup-background").click(function(){
		$(".popup-wrap").css("opacity","0").css("visibility","hidden");
		$("#inputItem").val("");
	});
	
});
</script>
</html>