<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>It works!</h1>
<hr/>
User: <security:authentication property="principal.username"/>
<br><br>
Role (s): <security:authentication property="principal.authorities"/>
<hr/>
<security:authorize access="hasRole(T(com.tomtre.springsecurity.SecurityRoles).MANAGER)" >
<p>
    <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a> (Only for Manager peeps)
</p>
<hr/>
</security:authorize>
<security:authorize access="hasRole(T(com.tomtre.springsecurity.SecurityRoles).ADMIN)" >
<p>
    <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a> (Only for Admin peeps)
</p>
<hr/>
</security:authorize>
<form:form action="${pageContext.request.contextPath}/logout" method="POST">
    <input type="submit" value="Logout"/>
</form:form>

</body>
</html>
