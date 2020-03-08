<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#cceeff">
<% 
request.getSession(true);
String id= (String)session.getAttribute("id");

%>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
       url="jdbc:mysql://localhost:8889/Store"
       user="root"  password="root"/> 
       <c:if test="${param.save != null}">
    <sql:update dataSource="${myDS}" var="result">
   
        insert into ligneCommande (code,Qte) values (?,?);
        
        <sql:param value="${param.code}"/>
          <sql:param value="${param.Qte}"/>
         
    </sql:update>
    <c:if test="${result > 0}">
        <c:set property="sm" scope="session" value="command saved successfully" var="sm"/>
    </c:if>
</c:if>
  <h1>Passee Une Commande de l'article <c:out value="${table.designation}"></c:out></h1>
        <p>
            <font color="green">
            <c:if test="${sm != null}">
                <c:out value="${sm}"/>
                <c:remove scope="session" var="sm"/>
            </c:if>
            </font>
        </p>
        <center>
        <form name="register_user" action="" method="post">
        <sql:query var="records" dataSource="${myDS}">
       select * from articles 
         </sql:query> 
       <label>code :</label>
       <SELECT NAME="code">
<c:forEach var="table" items="${records.rows}"> 
    <OPTION VALUE="01"><c:out value="${table.code}"></c:out>
    </OPTION></c:forEach>
    </SELECT>
           <label>Qte :</label>
    <input type="number" id="n" name="Qte" placeholder="Your Qte.."><br><br>
   
           
            <input type="submit" name="save" value="Save"/>
        </form> </center>    

</body>
</html>