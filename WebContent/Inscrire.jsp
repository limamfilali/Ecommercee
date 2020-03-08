<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:8889/Store"
       user="root"  password="root"/> 

<c:if test="${param.save != null}">
    <sql:update dataSource="${myDS}" var="result">
        insert into clients (nom,prenom,email,motpasse) values (?, ?,?,?);
        <sql:param value="${param.nom}"/>
        <sql:param value="${param.prenom}"/>
         <sql:param value="${param.email}"/>
        <sql:param value="${param.motpasse}"/>
    </sql:update>
    <c:if test="${result > 0}">
        <c:set property="sm" scope="session" value="User info saved successfully" var="sm"/>
    </c:if>
</c:if>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Register page</title>
    </head>
    <body bgcolor="#cceeff">
       <center> <h1>Register here</h1>
        <p>
            <font color="green">
            <c:if test="${sm != null}">
                <c:out value="${sm}"/>
                <c:remove scope="session" var="sm"/>
            </c:if>
            </font>
        </p>
        <form name="register_user" action="" method="post">
           <label>Nom :</label>
    <input type="text" id="n" name="nom" placeholder="Your firstname.."><br><br>
     <label>Prenom :</label>
    <input type="text" id="p" name="prenom" placeholder="Your lastname.."><br><br>
     
     <label>Email :</label>
    <input type="email" id="email" name="email" placeholder="Your mail.."><br><br>
    <label>Mot-Passe :</label>
    <input type="password" id="pass" name="motpasse" placeholder="Your password.."><br><br><br>
           
            <input type="submit" name="save" value="Save"/>
        </form>
        </center>
    </body>
</html>
    