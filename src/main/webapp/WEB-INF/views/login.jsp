<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'es'}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="login.titulo" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<h1><fmt:message key="login.titulo" /></h1>

<p>
    <a href="${pageContext.request.contextPath}/idioma?lang=es">Espanol</a> |
    <a href="${pageContext.request.contextPath}/idioma?lang=en">English</a>
</p>

<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/login" class="form-grid">
    <label for="username"><fmt:message key="login.usuario" /></label>
    <input id="username" type="text" name="username" required>

    <label for="password"><fmt:message key="login.password" /></label>
    <input id="password" type="password" name="password" required>

    <button type="submit"><fmt:message key="login.ingresar" /></button>
</form>
</body>
</html>
