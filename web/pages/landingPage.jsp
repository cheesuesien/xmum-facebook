<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/landingPage.css"/>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/LoginBar.jsp" %>
<%@ include file="../components/Register.jsp" %>

<%
    Cookie cookie =null;
    // Get an array of Cookies associated with the this domain
    Cookie[] cookies = request.getCookies();

    if( cookies != null ) {
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if((cookie.getName( )).compareTo("user") == 0 ) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
    } else {
    }
%>

<div id="main-body">
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
<%@ include file="../includes/footer.jsp" %>
