<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내용보기</title>
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
		
		var msg = "${msg}";
		
		if(msg != ""){
		alert(msg);
		}
		
		var id = "${member.m_id}";
		var pid = "${pList.pmid}";
		
		if(id == "" || id == null){
			$(".bef").css("display", "block");
			$("#rFrm").css("display", "none");
			$("#button").css("display", "none");
		}
		if(id != pid){
			$("#puls").css("display", "none");
			$("#pulss").css("display", "none");
		}
	});
</script>
</head>
<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>

	<section>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 col-xs-12"
				style="border: 2px solid skyblue; padding-top: 20px; padding-bottom: 20px;">
				<table class="table col-xs-12 col-md-8" style="margin-bottom: 0;">
					<tr>
						<td class="col-md-1 col-xs-2"
							style="background-color: #CCFFFF; text-align: center;">제목</td>
						<td class="col-md-7 col-xs-9">${pList.ptitle}
					</tr>
				</table>
				<table class="table col-xs-12 col-md-8" style="margin-bottom: 0;">
					<tr>
						<td class="col-md-1 col-xs-2"
							style="background-color: #CCFFFF; text-align: center;">작성자</td>
						<td class="col-md-3 col-xs-9">${pList.pmid}</td>
						<td class="hidden-xs col-md-1"
							style="background-color: #CCFFFF; text-align: center;">작성일</td>
						<td class="hidden-xs col-md-3">${pList.pdate}</td>
					</tr>
				</table>
				<table class="table col-xs-12 col-md-8" style="margin-bottom: 0;">
					<tr>
						<td class="hidden-xs col-md-1"
							style="text-align: center; background-color: #CCFFFF">내용</td>
						<td class="col-md-7 col-xs-11 " style="height: 450px;">${pList.pcontents}</td>
					</tr>
				</table>
				<table class="table col-xs-12 col-md-8" style="margin-bottom: 0;">
					<tr>
						<td class="col-md-1 col-xs-3"
							style="background-color: #CCFFFF; text-align: center;">첨부파일</td>
						<td class="col-md-7 col-xs-8" colspan="5"><c:if
								test="${empty fList}">
								첨부된 파일이 없습니다.
							</c:if> <c:if test="${!empty fList}">
								<c:forEach var="file" items="${fList}">
									<a href="./fileDown?sysName=${file.con_sysname}"> <span
										class="file-title">${file.con_oriname}</span></a>&nbsp;&nbsp;
								</c:forEach>
							</c:if></td>
					</tr>
					<c:if test="${!empty bfList}">
						<tr>
							<th>PREVIEW</th>
							<td colspan="5"><c:forEach var="f" items="${fList}">
									<c:if test="${fn:contains(f.con_sysname, '.jpg')}">
										<img src="resources/upload/${f.con_sysname}" width="100">
									</c:if>
									<c:if test="${fn:contains(f.con_sysname, '.png')}">
										<img src="resources/upload/${f.con_sysname}" width="100">
									</c:if>
									<c:if test="${fn:contains(f.con_sysname, '.gif')}">
										<img src="resources/upload/${f.con_sysname}" width="100">
									</c:if>
								</c:forEach></td>
						</tr>
					</c:if>
				</table>
				<div class="row col-md-8 col-md-offset-2 col-xs-8 col-xs-offset-2" style="text-align: center;">
					<button class="btn btn-info" id="puls"
						onclick="location.href='./bModifyFrm?pnum=${pList.pnum}'"
						style="margin-top: 30px; text-align: center;">수정</button>
					<button type="button" class="btn btn-info" id="pulss"
						onclick="location.href='./condel?pnum=${pList.pnum}'"
						style="margin-top: 30px; text-align: center;">삭제</button>
					<button class="btn btn-info"
						style="margin-top: 30px; text-align: center;" onclick="page()">뒤로가기</button>
				</div>

			</div>
		</div>
			<div class="col-md-offset-3 col-md-6" style="height: 30px;"></div>
				<form id="rFrm" class="col-md-offset-3 col-md-6" >
					<div class="row form-group" style="margin-top:20xp;">
						<label class="radio-inline col-md-offset-1"> <input type="radio"
							id="inlineRadio1" name="r_secret" value="T">비밀댓글
						</label> <label class="radio-inline"> <input type="radio"
							id="inlineRadio2" name="r_secret" checked value="F">공개댓글
						</label>
					</div>
					<div class="row form-group">
						<textarea class="col-md-10 col-md-offset-1 col-xs-12" placeholder="내용을 입력해 주세요" name="r_contents"
							style="height: 100px; resize: none; margin-top: 10px;"></textarea>
					</div>
					<div class="row form-group">
						<input class="btn btn-info col-md-10 col-md-offset-1 col-xs-12" type="button"
							value="등록" onclick="replyInsert(${pList.pnum})"
							style="height: 40px; margin-bottom: 30px;">
					</div>
				</form>
			
		<div class="row" style="text-align: center;">
			<div class="col-md-6 col-md-offset-3"
				style="padding-top: 20px; padding-bottom: 20px;">
				<table class="table" id="rtable">
					<c:forEach var="r" items="${rList}">
						<tr height="25" align="center">
							<td class="col-md-1 col-xs-2">${r.r_id}</td>
							<td class="col-md-3 col-xs-9">${r.r_contents}</td>
							<td class="col-md-1 hidden-xs">
							<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${r.r_date}" /></td>
							<td class="col-md-1 hidden-xs" id="button">
								<button type="button" onclick="">신고</button> 
								<c:if test="${r.r_id == member.m_id}">
									<button type="button" class="del"
										onclick="location.href='./delete?pnum=${r.r_pnum}&rnum=${r.r_num}'">삭제</button>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</section>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
function page(){
		var cat = "${pList.pcategory}";
		
		if(cat == "메이트 구하기"){
			location.href="./bMateList?pageNum=${pageNum}"
		}
		else if(cat == "자유"){
			location.href="./bFreeList?pageNum=${pageNum}"
		}
		else if(cat == "후기"){
			location.href="./bReviewList?pageNum=${pageNum}"
		}
		else{
			location.href="./bCommunity?pageNum=${pageNum}"
		}
		
}
function replyInsert(pnum){
	var replyFrm = $("#rFrm").serializeObject();
	replyFrm.r_pnum = pnum;//글번호 추가
	replyFrm.r_id = "${member.m_id}";
	
	console.log(replyFrm);
	
	$.ajax({
		url: "replyIns",
		type: "post",
		data: replyFrm,
		dataType: "json",
		success: function(data){
			var rlist = "";
			var dlist = data.rList;
			var id = "${member.m_id}";
			
			for(var i = 0; i < dlist.length; i++){
				rlist += '<tbody><tr height="25" align="center">'
				+'<td class="col-md-1 col-xs-2">' + dlist[i].r_id + '</td>' 
				+'<td class="col-md-3 col-xs-9">' + dlist[i].r_contents + '</td>' 
				+'<td class="col-md-1 hidden-xs">' +  dlist[i].r_date + '</td>'
				+'<td class="col-md-1 hidden-xs">' +'<button type="button" id="del" onclick="">신고 </button>';
				if(dlist[i].r_id == id){	
					rlist += '<button type="button" class="del" onclick="location.href=' + "'./delete?pnum=" 
				+ dlist[i].r_pnum + "&rnum=" + dlist[i].r_num + "'" + '">삭제</button>';
				
				}
				rlist += '</td></tr></tbody>'
			}
			$('#rtable').html(rlist);
		},
		error: function(error){
			console.log(error);
			alert("댓글 입력 실패")
		}
		
	});
	
	$("#comment").val("");
}

</script>
</html>





