<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/PasswordReset.css"/>

<jsp:include page="../includes/header.jsp" />
<jsp:include page="../components/LoginBar.jsp"/>

<script>
    function passwordreset_validate()
    {
        var username = document.getElementById("username").value;
        var newpassword = document.getElementsById("newpassword").value;
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

<div class="reset-main-body">
    <div class="PasswordForget">
        <form name="RegisterVerify" method="post" action="${pageContext.request.contextPath}/ResetPassword" onsubmit="passwordreset_validate()">
            <div class="passwordreset">
                Reset Password
            </div>
            <div style="margin-bottom: 10px">
                <div style="display: inline-block">
                    <div class = "email">
                        Email:
                    </div>
                    <div class = "email">
                        Password:
                    </div>
                    <div class = "email">
                        NewPassword:
                    </div>
                    <div class = "email">
                        RetypeNewPassword:
                    </div>
                </div>
                <div style="display: inline-block">
                    <div>
                        <input class="emailinput" type = "email" id="email" name = "email"/>
                    </div>
                    <div>
                        <input class="emailinput" type = "email" id="password" name = "password"/>
                    </div>
                    <div>
                        <input class="emailinput" type = "email" id="newpassword" name = "newpassword"/>
                    </div>
                    <div>
                        <input class="emailinput" type = "email" name = "newpassword2"/>
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
</div>
<jsp:include page="../includes/footer.jsp" />
