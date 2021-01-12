<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body style="height: 100%;">

	<header style="height: 13%; min-height: 13%; line-height: 13%;">
		<jsp:include page="header.jsp" />
	</header>

	<section style="height: 82%;">
		<div class="row" style="text-align: center; margin-left: 19%; margin-top: 25px;">
			<div class="col-sm-9" style="background-color: pink; height: 200px;">
				<h2>여행일정</h2>
				<div class="row" style="margin-left: 28%;">
					<div class="col-xs-8 col-sm-2" style="background-color: yellow; height: 100px; margin-right: 200px;
															border-radius: 50%;">
					Level 2: .col-xs-8 .col-sm-6</div>
					<div class="col-xs-4 col-sm-2" style="background-color: green; height: 100px; border-radius: 50%;">
					Level 2: .col-xs-4 .col-sm-6</div>
				</div>
			</div>
		</div>
		<div class="row" style="text-align: center; background-color: yellow; margin-top:25px; width: 40%;
								margin-left: 30%; margin-bottom: 25px; height: 200px; padding-top: 50px;">
			<h1>1111111</h1>
		</div>
		<div class="row" style="text-align: center; margin-left: 19%; margin-top: 25px;">
			<div class="col-sm-9" style="background-color: pink; height: 300px;">
				<h2>여행일정</h2>
				<div class="row" style="margin-left: 5%;">
					<div class="col-xs-8 col-sm-2" style="background-color: yellow; height: 200px; margin-right: 70px;
															width: 230px;">
					Level 2: .col-xs-8 .col-sm-6</div>
					<div class="col-xs-4 col-sm-2" style="background-color: green; height: 200px;
															margin-right: 70px; width: 230px;">
					Level 2: .col-xs-4 .col-sm-6</div>
					<div class="col-xs-4 col-sm-2" style="background-color: green; height:200px;
															width: 230px;">
					Level 2: .col-xs-4 .col-sm-6</div>
				</div>
			</div>
		</div>
	</section>

	<footer style="height: 5%;">
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>
