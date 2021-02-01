<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스토어 상세</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
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
	height: 31px;
	display: inline;
	font-size: 28px;
	font-weight: bold;
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
	margin-top: 160px;
}
.divBtn {
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
	height: 500px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<section>
		<div class="container">
			<!-- 가게 간단 정보 -->
			<div class="top">
				<div class="StoreImg container">
					<c:if test="${!empty fDto}">
						<ul class="bxslider">
							<c:if test="${fn:contains(fDto.f_sysname, '.png')}">
								<li><img src="resources/upload${fDto.f_sysname}" /></li>
							</c:if>
							<c:if test="${fn:contains(fDto.f_sysname, '.jpg')}">
								<li><img src="resources/upload${fDto.f_sysname}" /></li>
							</c:if>
							<c:if test="${!empty photoList}">
								<c:forEach var="photoList" items="${photoList}">
									<c:if test="${fn:contains(photoList.f_sysname, '.png')}">
										<li><img src="resources/upload${photoList.f_sysname}" /></li>
									</c:if>
									<c:if test="${fn:contains(photoList.f_sysname, '.jpg')}">
										<li><img src="resources/upload${photoList.f_sysname}" /></li>
									</c:if>
								</c:forEach>
							</c:if>
						</ul>
					</c:if>
				</div>
				<div class="StoreContents">
					<div class="container">
						<div class="storeName">
							<span class="st-name">${store.s_name}&nbsp;&nbsp;</span>
							<c:choose>
								<c:when test="${zzim == 0}">
									<span id="block1"> <img id="heart-button"
										src="resources/images/heart.svg" alt="heart-empty"
										width="18px" height="18px" style="margin-bottom: 8px;">
									</span>
								</c:when>
								<c:otherwise>
									<span id="block1"> <img id="heart-button"
										src="resources/images/heart_red.svg" alt="heart-full"
										width="18px" height="18px" style="margin-bottom: 8px;">
									</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="storeSummary">
							<h4>${store.s_summary}</h4>
						</div>
						<div class="rating">
							<span class="glyphicon glyphicon-star"></span> <span><fmt:formatNumber
									value="${store.s_rate}" pattern=".0" /></span> <span><a
								href="#review" class="reviewMove">&nbsp;&nbsp; 후기 ></a></span>
						</div>
					</div>
				</div>
			</div>

			<!-- 상품 리스트 -->
			<div class="product">
				<div class="media">
					<c:if test="${empty pList}">
					예약 가능한 룸이 없습니다.
				</c:if>
					<c:if test="${!empty pList}">
						<c:forEach var="pt" items="${ptMap}" varStatus="status">
							<div class="productList">
								<form action="rReservation">
									<div class="media-left">
										<c:if test="${fn:contains(pt.key, '.jpg')}">
											<a
												href="stDetail?pl_num=${pt.value.pl_num}&s_num=${store.s_num}">
												<img src="resources/upload${pt.key}"
												style="width: 450px; height: 300px; border-radius: 5px;">
											</a>
										</c:if>
										<c:if test="${fn:contains(pt.key, '.png')}">
											<a
												href="stDetail?pl_num=${pt.value.pl_num}&s_num=${store.s_num}">
												<img src="resources/upload${pt.key}"
												style="width: 450px; height: 300px; border-radius: 5px;">
											</a>
										</c:if>
									</div>
									<div class="media-body">
										<div class="media-heading name">
											<a
												href="stDetail?pl_num=${pt.value.pl_num}&s_num=${store.s_num}">${pt.value.pl_name}</a>
										</div>
										<div class="person">최대 ${pt.value.pl_person}인</div>
										<div class="price">
											가격 &nbsp;&nbsp;&nbsp;
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${pt.value.pl_price}" />
											원
										</div>
										<div class="divBtn">
											<div>
												<input type="submit" class="resBtn" value="예약">
											</div>
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
		<div id="review" class="container">
			<div class="reviewTop">
				<div class="reviewTitle">후기</div>
				<div class="reviewRating">
					<span class="glyphicon glyphicon-star reviewStar"></span> <span><fmt:formatNumber
							value="${store.s_rate}" pattern=".0" /></span>
					<hr>
				</div>
			</div>
		</div>

	</section>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
<script type="text/javascript">
	var j = $.noConflict(true);
	j(document).ready(function() {
		j('.bxslider').bxSlider({
			auto : false,
			controls : true,
			randomStart : false,
			pager : false,
		});
	});
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	var j311 = jQuery.noConflict();

	j311(function() {
		j311("#block1").click(
				function() {
					var heart = j311("#heart-button").attr("src");
					if (heart == "resources/images/heart.svg") {
						j311("#heart-button").attr("src",
								"resources/images/heart_red.svg");

						var mid = "<c:out value='${member.m_id}'/>";
						var cnum = "<c:out value='${store.s_num}'/>";

						var heartObj = {
							"ic_mid" : mid,
							"ic_cnum" : cnum
						};
						console.log(heartObj);

						j311.ajax({
							url : "inCartHeart",
							type : "get",
							data : heartObj,
							success : function(data) {
								alert("나의 찜리스트에 포함되었습니다.");
							},
							error : function(error) {
								console.log(error);
							}
						});
					} else {

						j311("#heart-button").attr("src",
								"resources/images/heart.svg");

						var mid = "<c:out value='${member.m_id}'/>";
						var cnum = "<c:out value='${store.s_num}'/>";

						var heartObj = {
							"ic_mid" : mid,
							"ic_cnum" : cnum
						};

						j311.ajax({
							url : "inCartHeartEmpty",
							type : "get",
							data : heartObj,
							success : function(data) {
								alert("나의 찜리스트에 제외되었습니다.");
							},
							error : function(error) {
								console.log(error);
							}
						});
					}
				});
	});
</script>
</html>


