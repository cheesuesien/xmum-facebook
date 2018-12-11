<link rel="stylesheet" type="text/css" href="../body.css"/>
<link rel="stylesheet" type="text/css" href="accountPage.css"/>

<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../components/sideBar/sideBar.jsp" %>
<%@ include file="../../components/navBar/navBar.jsp" %>

<div id="main-body">
    <div class="title">My Account</div>
    <img class="profile" src="../../img/profile-pic.jpg" alt="Avatar">
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

<%@ include file="../../includes/footer.jsp" %>
