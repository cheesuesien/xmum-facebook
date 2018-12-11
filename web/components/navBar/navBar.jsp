<link href="../../components/navBar/navBar.css" rel="stylesheet">
<nav>
    <div class="nav-left">
        <img class="icon" src="../../components/icons/main.png" alt="main-icon"/>
        <div>XMUM FACEBOOK</div>
    </div>
    <div class="nav-right">
        <div><%= session.getAttribute("username")%></div>
        <div style="font-weight:bold;">Sign In</div>
    </div>
</nav>
