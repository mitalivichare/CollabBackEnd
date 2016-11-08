<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" ng-app="webapp">

<head>

	<%@include file="../shared/header.jsp" %>

	<jsp:include page="../shared/title.jsp">
		<jsp:param value="Blog" name="title"/>
	</jsp:include>
			
	
</head>

<body>
<div>
<%@include file="../shared/header.jsp" %>
	<%@include file="../shared/menu.jsp" %>
	</div>
<center>
    	<img alt="No IMAGE" src="${images}/blog.jpg" width="50%" height="100" />
    </center>
    <!-- Page Content -->
    <div class="container">
        <div class="row" ng-controller= "PublicBlogListController as listBlogCtrl">
            <!-- Blog Post Content Column -->
            <div class="col-lg-12" ng-repeat="blog in listBlogCtrl.blogs">                
                <!-- Title -->
                <h3>                
                	<a ng-href="${contextPath}/view/blog/{{blog.blogId}}">{{blog.title}}</a>                
                </h3>

                <!-- Author -->
                <p class="lead">
                    by {{blog.firstName}} {{blog.lastName}}
                </p>
                <hr>
                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> Posted on {{blog.createdAt | date:fullDate}}</p>
                <hr>
            </div>
        </div>
        <!-- /.row -->
</div>
        <!-- Footer -->
        <div>
        <%@include file="../shared/footer.jsp" %>
   </div>
    <!-- /.container -->
	
	<script src="${js}/controller/blog.js"></script>


</body>

</html>