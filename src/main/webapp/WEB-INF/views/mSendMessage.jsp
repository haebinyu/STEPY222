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
<body
	style="background-image: linear-gradient(to bottom right, rgba(67, 117, 217, 1), rgba(67, 117, 217, 0.5));"
>
	<main class="container" style="margin-top: 150px;">
		<div class="col-md-12 text-center">
			<form action="mSendMessageProc" method="post">
				<div class="form-group">
					<label for="exampleFormControlInput1" style="color: white;">받는사람 (TO)</label> <input
						type="email" class="form-control" id="exampleFormControlInput1"
						value="${host.m_nickname}(${host.m_id})" readonly
					> <input type="hidden" name="ms_mid" value="${host.m_id }">
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1" style="color: white;">보내는 사람(FROM))</label> <input
						type="email" class="form-control" id="exampleFormControlInput1"
						value="${guest.m_nickname }(${guest.m_id})" readonly
					> <input type="hidden" name="ms_smid" value="${guest.m_id}">
				</div>

				<div class="form-group">
					<label for="exampleFormControlTextarea1" style="color: white;">내용 작성</label>
					<textarea class="form-control" name="ms_contents" rows="3" placeholder="200자 이내로 작성해주세요"
						maxlength="200" onkeypress="return restricSpace()" onPaste="return false"
					></textarea>
					<div style="color: white;">
						<div style="float:right; ">
							<span id="written">(0</span> <span id="space">/ 200)</span>
						</div>
					</div>
				</div>
				<br>
				<span id="alarm"></span>
				<div class="col">
				<button id="btn" type="submit" class="btn btn-primary">보내기</button><br><br>
				<button type="button" class="btn" style="background-color: #f5f5f5; color:black;" onclick="back()">뒤로가기</button>
				</div>
			</form>
		</div>

	</main>

</body>
<script type="text/javascript">

	function back(){
		window.history.back();
	}

	$('textarea').keyup(function() {
		
		var counter = $(this).val().length;
			var current = $('#written');
			current.text("(" + counter);
			
		if(counter>200){
			$("#btn").prop("disabled", true);
			$("#alarm").css("display", "block");
			$("#alarm").text("200자를 초과하는 메세지는 전송이 불가능합니다^^!");
		}else{
			$("#btn").prop("disabled", false);
			$("#alarm").css("display", "none");
		}

	});
			
	function restricSpace(){
		if(event.keyCode == 13) {
			event.returnValue = false;
			return false;
		}
	}		
</script>
</html>