<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/styles/LoginBar.css"/>

<script>
    function toggleResetPassword(){
        if(document.getElementById("resetPassword").style.display === "none"){
            document.getElementById("resetPassword").style.display = "block";
            document.getElementById("register").style.display = "none";
            document.getElementById("resetPasswordBtn").style.display = "none";
            document.getElementById("registerBtn").style.display = "inline-block";
        } else {
            document.getElementById("resetPassword").style.display = "none";
            document.getElementById("register").style.display = "block";
            document.getElementById("resetPasswordBtn").style.display = "inline-block";
            document.getElementById("registerBtn").style.display = "none";
        }
    }
</script>

<nav>
    <div class="nav-left">
        <img class="icon" src="${pageContext.request.contextPath}/components/icons/logo.png" alt="main-icon"/>
        <a href="${pageContext.request.contextPath}/pages/landingPage.jsp" class="homeBtn" style="color: white;">XMUM FACEBOOK</a>
    </div>
    <div class="nav-right">
        <c:choose>
            <c:when test="${toggle == 'resetPassword'}">
                <button class="ForgetPassword" id="resetPasswordBtn" onclick="toggleResetPassword()" style="display: none;">Reset password?</button>
                <button class="ForgetPassword" id="registerBtn" onclick="toggleResetPassword()">Register</button>
            </c:when>
            <c:otherwise>
                <button class="ForgetPassword" id="resetPasswordBtn" onclick="toggleResetPassword()">Reset password?</button>
                <button class="ForgetPassword" id="registerBtn" onclick="toggleResetPassword()" style="display: none;">Register</button>
            </c:otherwise>
        </c:choose>


        <%--<form name="PasswordForget"&lt;%&ndash; action="${pageContext.request.contextPath}/components/PasswordReset.jsp"&ndash;%&gt; onsubmit="toggleResetPassword()">
            <input class="ForgetPassword" id="resetPasswordBtn" type = "submit" value="Reset password?"/>
            <input class="ForgetPassword" id="registerBtn" type = "submit" value="Register" style="display: none;"/>
        </form>--%>
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
