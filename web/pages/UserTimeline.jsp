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
                    <img src="../components/icons/PFP.jpg" alt="Profile Picture" class="pfp"/>
                </td>
                <td class="normal-username">
                    <a href="${pageContext.request.contextPath}/timeline?id=${post.getAuthor().getId()}" style="color:#d1cc6e;"><b>${post.getAuthor().getNickname()}</b></a>
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

