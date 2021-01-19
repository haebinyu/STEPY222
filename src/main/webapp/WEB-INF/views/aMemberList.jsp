<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STEPY - 관리자 페이지</title>
<!-- 스크립트 - jquery 임포트 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS
부트스트랩 min 버전 임포트 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 스크립트 - 부트스트랩용 스크립트 임포트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
					<font>일반 회원 리스트 보기</font>
				</caption>
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이메일</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>연락처</th>
						<th>주소</th>
						<th>회원 추방</th>
					</tr>
				</thead>
				<!-- 전달받아 등록된 멤버 리스트 mList에서 꺼내 반복 출력
					꺼낼 대상은 mList, 꺼내는 매개변수 가명은 mItem으로 지정
					mItem을 통해 꺼낸 후 다시 mItem(DTO취급) 내의 필드 변수들을 꺼내 출력
					필드 변수 이름==DTO 변수 이름==DB 칼럼 이름 통일 필수-->
				<c:forEach var="mItem" items="${mList}">
					<tr>
						<td>${mItem.m_id}</td>
						<td>${mItem.m_pwd}</td>
						<td>${mItem.m_email}</td>
						<td>${mItem.m_name}</td>
						<td>${mItem.m_nickname}</td>
						<td>${mItem.m_birth}</td>
						<td>${mItem.m_gender}</td>
						<td>${mItem.m_phone}</td>
						<td>${mItem.m_addr}</td>
						<td>
							<button onclick="delConfirm('${mItem.m_id}');">추방하기</button>
						</td>
					</tr>
				</c:forEach>
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
	function delConfirm(m_id) {
		var mId = m_id;
		console.log(mId);

		var checkConfirm = confirm("이 회원의 데이터를 삭제합니다");
		if (checkConfirm == true) {
			location.href = "aDeleteMember?m_id=" + mId;
		}
		;
	}
</script>
</html>