<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
 
<%--!<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:8889/Store"
       user="root"  password="root"/> --%>

    
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#cceeff">
<%--!<sql:query var="result" dataSource="${myDS}">
        select nom as kount from clients where email=? ;
        <sql:param value="${param.email}"/> 
        
       
    </sql:query>
    <c:forEach var="table" items="${records.rows}">
      <c:out value="${table.nom}"></c:out>
     </c:forEach>
<h3>Bienvenue Monsieur</h3>
 <a href="logout.jsp">Logout</a>--%>
 

<% 
request.getSession(true);

%>
<br><br>
<%
out.println("<h1>Bienvenue :<br> Bonjour  Monsieur : "+session.getAttribute("prenom")+" "+session.getAttribute("uname")+"</h1>");
%>
<hr>
<br><br>
<center>
<a href="Catalogue.jsp">Consulter Le Catalogue </a><br><br>
<a href="SuiviC.jsp">Suivre Votre Commande </a><br><br>
<a href="Panier.jsp">Visualiser Votre Panier </a><br>
</center>
</body>
</html>