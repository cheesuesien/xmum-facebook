<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css"/>
<link href="${pageContext.request.contextPath}/pages/styles/aboutUs.css" rel="stylesheet" type="text/css" media="all" />
<%@ include file="../includes/header.jsp" %>

<%@ include file="../components/navBar.jsp" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/landingPage.jsp");
    }
%>

<div id="page-wrapper">
    <div id="featured" class="container">
        <div class="title">
            <h2>Developers</h2>
        </div>
        <div class="tbox1">
            <div class="padding-bottom" >
                <h2>Chee Sue sien</h2>
                <img width="240px" height="240px" src="../img/Suesien1.jpg" alt="" class="image"/>
                <p class="description">Hello, my name is Chee Sue Sien.</p>
            </div>
            <div >
                <h2>Tom Zhou</h2>
                    <img width="240px" height="240px" src="../img/Tom.jpg" alt="" class="image"/>
                <p class="description">I am so damn awesome.</p>
            </div>
        </div>
        <div class="tbox2">
            <div class="padding-bottom">
                <h2>Jeffrey Goh Jia Le</h2>
                <img width="240px" height="240px"src="../img/Jiale.png" alt="" class="image"/>
                <p class="description">My name is Jiale</p>
            </div>
            <div>
                <h2>Teh Li Han</h2>
                <img width="240px" height="240px" src="../img/Lihan.jpg" alt="" class="image"/>
                <p class="description">I am from outer space! </p>
            </div>
        </div>
    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
