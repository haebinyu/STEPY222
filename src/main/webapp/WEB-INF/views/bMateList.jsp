<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행 동행</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$(".suc").css("display", "none");
		$(".bef").css("display", "none");
		

		//
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", fucntion(){
			searchForm.submit();
		});
});
</script>

<style type="text/css">
.paging{
	text-align: center;
	margin-top: 30px;
}
.pagination {
	color: #4375D9;
}

.searchFrm {
	float: right;
	margin-top: 100px;
}
.option {
	float: left;
	width: 200px;
}
.keywordInput {
	float: left;
	width: 500px;
	margin: 0 5px;
}
.searchBtn {
	color: #4375D9;
	border: 1px solid #4375D9;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>

	<section>
		<form class="form-horizontal" action="login" method="post">
			<div class="form-group">
				<label for="inputEmail3"
					class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4"> 
					<input type="text" class="form-control" id="inputEmail3"
						name="m_id" placeholder="게시글 제목을 입력해주세요">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-xs-12">
				<table class="table">
					<c:forEach var="pitem" items="${pList}">
					<tr>
						<td class="active" style="width:40px;">${pitem.pmid}</td>
						<td class="warning" style="width:230px;">
							<a href="contents?pnum=${pitem.pnum}">${pitem.ptitle}</a></td>
						<td class="danger hidden-xs" style="width:50px;">조회수 : ${pitem.pview}</td>	
						<td class="info hidden-xs" style="width:50px;">추천수 : ${pitem.plike}</td>
						<td class="active hidden-xs" style="width:40px;">${pitem.pdate}</td>	
					</tr>
					</c:forEach>				
				</table>
					<div class="row">
						<div class="col-xs-12" style="text-align: center;">${paging}</div>	
					</div>
					<div class="row" style="text-align:center;">
						<button type="button" class="btn btn-info"
							onclick="location.href='./bWriteProc'" style="margin-top:50px;">글쓰기</button>
					</div>
			</div>
		</div>
		
		<!-- 검색창 -->
		<div class="container searchFrm">
			<form action="searchMate" method="post" id="searchForm">
				<select class="form-control option" name="searchOption">
					<option value="all" <c:out value=""/>>
						전체(제목+내용+작성자)</option>	
					<option value="p_title">제목
					<option value="p_contents">내용</option>
					<option value="p_mid">작성자</option>
				</select>
				<input name="keyword"class="form-control keywordInput" type="text" placeholder="검색어를 입력해주세요.">
				<button class="btn btn-default searchBtn" type="submit">검색</button>
			</form>
		</div>
	</section>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>