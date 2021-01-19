<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<jsp:include page="aSideBar.jsp" />
	<div class="formArea col-sm-10" align=center>
		<form target="aSendMemberMail" method="post">
			<fieldset>
				<legend>이메일</legend>
				<textarea rows="3" cols="120" name="targets" placeholder="이메일"></textarea>
			</fieldset>
			<fieldset>
				<legend>제목</legend>
				<input type="text" name="title" placeholder="제목">
			</fieldset>
			<fieldset>
				<legend>내용</legend>
				<textarea rows="10" cols="120" name="contents" placeholder="메일 내용"></textarea>
			</fieldset>
			<input type="submit" value="메일 전송" class="mailBtn">
			<!--  -->
			<input type="reset" value="메일 리셋" class="mailBtn">
		</form>
	</div>
</div>