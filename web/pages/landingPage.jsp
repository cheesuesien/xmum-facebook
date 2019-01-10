<jsp:include page="../includes/header.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/landingPage.css"/>
    <%
        if (session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
        }
    %>
<jsp:include page="../components/LoginBar.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-3.3.1.js"></script>
<div style="margin: 80px auto; width: 75%;">
    <div style="display:flex; flex-direction: column;">
        <div style="display:flex; height:400px;">
            <div id="slideshow" style="flex:1 0 auto;">
                <div><img class="mySlides" src="${pageContext.request.contextPath}/img/school_enviroment1.png" alt=""></div>
                <div><img class="mySlides" src="${pageContext.request.contextPath}/img/school_enviroment2.jpg" alt=""></div>
                <div><img class="mySlides" src="${pageContext.request.contextPath}/img/school_enviroment3.jpg" alt=""></div>
            </div>
            <div style="background-color:#383838; flex: 0 1 auto; width:400px;">
                <jsp:include page="../components/PasswordReset.jsp"/>
                <jsp:include page="../components/Register.jsp"/>
            </div>
        </div>
        <div style="display:flex; height:400px;">
            <div class="words">
                An apple a day keeps anyone away if you throw it hard enough.
            </div>
            <div style="flex:0 1 auto;">
                <img class="greyscale" src="${pageContext.request.contextPath}/img/Beautiful-Apple-Photography-19.jpg" alt="">
            </div>
        </div>
        <div style="display:flex; height:400px;">
            <div style="flex:0 1 auto;">
                <img class="greyscale" src="${pageContext.request.contextPath}/img/africa.jpg" alt="">
            </div>
            <div class="words">
                Did you know? Every 60 seconds in Africa, a minute passes.
            </div>
        </div>
        <div style="display:flex; height:400px;">
            <div class="words">
                Keep calm and do your assignment.
            </div>
            <div style="flex:0 1 auto;">
                <img class="greyscale" src="${pageContext.request.contextPath}/img/book.jpg" alt="">
            </div>
        </div>
        <div style="display:flex; height:400px;">
            <div style="flex:0 1 auto;">
                <img class="greyscale" src="${pageContext.request.contextPath}/img/Beautiful%20Books%202.jpg" alt="">
            </div>
            <div class="words">
                Education is learning what you didn't even know you didn't know.
            </div>
        </div>
    </div>

</div>
<script>
    $("#slideshow > div:gt(0)").hide();

    setInterval(function() {
        $('#slideshow > div:first')
            .fadeOut(1000)
            .next()
            .fadeIn(1000)
            .end()
            .appendTo('#slideshow');
    }, 5000);
</script>

<%@ include file="../includes/footer.jsp" %>
