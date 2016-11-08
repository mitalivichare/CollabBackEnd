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
<html lang="en" >

<head>

<%@include file="../shared/header.jsp"%>
<script src="${js}/controller/forum.js"></script>
<jsp:include page="../shared/title.jsp">
	<jsp:param value="About Us" name="title" />
</jsp:include>

</head>

<body>

	<%@include file="../shared/menu.jsp"%>

	<!-- Page Content -->
	<div ng-app="webapp" class="container">

		<div class="row">
			<div class="col-xs-offset-2 col-xs-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">${operation} Forum</h3>
					</div>
					<div class="panel-body">
						<form:form action="${contextPath}/admin/forum/save" modelAttribute="forum" cssClass="form-horizontal" id="frmForum" method="POST">
							<form:hidden path="id"/><form:hidden path="newForum"/><form:hidden path="createdAt"/>
							<div class="form-group has-feedback">
								<label for="title" class="col-md-4 control-label">Enter Title: </label>
								<div class="col-md-8">
									<form:input path="title" cssClass="form-control" placeholder="Enter Forum Title" id="title"/>
									<span id="title1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="description" class="col-md-4 control-label">Enter Description: </label>
								<div class="col-md-8">
									<form:textarea path="description" cssClass="form-control" placeholder="Enter Forum Description" id="description" rows="5"/>
									<span id="description1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							
							<div class="form-group">
								<label for="category" class="control-label col-md-4">Select Category</label>
								<div class="col-md-8">				
								    <form:select path="categoryId" cssClass="form-control" id="category">
										<form:options items="${categories}"/>		    		
								    </form:select>
							    </div>
							</div>							
							<div class="form-group">							
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" value="${operation} Forum" class="btn btn-primary"/>
								</div>								
							</div>								
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->


		<!-- Footer -->

		<%@include file="../shared/footer.jsp"%>


	</div>
	<!-- /.container -->
	
	
</body>

</html>