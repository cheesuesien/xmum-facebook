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
<jsp:useBean id="user" class="com.xmum.UserBean"/>
<jsp:setProperty name="user" property="id" value="swe1609661"/>
<jsp:setProperty name="user" property="username" value="lihan"/>
<jsp:setProperty name="user" property="intro" value="I am short and cute!"/>
<%
    int status = UserDAO.updateUser(user);
    if (status>0) {
        out.println("Updated successfully");
    } else {
        out.println("Update failed...");
    }
%>
</body>
</html>
