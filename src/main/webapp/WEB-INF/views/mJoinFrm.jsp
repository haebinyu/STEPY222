<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main class="container">
		<div class="container mt-4 center-block text-center"
			style="margin-top: 50px; max-width: 600px; background-color: #4375d9; color: white;"
		>
			<h1>Join STEPY</h1>
		</div>
		<div class="container mt-4 center-block text-dark text-center"
			style="max-width: 600px; background-color: #F5F5F5; margin-bottom: 100px;"
		>
			<br> <br>

			<form action="mJoinProc" method="post">

				<div class="form-group row">
					<label for="checkid" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-8">
						<input type="text" name="m_id" class="form-control" placeholder="id입력" id="checkid" required>
					</div>
					<div class="col-sm-2">
						<input type="button" value="중복확인" onclick="idDuplicationCheck()">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" name="m_pwd" class="form-control" id="inputPassword3"
							placeholder="비밀번호" required
						>
					</div>
				</div>

				<div class="form-group row">
					<label for="passdoublecheck" class="col-sm-2 col-form-label">비밀번호 확인</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="passdoublecheck" placeholder="비밀번호 확인"
							required
						>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-8">
						<input type="email" name="m_email" class="form-control" id="inputEmail3"
							placeholder="ex) stepy@naver.com" required
						>
					</div>
				</div>

				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">성명</label>
					<div class="col-sm-8">
						<input type="text" name="m_name" class="form-control" id="name" placeholder="ex)홍길동" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="nickname" class="col-sm-2 col-form-label">닉네임</label>
					<div class="col-sm-8">
						<input type="text" name="m_nickname" class="form-control" id="nickname" required>
					</div>
				</div>

				<br>
				<h4>
					<i>선택사항</i>
				</h4>
				<br>

				<div class="form-group row">
					<label for="mobilephone" class="col-sm-2 col-form-label">연락처</label>
					<div class="col-sm-8">
						<input type="tel" name="m_phone" class="form-control" id="mobilephone"
							placeholder="여백없이 번호 11자리 입력 " minlength="11" maxlength="11"
						>
					</div>
				</div>

				<div class="form-group row">
					<label for="birth" class="col-sm-2 col-form-label">생일</label>
					<div class="col-sm-8">
						<input type="tel" name="m_birth" class="form-control" id="birth" minlength="8" maxlength="8" placeholder="19980323">
					</div>
				</div>
				<br>

				<fieldset class="form-group">
					<div class="row">
						<div class="col-sm-2 col-form-label">
							<b>성별</b>
						</div>
						<div class="col-sm-8">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="m_gender" id="gender_wm" value="여성"
								> <label class="form-check-label" for="gender_wm"> 여성 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="m_gender" id="gender_m" value="남성">
								<label class="form-check-label" for="gender_m"> 남성 </label>
							</div>
						</div>
					</div>
				</fieldset>
				<br>

				<div class="form-group row">
					<label for="address" class="col-sm-2 col-form-label">거주지</label> <input type="text"
						id="sample6_postcode" placeholder="우편번호"
					> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="address_without_specific"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address_with_specific">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
				</div>
				<br>
				<br>


				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
			<br> <br>
		</div>

	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// + 아이디 중복 체크 안했으면 회원가입 안되게 작업처리
// + 카카오 이메일 동의 안했으면 사이트 이용 불가처리

	function idDuplicationCheck() {
		var enteredId = $('#checkid').val();

		var object = {
			"tempid" : enteredId
		};//아이디를 보내면 server 에서 id 를 검색을 해서 check 함. 
		console.log(object);

		$.ajax({
			url : "mIdDuplicationCheck",
			type : "get",
			data : object,
			success : function(rtdata) {
				alert(rtdata);
			},
			error : function(rtdata) {
				alert("error occured");
			}
		});

	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>