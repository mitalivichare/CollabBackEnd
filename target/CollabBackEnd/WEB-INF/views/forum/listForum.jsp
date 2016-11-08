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
	<script src="${js}/controller/forum.js"></script>	
</head>

<body>
<%@include file="../shared/header.jsp" %>
	<%@include file="../shared/menu.jsp" %>

    <!-- Page Content -->
    <div ng-app="webapp" class="container">
    <CENTER>
 <img alt="No IMAGE" src="${images}/forum1.jpg" width="50%" height="100" />
 </CENTER>
        <div class="row" ng-controller= "PublicForumListController as listForumCtrl">
            <!-- Blog Post Content Column -->
            <div class="col-lg-12" ng-repeat="forum in listForumCtrl.forums">                
                <!-- Title -->
                <h3>                
                	<a ng-href="${contextPath}/public/view/forum/{{forum.forumId}}">{{forum.title}}</a>                
                </h3>

                <!-- Author -->
                <p class="lead">
                    {{forum.categoryName}} - <span class="glyphicon glyphicon-time"></span> Created At {{forum.createdAt | date:fullDate}}
                 </p>
            </div>
        </div>
        <!-- /.row -->


        <!-- Footer -->
        
        <%@include file="../shared/footer.jsp" %>
        

    </div>
    <!-- /.container -->
	

	

</body>

</html>