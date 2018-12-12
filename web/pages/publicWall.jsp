<%@ page import="com.xmum.User.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.xmum.User.UserBean" %>
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/sideBar.jsp" %>
<%@ include file="../components/navBar.jsp" %>

<html>
<head>
    <title>XMUM Facebook</title>
</head>
<body>
<jsp:useBean id="user" class="com.xmum.User.UserBean"/>
<jsp:setProperty name="user" property="username" value="css"/>
<%
    ResultSet userResult = UserDAO.getUser(user);
    try{
        if (userResult.next()){
            UserBean thisUser = new UserBean( userResult.getString("id"), userResult.getString("username"), userResult.getString("intro") );
            session.setAttribute("user", thisUser);
        } else {
            System.out.println("no user selected from db");
        }
    } catch (Exception e){
        System.out.println("get user failed");
    }
%>
    <!--Type user status here -->
    <div id="status-input">
        <form id="postForm" method="post" action="${pageContext.request.contextPath}/post">
            <textarea name="postMessage" placeholder=" What's on your mind?" style="width:80%;"></textarea>
            <div class="buttooon" onclick="document.getElementById('postForm').submit()">Post</div>
        </form>
    </div>

    <!--Pinned post: Admin Posts and Official Announcements-->
    <div class="main">
        <div id="pin-post">
            <h2>THIS IS A PINNED MESSAGE</h2>
            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="../components/icons/PFP.jpg" alt="Profile Picture" class="pfp"/>
                    </td>
                    <td class="admin-username">
                        <b>User Name</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        10th December 2018 00:18
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                            Bla bla bla bla bla blabla bla bal bla bla bla saldjasklfjakmkxmckjfklasdsa aldjskfmd adhsajhkasdj khjaskdhjasjksadhkjas adjkahsjk askhsk asldjkdammk sda asd askljaskl
                            <br><br>
                            <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!--Normal Posts: Normal User Posts and Spams-->
    <div>
        <div class="normal">
            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="#" alt="Profile Picture"  class="pfp"/>
                    </td>
                    <td class="user-username">
                        <b>User Name</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        10th December 2018 00:18
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                            Bla bla bla bla bla blabla bla bal bla bla bla saldjasklfjakmkxmckjfklasdsa aldjskfmd adhsajhkasdj khjaskdhjasjksadhkjas adjkahsjk askhsk asldjkdammk sda asd askljaskl
                            <br><br>
                            <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div>
        <div class="normal">
            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="#" alt="Profile Picture"  class="pfp"/>
                    </td>
                    <td class="user-username">
                        <b>User Name</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        10th December 2018 00:18
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                            Bla bla bla bla bla blabla bla bal bla bla bla saldjasklfjakmkxmckjfklasdsa aldjskfmd adhsajhkasdj khjaskdhjasjksadhkjas adjkahsjk askhsk asldjkdammk sda asd askljaskl
                            <br><br>
                            <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div><br>  <br></div>
</body>
</html>

<%@ include file="../includes/footer.jsp" %>
