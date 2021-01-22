<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STEPY - 관리자 페이지</title>
<!-- 이벤트 페이지들 전용 스타일-->
<link rel="stylesheet" href="resources/css/aEventListStyle.css">
<link rel="stylesheet" href="resources/css/aListStyle.css">
</head>
<body>
	<!-- header,footer는 공통 양식으로 include 처리 -->
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container">
		<jsp:include page="aSideBar.jsp" />
		<div class="list_area col-sm-3 col-md-10">
			<table class="listTbl table-bordered table-hover table-striped">
				<caption>
					<font>이벤트 리스트 보기</font>
				</caption>
				<thead>
					<tr>
						<th>이벤트 번호</th>
						<th>이벤트 제목</th>
						<th>이벤트 내용</th>
						<th>이벤트 기간</th>
						<th>이벤트 중지</th>
					</tr>
				</thead>
				<c:forEach var="eItem" items="${eventList}">
					<tr>

						<td>${eItem.e_num}</td>
						<td>${eItem.e_title}</td>
						<td>${eItem.e_contents}</td>
						<td>${eItem.e_date}</td>
						<td><a><button>중지하기</button></a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty eventList }">
					<tr>
						<!-- 칼럼의 수만큼 colspan -->
						<td id="noData">등록된 이벤트가 없습니다</td>
					</tr>
				</c:if>
				<tfoot>
					<tr>
						<td id="blank_td"></td>
						<td id="new_event"><a href="aEventWriteFrm"><button>신규
									이벤트 등록</button></a></td>
					</tr>
				</tfoot>
			</table>
			<!-- 페이지 버튼 영역 -->
			<div class="btn-area">
				<!-- 페이지 버튼, EL 처리 -->
				<div class="paging">${paging}</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
<script type="text/javascript">
	//칼럼의 수만큼 자동 colspan
	var target = document.getElementsByTagName('th');
	for (var i = 0; i < target.length; i++) {
		target[i].setAttribute('class', 'tbl_col');
	}

	var tbl_cols_array = document.getElementsByClassName("tbl_col");
	var tbl_cols = tbl_cols_array.length;//칼럼 배열의 길이=칼럼 수

	//총 칼럼의 수만큼 colspan 속성 지정
	var noData = document.getElementById("noData");
	if (noData != null) {
		noData.setAttribute("colspan", tbl_cols);
	}
	blank_td.setAttribute("colspan", tbl_cols - 2);
	new_event.setAttribute("colspan", (tbl_cols - (tbl_cols - 2)));
</script>
</html>