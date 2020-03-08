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
       select * from categorie 
        
      
       </sql:query> 
<br><br>
<center><h1><font color="red">Catalogue</font></h1></center><br><br>

<center>Categorie :<SELECT NAME="lstDep">
<c:forEach var="table" items="${records.rows}"> 
    <OPTION VALUE="01"><c:out value="${table.categorie}"></c:out>
    </OPTION></c:forEach>
    </SELECT>
</center><br>

       <sql:query var="records" dataSource="${myDS}">
       select * from articles  
      
       </sql:query>  
<center><table width="60%" border="1">
<tr>
   <th>Photo</th>
   <th>CodeArticle</th>
   <th>Titre</th>
   <th>Stock</th>
   <th>prix</th>
   <th>commander</th>
   
</tr>
<c:forEach var="table" items="${records.rows}">  
<tr>
   <td><c:out value="${table.photo}"></c:out></td>
   <td><c:out value="${table.code}"></c:out></td>
   <td><c:out value="${table.designation}"></c:out></td>
    <td><c:out value="${table.stock}"></c:out></td>
    <td><c:out value="${table.prix} dh"></c:out></td>
    <td><button><a href="Panier.jsp?code=${table.code}">Ajouter au panier</a></button></a></td>
</tr>
</c:forEach>
</table></center>
</body>
</html>