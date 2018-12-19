<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/landingPage.css"/>

<jsp:include page="../includes/header.jsp" />
<jsp:include page="../components/LoginBar.jsp"/>
<jsp:include page="../components/Register.jsp"/>

<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("user")) {
                userName = cookie.getValue();
                request.getSession(true).setAttribute("user", userName);
            }
        }
    }

    if (session.getAttribute("user") != null) {
        response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
    }
%>

<div id="landing-main-body">
    <%-- Code goes here--%>
    <div class="block" id="block1">
        <div>Hi, welcome to XMUM FACEBOOK!</div>
    </div>
    <div class="block" id="block2">
        <div>XMUM Facebook is the only platform where you can easily socialise with anyone in Xiamen University!</div>
        <div>It is a ...</div>
    </div>
    <div class="block" id="block3">
        <div>Want to find buddies to play a game of basketball? Easily done!</div>
        <div>Want to know who is that cute girl in your physics course? No problem!</div>
    </div>
</div>
<jsp:include page="../includes/footer.jsp" />
