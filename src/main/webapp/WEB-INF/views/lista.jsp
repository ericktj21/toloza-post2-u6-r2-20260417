<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'es'}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="app.titulo" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<div class="topbar">
    <h1><fmt:message key="app.titulo" /></h1>
    <div>
        <a href="${pageContext.request.contextPath}/idioma?lang=es">Espanol</a> |
        <a href="${pageContext.request.contextPath}/idioma?lang=en">English</a> |
        <a href="${pageContext.request.contextPath}/login?accion=logout"><fmt:message key="btn.logout" /></a>
    </div>
</div>

<p>
    <fmt:message key="app.bienvenida" />,
    <strong>${sessionScope.usuarioActual.username}</strong>
</p>

<c:if test="${not empty mensaje}">
    <p class="ok">${mensaje}</p>
</c:if>

<p>
    <a href="<c:url value='/productos?accion=formulario' />">+ <fmt:message key="menu.nuevo" /></a>
</p>

<table>
    <thead>
    <tr>
        <th>#</th>
        <th><fmt:message key="tabla.nombre" /></th>
        <th><fmt:message key="tabla.categoria" /></th>
        <th><fmt:message key="tabla.precio" /></th>
        <th><fmt:message key="tabla.stock" /></th>
        <th><fmt:message key="tabla.acciones" /></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${productos}" varStatus="s">
        <tr>
            <td>${s.count}</td>
            <td>${p.nombre}</td>
            <td>${p.categoria}</td>
            <td>${p.precio}</td>
            <td>${p.stock}</td>
            <td>
                <a href="<c:url value='/productos?accion=editar&id=${p.id}' />"><fmt:message key="btn.editar" /></a> |
                <a href="<c:url value='/productos?accion=eliminar&id=${p.id}' />"
                   onclick="return confirm('Seguro que deseas eliminar este producto?')"><fmt:message key="btn.eliminar" /></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
