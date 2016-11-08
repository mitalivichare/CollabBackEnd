<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" >
<head>
	<%@include file="../shared/header.jsp" %>
	<jsp:include page="../shared/title.jsp">
		<jsp:param value="Forum" name="title"/>
	</jsp:include>
	<script>
		window.forumId = '${forumId}';
	</script>
	<script src="${js}/controller/forum.js"></script>
</head>

<body>

	<%@include file="../shared/menu.jsp" %>

    <!-- Page Content -->
    <div ng-app="webapp" class="container">

        <div class="row" ng-controller="PublicForumController as forumCtrl">

            <!-- Blog Post Content Column -->
            <div class="col-lg-12">

                <!-- Blog Post -->

                <!-- Title -->
                <h1>{{forumCtrl.forum.title}}</h1>

                <hr>

                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> Posted on {{forumCtrl.forum.createdAt | date:fullDate}}</p>

                <hr>


                <!-- Post Content -->
                <p class="lead">
                	
                	{{forumCtrl.forum.description}}
                
                </p>
                
                	

                <hr>

                <!-- Blog Comments -->


			
                <!-- Post Form -->
                <!-- display only if use is authenticated -->
                <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
	                <div class="well">
	                    <h4>Leave a Post:</h4>
	                    <form:form role="form" method="POST" modelAttribute="forumPost" action="${contextPath}/user/post/save/${forumId}">
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
	                	<p class="pull-right"><a href="${contextPath}/login">Login | Sign Up</a> to post!</p>                	
               		</div>
                </sec:authorize>
                                

                <!-- Posted Comments -->
				<h4>Posts</h4>
				<hr>
                <!-- Comment -->
                <div class="media" ng-repeat="post in forumCtrl.forum.posts">
                    <div class="media-body">
                        <h4 class="media-heading">{{post.firstName}} {{post.lastName}}
                            <small>{{post.postedAt | date:fullDate}}</small>
                        </h4>
                        {{post.content}}
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        
        <%@include file="../shared/footer.jsp" %>
        

    </div>
    <!-- /.container -->

	
	
	

</body>

</html>
