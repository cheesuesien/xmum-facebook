<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/upward&downward.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>
<script type="text/javascript" src="../javascript/jquery-3.3.1.js"></script>
<script>var rootPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="../javascript/UpvoteDownvote.js"></script>

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
        <form id="postForm" method="post" action="${pageContext.request.contextPath}/post" enctype="multipart/form-data">
            <input id="uploadType" type="hidden" name="uploadType" value="postNoPic"/>
            <input id="imageUpload" type="file" name="imageUpload" id="imageInput" multiple/>
            <textarea name="postMessage" placeholder=" What's on your mind?" style="width:80%;"></textarea>
            <div class="buttooon" onclick="submitForms()">Post</div>
        </form>
    </div>
    <script>
        const imageInput = document.getElementById('imageUpload');
        imageInput.addEventListener("change", printValue, false);

        function printValue(){
            console.log(imageInput.value);
            if(imageInput.value){
                document.getElementById("uploadType").value = "postPic";
            } else{
                document.getElementById("uploadType").value = "postNoPic";
            }
        }

        function submitForms(){
            document.getElementById('postForm').submit();
        }
    </script>


    <!--Pinned post: Admin Posts and Official Announcements-->
    <%--get ${posts} from session attribute--%>
    <c:forEach items="${posts}" var="post" varStatus="loop">
        <c:choose>
            <c:when test="${loop.index == 0}">
                <div class="main">
                    <h2>THIS IS A PINNED MESSAGE</h2>
            </c:when>
            <c:otherwise>
                <div class="normal">
            </c:otherwise>
        </c:choose>

            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="${pageContext.request.contextPath}/img/${post.getAuthor().getProfilePic()}" alt="Profile Picture" class="pfp"/>
                    </td>
                    <td class="user-username">
                        <a href="${pageContext.request.contextPath}/timeline?id=${post.getAuthor().getId()}" style="color:#d1cc6e;"><b>${post.getAuthor().getNickname()}</b></a>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        ${post.getFormattedDate()}
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:forEach items="${post.getImages()}" var="image" varStatus="loop">
                            <img src="${pageContext.request.contextPath}/img/postimgs/${image}" alt="Post Picture" style="height:100px"/>
                        </c:forEach>
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
                <tr>
                    <button value = "Like" id="like_${post.postid()}_${user.getId()}_${post.getUserlevel()}" class="like">
                        <i class="fa fa-thumbs-o-up fa-lg"></i>
                    </button>
                    <button value = "Unlike" id="unlike_${post.postid()}_${user.getId()}_${post.getUserlevel()}" class="unlike">
                        <i class="fa fa-thumbs-o-down fa-lg"></i>
                    </button>
                    <span id="likes_${post.postid()}_${user.getId()}_${post.getUserlevel()}">
                        ${post.getLikes()}
                    </span>
                    <span id="unlikes_${post.postid()}_${user.getId()}_${post.getUserlevel()}">
                        ${post.getDislikes()}
                    </span>
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
