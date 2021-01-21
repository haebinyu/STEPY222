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
		<form>
		<p><strong>카테고리</strong></p>
		<input type="hidden" name="cl_category" value="${category}">
		<select class="form-control" id="categorySelect" onchange="categoryChange()">
		  <option value="직접입력">직접 입력</option>
		  <option value="교통" selected>교통</option>
		  <option value="관광">관광</option>
		  <option value="숙소">숙소</option>
		</select>
		<input type="text" class="form-control" id="categoryName" placeholder="카테고리를 입력해주세요" name="cl_categoryname" value="교통">
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
			<textarea class="form-control" rows="8" id="inputItem" name="itemName" placeholder="최대 20자까지 내용 입력" style="resize: none;" onkeyup="lengthCheck()"></textarea>
			<div class="row" style="margin-top: 30px">
				<div class="col-sm-6">
					<input class="btn btn-default btn-block add-party-btn" type="button" value="취소">
				</div>
				<div class="col-sm-6">
					<input class="btn btn-default btn-block del-party-btn" type="submit" value="완료">
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
	var category = $("#categorySelect").val();
	$("#categoryName").val(category);
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