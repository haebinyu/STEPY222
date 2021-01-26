<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행 정보 수정</title>
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
	<button class="btn btn-default btn-lg" type="button" onclick="location.href='./'" style="margin-bottom: 20px; ">
	<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"> 메인으로&nbsp;</span>
	</button>
	<div class="contents-box">
		<form action="pEditPlan" method="post">
			<div class="row">
				<div class="form-group col-sm-offset-3 col-sm-6">
			  		<label for="t_planname">여행 이름</label>
			  		<input type="text" class="form-control" id="t_planname" name="t_planname" 
			  		placeholder="수정할 이름을 입력해주세요!" onkeyup="lengthCheck()" required>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-offset-3 col-sm-6">
			    <label for="t_spot">여행 지역</label>
			    <select class="form-control" id="t_spot" name="t_spot">
						  <option>서울</option>
						  <option>인천</option>
						  <option>강릉/속초</option>
						  <option>부산</option>
						  <option>여수</option>
						  <option>전주</option>
						  <option>제주</option>
					  </select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-offset-3 col-sm-6">
					<button type="submit" class="add-plan-btn btn btn-default btn-block">수정 완료</button>
				</div>
			</div>
		</form>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
<script type="text/javascript">
$(function(){
	//원래 여행 이름
	$("#t_planname").val('${plan.t_planname}');
	//원래 여행 장소
	$("#t_spot").val('${plan.t_spot}').prop("selected",true)
});

//내용 입력 글자수 제한
function lengthCheck(){
	var str = $("#t_planname").val();
	
	if(str.length > 20){
		$("#t_planname").val("");
		alert("내용은 20글자 까지만 입력해주세요");
	}
}
</script>
</html>