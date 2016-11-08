<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<%@include file="../shared/header.jsp"%>
<jsp:include page="../shared/title.jsp">
	<jsp:param value="${profile.firstName}" name="title" />
</jsp:include>

</head>

<body>

	<%@include file="../shared/menu.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-2">
				<%@include file="../shared/sidebar.jsp"%>
			</div>
			<div class="col-sm-12 col-md-10">

				<div class="panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">${operation} Blog</h3>
					</div>

					<div class="panel-body">
						<div class="row">
							<form:form action="${contextPath}/user/blog/save"
								modelAttribute="blog" cssClass="form-horizontal" id="frmBlog"
								method="POST">
								<form:hidden path="id" /><form:hidden path="createdAt" /><form:hidden path="newBlog" />
								<div class="form-group has-feedback">
									<label for="title" class="col-md-4 control-label">Enter Title: </label>
									<div class="col-md-8">
										<form:input path="title" cssClass="form-control"
											placeholder="Enter Blog Title" id="title" />
										<span id="title1" class="glyphicon form-control-feedback"
											aria-hidden="true"></span>
									</div>
								</div>
								<div class="form-group has-feedback">
									<label for="description" class="col-md-4 control-label">Enter Description: </label>
									<div class="col-md-8">
										<form:textarea path="description" cssClass="form-control"
											placeholder="Enter Blog Description" id="description"
											rows="5" />
										<span id="description1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-4 col-md-8">
										<input type="submit" value="${operation} Blog" class="btn btn-primary" />
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->

		<%@include file="../shared/footer.jsp"%>

	</div>
	<!-- /.container -->


</body>

</html>
