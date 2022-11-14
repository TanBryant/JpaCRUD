<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spring MVC 5 - form handling | Java Guides</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-2 col-md-7">
			<h2 class="text-center">Spring MVC và MySQl</h2>
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Thêm sản phẩm</div>


				</div>
				<div class="panel-body">
					<c:url var="post_url" value="/product/saveProduct" />
					<form:form action="${post_url}" cssClass="form-horizontal"
						method="post" modelAttribute="product">
						<form:errors path="*" cssClass="errorblock" element="div" />

						<!-- need to associate this data with customer id -->
						<form:hidden path="id" />

						<div class="form-group">
							<label for="name" class="col-md-3 control-label">Name</label>
							<div class="col-md-9">
								<form:input path="name" cssClass="form-control" />
								<form:errors path="name" cssClass="error" />
							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-md-3 control-label">Description</label>
							<div class="col-md-9">
								<form:input path="description" cssClass="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="price" class="col-md-3 control-label">Price</label>
							<div class="col-md-9">
								<form:input path="price" cssClass="form-control" />
								<form:errors path="price" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="category" class="col-md-3 control-label">Category</label>
							<div class="col-md-9">
								<form:select path="category.id" cssClass="form-control">

									<c:forEach var="cate" items="${cates}" varStatus="loop">
										<option value="${cate.id}"
											<c:if test="${cate.id == product.category.id}">selected</c:if>>
											${cate.name}</option>
									</c:forEach>


								</form:select>


							</div>
						</div>

						<div class="form-group">
							<label for="createDate" class="col-md-3 control-label">Creare
								Date</label>
							<div class="col-md-9">
								<form:input path="createDate" type="date"
									cssClass="form-control" value="${product.createDate}" />

							</div>
						</div>

						<div class="form-group">
							<label for="tags" class="col-md-3 control-label">Tag</label>
							<div class="col-md-9">
								<c:forEach items="${tagList}" var="tag">

									<c:url var="isProdTag" value="false" />
									<c:forEach items="${product.tags}" var="ptag">
										<c:if test="${tag.tagId == ptag.tagId}">
											<c:url var="isProdTag" value="true" />

										</c:if>
									</c:forEach>

									<c:if test="${isProdTag eq  true}">
										<form:checkbox path="tags" value="${tag.tagId}"
											checked="checked" />
										<c:out value="${tag.tagName}" />
									</c:if>

									<c:if test="${isProdTag eq false}">
										<form:checkbox path="tags" value="${tag.tagId}" />
										<c:out value="${tag.tagName}" />
									</c:if>


								</c:forEach>
							</div>
						</div>
						<div class="form-group">
							<!-- Button -->
							<div class="col-md-3">
								<form:button cssClass="btn btn-primary">Submit</form:button>
							</div>

							<div class="col-md-3">
								<a>Trở về</a>
							</div>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>