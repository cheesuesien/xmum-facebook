<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/styles/Register.css"/>

<script>
    function register_validate()
    {
        var id = document.getElementById("registerId").value;
        var nickname = document.getElementById("registerNickname").value;
        var password = document.getElementById("registerPassword").value;
        var password2 = document.getElementById("registerPassword2").value;

        if (!id || !nickname || !password || !password2)
        {
            alert("Don't leave any inputs blank");
            return false;
        }
        else if (password !== password2)
        {
            alert("Confirm Password should match with the Password");
            return false;
        }
        else
            return true;
    }
</script>

<div>
    <c:choose>
        <c:when test="${toggle == 'resetPassword'}">
            <div class="register-body" id="register" style="display:none;">
        </c:when>
        <c:otherwise>
            <div class="register-body" id="register">
        </c:otherwise>
    </c:choose>
        <%--<div class="register-body" id="register">--%>
            <form name="RegisterVerify" method="post" action="${pageContext.request.contextPath}/RegisterController" onsubmit="return register_validate()">
                <div id = "RegisterBlock">
                    Register
                </div>
                <div style="display: inline-block; padding: 5px">
                    <div class ="line">
                        ID:
                    </div>
                    <div class ="line">
                        Nickname:
                    </div>
                    <div class ="line">
                        NewPassword:
                    </div>
                    <div class ="line">
                        Retype NewPassword:
                    </div>
                </div>
                <div style="display: inline-block">
                    <div>
                        <input class = "InputBlock" id="registerId" type = "text" name = "id"/>
                    </div>
                    <div style="padding-top: 9px">
                        <input class = "InputBlock" id="registerNickname" type = "text" name = "nickname"/>
                    </div>
                    <div style="padding-top: 9px">
                        <input class = "InputBlock" id="registerPassword" minlength="6" type = "password" name = "password"/>
                    </div>
                    <div style="padding-top: 9px;">
                        <input class = "InputBlock" id="registerPassword2" minlength="6" type = "password" name = "password2"/>
                    </div>
                </div>
                <div>
                    <div style="text-align: right; width: 260px; display: inline-block;">
                        <input  class="SubmitBlock" type="submit"/>
                    </div>
                    <div style="display: inline-block; color: red; font-size: 0.7em;">
                        <%
                            out.println(request.getAttribute("register_result") != null? request.getAttribute("register_result") : "");
                        %>
                    </div>
                </div>
            </form>
        </div>
</div>

