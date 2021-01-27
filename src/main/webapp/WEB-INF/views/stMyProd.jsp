<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>내 상품 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<style type="text/css">
.btn {
	background-color: #4375D9;
	color: white;
	margin: 10px 0px;
}
.btn-color {
	background-color: #F25D07;
}
.btn-color2 {
	background-color: #F2B950;
}
.sub {
	width: 45%;
}
.btn-mar {
	margin: 10px auto;
	
}
.contents-size {
	height: 180px;
	overflow: auto;
}
.contents-size::-webkit-scrollbar {
    width: 10px;
}
.contents-size::-webkit-scrollbar-thumb {
    background-color: #F2B950;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
}
.contents-size::-webkit-scrollbar-track {
    background-color: #ddd;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
}
.thumbnail {
	height: 450px!important;
}
</style>

<script type="text/javascript">
$(function(){
	$(".suc").css("display", "block");
	$(".bef").css("display", "none");	
	
	var chk = "${msg}";
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}	
});

</script>

</head>
<body>
	<header>
		<jsp:include page="stHeader.jsp" />
	</header>
	
	<!-- section -->
	<div class="container center-block" style="width:1000px;">
		<ul class="nav nav-tabs nav-justified">
  			<li role="presentation"><a href="./stMyPage">내 정보 관리</a></li>
  			<li role="presentation" class="active"><a href="./stMyProd">내 상품 관리</a></li>
  			<li role="presentation"><a href="./stResList">예약 현황 보기</a></li>
  			<li role="presentation"><a href="./stReviewList">가게 후기 보기</a></li>
  			<li role="presentation"><a href="./stReportList">가게 신고 보기</a></li>
		</ul>
		
		<div class="btn-mar">			
   			<button type="submit" class="btn" onclick="location.href='./stWriteFrm'">
   				<span class="glyphicon glyphicon-pencil"></span></button>
   			<button type="button" class="btn btn-color" onclick="location.href='./stIntro'">
   				<span class="glyphicon glyphicon-zoom-in"></span></button>
		</div>		
		
		<c:if test="${empty pList}">
			<div class="text-center" style="margin-top: 40px;">등록된 상품이 없습니다.</div>
		</c:if>
		<c:if test="${!empty pList}">
			<div class="row">
				<c:forEach var="pt" items="${ptMap}" varStatus="status">
					<div class="col-sm-6 col-md-4">					
						<div class="thumbnail">						
							<c:if test="${fn:contains(pt.key, '.jpg')}">
								<img src="resources/upload${pt.key}" style="width: 100%; height: 200px;">
							</c:if>
							<c:if test="${fn:contains(pt.key, '.png')}">
								<img src="resources/upload${pt.key}" style="width: 100%; height: 200px;">
							</c:if>						
							<div class="caption contents-size">								
								<h3>${pt.value.pl_name}</h3>
        						<p>
        							&bull; 가격: <fmt:formatNumber value="${pt.value.pl_price}" pattern="#,###"/>원 <br>
        							&bull; 인원: ${pt.value.pl_person}명 <br>
        						<c:if test="${!empty pt.value.pl_qty}">
        							&bull; 수량: ${pt.value.pl_qty}개<br>
        						</c:if>        						
        							&bull; 특징: ${pt.value.pl_text}<br>        							
        						</p>
        					</div>
        					<p class="text-center">
        						<a href="#" class="btn sub" role="button" onclick="location.href='./stModifyProdFrm'">
        							<span class="glyphicon glyphicon-plus"></span>
        						</a>
        						<a href="#" class="btn btn-color2 sub" role="button">
        							<span class="glyphicon glyphicon-trash"></span>
        						</a>
        					</p>        					     						
    					</div>
  					</div>		
				</c:forEach>
			</div>
		</c:if>		
	</div>
	
	<footer>
		<jsp:include page="stFooter.jsp" />
	</footer>

</body>
</html>