<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String type = request.getParameter("type");
int typeNum = Integer.parseInt(request.getParameter("typeNum"));
%>
<head>
<link rel="stylesheet" href="resources/css/aListStyle.css">
<script type="text/javascript">
	var msgChk = "${msg}";

	if (msgChk != "") {
		alert(msgChk);
		msgChk = null;
		location.href = "aCeoList";
	}
</script>
</head>
<div class="list_area col-sm-3 col-md-10">
	<table class="listTbl table-bordered table-hover table-striped">
		<caption>
			<font id="caption_title"><%=type%> 리스트 보기</font>
		</caption>
		<thead>
			<tr>
				<th>승인 여부 확인</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>승인</th>
				<th>신고 수</th>
				<th>회원 추방</th>
			</tr>
		</thead>
		<c:forEach var="cItem" items="${ceoList}">
			<tr>
				<td class="joinCell">${cItem.c_join }</td>
				<td class="cNum">${cItem.c_num}</td>
				<td>${cItem.c_pwd}</td>
				<td>${cItem.c_email}</td>
				<td>${cItem.c_name}</td>
				<td>${cItem.c_phone}</td>
				<td class="accept" onclick="checkConfirm('${cItem.c_num}');">승인하기</td>
				<td>${cItem.c_report}</td>
				<td class="delete" onclick="delConfirm('${cItem.c_num}');">
					추방하기</td>
			</tr>
		</c:forEach>
		<c:if test="${empty ceoList }">
			<tr>
				<!-- 칼럼의 수만큼 colspan -->
				<td id="noData">승인 완료/대기 업체가 없습니다</td>
			</tr>
		</c:if>
	</table>
	<!-- 페이지 버튼 영역 -->
	<div class="btn-area">
		<!-- 페이지 버튼, EL 처리 -->
		<div class="paging">${paging}</div>
	</div>
</div>
<script>
	joinCells = document.getElementsByClassName("joinCell");
	checks = document.getElementsByClassName("check");
	cNumbers = document.getElementsByClassName("cNum");

	for (var i = 0; i < joinCells.length; i++) {
		if (joinCells[i].innerHTML == "pending") {
			joinCells[i].innerHTML = "승인 대기중";
			//joinCell[i]의 값이 "pending" 이므로 승인 버튼 표시 유지
		} else {
			//joinCell[i]의 값이 "approve" 이므로 이미 승인된 대상이므로 버튼을 숨김
			joinCells[i].innerHTML = "승인 완료됨";
			$(checks[i]).css("display", "none");
		}
	};

	//승인 수락 확인 confirm+클래스로 넘기기
	function checkConfirm(c_num) {
		var cNum = c_num;
		console.log(cNum);

		//JS에서 클래스로 파라미터를 넘길 때, ?(변수명)=파라미터값
		//confirm창에서 확인을 누른 경우 T, 취소를 누른 경우 F값
		var checkConfirm = confirm("이 회원의 등록을 승인합니다");
		if (checkConfirm == true) {
			location.href = "aPermitStore?c_num=" + cNum;
		}
		;
	};

	//삭제 승인 확인 confirm+클래스로 넘기기
	function delConfirm(c_num) {
		var cNum = c_num;
		console.log(cNum);

		var checkConfirm = confirm("이 회원의 데이터를 삭제합니다 | " + c_num);
		if (checkConfirm == true) {
			location.href = "aDeleteStore?c_num=" + cNum;
		}
		;
	}
</script>
<script src="resources/js/aAutoColspan.js"></script>