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

			<div class="col-md-3">
				<%@ include file="left-nav.jsp"%>
			</div>

			<div class="col-md-9">
				<div class="row">
					<div class="col-md-3 pull-right">
						Hello <c:out value="${user}" />
					</div>
				</div>

				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/800x300"
						alt="">
					<div class="caption-full">
						<h4 class="pull-right">$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></h4>
						<h4>
							<a href="#"><c:out value="${product.name}"/></a>
						</h4>
						<p>
							<c:out value="${product.description}"/>
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum</p>
					</div>
					<div class="ratings">
						<p class="pull-right">3 reviews</p>
						<p>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> 4.0 stars
						</p>
					</div>
				</div>

				<div class="well">

					<div class="text-right">
						<a class="btn btn-success">Leave a Review</a>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> Anonymous <span
								class="pull-right">10 days ago</span>
							<p>This product was great in terms of quality. I would
								definitely buy another!</p>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> Anonymous <span
								class="pull-right">12 days ago</span>
							<p>I've alredy ordered another one!</p>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> Anonymous <span
								class="pull-right">15 days ago</span>
							<p>I've seen some better than this, but not at this price. I
								definitely recommend this item.</p>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- /.container -->

	<%@ include file="footer.jsp"%>

	<%@ include file="js-include.jsp"%>
</body>

</html>
