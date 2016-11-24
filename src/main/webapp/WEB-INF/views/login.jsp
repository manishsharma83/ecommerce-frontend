<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="common_resource.jsp"%>
</head>

<body>
	<%@ include file="header.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-12">
				<form action="/login" method="POST">
					<div class="form-group">
						<label for="email">Email address:</label> <input type="email" class="form-control" id="email">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password" class="form-control" id="pwd">
					</div>
					<!-- <div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div> -->
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<%@ include file="footer.jsp"%>

	<%@ include file="js-include.jsp"%>

</body>

</html>
