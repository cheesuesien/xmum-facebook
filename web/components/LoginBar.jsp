<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/styles/LoginBar.css"/>

<nav>
    <div class="nav-left">
        <img class="icon" src="${pageContext.request.contextPath}/components/icons/logo.png" alt="main-icon"/>
        <a href="${pageContext.request.contextPath}/pages/landingPage.jsp" class="homeBtn" style="color: white;">XMUM FACEBOOK</a>
    </div>
    <div class="nav-right">
        <form name="PasswordForget" action="${pageContext.request.contextPath}/pages/PasswordReset.jsp">
            <input class="ForgetPassword" type = "submit" value="Reset password?"/>
        </form>
        <form name ="Login" method="post" action = "${pageContext.request.contextPath}/LoginController">
            <div class="Text">Student/Staff ID: </div>
            <input class="InputBlock" type = "text" name = "id"/>
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
