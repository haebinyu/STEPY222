<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>STEPY 통합 검색</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="resources/css/style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$('#myTab a').click(function (e) {
	e.preventDefault()
	$(this).tab('show')
})
</script>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<section>
		<div class="container">
			<h3 style="text-align: center">검색</h3>
			<br>

			<div class="container-fluid">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#hotel" aria-controls="hotel" role="tab" data-toggle="tab">숙소</a></li>
					<li role="presentation">
						<a href="#restaurant" aria-controls="restaurant" role="tab" data-toggle="tab">음식점</a></li>
					<li role="presentation">
						<a href="#play" aria-controls="play" role="tab" data-toggle="tab">레저/티켓</a></li>
				</ul>
			</div>
			
			
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="hotel">
					<div class="form-group form-group-lg">
						<div class="col-sm-10">
							<input class="form-control" type="text" id="formGroupInputLarge"
								placeholder="지역, 숙소명">
						</div>
					</div>
					<button type="button" class="btn btn-default btn-lg"
						style="border: 1px solid #4375D9; color: #4375D9;">검색</button>
				</div>
				
				<div role="tabpanel" class="tab-pane" id="restaurant">
					<div class="form-group form-group-lg">
						<div class="col-sm-10">
							<input class="form-control" type="text" id="formGroupInputLarge"
								placeholder="지역, 음식점명">
						</div>
					</div>
					<button type="button" class="btn btn-default btn-lg"
						style="border: 1px solid #4375D9; color: #4375D9;">검색</button>
				</div>
				
				<div role="tabpanel" class="tab-pane" id="play">
					<div class="form-group form-group-lg">
						<div class="col-sm-10">
							<input class="form-control" type="text" id="formGroupInputLarge"
								placeholder="지역, 티켓명">
						</div>
					</div>
					<button type="button" class="btn btn-default btn-lg"
						style="border: 1px solid #4375D9; color: #4375D9;">검색</button>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>

</html>