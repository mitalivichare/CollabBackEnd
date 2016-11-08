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
		window.blogId = '${blogId}'; 
	</script>
<script src="${js}/controller/blog.js"></script>

</head>

<body>

	<%@include file="../shared/menu.jsp"%>

	<!-- Page Content -->
	<div class="container" ng-controller = "BlogController as blogCtrl">
		<div class="row">
			<div class="col-sm-12 col-md-2">
				<%@include file="../shared/sidebar.jsp"%>
			</div>
			<div class="col-sm-12 col-md-10">

                <!-- Title -->
                <h3>{{blogCtrl.blog.title}}</h3>
                <hr/>
                Created At: <span class="glyphicon glyphicon-time"></span> {{blogCtrl.blog.createdAt | date: mediumDate}} |
                Last Modified At: <span class="glyphicon glyphicon-time"></span> {{blogCtrl.blog.modifiedAt | date: mediumDate}}
                <hr/>
                <p>
			        {{blogCtrl.blog.description}}
                </p>
			</div>
		</div>
			<!-- Footer -->

			<%@include file="../shared/footer.jsp"%>

		</div>
		<!-- /.container -->

		
		
		
</body>

</html>