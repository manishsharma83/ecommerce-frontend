<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../common_resource.jsp"%>
</head>

<body>
	<div id="wrapper">
		<%@ include file="../header.jsp"%>
	
		<div id="page-wrapper">
	
			<div class="container-fluid">
				<c:url var="productUrl" value="/admin/products" />
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Tables
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Tables
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				<div class="row">
					<div class="col-lg-2">
						<a href="${productUrl}/add" class="btn btn-lg btn-primary">Add Product</a>
					</div>
				</div>
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Products</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
	                                <c:forEach var="product" items="${products}">
	                                    <tr>
	                                        <td><c:out value="${product.name}"/></td>
	                                        <td><c:out value="${product.productCategory.name}"/></td>
	                                        <td><a href="${productUrl}/edit/<c:out value="${product.id}"/>">Edit</a></td>
	                                        <td><a href="${productUrl}/delete/<c:out value="${product.id}"/>">Delete</a></td>
	                                    </tr>
	                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
				
	
			</div>
			<!-- /.container-fluid -->
	
		</div>
		<!-- /#page-wrapper -->
	</div>
	<%@ include file="../js-include.jsp"%>

</body>

</html>
