<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--! <sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:8889/Store"
       user="root"  password="root"/> 
<c:if test="${param.login != null}">
    <sql:query var="result" dataSource="${myDS}">
        select count(*) as kount from clients where email=? and motpasse=?;
        <sql:param value="${param.email}"/>
        <sql:param value="${param.motpasse}"/>
       
    </sql:query>

    <c:forEach var="row" items="${result.rows}">
        <c:choose>
            <c:when test="${row.kount > 0}">
                <c:set scope="session" var="email" value="${param.email}"/>
                <c:redirect url="index.jsp"/>
            </c:when>
            <c:otherwise>
                <c:set scope="session" value="Email and password not matched" var="em"/>
            </c:otherwise>
        </c:choose>
    </c:forEach>

</c:if>--%> 


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>
    </head>
    <body bgcolor="#cceeff">
       <center> <h1>Identifiez-vous :</h1>
        <p>
            <%--!<font color="red">
            <c:if test="${em != null}">
                <c:out value="${em}"/>
                <c:remove scope="session" var="em"/>
            </c:if>
            </font> --%>
        </p>
        <form name="login_user" action="UserProfile" method="post">
            Email:
            <input type="email" name="email"/><br/><br/>
            Password:
            <input type="password" name="motpasse"/><br/><br/>
            <input type="submit" name="login" value="Login"/>
        </form>
        </center>
    </body>
</html>