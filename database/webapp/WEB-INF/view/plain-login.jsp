<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>

    <style type="text/css">
        .failed {
            color: red;
        }
    </style>
</head>
<body>
<h3>Custom Login Page</h3>

<form:form action="${pageContext.request.contextPath}/authenticate-user" method="POST">

    <c:if test="${param.error != null}">
        <i class="failed">You entered Invalid username or password.</i>
    </c:if>

    <p>
        User name: <input type="text" name="username"/>
    </p>
    <p>
        Password: <input type="password" name="password"/>
    </p>

    <input type="submit" value="Login"/>
</form:form>

</body>
</html>
