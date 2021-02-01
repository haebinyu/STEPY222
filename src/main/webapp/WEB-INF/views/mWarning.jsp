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
	<main class="container" style="margin-bottom: 200px; margin-top: 100px;">
		<div class="center-block" id="firstphase">
			<div class="card text-center" id="first">
				<div class="card-header">
					<span class="glyphicon glyphicon-fire"></span>경고<span class="glyphicon glyphicon-fire"></span>
				</div>
				<div class="card-body">
					<h5 class="card-title">누군가가 이미 '${tryingid}'로 로그인하였습니다.</h5>
					<p class="card-text">
						본인이 아닌 다른 사람이 로그인을 했나요?<br> 이메일 인증을 통해서 '${tryingid}'로 재 로그인이 가능합니다.
					</p>
					<button class="btn btn-primary" id="toemail">이메일 인증하고 로그인하기</button>
				</div>

			</div>

			<div class="card text-center center-block" id="second" style="display: none;">
				<div class="card-header"></div>
				<div class="card-body">
					<h5 class="card-title">회원가입 시 작성한 이메일을 입력해주세요</h5>
					<input type="email" id="emailvalue"><br>
					<br> <span id="salarm"></span><br>
					<br>
					<div id="third" style="display: none">
						<input type="text" id="validate"><br> <span id="sndalarm"></span><br>
						<br>
					</div>
					<button class="btn btn-primary" id="sendemail">이메일 인증</button>

					<button type="button" class="btn btn-primary" id="changepwd" style="display: none;" 
					>비밀번호 변경하기</button>
				</div>

			</div>
		</div>

		<div id="secondphase" style="display:none;">
			<div class="card text-center" id="first">
				<div class="card-header">
					<span class="glyphicon glyphicon-fire"></span>마지막 단계입니다! 비밀번호를 변경해주세요. 기존에 로그인한 유저는 자동으로 로그아웃 됩니다!<span class="glyphicon glyphicon-fire"></span>
				</div>
				<div class="card-body">
					<h5 class="card-title">${tryingid}님 변경할 비밀번호를 입력해 주세요.</h5>
					<input type="password" id="pwd">
					<button class="btn btn-primary" id="confirm">변경</button>
					<span id="finalmsg"></span>
				</div>

			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
<script>
	var authkey;
	
	$(document).ready(function() {
		$("#validate").keyup(keymatch);
	});
	
	

	var toemail = document.getElementById("toemail");
	toemail.addEventListener("click", function() {
		$("#first").css("display", "none");
		$("#second").css("display", "block");
	});

	var sendmail = document.getElementById("sendemail");
	sendmail.addEventListener("click", function() {

		if ($("#emailvalue").val() == '') {
			$('#salarm').text("이메일 주소를 입력해주세요!");
			return;
		}

		var id = "${tryingid}";
		var obj = {
			"m_id" : id
		};
		obj.m_email = $("#emailvalue").val();
		console.log(obj);

		$.ajax({
			url : "mRestorePwd",
			type : "post",
			data : obj,
			dataType : "json",
			success : function(re) {
				if (re.msg.includes("success")) {
					$("#salarm").text("인증번호를 입력해주세요");
					$("#third").css("display", "block");
					$("#sendemail").css("display", "none");
					authkey = re.authkey;
				}
				if (re.msg.includes("nomatch")) {
					$("#salarm").text("일치하는 메일이 아닙니다.");
				}
				if (re.msg.includes("fail")) {
					$("#salarm").text(
							"지원하지 않는 이메일 형식입니다. naver 혹은 google 메일을 사용해주세요.");
				}
			},
			error : function(re) {

			}

		});

	});

	function keymatch() {
		var uip = $("#validate").val();
		if (uip == '') {
			$("#sndalarm").text('');
		}
		if (authkey != uip) {
			$("#sndalarm").text("인증번호가 일치하지 않습니다.");
			$("#sndalarm").css("color", "red");
		} else {
			$("#sndalarm").text("인증번호가 일치합니다!");
			$("#sndalarm").css("color", "green");
			$("#changepwd").css("display", "inline-block");
		}

	}

	var tochange = document.getElementById("changepwd");
	tochange.addEventListener("click",function(){
		$("#firstphase").css("display","none");
		$("#secondphase").css("display","block");
	});

	
	var confirm = document.getElementById("confirm");
	confirm.addEventListener("click",function(){
		var pwd = $("#pwd").val();
		var confirm = {"m_pwd" : pwd};
		confirm.m_id = "${tryingid}";
		
		$.ajax({
			url: "mUpdatePwd",
			data : confirm,
			type : "post",
			success: function(re){
				if(re == "success"){
					$("#finalmsg").text("비밀번호 변경이 완료되었습니다!다시 로그인해 주세요");
					$.ajax({
						url : "mForcedLogOut",
						data : confirm,
						type: "post",
						success : function(re){
							
						},
						error: function(re){
							
						}
					})
				}
				
			},
			error : function(re){
				alert(re);
			}
		});
		
	});
	
	
</script>
</html>