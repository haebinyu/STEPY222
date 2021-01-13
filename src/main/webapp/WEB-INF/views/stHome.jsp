<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1">
<title>Login</title>
</head>

<body>
<div class="container mt-4 center-block" style="width:500px;">
	<form class="px-4 py-3" action="./login" method="post">
		<div class="mb-3">
			<label for="exampleDropdownFormEmail2" class="form-label">ID</label>
			<input type="text" class="form-control" name="m_id" required
				id="exampleDropdownFormEmail2" placeholder="ID" autofocus>
		</div>
		<div class="mb-3">
			<label for="exampleDropdownFormPassword2" class="form-label">Password</label>
			<input type="password" class="form-control" name="m_pwd" required
				id="exampleDropdownFormPassword2" placeholder="Password">
		</div>
		<button type="submit" class="btn btn-primary">Login</button>
	</form>
	</div>

</body>
</html>