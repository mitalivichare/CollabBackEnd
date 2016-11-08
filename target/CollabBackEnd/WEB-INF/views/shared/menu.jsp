 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${contextPath}/home">Sahar Site</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${contextPath}/home">Home</a>
                    </li>
                    <li>
                        <a href="${contextPath}/all/blogs">Blog</a>
                    </li>
                    <li>
                        <a href="${contextPath}/public/forums">Forum</a>
                    </li>
                    <sec:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
	                    <li>
	                        <a href="${contextPath}/user/dashboard">DashBoard</a>
	                    </li>
                    </sec:authorize>
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                    	<li><a href="${contextPath}/admin">Admin DashBoard</a></li>
                    </sec:authorize>
                    
                  

                    <li>
                        <a href="${contextPath}/about">About</a>
                    </li>
                    <li>
                        <a href="${contextPath}/contact">Contact</a>
                    </li>
                    <sec:authorize access="hasRole('ROLE_USER')">
	                    <li>
	                        <a href="${contextPath}/user/viewChat">
	                        	<span class="glyphicon glyphicon-user"></span> Join Chat
	                        </a>
	                    </li>
                    </sec:authorize>

                    <sec:authorize access="isAnonymous()">
	                    <li>
	                        <a href="${contextPath}/login">
	                        	<span class="glyphicon glyphicon-lock"></span> Login
	                        </a>
	                    </li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
	                    <li>
	                        <a href="${contextPath}/logout">
	                        	<span class="glyphicon glyphicon-off"></span> Logout
	                        </a>
	                    </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    	<li><a href="#"> WELCOME ADMIN</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_USER')">
	                    <li><a href="#">WELCOME  <%= request.getUserPrincipal().getName() %>  </a></li>
	                    </sec:authorize>
	                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
