<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style_hj.css" rel="stylesheet">
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<section>
<div class="container">
<p>여행 번호 : ${planNum}</p>
<p>여행 이름 : ${planName}</p>
<p>리더 : ${leader}</p>
<p>장소 : ${spot}</p>
<p>출발일 : ${start}</p>
<p>도착일 : ${end}</p>
<p>멤버1 : ${member1}</p>
<p>멤버2 : ${member2}</p>
<p>멤버3 : ${member3}</p>
<p>멤버4 : ${member4}</p>
<p>멤버5 : ${member5}</p>
</div>
</section>
<footer>
<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>