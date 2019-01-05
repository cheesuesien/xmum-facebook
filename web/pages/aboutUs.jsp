

<%@ include file="../includes/header.jsp" %>

<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Clarion
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20131009

-->

<head>
    <%@ include file="../components/navBar.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
    <link href="styles/default.css" rel="stylesheet" type="text/css" media="all" />


</head>
<body>
<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo" style="margin-top:20px;">
            <h1><a href="#">About Us</a></h1>
        </div>

    </div>
    <div id="banner" class="container">
        <p>This is <strong>XiaMen University Malaysia Facebook</strong>, an online campus-based social media platform, Have fun :) </p>
    </div>
</div>
<div id="page-wrapper">
    <div id="featured" class="container">
        <div class="title">
            <h2>Develop Team members</h2>
        </div>
        <div class="tbox1">
            <div class="padding-bottom" >
                <h2>Chee Sue sien</h2>
                <img width="240px" height="240px" src="../img/Suesien1.jpg" alt="" />
                <p>I am pretty girl.</p>
                <a href="#" class="button">Etiam posuere</a>
            </div>
            <div >
                <h2>Tom Zhou</h2>

                    <img width="240px" height="240px" src="../img/Tom.jpg" alt="" />

                <p>I am so damn awesome.</p>
                <a href="#" class="button">About more</a>
            </div>
        </div>
        <div class="tbox2">
            <div class="padding-bottom">
                <h2>Integer gravida nibh quis</h2>
                <img width="240px" height="240px"src="../img/Jiale.png" alt="" />
                <p>My name is Jiale</p>
                <a href="#" class="button">Etiam posuere</a>
            </div>
            <div>
                <h2>Integer gravida nibh quis</h2>
                <img width="240px" height="240px" src="../img/Lihan.jpg" alt="" />
                <p>I am from ACGN </p>
                <a href="#" class="button">Etiam posuere</a>
            </div>
        </div>
    </div>
    <div>
        <h3>
            Our Location
        </h3>
        <div class="map">
            <script>
                function myMap() {
                    var mapProp= {
                        center:new google.maps.LatLng(51.508742,-0.120850),
                        zoom:5,
                    };
                    var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
                }
            </script>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9mOigMEYaeN7Ospi1sKUKf_Um-0sbhZI&callback=myMap"></script>

        </div>
    </div>
</div>

m
</body>
</html>


<%@ include file="../includes/footer.jsp" %>
