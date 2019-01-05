<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: cdtom
  Date: 12/25/2018
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/chatRoom.css"/>

<script type="text/javascript" src="../pages/Chat/jquery-1.8.0.js"></script>
<script type="text/javascript" src="../pages/Chat/chat.js"></script>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/sideBar.jsp" %>
<%@ include file="../components/navBar.jsp" %>
<html>
<head>

</head>
<body>
<div style="margin-top:80px ;margin-left:260px;font-size: 2em;" >
    <b>Let's chat</b>
</div>
<%
    Class.forName ("org.postgresql.Driver");
    java.sql.Statement stm = DriverManager.getConnection("jdbc:postgresql://localhost:5432/whatever","postgres", "tom123"
    ). createStatement();
    String sql = "select * from chatgroups,Users, groupmembers WHERE groupid = groupmembers.id AND groupmembers.idmember = Users.id";

    ResultSet rs = stm.executeQuery(sql);
%>
<div style="margin-left: 260px; margin-top:10px;">


<table width="900px">


        <div >Groups You have Joined</div>
    <%
        while (rs.next()){
    %>

        <tr>
            <div style="display: block; border-top: 1px solid;width:800px;">
            <td >
                <div style="text-align:left;">
                    <b>
                    <%=rs.getString("groupname")%>
                    </b>
                </div>
                    </td>
                <td>
                    <div style="text-align: center; ">
                        <%=rs.getString("groupintro")%>
                   </div>
                </td>
                <td>
                    <div class="container-contact100-form-btn" >
                        <button class="contact100-form-btn" type="submit" >
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							Chat!
						</span>
                        </button>
                    </div>
                </td>
            </div>
            
        </tr>
    <%
        }
    %>
    </table>

</div>

<%Class.forName ("org.postgresql.Driver");
   stm = DriverManager.getConnection("jdbc:postgresql://localhost:5432/whatever","postgres", "tom123"
    ). createStatement();
sql = "select groupname, groupintro \n" +
        "from chatgroups, Users, groupmembers \n" +
        "WHERE NOT EXISTS (select groupname, groupintro \n" +
        "from chatgroups, Users, groupmembers \n" +
        "where groupid = groupmembers.id AND groupmembers.idmember = Users.id); ";
rs = stm.executeQuery(sql);%>
    <div style="margin-left: 260px; margin-top:10px;">


    <table width="900px" >


    <div >Groups for you to explore</div>
<%
    while (rs.next()){
%>

<tr>
    <div style="display: block; ">
        <td >

            <div style="text-align: center; ">
                <b>
                    <%=rs.getString("groupname")%>
                </b>
            </div>
        </td>
        <td>
            <div style="text-align: center; ">
                <%=rs.getString("groupintro")%>
            </div>
        </td>
        <td>
            <div class="container-contact100-form-btn" >
                <button class="contact100-form-btn" type="submit" formaction="../pages/Chatroom.jsp" >
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							Apply
						</span>
                </button>
            </div>
        </td>
    </div>

</tr>
<%
    }
%>

</body>
</html>

<%@ include file="../includes/footer.jsp" %>