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

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <c:choose>
								<c:when test="${productId > 0}">
									Edit Product
								</c:when>
								<c:otherwise>
									Add Product
								</c:otherwise>
							</c:choose>
                        </h1>
                        <!-- <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Forms
                            </li>
                        </ol> -->
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
						<c:choose>
							<c:when test="${productDeleted}">
								<c:url var="productListURL" value="/admin/products/list" />
	                            <div class="form-group">
	                                <label>Product deleted successfully!!!</label>
	                            </div>
	
	                            Go to <a href="${productListURL}/add" class="btn btn-lg btn-primary">Product List</a>
							</c:when>
							<c:otherwise>
		                    	<c:url var="productDeleteSubmitURL" value="/admin/products/delete/<c:out value="${product.id}"/>" />
		                        <form role="form" name="adminProductConfirmDeleteForm" action="productDeleteSubmitURL" method="POST">
		
		                            <div class="form-group">
		                                <label>Are you sure you want to delete this product?</label>
		                            </div>
		
		                            <button type="submit" class="btn btn-lg btn-primary">Delete</button>
		
		                        </form>
							</c:otherwise>
						</c:choose>

                    </div>
                </div>
                <!-- /.row -->

            </div>
	
		</div>
		<!-- /#page-wrapper -->
	</div>
	<%@ include file="../js-include.jsp"%>

</body>

</html>
