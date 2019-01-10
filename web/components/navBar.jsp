<link href="${pageContext.request.contextPath}/components/styles/navBar.css" rel="stylesheet">
<nav>
    <div class="nav-left">
        <a id="home" href="${pageContext.request.contextPath}/post" class="button">Home</a>
        <%--<a id="profile" href="${pageContext.request.contextPath}/profile?id=${user.getId()}" class="button">Profile</a>--%>
        <a id="chat" href="${pageContext.request.contextPath}/chat?action=Enter" class="button">Chat</a>
        <a id="feedback" href="${pageContext.request.contextPath}/pages/feedBack.jsp" class="button">Report</a>
        <a id="about" href="${pageContext.request.contextPath}/pages/aboutUs.jsp" class="button">About us</a>
    </div>
    <div class="nav-center">
        <img class="icon" src="${pageContext.request.contextPath}/components/icons/logo.png" alt="main-icon"/>
        <a href="${pageContext.request.contextPath}/post" class="homeBtn" style="color: white;">XMUM FACEBOOK</a>
    </div>
    <div class="nav-right">
        <img style="border-radius:50%; width:25px; height:25px; background-size:contain;" src="${pageContext.request.contextPath}/img/${user.getProfilePic()}" alt="Avatar" />
        <a style="margin:5px 20px 5px 10px; color:white;" href="${pageContext.request.contextPath}/profile?id=${user.getId()}">${user.getNickname()}</a>
        <form name = "Logout" action="${pageContext.request.contextPath}/LogoutServlet">
            <input style="cursor:pointer;" type="submit" class="LogoutButton" value = "Logout"/>
        </form>
    </div>
    <script>
            let pathname = window.location.pathname.split("/");
            pathname = pathname[pathname.length-1];
            console.log(pathname);
            switch(pathname){
                case "publicWall.jsp":
                    document.getElementById("home").classList.add("active");
                    break;
                case "ChatRoom.jsp":
                    document.getElementById("chat").classList.add("active");
                    break;
                case "feedBack.jsp":
                    document.getElementById("feedback").classList.add("active");
                    break;
                case "aboutUs.jsp":
                    document.getElementById("about").classList.add("active");
                    break;
            }

    </script>
</nav>
