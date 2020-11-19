<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<title> HOME PAGE</title>
</head>
<body>
		<h2>Home Page</h2>
		<hr>
		<p> Welcome to Home Page - YOOOOOOOOOOOOOOOO</p>
		<hr>
		<!-- Display user name and role -->
		<p>
			User: <security:authentication property="principal.username" />
			<br><br>
			Role(s): <security:authentication property="principal.authorities" />
		</p>
		<hr>
		<!-- Add a link to point to /leaders ...this is for the managers -->
		<security:authorize access="hasRole('MANAGER')">
			<p>
				<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
				(Only for manager peeps)		
			</p>
		</security:authorize>
		<hr>		
		<!-- add this jsp tag for admin -->
		<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to /systems ...this is for the managers -->
			<p>
				<a href="${pageContext.request.contextPath}/systems">IT systems Meeting</a>
				(Only for Admin peeps)		
			</p>
		</security:authorize>
		
		<hr>	
	

		<!--  Add a logout button -->
		<form:form action="${pageContext.request.contextPath}/logout" 
							method="POST">
			<input type="submit" value="Logout"/>
		</form:form>

</body>
</html>
