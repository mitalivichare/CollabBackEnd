<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="images" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

	<%@include file="../shared/header.jsp" %>

	<jsp:include page="../shared/title.jsp">
		<jsp:param value="Home" name="title"/>
	</jsp:include>
	
</head>

<body>

	<%@include file="../shared/menu.jsp" %>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
		
        	<div class="col-xs-12">
				<h3>Welcome to Sahar Site!</h3>
				<hr/>
				<img height="250" width="350" align="left" alt="Unable To Load Image" src="${images}/img2.jpg" />
				<div style="position:absolute; left:380px;top:100px;  width:300px;">
				<p style="font-family:forte; color:blue; font-size:24px">
					Lets Connect with Friends and Family Here <br/>
					Let me start by welcoming back all those <br/>
					who have been lucky enough to connect with<br/> their friends & family here.
				</p>
				</div>
				<img height="250" width="350" align="right"  alt="Unable To Load Image" src="${images}/img1.jpg" />	
        	</div>					

        </div>
<br/><br/><br/>
        <!-- /.row -->



        <!-- Footer -->
        
        <%@include file="../shared/footer.jsp" %>
        

    </div>
    <!-- /.container -->

	

</body>

</html>