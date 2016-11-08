<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

			<script src="${js}/angular.min.js" type="text/javascript"></script>
		<script src="${js}/sockjs.min.js" type="text/javascript"></script>
	    <script src="${js}/stomp.min.js" type="text/javascript"></script>
	    <script src="${js}/lodash.min.js" type="text/javascript"></script>
	     <script src="${js}/chat/app.js" type="text/javascript"></script>
	    <script src="${js}/chat/controller.js" type="text/javascript"></script>
	    <script src="${js}/chat/services.js" type="text/javascript"></script>					   				
<jsp:include page="../shared/title.jsp">
	<jsp:param value="Chat Group" name="title" />
</jsp:include>
	<link href="${css}/chat.css" rel="stylesheet">
</head>
<body ng-app="chatApp" >
<%@include file="../shared/header.jsp" %>
	<%@include file="../shared/menu.jsp"%>
	<br/><br/>
	<!-- Page Content -->
		<div  class="container">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div ng-controller="ChatCtrl" class="col-md-8">
				      <form ng-submit="addMessage()" name="messageForm">
				        <input type="text" placeholder="Compose a new message..." ng-model="message" />
				        <div class="info">
				          <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
				          <button   ng-disabled="message.length > max || message.length === 0">Send</button>
				        </div>
				      </form>
				      <hr />
				      <p ng-repeat="message in messages | orderBy:'time':true" class="message">
				        <time>{{message.time | date:'HH:mm'}}</time>
				        <span ng-class="{self: message.self}">{{message.message}}</span>
				      </p>				
				</div>
				
			</div>
			<hr/>
  			<!-- Footer -->
			<%@include file="../shared/footer.jsp"%>

		</div>
		<!-- /.container -->
</body>

</html>