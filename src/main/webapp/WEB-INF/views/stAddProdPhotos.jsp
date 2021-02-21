<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상품사진 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$(".suc").css("display", "block");
	$(".bef").css("display", "none");
	$(".add3").css("display", "none");
	$("#add2").css("display", "none");
	
	var chk = "${msg}";
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}	
});
</script>
<style type="text/css">
.btn {
	background-color: #5983D9;
	color: white;
	margin-top: 5px;
	width: 100%;
}
.btn-color {
	background-color: #F2B950;
}
.btn-mt {
	margin-top: 30px;
}
.thumb-zone {
	margin-top: 30px;
	margin-bottom: 20px;
}
.upload-mt {
	margin-top: 30px;
}
.container-margin {
	margin-top: 10px;
}
input[type="file"] {
	width: 100%;
}
.bxslider {
	width: 100%;
	height: 300px;
}
.bx-wrapper {
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	border: 0;
}
.bx-wrapper img {
	width: 100%;
	height: 300px;
}
ul {
	margin-bottom: 0px;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="stHeader.jsp" />
	</header>
	
	<!-- section -->
	<div class="container center-block" style="width:500px;">
		<form class="row g-3" action="./stAddProdPhotoProc" method="post" enctype="multipart/form-data">
			<h3 class="text-left">상품사진 추가</h3>
			<div class="thumb-zone">
				<c:if test="${empty photoList}">
					<div class="alert alert-danger" role="alert">
					<span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;	
					사진을 추가하고 싶으신가요?<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					해당 상품의 다양한 사진을 올려주세요:)</div>
					
					<div class="col-12 upload-mt">
    					<input type="file" name="files" id="file" multiple required>
  						<input class="hidden upload-name" value="선택된 파일이 없습니다" readonly>
  						<input type="hidden" id="filecheck" value="0" name="fileCheck">
  					</div>
  					<div class="col-12">
   						<button type="submit" class="btn btn-mt">상품 사진 추가하기</button>
   						<button type="button" class="btn btn-color" onclick="location.href='./stMyProd'">돌아가기</button>
 					</div>					
				</c:if>
			</div>					
			<div class="thumb-zone">	
				<c:if test="${!empty photoList}">
					<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-bullhorn"></span>
						&nbsp;&nbsp;사진을 바꿀 경우, 삭제 후 다시 업로드해주세요:)</div>
					<ul class="bxslider">
						<c:forEach var="photo" items="${photoList}">
							<c:if test="${fn:contains(photo.f_sysname, '.png')}">
								<li><img src="resources/upload${photo.f_sysname}" /></li>
							</c:if>
							<c:if test="${fn:contains(photo.f_sysname, '.jpg')}">
								<li><img src="resources/upload${photo.f_sysname}" /></li>
							</c:if>
						</c:forEach>
					</ul>			
   					<div class="col-12">
   						<button type="button" class="btn btn-color" onclick="location.href='./stMyProd'">돌아가기</button>
 					</div>    					
				</c:if>
			</div>	  			  		
		</form>
	</div>
	
	<footer>
		<jsp:include page="stFooter.jsp" />
	</footer>

</body>
<script type="text/javascript">
$("#file").on('change', function(){
	var files = $("#file")[0].files;
	console.log(files);
	
	var fileName = "";
	
	for(var i = 0; i < files.length; i++){
		fileName += files[i].name + " ";
	}
	console.log(fileName);
	
	$(".upload-name").val(fileName);
	
	if(fileName == ""){
		console.log("empty");
		$("#filecheck").val(0);
		$(".upload-name").val("선택된 파일 없음");
	} else {
		console.log("not empty");
		$("#filecheck").val(1);
	}
});

$(document).ready(function() {
	$('.bxslider').bxSlider({
		auto: false,
		controls: true,
		randomStart: false,
		pager: false,
	});
});


</script>
</html>
