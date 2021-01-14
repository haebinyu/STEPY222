<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>새로운 일정 만들기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style_hj.css" rel="stylesheet">
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- jQuery UI 라이브러리 js파일 -->
<script>

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

$(function() {
	var chk = "${msg}";
	console.log(chk);

	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
});
</script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
<div class="container">
	<div class="contents-box">
		<div class="row">
			<form class="form-horizontal" action="pRegPlan" method="post">
				<div class="party-list col-sm-4 col-xs-12">
				<div class="reader">
				<p class="reader-name"><img src="resources/images/flag.png" height="15"> session.로그인아이디(추가예정)</p>
				<input type="hidden" value="user01" name="t_id">
				</div>
				<div id="hidden-member">
					<input type="hidden" name="t_member1">
					<input type="hidden" name="t_member2">
					<input type="hidden" name="t_member3">
					<input type="hidden" name="t_member4">
					<input type="hidden" name="t_member5">
				</div>
				<div id="party-member">
					
				</div>
				<input class="add-party-btn btn btn-default btn-block" id="add-party-btn" type="button" value="일행 추가하기 +" onclick="addParty()">
				<input class="del-party-btn btn btn-default btn-block" id="del-party-btn" type="button" value="일행 삭제하기 -" onclick="delParty()">
			</div>
			
			<div class="travel-info col-sm-8 col-xs-12">
				<div class="form-group">
				   <label for="t_planname" class="col-sm-2 control-label">여행이름</label>
				   <div class="col-sm-10">
				     <input type="text" class="form-control" id="t_planname" name="t_planname" placeholder="이번 여행의 이름을 입력해주세요!" required>
				   </div>
				 </div>
				  <div class="form-group">
				    <label for="t_spot" class="col-sm-2 control-label">여행지역</label>
				    <div class="col-sm-10">
				      <select class="form-control" id="t_spot" name="t_spot">
						  <option>서울</option>
						  <option>인천</option>
						  <option>강릉/속초</option>
						  <option>부산</option>
						  <option>여수</option>
						  <option>전주</option>
						  <option>제주</option>
					  </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="t_stdate" class="col-sm-2 control-label">출발 일자</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="t_stdate" name="t_stdate" required placeholder="출발 일자를 선택하세요">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="t_bkdate" class="col-sm-2 control-label">도착 일자</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="t_bkdate" name="t_bkdate" required placeholder="도착 일자를 선택하세요">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="add-plan-btn btn btn-default btn-block">여행 시작</button>
				    </div>
				  </div>
				</div>
			</form>
		</div>
	</div>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
<script type="text/javascript">
var memberCnt = 1; //생성된 멤버 카운트용 변수
function addParty(){
	console.log("addParty()");
	console.log(memberCnt);
	
	if(memberCnt >= 6){ // 6명 이상 추가시 경고창
		alert("멤버는 5명 까지만 추가 가능합니다!")
	}
	else{ // 새로운 멤버 아이디 입력창 생성
		var html = '<div class="form-group">' + 
	    '<label for="t_member' + memberCnt + '" class="col-sm-3 control-label">' +
		'<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>' + ' 멤버' + memberCnt + '</label>' +
	    '<div class="col-sm-9"><input type="text" class="form-control" id="t_member' + memberCnt + '" name="t_member' + memberCnt + '" placeholder="아이디를 입력하세요" required></div></div>'
	    
		$("#party-member").append(html);
	    $("#hidden-member>input:first-child").remove();// 가장 처음 요소 삭제
		memberCnt++; // 생성된 멤버 카운트 증가
	}
}
function delParty(){
	console.log("delParty()");
	var html = '<input type="hidden" name="t_member' + (memberCnt - 1) + '">'
	
	if(memberCnt > 1){ // 생성된 멤버가 있는 경우 실행
		$("#party-member>div:last-child").remove(); // 가장 마지막 입력 요소제거
		$("#hidden-member").prepend(html) // 요소 처음부터 추가
		memberCnt--; // 멤버 카운트 감소
	}
	else { // 생성된 멤버가 없는 경우 경고창
		alert("삭제할 멤버가 없습니다!")
	}
}
</script>
<script type="text/javascript">
$(function() {
    //datepicker 한국어로 사용하기 위한 언어설정
    $.datepicker.setDefaults($.datepicker.regional['ko']); 
    
    // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
    // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

    //시작일.
    $('#t_stdate').datepicker({
        showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지
        buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
        buttonText: "날짜선택",             // 버튼의 대체 텍스트
        dateFormat: "yy-mm-dd",             // 날짜의 형식
        changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
        minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
        onClose: function( selectedDate ) { 
        	console.log(selectedDate);
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#t_bkdate").datepicker( "option", "minDate", selectedDate );
        }                
    });

    //종료일
    $('#t_bkdate').datepicker({
        showOn: "both", 
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
        buttonImageOnly : true,
        buttonText: "날짜선택",
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        minDate: 0, // 오늘 이전 날짜 선택 불가
        onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#t_stdate").datepicker( "option", "maxDate", selectedDate );
        }                
    });
});
</script>
</html>