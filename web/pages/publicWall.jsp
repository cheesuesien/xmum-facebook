<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/sideBar.jsp" %>
<%@ include file="../components/navBar.jsp" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/landingPage.jsp");
    }
%>

<%--This jsp page should be called from the servlet, not directly called from another jsp.
That means that the navigation button to the publicWall should point to /post (the PostServlet) and not pages/publicWall.jsp
When testing, just type the url http://localhost:8080/LandingPage_war_exploded/post and you will be directed to the
publicWall.jsp after the posts are done loading--%>

<%--This is a temporary hardcoded function to set the session attribute "user" to get the logged in user.
This function should be added to the loginservlet function when it is ready.--%>

<!--Type user status here -->
    <div id="status-input">
        <form id="postForm" method="post" action="${pageContext.request.contextPath}/post">
            <textarea name="postMessage" placeholder=" What's on your mind?" style="width:80%;"></textarea>
            <div class="buttooon" onclick="document.getElementById('postForm').submit()">Post</div>
        </form>
    </div>

    <!--Pinned post: Admin Posts and Official Announcements-->
    <%--get ${posts} from session attribute--%>
    <c:forEach items="${posts}" var="post">

                <div class="normal">


            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="../components/icons/PFP.jpg" alt="Profile Picture" class="pfp"/>
                    </td>
                    <td class="admin-username">
                        <script>console.log(${post.getAuthor().getNickname()})</script>
                        <b>${post.getAuthor().getNickname()}</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        ${post.getTimeStamp()}
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                        ${post.getMessage()}
                        <br><br>
                        <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </c:forEach>
    <div class="main">
        <div class="pin-post">
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
                        <p>${posts[0].getMessage()}</p>
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

<%@ include file="../includes/footer.jsp" %>
