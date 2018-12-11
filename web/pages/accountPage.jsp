<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/accountPage.css"/>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/sideBar.jsp" %>
<%@ include file="../components/navBar.jsp" %>

<div id="main-body">
    <div class="title">My Account</div>
    <img class="profile" src="../img/profile-pic.jpg" alt="Avatar">
    <div class="content">
        <div>
            <div>Name: </div>
            <div><%= session.getAttribute("username")%></div>
        </div>
        <div>
            <div>Introduction: </div>
            <div><%= session.getAttribute("intro")%></div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
