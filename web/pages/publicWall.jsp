<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/upward&downward.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>
<script type="text/javascript" src="../jquery-3.3.1.js"></script>
<script>var rootPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="../UpvoteDownvote.js"></script>

<%@ include file="../includes/header.jsp" %>
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

    <div class="cover"></div>

<!--Type user status here -->
    <div id="status-input">
        <form id="postForm" method="post" action="${pageContext.request.contextPath}/post" enctype="multipart/form-data">
            <input id="uploadType" type="hidden" name="uploadType" value="postNoPic"/>
            <input id="imageUpload" type="file" name="imageUpload" id="imageInput" style="margin:10 25px; width:90%;"/>
            <input type="text" name="postMessage" placeholder="    What's on your mind?" maxlength="70" style="margin:10 25px; width:90%;border-radius: 25px;"/>
            <input type="submit" value="submit" hidden/>
            <%--<div class="buttooon" onclick="submitForms()">Post</div>--%>
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

        window.addEventListener('scroll', function () {
            document.body.classList[
                window.scrollY > 20 ? 'add': 'remove'
                ]('scrolled');
        });
    </script>


    <!--Pinned post: Admin Posts and Official Announcements-->
    <%--get ${posts} from session attribute--%>
    <div style="display:flex; flex-wrap: wrap; justify-content: center; ">
    <c:forEach items="${posts}" var="post" varStatus="loop">
        <c:choose>
            <c:when test="${loop.index == 0}">
                <section class="main">
                    <%--<h2 style="color:white;">ANNOUNCEMENT</h2>--%>
            </c:when>
            <c:otherwise>
                <section class="normal">
            </c:otherwise>
        </c:choose>

        <section class="post-area section" style="border-radius: 25px;"> <%--**blog-area section--%>
            <div class="container"> <%--**container--%>
                <div class="row">
                    <div class="outside x"> <%--**col-lg-4 col-md-6--%>
                        <div class="card h-100"> <%--**card h-100--%>
                            <c:choose>
                            <c:when test="${post.getImages() != null}">
                                <div class="inside-content style-1"> <%--**single-post post-style-1--%>
                                    <div class="post-image"> <%--**blog-image--%>
                                        <img src="${pageContext.request.contextPath}/img/postimgs/${post.getImages()[0]}" alt="Post Image" style="height:100px"/>
                                    </div><%--POST-IMAGE--%>
                            </c:when>
                            <c:otherwise>
                                <div class="inside-content style-2">
                            </c:otherwise>
                            </c:choose>
                                <div class="avatar-area">
                                    <%--PROFILE-PICTURE-(PFP)   **avatar--%>
                                    <a class="pfp" href="${pageContext.request.contextPath}/timeline?id=${post.getAuthor().getId()}"><img src="${pageContext.request.contextPath}/img/${post.getAuthor().getProfilePic()}" alt="Profile Picture" /></a>
                                    <div class="avatar-right-side">
                                        <a class="username" href="${pageContext.request.contextPath}/timeline?id=${post.getAuthor().getId()}"><b>${post.getAuthor().getNickname()}</b></a>
                                        <h6 class="date" href="#">${post.getFormattedDate()}</h6>
                                    </div> <%--AVATAR-RIGHT-SIDE--%>
                                </div><%--AVATAR-AREA--%>
                                <div class="post-stuff"> <%--**blog-info--%>
                                    <%--POST-CONTENT--%> <%--**title--%>
                                    <h4 class="post-content">${post.getMessage()}</h4>
                                    <ul class="post-votes"> <%--**post-footer--%>
                                        <li>
                                            <button value = "Like" id="like_${post.postid()}_${user.getId()}_${post.getUserlevel()}" class="like">
                                                <i class="fa fa-thumbs-o-up fa-lg"></i>
                                                <span id="likes_${post.postid()}_${user.getId()}_${post.getUserlevel()}">
                                                    ${post.getLikes()}
                                                </span>
                                            </button>
                                        </li>
                                        <li>
                                            <button value = "Unlike" id="unlike_${post.postid()}_${user.getId()}_${post.getUserlevel()}" class="unlike">
                                                <i class="fa fa-thumbs-o-down fa-lg"></i>
                                                <span id="unlikes_${post.postid()}_${user.getId()}_${post.getUserlevel()}">
                                                    ${post.getDislikes()}
                                                </span>
                                            </button>
                                        </li>
                                    </ul><%--POST-VOTES--%>
                                </div><%--POST-STUFF--%>
                            </div><%--INSIDE-CONTENT--%>
                        </div><%--INSIDE--%>
                    </div><%--OUTISDE--%>
                </div><%--ROW--%>
            </div><%--CONTAINER--%>
        </section><%--POST-CONTAINER--%>
            <%--<table>
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
            </table> --%>


        </section><%--NORMAL-OR-PINNED--%>

    </c:forEach>
    </div>
    <%--<div class="main">
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
    <div><br>  <br></div>--%>

<%@ include file="../includes/footer.jsp" %>
