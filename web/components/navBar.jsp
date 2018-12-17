<link href="../components/styles/navBar.css" rel="stylesheet">
<nav>
    <div class="nav-left">
        <img class="icon" src="../../components/icons/main.png" alt="main-icon"/>
        <a href="../pages/publicWall.jsp" class="homeBtn" style="color: white;">XMUM FACEBOOK</a>
    </div>
    <div class="nav-right">
        <div><%= session.getAttribute("username")%></div>
        <a href="../pages/.jsp" class="homeBtn" style="color: white;">XMUM FACEBOOK</a>
    </div>
</nav>
