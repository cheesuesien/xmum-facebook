<%--
  Created by IntelliJ IDEA.
  User: Chee
  Date: 9/12/2018
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.xmum.*"%>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="user" class="com.xmum.UserBean"/>
<jsp:setProperty name="user" property="username" value="mary"/>
<%
    ResultSet thisUser = UserDAO.getUser(user);
    if (thisUser.next()) {
        out.println("Inserted successfully");
        System.out.println(thisUser);
        try {
            session.setAttribute("username", thisUser.getString("username"));
            session.setAttribute("intro", thisUser.getString("intro"));
            System.out.println("set session attribute successful");
        } catch(Exception e){
            System.out.println("can't set session attribute");
            System.out.println(e);
        }
    } else {
        out.println("Insertion failed...");
    }
%>
</body>
</html>
