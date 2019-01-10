<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/upward&downward.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>


<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/navBar.jsp" %>

<div style="display:flex; flex-wrap: wrap; justify-content: center; ">
    <c:forEach items="${posts}" var="post" varStatus="loop">
        <section class="normal">
            <section class="post-area section" style="border-radius: 25px;">
                <div class="container">
                    <div class="row">
                        <div class="outside x">
                            <div class="card h-100">
                                <c:choose>
                                <c:when test="${post.getImages() != null}">
                                <div class="inside-content style-1"> <%--**single-post post-style-1--%>
                                    <div class="post-image"> <%--**blog-image--%>
                                        <img src="${pageContext.request.contextPath}/img/postimgs/${post.getImages()[0]}" alt="Post Image" style="height:100px; object-fit:cover;"/>
                                    </div><%--POST-IMAGE--%>
                                    </c:when>
                                    <c:otherwise>
                                    <div class="inside-content style-2">
                                        </c:otherwise>
                                        </c:choose>
                                        <div class="avatar-area">
                                            <a class="pfp" href="${pageContext.request.contextPath}/profile?id=${post.getAuthor().getId()}"><img src="${pageContext.request.contextPath}/img/${post.getAuthor().getProfilePic()}" style="height:100%; object-fit:cover;" alt="Profile Picture" /></a>
                                            <div class="avatar-right-side">
                                                <a class="username" href="${pageContext.request.contextPath}/profile?id=${post.getAuthor().getId()}"><b>${post.getAuthor().getNickname()}</b></a>
                                                <h6 class="date" href="#">${post.getFormattedDate()}</h6>
                                            </div>
                                        </div>
                                        <div class="post-stuff">
                                            <h4 class="post-content">${post.getMessage()}</h4>
                                            <ul class="post-votes">
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
        </section><%--NORMAL--%>
    </c:forEach>
</div>

<script type="text/javascript" src="../javascript/jquery-3.3.1.js"></script>
<script>var rootPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="../javascript/UpvoteDownvote.js"></script>

<%@ include file="../includes/footer.jsp" %>