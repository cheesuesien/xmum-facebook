<link href="${pageContext.request.contextPath}/components/styles/navBar.css" rel="stylesheet">
<nav>
    <div class="nav-left">
        <img class="icon" src="${pageContext.request.contextPath}/components/icons/main.png" alt="main-icon"/>
        <div>XMUM FACEBOOK</div>
    </div>
    <div class="nav-right">
        <form name = "Logout" action="${pageContext.request.contextPath}/LogoutServlet">
            <input type="submit" class="LogoutButton" value = "Logout"/>
        </form>
    </div>
</nav>
