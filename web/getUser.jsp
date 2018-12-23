<%--
  Created by IntelliJ IDEA.
  User: Chee
  Date: 9/12/2018
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.xmum.User.UserDAO"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="user" class="com.xmum.User.UserBean"/>
<jsp:setProperty name="user" property="username" value="css"/>
<%
    ResultSet thisUser = UserDAO.getUser(user);
    try {
        if (thisUser.next()) {
            out.println("Inserted successfully");
            System.out.println(thisUser);
            try {
                session.setAttribute("username");
                session.setAttribute("intro", thisUser.getString("intro"));
                System.out.println("set session attribute successful");
            } catch (Exception e) {
                System.out.println("can't set session attribute");
                System.out.println(e);
            }
        } else {
            out.println("Insertion failed...");
        }
    }catch(SQLException se) {
        System.out.println("can't get next");
        se.printStackTrace();
    }
%>
</body>
</html>
