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
							<c:when test="${productId > 0}">
								<c:url var="productSubmitURL" value="/admin/products/edit/<c:out value="${product.id}"/>" />
							</c:when>
							<c:otherwise>
								<c:url var="productSubmitURL" value="/admin/products/add" />
							</c:otherwise>
						</c:choose>
                        <form role="form" name="adminProductForm" action="productSubmitURL" method="POST">

                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" value="<c:out value="${product.name}"/>" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label>Type</label>
                                <input type="text" name="type" value="<c:out value="${product.type}"/>" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="description" rows="3"><c:out value="${product.description}"/></textarea>
                            </div>

                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" name="price" value="<c:out value="${product.price}"/>" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label>Category</label>
                                <select name="productCategory" class="form-control">
                                    <option value="">Select Category</option>
                                    <c:forEach var="productCategory" items="${productCategories}">
                                    	<option value="${productCategory.id}">${productCategory.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-lg btn-primary">Save</button>
                            <c:url var="productUrl" value="/admin/products" />
                            <a href="${productUrl}/add" class="btn btn-lg btn-link">Cancel</a>

                        </form>

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
