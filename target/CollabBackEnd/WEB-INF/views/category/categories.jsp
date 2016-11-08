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
<html lang="en" ng-app="webapp">

<head>

<%@include file="../shared/header.jsp"%>

<jsp:include page="../shared/title.jsp">
	<jsp:param value="About Us" name="title" />
</jsp:include>

</head>

<body>
<div>
	<%@include file="../shared/menu.jsp"%>
</div>
	<!-- Page Content -->
	<div class="container">
	<c:if test="${!empty operation}">
			<div class="alert alert-success" id="success-alert">
				<button type="button" class="close" data-dismiss="alert">x</button>
				<strong>Success! </strong> ${operation}			
			</div>
		</c:if>
	
	<div class="row">
			<div class="col-xs-offset-2 col-xs-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">${operation} Forum</h3>
					</div>
					<div class="panel-body">
						<form:form action="${contextPath}/admin/category/save" modelAttribute="category" cssClass="form-horizontal" id="frmForum" method="POST">
							<form:hidden path="id"/>
							<div class="form-group has-feedback">
								<label for="title" class="col-md-4 control-label">Enter Category: </label>
								<div class="col-md-8">
									<form:input path="name" cssClass="form-control" placeholder="Enter Category" id="name"/>
									<span  class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="description" class="col-md-4 control-label">Enter Description: </label>
								<div class="col-md-8">
									<form:textarea path="description" cssClass="form-control" placeholder="Enter Category Description" id="description" rows="5"/>
									<span id="description1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
														
							<div class="form-group">							
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" value="${operation} Category" class="btn btn-primary"/>
								</div>								
							</div>								
						</form:form>
					</div>
		</div>
		</div>
		</div>
		
	
	
	
	
	
	<div>
		<%@include file="../shared/footer.jsp"%>
	</div>

	</div>
	<!-- /.container -->


	
	

</body>

</html>
	