<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/components/icons/main.png" />
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700%7CPT+Serif:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css"  href='${pageContext.request.contextPath}/pages/styles/clear.css'/>
    <link rel="stylesheet" type="text/css"  href='${pageContext.request.contextPath}/pages/styles/common.css'/>
    <link rel="stylesheet" type="text/css"  href='${pageContext.request.contextPath}/pages/styles/font-awesome.min.css'/>
    <link rel="stylesheet" type="text/css"  href='${pageContext.request.contextPath}/pages/styles/carouFredSel.css'/>
    <link rel="stylesheet" type="text/css"  href='${pageContext.request.contextPath}/pages/styles/sm-clean.css'/>
    <link rel="stylesheet" type="text/css"  href='${pageContext.request.contextPath}/pages/styles/style.css' />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css"/>

    <%
        if (session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
        }
    %>
</head>

<header>
    <jsp:include page="../components/LoginBar.jsp"/>
</header>

<body class="home blog">
<div class="content-1170 header-holder center-relative">
    <div class="header-menu">
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>

<div class="block content-1170 center-relative">
    <div class="blog-holder block center-relative">
        <article id="post-1" class="relative blog-item-holder">
                <div class="post-thumb thumb-html one_thumb relative">
                    <script>
                        var slider1_speed = "500";
                        var slider1_auto = "true";
                        var slider1_pagination = "true";
                        var slider1_hover = "true";
                    </script>
                    <div class="image-slider-wrapper"  style="width: 60%; display: inline-block;">
                        <div class="caroufredsel_wrapper">
                            <ul id="slider1" class="image-slider slides center-text">
                                <li><img src="${pageContext.request.contextPath}/img/school_enviroment1.png" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/img/school_enviroment2.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/img/school_enviroment3.jpg" alt=""></li>
                            </ul>
                        </div>
                        <div class="slider1_pagination carousel_pagination left"></div>
                        <div class="clear"></div>
                    </div>
                    <div style="display: inline-block; background-color: #383838;width: 40%;" class="right">
                        <jsp:include page="../components/Register.jsp"/>
                    </div>
                </div>
                <%--<div class="post-title-holder one_title absolute" style="width: 60%">
                    <h2 class="entry-title excerpt">
                        <a href="single.html">
                            We are design &amp; digital studio based in New York.<br>
                            This is our showcase of crafted awesomeness.</a>
                    </h2>
                    <div class="cat-links">
                        <ul>
                            <li>
                                <a href="#">Design</a>
                            </li>
                        </ul>
                    </div>
                </div>--%>
                <div class="clear"></div>
        </article>


        <%--<article id="post-2" class="relative blog-item-holder">
            <div class="only-post-title-holder">
                <h2 class="entry-title excerpt">
                    <a href="single.html">
                        Gathered by gravity bits of moving fluff Flatland venture hearts of the stars Hypatia birth cosmic ocean! Flatland are creatures of the cosmos Orion's sword two ghostly white figures
                    </a>
                </h2>
                <div class="cat-links">
                    <ul>
                        <li>
                            <a href="#">Handmade</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </article>--%>


        <article id="post-3" class="relative blog-item-holder">
            <div class="post-thumb thumb-image two_third_thumb left">
                <img src="${pageContext.request.contextPath}/img/apple.png" alt="">
            </div>
            <div class="post-title-holder one_third_title right">
                <h2 class="entry-title">
                    An Apple a Day Keeps The Doctor Away.
                </h2>
                <%--<div class="cat-links">
                    <ul>
                        <li>
                            <a href="#">Interior</a>
                        </li>
                    </ul>
                </div>--%>
            </div>
            <div class="clear"></div>
        </article>


        <article id="post-4" class="relative blog-item-holder">
            <div class="post-thumb thumb-image two_third_thumb right">
                <img src="${pageContext.request.contextPath}/img/africa.jpg" alt="">
            </div>
            <div class="post-title-holder one_third_title left">
                <h2 class="entry-title">
                        Did you know? Every 60 seconds in Africa, a minute passes.
                </h2>
                <%--<div class="cat-links">
                    <ul>
                        <li>
                            <a href="#">Packaging</a>
                        </li>
                    </ul>
                </div>--%>
            </div>
            <div class="clear"></div>
        </article>


        <article id="post-5" class="relative blog-item-holder">
            <div class="post-thumb thumb-image one_third_thumb left">
                <img src="${pageContext.request.contextPath}/img/book.jpg" alt="">
            </div>
            <div class="post-title-holder two_third_title right">
                <h2 class="entry-title">
                        Keep calm and do your assignment.
                </h2>
                <%--<div class="cat-links">
                    <ul>
                        <li>
                            <a href="#">Handmade</a>
                        </li>
                    </ul>
                </div>--%>
            </div>
            <div class="clear"></div>
        </article>


        <%--<article id="post-6" class="relative blog-item-holder">
            <div class="only-post-title-holder">
                <h2 class="entry-title excerpt">
                    <a href="single.html">
                        It suddenly struck me that that tiny pea, pretty and blue, was the Earth. I put up my thumb and shut one eye, and my thumb blotted out the planet Earth. I didn't feel like a giant. I felt very, very small.
                    </a>
                </h2>
                <div class="cat-links">
                    <ul>
                        <li>
                            <a href="#">Handmade</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </article>--%>


        <article id="post-7" class="relative blog-item-holder">
            <div class="post-thumb thumb-image two_third_thumb right">
                <img src="${pageContext.request.contextPath}/img/takecare.jpg" alt="">
            </div>
            <div class="post-title-holder one_third_title left">
                <h2 class="entry-title" style="margin-top: 305px;">
                    Take care of yourself in social media.
                </h2>
                <%--<div class="cat-links">
                    <ul>
                        <li>
                            <a href="#">Lifestyle</a>
                        </li>
                    </ul>
                </div>--%>
            </div>
            <div class="clear"></div>
        </article>

    </div>
    <div class="clear"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.smartmenus.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/queryloader2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.carouFredSel-6.0.0-packed.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/main.js"></script>
<script src="${pageContext.request.contextPath}/javascript/html5.js"></script>

<%@ include file="../includes/footer.jsp" %>
