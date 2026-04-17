<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'es'}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>${empty producto.id or producto.id == 0 ? 'Nuevo Producto' : 'Editar Producto'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<h1>${empty producto.id or producto.id == 0 ? 'Registrar Producto' : 'Editar Producto'}</h1>

<p>
    <a href="${pageContext.request.contextPath}/idioma?lang=es">Espanol</a> |
    <a href="${pageContext.request.contextPath}/idioma?lang=en">English</a> |
    <a href="${pageContext.request.contextPath}/login?accion=logout"><fmt:message key="btn.logout" /></a>
</p>

<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<form method="post" action="<c:url value='/productos' />" class="form-grid">
    <c:if test="${not empty producto.id and producto.id > 0}">
        <input type="hidden" name="id" value="${producto.id}">
    </c:if>

    <label for="nombre">Nombre</label>
    <input id="nombre" type="text" name="nombre" required value="${producto.nombre}">
    <c:if test="${not empty errores.nombre}"><span class="error">${errores.nombre}</span></c:if>

    <label for="categoria">Categoria</label>
    <input id="categoria" type="text" name="categoria" required value="${producto.categoria}">
    <c:if test="${not empty errores.categoria}"><span class="error">${errores.categoria}</span></c:if>

    <label for="precio">Precio</label>
    <input id="precio" type="number" min="0" step="0.01" name="precio" required value="${producto.precio}">
    <c:if test="${not empty errores.precio}"><span class="error">${errores.precio}</span></c:if>

    <label for="stock">Stock</label>
    <input id="stock" type="number" min="0" name="stock" required value="${producto.stock}">
    <c:if test="${not empty errores.stock}"><span class="error">${errores.stock}</span></c:if>

    <button type="submit">
        <c:choose>
            <c:when test="${empty producto.id or producto.id == 0}">
                <fmt:message key="btn.guardar" />
            </c:when>
            <c:otherwise>
                <fmt:message key="btn.actualizar" />
            </c:otherwise>
        </c:choose>
    </button>
    <a href="<c:url value='/productos' />"><fmt:message key="btn.cancelar" /></a>
</form>
</body>
</html>
