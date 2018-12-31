<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/upward&downward.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>
<script type="text/javascript" src="../jquery-3.3.1.js"></script>
<script>var rootPath = "${pageContext.request.contextPath}"</script>
<script type="text/javascript" src="../UpvoteDownvote.js"></script>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/sideBar.jsp" %>
<%@ include file="../components/navBar.jsp" %>

<c:forEach items="${posts}" var="post" varStatus="loop">
    <div class="normal">
        <table>
            <tr>
                <td rowspan="2" width="100px">
                    <img src="${pageContext.request.contextPath}/img/${post.getAuthor().getProfilePic()}" alt="Profile Picture" class="pfp"/>
                </td>
                <td class="normal-username">
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

