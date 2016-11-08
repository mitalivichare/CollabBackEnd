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

<jsp:include page="../shared/title.jsp">
	<jsp:param value="Home" name="title" />
</jsp:include>

</head>

<body>

	<%@include file="../shared/menu.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<c:if test="${!empty registration}">
			<div class="alert alert-info">			
				<p>${registration}</p>			
			</div>		
		</c:if>
	
		<div class="row">
			<div class="col-md-5">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Log-In here</h3>
						<img style="width:100%;height:100px;" alt="Unable to Load Image" src="${images}/LogIn.jpg" />
					</div>
					<div class="panel-body">
			    		<c:if test="${not empty error}">
							<div class="alert alert-danger" role="alert">
							  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							  <span class="sr-only">Error:</span>
							  	${error}
							</div>
		    			</c:if>						
						<form class="form-horizontal" id="frmLogin" method="POST" action="${contextPath}/login" >
							<div class="form-group has-feedback">
								<label for="username" class="col-md-2 control-label">Username</label>
								<div class="col-md-10">
									<%--<form:input path="username" cssClass="form-control" placeholder="Enter Email Address"/>--%>
									<input type="text" name="username" class="form-control" placeholder="Enter Username" id="username"/>
									<span id="username1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="password" class="col-md-2 control-label">Password</label>
								<div class="col-md-10">
									<%--<form:input path="password" cssClass="form-control" placeholder="Enter Password" />--%>
									<input type="password" name="password" class="form-control" placeholder="Enter Password" id="password"/>
									<span id="password1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-md-10">
									<input type="submit" value="Log In" class="btn btn-primary" />
								</div>
							</div>
						<%--</form:form>--%>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">New user registration form.</h3>
						<img style="width:100%;height:100px;" alt="Unable to Load Image" src="${images}/register.jpg" />
					</div>
					<div class="panel-body">
						<form:form action="${contextPath}/register" modelAttribute="profile" cssClass="form-horizontal" id="frmRegistration" method="POST">
						
<%-- 						<div class="alert alert-danger">
							<form:errors path="*"/>
						</div>
 --%>						<%-- <form class="form-horizontal" id="frmRegistration" method="post">--%>
							<div class="form-group has-feedback">
								<label for="firstName" class="col-md-4 control-label">First Name</label>
								<div class="col-md-8">
									<form:input path="firstName" cssClass="form-control" placeholder="Enter First Name" id="firstName"/>
<!-- 									<input type="text" name="firstName" class="form-control" placeholder="Enter First Name" id="firstName"/> -->
									<span id="firstName1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="lastName" class="col-md-4 control-label">Last Name</label>
								<div class="col-md-8">
									<form:input path="lastName" cssClass="form-control" placeholder="Enter Last Name" id="lastName"/>
<!-- 									<input type="text" name="lastName" class="form-control" placeholder="Enter Last Name" id="lastName"/> -->
									<span id="lastName1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="emailAddress" class="col-md-4 control-label">Email Address</label>
								<div class="col-md-8">
									<form:input path="emailAddress" cssClass="form-control" placeholder="Enter Email Address" id="emailAddress"/>
<!-- 									<input type="email" name="emailAddress" class="form-control" placeholder="Enter Email Address" id="emailAddress"/> -->
									<span id="emailAddress1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<form:errors path="emailAddress" element="span" cssClass="help-block has-error" />
								</div>
							</div>
							
							<div class="form-group has-feedback">
								<label for="contactNumber" class="col-md-4 control-label">Contact Number</label>
								<div class="col-md-8">
									<form:input path="contactNumber" cssClass="form-control" placeholder="Enter Contact Number" id="contactNumber" maxlength="10"/>
<!-- 									<input type="text" name="contactNumber" class="form-control" placeholder="Enter Contact Number" id="contactNumber" maxlength="10"/> -->
									<span id="contactNumber1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
									<label class="col-md-4 control-label">Select Gender</label>
									<div class="col-md-8">
										<label class="radio-inline"><form:radiobutton path="gender" value="M"/>Male</label>
										<label class="radio-inline"><form:radiobutton path="gender" value="F"/>Female</label>
									</div>
							</div>		
							<div class="form-group has-feedback">
								<label for="registerPassword" class="col-md-4 control-label">Select Password</label>
								<div class="col-md-8">
									<form:password path="registerPassword" cssClass="form-control" placeholder="Enter Password" id="registerPassword"/>
<!-- 									<input type="password" name="registerPassword" class="form-control" placeholder="Enter Password" id="registerPassword"/> -->
									<span id="registerPassword1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="confirmPassword" class="col-md-4 control-label">Confirm Password</label>
								<div class="col-md-8">
									<form:password path="confirmPassword" cssClass="form-control" placeholder="Re-Enter Password" id="confirmPassword" />
<!-- 									<input type="password" name="confirmPassword" class="form-control" placeholder="Re-Enter Password" id="confirmPassword"/> -->
									<span id="confirmPassword1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" value="Register" class="btn btn-primary" />
								</div>
							</div>
						</form:form>
						<%-- </form>--%>
					</div>
				</div>
			
			
			</div>
		</div>
		<!-- /.row -->


		<!-- Footer -->

		<%@include file="../shared/footer.jsp"%>


	</div>
	<!-- /.container -->
	<script src="${js}/webapp.js"></script>


</body>

</html>