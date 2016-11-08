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
	<script src="${js}/controller/blog.js"></script>
	<script>
	
		window.blogId = '${blogId}';
	
	</script>
	
	
</head>

<body>
	<%@include file="../shared/header.jsp" %>
	<%@include file="../shared/menu.jsp" %>

    <!-- Page Content -->
    <div class="container">

        <div class="row" ng-controller="BlogController as blogCtrl">

            <!-- Blog Post Content Column -->
            <div class="col-lg-12">

                <!-- Blog Post -->

                <!-- Title -->
                <h1>{{blogCtrl.blog.title}}</h1>

                <!-- Author -->
                <p class="lead">
                    by {{blogCtrl.blog.firstName}} {{blogCtrl.blog.lastName}} </a>
                </p>

                <hr>

                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> Posted on {{blogCtrl.blog.createdAt | date:fullDate}}</p>

                <hr>


                <!-- Post Content -->
                <p class="lead">
                	
                	{{blogCtrl.blog.description}}
                
                </p>
                
                	

                <hr>

                <!-- Blog Comments -->


			
                <!-- Comments Form -->
                <!-- display only if use is authenticated -->
                <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
	                <div class="well">
	                    <h4>Leave a Comment:</h4>
	                    <form:form role="form" modelAttribute="comment" method="POST" action="${contextPath}/user/comment/save/${blogId}">
	                        <div class="form-group">
	                            <form:textarea class="form-control" rows="3" path="content"></form:textarea>
	                        </div>
	                        <button type="submit" class="btn btn-primary">Submit</button>
	                    </form:form>
	                </div>     
	                <hr>           
                </sec:authorize>
                
                <sec:authorize access="isAnonymous()">
                	
                	<div>
                	
	                	<p class="pull-right"><a href="${contextPath}/login">Login | Sign Up</a> to comment!</p>
                	
               		</div>
                </sec:authorize>
                
                

                <!-- Posted Comments -->
				<h4>Comments</h4>
				<hr>
                <!-- Comment -->
                <div class="media" ng-repeat="comment in blogCtrl.blog.comments">
                    <div class="media-body">
                        <h4 class="media-heading">{{comment.firstName}} {{comment.lastName}}
                            <small>{{comment.commentedAt | date:fullDate}}</small>
                        </h4>
                        {{comment.content}}
                    </div>
                </div>
            </div>

        </div>
        <hr>
     </div>
 			<!-- /.row -->
        
        	<!-- Footer -->
        <div>
        <%@include file="../shared/footer.jsp" %>
        </div>

    
    
	
	
	

</body>

</html>