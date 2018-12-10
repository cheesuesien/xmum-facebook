<%@ page import="web.includes.Register.*"%>

<jsp:useBean id = "obj" class = "web.includes.Register.RegisterBean"/>
<jsp:setProperty property = "*" name = "obj"/>
    <%
        int status = RegisterVerify.insertUser(obj);
        if(status>0)
        out.println("Inserted Successfully..");
        else
        out.println("Insertion Fail..");
     %>