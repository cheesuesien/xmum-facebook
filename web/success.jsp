<%@ page import="com.xmum.*" %><%--
  Created by IntelliJ IDEA.
  User: Chee
  Date: 8/12/2018
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="obj" class="com.xmum.mainBean"/>
<jsp:setProperty name="obj" property="*"/>
<%
    int status = PostDAO.insertPost(obj);
    if (status>0) {
        out.println("Inserted successfully");
    } else {
        out.println("Insertion failed...");
    }
%>
</body>
</html>
