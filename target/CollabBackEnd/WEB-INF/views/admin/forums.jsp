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
<script src="${js}/controller/forum.js"></script>
<jsp:include page="../shared/title.jsp">
	<jsp:param value="FORUMS" name="title" />
</jsp:include>

</head>

<body>

	<%@include file="../shared/menu.jsp"%>

	<!-- Page Content -->
	<div  ng-app="webapp" class="container">
		<c:if test="${!empty operation}">
			<div class="alert alert-success" id="success-alert">
				<button type="button" class="close" data-dismiss="alert">x</button>
				<strong>Success! </strong> ${operation}			
			</div>
		</c:if>

		<div class="row" ng-controller="ForumListController as forumCtrl">
			<div class="col-xs-12">
				<div class="panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">Active Forums</h3>
					</div>

					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>
								<tr ng-repeat="item in forumCtrl.collections">
									<td>{{item.category.name}}</td>
									<td>
										<table class="table table-condensed tblForum">
											<tr ng-if="!item.forums || item.forums.length == 0">
												<td>There is no forum for this category</td>
											</tr>
											<tr ng-repeat="forum in item.forums">
												<td width="60%"><a
													ng-href="${contextPath}/viewForum/{{forum.id}}">{{forum.title}}</a></td>
												<td width="25%">{{forum.createdAt | date: mediumDate }}</td>
												<td width="15%"><a class="btn btn-primary"
													ng-href="${contextPath}/admin/forum/edit/{{forum.id}}">Edit</a>&#160;
													<a class="btn btn-danger" ng-click="removeForum(forum.id)">Delete</a></td>
											</tr>
										</table>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="panel-footer">
						<a href="${contextPath}/admin/forum/add" class="btn btn-primary">Create
							New</a>
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
