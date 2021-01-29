<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="resources/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
.top {
	margin: 0 auto;
}
.storeImg {
	margin: 0;
}
.glyphicon-star {
	font-size: 20px;
	color: #F2B950;
}
.rating {
	font-size: 20px;
}
.calendar {
	font-size: 18px;
	text-align: center;
	border: 1px solid #F8F8F8;
	border-radius: 5px;
	background: #F8F8F8;
	width: 430px;
	height: 55px;
	line-height: 55px;
	margin: 30px 0;
}
.dateInput {
	color: #F2B950;
	font-size: 17px;
	text-align: center;
	background: white;
	width: 120px;
	height: 35px;
	border: 1px solid #F2B950;
	border-radius: 5px;
}
.submitBtm {
	background: #F2B950;
	color: white;
	font-size: 17px;
	text-align: center;
	background: white;
	width: 60px;
	height: 35px;
	border: 1px solid #F2B950;
	border-radius: 5px;
}

.StoreContents {
	margin-top: 20px;
}
.storeName {
	font-size: 28px;
	font-weight: bold;
}
.glyphicon-heart-empty {
	font-size: 30px;
	margin: 0 auto;
}
.rating {
	font-size: 22px;
	margin-top: 10px;
}
.reviewMove {
	font-size: 17px;
}
.product {
	border: 1px solid #EEEEEE;
	border-radius: 5px;
	padding: 25px;
	margin-top: 70px;
	font-weight: bold;
}
.productList {
	float: left;
	width: 100%;
}
.productImg {
	width: 450px;
	height: 300px;
	border-radius: 5px;
	margin-right: 10px;
}
.name {
	font-size: 23px;
}
.person {
	font-size: 16px;
	font-weight: normal;
	color: #989898;
}
.price {
	text-align: right;
	font-size: 20px;
}
.resBtn {
	float: right;
	font-size: 20px;
	font-weight: normal;
	width: 50%;
	height: 45px;
	color: white;
	background: #4375D9;
	border: 1px solid #4375D9;
	border-radius: 5px; 
	margin-top: 100px;
}
.divBtn{
	height: 45px;
}

#review {
	border: 1px solid #EEEEEE;
	border-radius: 5px;
	padding: 25px;
	margin-top: 50px;
}
.reviewTitle {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}
.reviewStar {
	font-size: 28px;
}
.reviewRating {
	font-size: 32px;
	font-weight: bold;
}
</style>
</head>

<body>
<header>
	<jsp:include page="header.jsp" />
</header>

<section>
	<div class="container">
		<!-- 가게 간단 정보 -->
		<div class="top">
			<div class="StoreImg">
				<img src="resources/images/gyeong.jpg" alt="">
			</div>
			<div class="StoreContents">
				<div class="storeName">${store.s_name} &nbsp;&nbsp;
					<span class="glyphicon glyphicon-heart-empty"></span>
				</div>
				<div class="rating">
					<span class="glyphicon glyphicon-star"></span> 
					<span><fmt:formatNumber value="${store.s_rate}" pattern=".0"/></span>
					<span><a href="#review" class="reviewMove">&nbsp;&nbsp; 후기 ></a></span>
				</div>
			</div>
		</div>
			
		<!-- 상품 리스트 -->
		<div class="product">
			<!--  
			<form action="productList">
				<div class="calendar">
					<span class="glyphicon glyphicon-calendar"></span>&nbsp;날짜 선택&nbsp;&nbsp;&nbsp;
					<input type="text" id="checkinDate" class="dateInput" placeholder="체크인 날짜">
					&nbsp; ~ &nbsp;
					<input type="text" id="checkoutDate" class="dateInput" placeholder="체크아웃 날짜">
					<input type="submit" class="submitBtm" value="적용">
				</div>
			</form>
			-->	
			<!-- 상품 리스트 출력 -->
			<div class="media">
				<c:if test="${empty pList}">
					예약 가능한 룸이 없습니다.
				</c:if>
						
				<div class=""> 
					<c:if test="${!empty pList}">
						<c:forEach var="pitem" items="${pList}">
							<div class="productList">
								<form action="rReservation">
									<div class="media-left">
										<img class="media-object productImg" 
											src="resources/images/ondol.jpg" alt="...">
									</div>
									<div class="media-body">
										<div class="media-heading name">${pitem.pl_name}</div>
										<div class="person">최대 ${pitem.pl_person}인</div>
										<div class="price">가격 &nbsp;&nbsp;&nbsp;
											<fmt:formatNumber type="number" maxFractionDigits="3" 
												value="${pitem.pl_price}"/>원</div>
										<div class="divBtn">
											<div><input type="submit" class="resBtn" value="예약"></div>
										</div>
									</div>
									<hr>
								</form>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- 후기 -->
		<div id="review">
			<div class="reviewTop">
				<div class="reviewTitle">후기</div>
				<div class="reviewRating">
					<span class="glyphicon glyphicon-star reviewStar"></span> 
					<span><fmt:formatNumber value="${store.s_rate}" pattern=".0"/></span>
					<hr>
				</div>
			</div>
		</div>
		
	</div>
</section>
	
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>

<script type="text/javascript">
// 달력
$(function() {
    $("#checkinDate").datepicker({
    	changeMonth: true, // 월 선택
    	changeYear: true, // 년도 선택
    	
    	nextText: "다음 달", // > 화살표 툴탭
    	prevText: "이전 달", // < 화살표 툴탭
    	
    	dateFormat: "yy.mm.dd", // 날짜 표기 방식
    	minDate: 0, // 오늘 이전 날짜 선택 불가
    	
    	onClose: function( selectedDate ) {    
            // 시작일(checkinDate) datepicker가 닫힐 때
            // 종료일(checkoutDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#checkoutDate").datepicker("option", "minDate", selectedDate);
        }
    });
    
    $("#checkoutDate").datepicker({
    	changeMonth: true, // 월 선택
    	changeYear: true, // 년도 선택
    	
    	nextText: "다음 달", // > 화살표 툴탭
    	prevText: "이전 달", // < 화살표 툴탭
    	
    	dateFormat: "yy.mm.dd", // 날짜 표기 방식
    	minDate: 0, // 오늘 이전 날짜 선택 불가
    	
    	onClose: function( selectedDate ) {
            // 종료일(checkoutDate) datepicker가 닫힐 때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#checkinDate").datepicker("option", "maxDate", selectedDate);
        }
    });
});
</script>

</html>