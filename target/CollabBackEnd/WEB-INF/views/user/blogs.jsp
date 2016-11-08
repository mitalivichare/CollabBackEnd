<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" ng-app="webapp">

<head>

<%@include file="../shared/header.jsp"%>
<jsp:include page="../shared/title.jsp">
	<jsp:param value="${profile.firstName}" name="title" />
</jsp:include>

	<script>
		window.userId = '${profile.id}'; 
	</script>
<script src="${js}/controller/blog.js"></script>

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
						<h3 class="panel-title">${profile.firstName}
							${profile.lastName} - Blogs</h3>
					</div>

					<div class="panel-body" ng-controller = "BlogListController as blogCtrl">
						<div class="row">
							<table class="table table-bordered table-striped">							
								<thead>
									<tr>
										<th>Title</th>
										<th>Created At</th>
										<th></th>
									</tr>																	
								</thead>
								<tbody>
									<tr ng-repeat = "blog in blogCtrl.blogs">
										<td><a ng-href ="${contextPath}/user/view/blog/{{blog.id}}">{{blog.title}}</a></td>
										<td><span class="glyphicon glyphicon-time"></span> {{blog.createdAt | date:mediumDate}}</td>
										<td>
											<a ng-href ="${contextPath}/user/blog/edit/{{blog.id}}" class="btn btn-primary">Edit</a>&#160;
											<a ng-click="removeBlog(blog.id)" class="btn btn-danger">Delete</a>
										</td>
									</tr>
								</tbody>							
							</table>							
						</div>
					</div>
					
					<div class="panel-footer">
						<a href="${contextPath}/user/blog/add" class="btn btn-primary">Create New</a>
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
