<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/LoginBar.jsp" %>

<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/PasswordForget.css"/>

<script>
    function validate()
    {
        var username = document.getElementsByName("username")[0].value;
        console.log("username", username);
        var newpassword = document.getElementsByName("newpassword")[0].value;
        var newpassword2 = document.getElementsByName("newpassword2")[0].value;

        if (username===null || username==="")
        {
            alert("Username can't be blank");
            return false;
        }

        else if (newpassword!=newpassword2)
        {
            alert("Confirm NewPassword is same");
            return false;
        }
        else
            return true;
    }
</script>

<div id="main-body" class="main">
    <div class="PasswordForget">
        <form name="RegisterVerify" method="post" action="ResetPassword" onsubmit="validate()">
            <div class="passwordreset">
                Password Reset
            </div>

            <div style="display: inline-block">
                <div class = "email">
                    Email:
                </div>
            </div>
            <div style="display: inline-block">
                <div>
                    <input class="emailinput" type = "email" name = "email"/>
                </div>
            </div>
            <div style="display: inline-block">
                <div class = "email">
                    Password:
                </div>
            </div>
            <div style="display: inline-block">
                <div>
                    <input class="emailinput" type = "email" name = "password"/>
                </div>
            </div>
            <div style="display: inline-block">
                <div class = "email">
                    NewPassword:
                </div>
            </div>
            <div style="display: inline-block">
                <div>
                    <input class="emailinput" type = "email" name = "newpassword"/>
                </div>
            </div>
            <div style="display: inline-block">
                <div class = "email">
                    RetypeNewPassword:
                </div>
            </div>
            <div style="display: inline-block">
                <div>
                    <input class="emailinput" type = "email" name = "newpassword2"/>
                </div>
            </div>
            <div>
                <div style="text-align: right; width: 260px; display: inline-block;">
                    <input class = "submit" type="submit" onclick="resetPass()"/>
                </div>
            </div>
        </form>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
