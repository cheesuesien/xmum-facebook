<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/styles/Register.css"/>

<script>
    function passwordreset_validate()
    {
        var username = document.getElementById("id").value;
        var newpassword = document.getElementById("newpassword").value;
        var newpassword2 = document.getElementById("newpassword2").value;

        if (username===null || username==="")
        {
            alert("Username can't be blank");
            return false;
        }

        else if (newpassword!==newpassword2)
        {
            alert("Confirm NewPassword is same");
            return false;
        }
        else
            return true;
    }
</script>

<div>
    <c:choose>
        <c:when test="${toggle == 'resetPassword'}">
            <div class="register-body" id="resetPassword">
        </c:when>
        <c:otherwise>
            <div class="register-body" id="resetPassword" style="display:none;">
        </c:otherwise>
    </c:choose>
    <%--<div class="register-body" id="resetPassword" style="display:none;">--%>
        <form name="RegisterVerify" method="post" action="${pageContext.request.contextPath}/ResetPassword" onsubmit="passwordreset_validate()">
            <div id = "RegisterBlock">
                Reset Password
            </div>
            <div style="display: inline-block; padding: 5px">
                <div class ="line">
                    ID:
                </div>
                <div class ="line">
                    Password:
                </div>
                <div class ="line">
                    New Password:
                </div>
                <div class ="line">
                    Retype New Password:
                </div>
            </div>
            <div style="display: inline-block; padding: 5px;">
                <div>
                    <input class="InputBlock" type = "text" id="id" name = "id"/>
                </div>
                <div style="padding-top: 9px">
                    <input class="InputBlock" type = "password" id="password" name = "password"/>
                </div>
                <div style="padding-top: 9px">
                    <input class="InputBlock" type = "password" id="newpassword" name = "newpassword"/>
                </div>
                <div style="padding-top: 9px">
                    <input class="InputBlock" type = "password" id="newpassword2" name = "newpassword2"/>
                </div>
            </div>
            <div>
                <div style="text-align: right; width: 260px; display: inline-block;">
                    <input  class="SubmitBlock" type="submit"/>
                </div>
                <div style="display: inline-block; color: red; font-size: 0.7em;">
                    <%
                        out.println(request.getAttribute("reset_result") != null? request.getAttribute("reset_result") : "");
                    %>
                </div>
            </div>
        </form>
    </div>
</div>



<%--<div class="reset-main-body">
    <div class="PasswordForget">
        <form name="RegisterVerify" method="post" action="${pageContext.request.contextPath}/ResetPassword" onsubmit="passwordreset_validate()">
            <div class="passwordreset">
                Reset Password
            </div>
            <div style="margin-bottom: 10px">
                <div style="display: inline-block">
                    <div class = "email">
                        ID:
                    </div>
                    <div class = "email">
                        Password:
                    </div>
                    <div class = "email">
                        New Password:
                    </div>
                    <div class = "email">
                        Retype New Password:
                    </div>
                </div>
                <div style="display: inline-block">
                    <div>
                        <input class="emailinput" type = "text" id="id" name = "id"/>
                    </div>
                    <div>
                        <input class="emailinput" type = "password" id="password" name = "password"/>
                    </div>
                    <div>
                        <input class="emailinput" type = "password" id="newpassword" name = "newpassword"/>
                    </div>
                    <div>
                        <input class="emailinput" type = "password" name = "newpassword2"/>
                    </div>
                </div>
            </div>
            <div>
                <div style="text-align: right; width: 300px; display: inline-block;">
                    <input class = "submit" type="submit" />
                </div>
                <div style="display: inline-block; color: red; font-size: 0.7em;width: 130px; ">
                    <%
                        out.println(request.getAttribute("reset_result") != null? request.getAttribute("reset_result") : "");
                    %>
                </div>
            </div>
        </form>
    </div>
</div>--%>
