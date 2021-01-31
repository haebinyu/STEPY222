<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>스토어 메인사진 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	margin-top: 65px;
}
.thumb-zone {
	margin-top: 30px;
	margin-bottom: 20px;
}
.upload-mt {
	margin-top: 30px;
}
input[type="file"] {
	width: 100%;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="stHeader.jsp" />
	</header>
	
	<!-- section -->
	<div class="container center-block" style="width:500px;">
		<form class="row g-3" action="./stMyThumbProc" method="post" enctype="multipart/form-data">
			<h3 class="text-left">스토어 메인사진 관리</h3>
			<div class="thumb-zone">
				<c:if test="${empty stThumb}">
					<div class="alert alert-danger" role="alert">
					<span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;	
					등록된 메인 사진이 없습니다. <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스토어를 잘 보여줄 수 있는 사진 1장을 올려주세요:)</div>
					
					<div class="col-12 upload-mt">
    					<input type="file" name="files" id="file" required>
  						<input class="hidden upload-name" value="선택된 파일이 없습니다" readonly>
  						<input type="hidden" id="filecheck" value="0" name="fileCheck">
  					</div>
  					<div class="col-12">
   						<button type="submit" class="btn btn-mt">메인사진 등록하기</button>
   						<button type="button" class="btn btn-color" onclick="location.href='./stMyPage'">돌아가기</button>
 					</div>					
				</c:if>
			</div>					
			<div class="thumb-zone">	
				<c:if test="${!empty stThumb}">
					<div class="alert alert-warning" role="alert"><span class="glyphicon glyphicon-bullhorn"></span>
						&nbsp;&nbsp;메인 사진을 바꿀 경우 삭제 후 다시 업로드해주세요:)</div>
					<c:if test="${fn:contains(stThumb.f_oriname, '.jpg')}">
						<img src="resources/upload${stThumb.f_sysname}" style="width: 100%; height: 300px;">
					</c:if>
					<c:if test="${fn:contains(stThumb.f_oriname, '.png')}">
						<img src="resources/upload${stThumb.f_sysname}" style="width: 100%; height: 300px;">
					</c:if>
					<div class="col-12">
   						<button type="button" class="btn btn-mt" onclick="del('${stThumb.f_sysname}')">등록된 메인사진 삭제하기</button>
   					</div>
   					<div class="col-12">
   						<button type="button" class="btn btn-color" onclick="location.href='./stMyPage'">돌아가기</button>
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
function del(sysname){
	var con = confirm("메인사진을 삭제하시겠습니까?");
	if(con){
		var sysname = "${stThumb.f_sysname}"
		var objdata = {"f_sysname":sysname};
		objdata.f_cnum = ${ceo.c_num};
		console.log(objdata);
		
		$.ajax({
			url: "delThumb",
			type: "post",
			data: objdata,
			dataType: "text",
			success: function(data){
				if(data == "success"){
					alert("삭제되었습니다. 다시 올려주세요.");
					location.reload(true);
				} else {
					alert("삭제 실패하였습니다.");					
				}				
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				location.reload(true);
			}			
		});		
	}
}

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


</script>
</html>