<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#cceeff">
 <sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:8889/Store"
       user="root"  password="root"/> 
       <sql:query var="records" dataSource="${myDS}">
       select * from commande C,ligneCommande L where C.NumCommande=L.NumCommande 
      
       </sql:query> 
       <center> 
       <h1>Mes Commandes !!</h1><br><br>
<table border="1" >
<tr>
   <th>NumCommande</th>
   <th>CodeArticle</th>
   <th>CodeClient</th>
   <th>Qte</th>
   <th>Date</th>
</tr>
<c:forEach var="table" items="${records.rows}">  
<tr>
   <td><c:out value="${table.NumCommande}"></c:out></td>
   <td><c:out value="${table.code}"></c:out></td>
   <td><c:out value="${table.CodeClient}"></c:out></td>
    <td><c:out value="${table.Qte}"></c:out></td>
    <td><c:out value="${table.Date_commande}"></c:out></td>
</tr>
</c:forEach>

 </table>
 </center>
</body>
</html>