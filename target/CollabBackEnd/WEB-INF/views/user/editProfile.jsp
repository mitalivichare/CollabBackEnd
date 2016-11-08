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
	<jsp:param value="${profile.firstName}" name="title" />
</jsp:include>

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
						<h3 class="panel-title">${operation} Profile</h3>
					</div>

					<div class="panel-body">
						<div class="row">
							<form:form action="${contextPath}/user/profile/save"
								modelAttribute="profile" cssClass="form-horizontal" id="frmProfile"
								method="POST" enctype="multipart/form-data">
								<form:hidden path="id" /><form:hidden path="createdAt" />
								<form:hidden path="contactNumber" /><form:hidden path="emailAddress" />
								<form:hidden path="nickname" />
							<div class="form-group has-feedback">
								<label for="firstName" class="col-md-4 control-label">First Name</label>
								<div class="col-md-8">
									<form:input path="firstName" cssClass="form-control" placeholder="Enter First Name" id="firstName"/>
									<span id="firstName1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<form:errors path="firstName"/>
								</div>
							</div>
							<div class="form-group has-feedback">
								<label for="lastName" class="col-md-4 control-label">Last Name</label>
								<div class="col-md-8">
									<form:input path="lastName" cssClass="form-control" placeholder="Enter Last Name" id="lastName"/>
									<span id="lastName1" class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<form:errors path="lastName"/>
								</div>
							</div>
							<div class="form-group">
									<label class="col-md-4 control-label">Select Gender</label>
									<div class="col-md-8">
										<label class="radio-inline"><form:radiobutton path="gender" value="M"/>Male</label>
										<label class="radio-inline"><form:radiobutton path="gender" value="F"/>Female</label>
									</div>
							</div>
						  	<div class="form-group">						  	
						  		<div class="col-md-offset-4 col-md-3">
								    <label for="uploadImage">Upload Image for Profile</label>
								    <form:input type="file" path="file" class="form-control-file" id="uploadImage"/>			    		
					    		  		<%-- <form:errors path="file"/>  --%>
					    		  		<form:hidden path="avatar"/>	    		  		
						  		</div>
						  		<div class="col-md-3">
						  			<div id="imgContainer">
						  				<img   src="${images}/profile/${profile.avatar}" width="200px" alt="NO PROFILE PIC"/>
						  			</div>		  			
						  		</div>
						  	</div>
						  	<div class="form-group">
						  		<div class="col-md-offset-4 col-md-2">
						  			<input type="submit" value="Update Profile" class="btn btn-primary"/>
						  		</div>
						  	</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->

		<%@include file="../shared/footer.jsp"%>

	</div>
</body>

</html>
