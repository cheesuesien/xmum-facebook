<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/publicWall.css"/>

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
        </table>
    </div>
</c:forEach>

