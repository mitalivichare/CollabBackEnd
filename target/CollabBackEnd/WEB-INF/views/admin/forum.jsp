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
	<jsp:param value="FORUMS" name="title" />
</jsp:include>

<script>
	window.forumId = '${forumId}';
</script>
</head>

<body>

	<%@include file="../shared/menu.jsp"%>

	<!-- Page Content -->
	<div ng-app="webapp" class="container">		
<div class="row" ng-controller="ForumController as forumCtrl">			
			<div class="col-xs-12">
				<div class="panel panel-default">

					<div class="panel-heading">
						<div class="panel-title">
							<h1>{{forumCtrl.collection.forum.title}} <small><span class="glyphicon glyphicon-time"></span>&#160; {{forumCtrl.collection.forum.createdAt | date: mediumDate }}</small></h1>							
						</div>
					</div>

					<div class="panel-body">
						<table class="table table-condensed">
							<tbody>
								<tr ng-repeat="post in forumCtrl.collection.posts">
									<td>{{post.content}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->


		<!-- Footer -->

		<%@include file="../shared/footer.jsp"%>


	</div>	<!-- /.container -->
	
</body>

</html>