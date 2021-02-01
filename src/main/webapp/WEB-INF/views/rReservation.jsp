<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>STEPY 예약</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="resources/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">
.personalInfo {
	float: left;
	padding: 30px;
	width: 50%;
}
.bigTitle {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 25px;
}
.title {
	font-size: 18px;
	color: #808080;
	margin-bottom: 10px;
}
.contents {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 20px;
}
input {
	margin-bottom: 20px;
}

.reservInfo {
	float: right;
	background-color: #F8F8F8;
	margin-top: 20px;
	padding: 30px;
	width: 30%
}
.VAT {
	font-size: 16px;
}
.price {
	font-size: 25px;
	font-weight: bold;
	color: #F2B950;
	margin-top: 10px;
}
li {
	font-size: 16px;
	margin-top: 30px;
	margin-left: 0;
}
.reservBtn{
	margin-top: 50px;
	margin-left: 30px;
	width: 30%;
	height: 50px;
	font-size: 20px;
	color: white;
	background: #4375D9;
	border: 1px solid #4375D9;
}
</style>
</head>
	
<body>
<header>
	<jsp:include page="header.jsp" />
</header>

<section>
	<div class="container">
		<form action="" method="post">
			<div class="personalInfo">
				<div class="bigTitle">예약자 정보</div>
				<div class="title">예약자 이름</div>
				<div>
					<input class="form-control input-lg" type="text" id="formGroupInputLarge" 
						placeholder="체크인 시 필요한 정보입니다.">
				</div>
				<div class="title">예약자 번호</div>
				<div>
					<input class="form-control input-lg" type="text" id="formGroupInputLarge"
						placeholder="안심번호로 변경되어 숙소에 전달됩니다.">
				</div>
				<hr>
			</div>
			
			<!-- --------- -->
			<div>
				<div  class="reservInfo">
					<div>
						<div class="title">숙소 이름</div> <div class="contents">${store.s_name}</div>
					</div>
					<div>
						<div class="title">객실 타입</div> <div class="contents">${product.pl_name}</div>
					</div>
					<div>
						<div class="title">체크인</div> <div class="contents"></div>
					</div>
					<div>
						<div class="title">체크아웃</div> <div class="contents"></div>
					</div>
					<hr>
					
					<div>
						<div>
							<span class="bigTitle">총 결제 금액</span> <span class="VAT">(VAT 포함)</span>
						</div>
						<div class="price">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.pl_price}"/>원
						</div>
						<div>
							<ul>
								<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다.</li>
								<li>결제 완료 후 예약자 이름으로 바로 체크인 하시면 됩니다.</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div>
					<input type="submit" value="예약하기" class="reservBtn">
				</div>
			</div>
		</form>
	</div>
</section>

<footer>
	<jsp:include page="footer.jsp" />
</footer>
</body>

<script type="text/javascript">
$(function(){
	
});
</script>

</html>