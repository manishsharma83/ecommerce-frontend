<!DOCTYPE html>
<html lang="en">
	
	<head>
		<%@ include file="common_resource.jsp" %>
	</head>
	
	<body>
		<%@ include file="header.jsp" %>
	    <!-- Page Content -->
	    <div class="container">
	
	        <div class="row">
	
	            <div class="col-md-3">
	                <%@ include file="left-nav.jsp" %>
	            </div>
	
	            <div class="col-md-9">
					<div class="row">
						<div class="col-md-3 pull-right">Hello <c:out value="${user}"/></div>
					</div>
	                <div class="row carousel-holder">
	
	                    <div class="col-md-12">
	                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	                            <ol class="carousel-indicators">
	                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	                            </ol>
	                            <div class="carousel-inner">
	                                <div class="item active">
	                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
	                                </div>
	                                <div class="item">
	                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
	                                </div>
	                                <div class="item">
	                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
	                                </div>
	                            </div>
	                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
	                                <span class="glyphicon glyphicon-chevron-left"></span>
	                            </a>
	                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
	                                <span class="glyphicon glyphicon-chevron-right"></span>
	                            </a>
	                        </div>
	                    </div>
	
	                </div>
	
	                <div class="row">
						<c:forEach var="product" items="${products}">
		                    <div class="col-sm-4 col-lg-4 col-md-4">
		                        <div class="thumbnail">
		                            <img src="http://placehold.it/320x150" alt="">
		                            <div class="caption">
		                                <h4><a href="#"><c:out value="${product.name}"/></a></h4>
		                                <br/>
		                                <h4 class="pull-right">$<c:out value="${product.price}"/></h4>
		                                <br/>
		                                <h4 class="pull-right"><c:out value="${product.productCategory.name}"/></h4>
		                                <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
		                            </div>
		                            <div class="ratings">
		                                <p class="pull-right">15 reviews</p>
		                                <p>
		                                    <span class="glyphicon glyphicon-star"></span>
		                                    <span class="glyphicon glyphicon-star"></span>
		                                    <span class="glyphicon glyphicon-star"></span>
		                                    <span class="glyphicon glyphicon-star"></span>
		                                    <span class="glyphicon glyphicon-star"></span>
		                                </p>
		                            </div>
		                        </div>
		                    </div>
	                    </c:forEach>
	                </div>
	                
	            </div>
	        </div>
	    </div>
	    <!-- /.container -->
	
		<%@ include file="footer.jsp" %>
		
		<%@ include file="js-include.jsp" %>

	</body>

</html>
