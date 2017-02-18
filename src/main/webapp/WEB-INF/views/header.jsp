<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Start Bootstrap</a>
		</div>
		<c:url var="home" value="/" />
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav pull-right">
				<c:choose>
				    <c:when test="${loggedInUser == 'anonymousUser'}">
				       <li><a href="${home}signup">SignUp</a></li>
				       <li><a href="${home}login">Login</a></li>
				    </c:when>
				    <c:otherwise>
				    	<li><a href="javascript:void(0);"><c:if test="${loggedInUser != 'anonymousUser'}">Hello <c:out value="${loggedInUser}"/></c:if></a></li>
				        <li><a href="${home}logout">Logout</a></li>
				    </c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>