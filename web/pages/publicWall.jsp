<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
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
    <div id="status-input" >
        <form id="postForm" method="post" action="${pageContext.request.contextPath}/post" enctype="multipart/form-data">
            <input id="uploadType" type="hidden" name="uploadType" value="postNoPic"/>
            <div style="padding-top: 10px;display:flex;height:100%;width: 90%;justify-content: space-evenly;align-items: center; margin: 0 auto;">
                <div class="upload-image" style="height: 25px; display:flex;">
                    <output id="list" style="height:25px; "></output>
                    <label for="imageUpload" style="cursor: pointer;"><img style="width:25px; height:25px;" src="${pageContext.request.contextPath}/components/icons/add-img-icon.png" alt=""/></label>
                    <input id="imageUpload" type="file" name="imageUpload"  style="display:none;margin:10px 25px;"/>
                </div>
                <div style="flex: 1 0 auto; margin-left: 20px;">
                    <input type="text" name="postMessage" placeholder="What's on your mind?" maxlength="70" style="width: 100%;padding-left:10px;border-radius: 25px;"/>
                    <input type="submit" value="submit" hidden/>
                </div>
            </div>
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
        document.getElementById('imageUpload').addEventListener('change', handleFileSelect, false);

        function handleFileSelect(evt) {
            var files = evt.target.files;
            var f = files[0];
            var reader = new FileReader();

            reader.onload = (function(theFile) {
                return function(e) {
                    document.getElementById('list').innerHTML = ['<img src="', e.target.result,'" title="', theFile.name, '" height="25px" />'].join('');
                    document.getElementById('list').style.width = "25px";
                };
            })(f);

            reader.readAsDataURL(f);
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
                            <script>console.log("${loop.index}")</script>
                            <script>console.log("${post.getImages()}")</script>
                            <c:choose>
                            <%--normal post with image--%>
                            <c:when test="${(post.getImages() != null) && (loop.index != 0)}">
                                <script>console.log("style1!!!")</script>
                                <div class="inside-content style-1"> <%--**single-post post-style-1--%>
                                    <div class="post-image"> <%--**blog-image--%>
                                        <img src="${pageContext.request.contextPath}/img/postimgs/${post.getImages()[0]}" alt="Post Image" style="height:100px; object-fit:cover;"/>
                                    </div><%--POST-IMAGE--%>
                            </c:when>
                                    <%--pinned post with image--%>
                            <c:when test="${post.getImages() != null && (loop.index == 0)}">
                                <script>console.log("style2!!!")</script>
                                <div class="inside-content style-2" style="display:flex; justify-content:flex-start;"> <%--**single-post post-style-1--%>
                                    <div class="post-image" style="height:100%; width:80%;"> <%--**blog-image--%>
                                        <img src="${pageContext.request.contextPath}/img/postimgs/${post.getImages()[0]}" alt="Post Image" style="width:100%; height:100%; object-fit:cover;"/>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                <div class="inside-content style-2">
                            </c:otherwise>
                            </c:choose>
                                <div style="width:100%;">
                                <div class="avatar-area">
                                    <%--PROFILE-PICTURE-(PFP)   **avatar--%>
                                    <a class="pfp" href="${pageContext.request.contextPath}/timeline?id=${post.getAuthor().getId()}"><img src="${pageContext.request.contextPath}/img/${post.getAuthor().getProfilePic()}" alt="Profile Picture" style="height:100%; object-fit:cover;"/></a>
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
                                </div>
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
                        <script>
                            if (!("${post.getImages()[0]}")){
                                console.log("image is null");
                            }
                        </script>
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
