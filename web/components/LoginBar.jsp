<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/styles/LoginBar.css"/>

<nav>
    <div class="nav-left">
        <img class="icon" src="${pageContext.request.contextPath}/components/icons/main.png" alt="main-icon"/>
        <div>
            <form name="main_page" action="${pageContext.request.contextPath}/pages/landingPage.jsp">
            <input class = "XMUM_Facebook" type = "submit" value="XMUM FACEBOOK"/>
            </form>
        </div>
    </div>
    <div class="nav-right">
        <form name="PasswordForget" action="${pageContext.request.contextPath}/pages/PasswordReset.jsp">
            <input class="ForgetPassword" type = "submit" value="Reset password?"/>
        </form>
        <form name ="Login" method="post" action = "${pageContext.request.contextPath}/LoginController">
            <div class="Text">Username: </div>
            <input class="InputBlock" type = "text" name = "username"/>
            <div class="Text">Password: </div>
            <input class="InputBlock" type = "password" name = "password"/>
            <input class="LoginButton" type = "submit" value = "Login"/>
            <div class="submit-result">
               <%
                    out.println(request.getAttribute("submit_result") != null? request.getAttribute("submit_result") : "");
               %>
            </div>
        </form>
    </div>
</nav>
