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

<title>가게 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<style type="text/css">
.title-zone {
	width: 100%;
	height: 40px;
	padding: 5px;
	margin-bottom: 5px;
	background-color: #5983D9;
	color: white;
}
.photo-zone {
	width: 100%;
}
.bxslider {
	width: 100%;
	height: 400px;
}
.bx-wrapper {
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	border: 0;
}
.bx-wrapper img {
	width: 100%;
	height: 400px;
}
.info-zone {
	margin-bottom: 30px;
}
table {
	width: 100%;
	border: 1px solid #ddd;
	marign: 10px;
}
td {
	padding: 10px 20px 10px 20px;
}
.guide-zone {
	margin-top: 50px;
}
.price-deco {
	font-size: xx-large;
	font-weight: bold;
}
.address {
	color: #4375d9;
	font-weight: bold;
}
.btn {
	width: 47%;
	background-color: #4375d9;
	color: white;
	margin: 30px 3px;
}
.btn2 {
	background-color: #F2B950;
}
</style>

</head>
<body>
<!-- section -->
<div class="container center-block" style="width:800px;">
	<div class="container center-block title-zone">
		<h4 class="text-center"><b>스토어 상세</b></h4>		
	</div>
	<div class="container center-block info-zone">
		<h2 class="text-left" style="margin: 30px 0px"><b>${product.pl_name}</b></h2>
		<h5>&bull; 남은 개수 : ${product.pl_qty}개</h5>
		<h5>&bull; 기준 인원 : ${product.pl_person}명</h5>		
		<h5 style="margin-bottom: 25px">&bull; ${product.pl_text}</h5>
		<h5 class="address"><span class="glyphicon glyphicon-map-marker"></span> ${store.s_name}</h5>
	</div>	
	<div class="photo-zone">
		<c:if test="${empty photoList}">
			<c:if test="${fn:contains(fDto.f_sysname, '.png')}">
				<li><img src="resources/upload${fDto.f_sysname}" /></li>
			</c:if>
			<c:if test="${fn:contains(fDto.f_sysname, '.jpg')}">
				<li><img src="resources/upload${fDto.f_sysname}" /></li>
			</c:if>			
		</c:if>
		<c:if test="${!empty photoList}">
			<ul class="bxslider">
				<c:if test="${fn:contains(fDto.f_sysname, '.png')}">
					<li><img src="resources/upload${fDto.f_sysname}" /></li>
				</c:if>
				<c:if test="${fn:contains(fDto.f_sysname, '.jpg')}">
					<li><img src="resources/upload${fDto.f_sysname}" /></li>
				</c:if>				
				<c:forEach var="photo" items="${photoList}">
					<c:if test="${fn:contains(photo.f_sysname, '.png')}">
						<li><img src="resources/upload${photo.f_sysname}" /></li>
					</c:if>
					<c:if test="${fn:contains(photo.f_sysname, '.jpg')}">
						<li><img src="resources/upload${photo.f_sysname}" /></li>
					</c:if>
				</c:forEach>
			</ul>										
		</c:if>		
	</div>	
	<div class="center-block res-zone">
		<table>
			<tr>
				<td class="text-left"><h4><b>숙박</b></h4></td>
				<td></td>
			</tr>
			<tr>
				<td>체크인 23:00 부터 <br>체크아웃 13:00 까지</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td class="text-right">1박 기준 판매가<br><span class="price-deco">
					<b><fmt:formatNumber value="${product.pl_price}" pattern="#,###"/></b></span>원</td>
			</tr>
		</table>		
	</div>
	<div class="center-block btn-zone" style="width: 800px">
		<button type="button" class="btn btn1">예약하기</button>
		<button type="button" class="btn btn2">돌아가기</button>	
	</div>
	




</div>


</body>
<script type="text/javascript">
//<![CDATA[
var jQ182 = $.noConflict(true);
jQ182(document).ready(function(){
	jQ182('.bxslider').bxSlider({
		auto: false,
		controls: true,
		randomStart: false,
		pager: false,
	});
});
//]]>	
</script>
</html>