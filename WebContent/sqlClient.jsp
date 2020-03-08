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
<title>Idetifier votre compte</title>
</head>
<body>


 <sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:8889/Store"
       user="root"  password="root"/> 
       <sql:query var="records" dataSource="${myDS}">
       select * from clients 
      
       </sql:query>  
<table border="1">
<tr>
   <th>nom</th>
   <th>prenom</th>
   <th>adresse</th>
   <th>motpasse</th>
</tr>
<c:forEach var="table" items="${records.rows}">  
<tr>
   <td><c:out value="${table.nom}"></c:out></td>
   <td><c:out value="${table.prenom}"></c:out></td>
   <td><c:out value="${table.email}"></c:out></td>
    <td><c:out value="${table.motpasse}"></c:out></td>
</tr>
</c:forEach>

 </table>
 </body>
 </html>