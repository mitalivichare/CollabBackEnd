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

	<script>
		window.userId = '${profile.id}'; 
	</script>

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
						<h3 class="panel-title">${profile.firstName}
							${profile.lastName}</h3>
					</div>

					<div class="panel-body">
						<div class="row">
							<div class="col-md-3" align="center">
								<img alt="${profile.avatar}"
									src="${images}/profile/${profile.avatar}"
									class="img-circle img-responsive">
							</div>
							<div class="col-md-9">
								<table class="table table-responsive">
									<tbody>
										<tr>
											<td>Profile Created At:</td>
											<td>${profile.createdAt}</td>
										</tr>
										<tr>
											<td>Gender</td>
											<td>												
												<c:choose>
													<c:when test="${profile.gender eq 'M'.charAt(0) }">
														Male
													</c:when>
													<c:otherwise>
														Female
													</c:otherwise>
												</c:choose>
												
											</td>
										</tr>
										<tr>
											<td>Email</td>
											<td><a href="mailto:${profile.emailAddress}">${profile.emailAddress}</a></td>
										</tr>
										<tr>
											<td>Contact Number</td>
											<td>${profile.contactNumber}</td>
										</tr>
										<tr>
											<td colspan="2">
<%-- 												<button class="btn btn-primary" >Friends : ${profile.noOfFriends}</button>
												<button class="btn btn-primary" >Blogs : ${profile.noOfBlogs}</button>
												<button class="btn btn-primary" >Forum Posts : ${profile.noOfBlogs}</button>
 --%>												
 												<a href="${contextPath}/user/edit/${profile.id}" class="btn btn-warning pull-right">Edit Profile</a>
											</td>											
										</tr>										
									</tbody>
								</table>								
							</div>
						</div>
					</div>


				</div>
			</div>
			</div>
			<!-- Footer -->

			<%@include file="../shared/footer.jsp"%>

		</div>
		<!-- /.container -->


</body>

</html>
