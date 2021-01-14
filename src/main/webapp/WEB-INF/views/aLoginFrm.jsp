<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Travelers!</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";

		if (msg != "") {
			alert(msg);//msg 메시지를  alert출력
			//현재 페이지를 리로드, 새로고침해 현재 페이지를 초기화
			location.reload(true);
		}
	});
</script>
<style type="text/css">
form.form-horizontal>h3 {
	margin-top: 10px;
	font-weight: bolder;
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container">
		<form class="form-horizontal" action="aHome" method="post">
			<h3>확인을 위해 다시 로그인 해주세요</h3>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputId" name="m_id"
						placeholder="아이디" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPwd"
						name="m_pwd" placeholder="비밀번호" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox">아이디 저장하기
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
				</div>
			</div>
		</form>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>