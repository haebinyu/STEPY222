<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.footer {
	position: absolute;
	height: 80px;
	width: 100%;
	bottom: 0;
}
.footer-menu {
	padding: 25px 0 30px;
	background-color: #fbfbfb;
	box-sizing: border-box;
	display: block;
}
.footer-layout {
	position: relative;
	width: 100%;
	box-sizing: 100%;
	display: block;
	margin: 0px auto;
}
.footer-menu p {
	font-size: 13px;
	line-height: 26px;
	margin: 0;
	padding: 0;	
}
.footer-menu span a {
	color: #333333;
	text-decoration: none;
	margin: 0px 20px 0px 23px;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}
.line {
	border-left: 1px solid #333333;
}
.line:last-child {
	border-right: 1px solid #333333;
}	
.sub-menu {
	margin-bottom: 10px !important;
}
.copy {
	font-family: 'Noto Sans KR', sans-serif;
	
}
</style>

	<div class="footer text-center">
		<div class="footer-menu"> <!-- company info -->
			<div class="footer-layout"><!-- contents layout -->
				<p class="sub-menu center-block">
				<span class="line">
					<a href="./sSearchFrm" class="sug-board" style="text-decoration: none;">검색하기</a>
				</span>
				<span class="line">
					<a href="./bSugList" class="sug-board" style="text-decoration: none;">건의하기</a>
				</span>
				<span class="line">
					<a href="./stHome" class="ceo-board" style="text-decoration: none;">사장님 페이지</a>
				</span>
				<span class="line">
					<a href="./aLoginFrm" class="ceo-board"	style="text-decoration: none;">관리자 페이지</a>
				</span>
				</p>
				<p class="center-block">
					<span class="copy">&copy; 2021 BOB All Rights Reserved.</span>
				</p>			
			</div>			
		</div>				
	</div>



