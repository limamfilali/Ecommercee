<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${email != null}">
    <c:remove scope="session" var="email"/>
    <c:redirect url="index.html"/>
</c:if>
