<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/components/styles/Register.css"/>

<script>
    function register_validate()
    {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;

        if (username===null || username==="")
        {
            alert("Username can't be blank");
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
        <div class="register-body">
            <form name="RegisterVerify" method="post" action="${pageContext.request.contextPath}/RegisterController" onsubmit="register_validate()">
                <div id = "RegisterBlock">
                    Register
                </div>
                <div style="display: inline-block; padding: 5px">
                    <div class ="line">
                        Username:
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
                        <input class = "InputBlock" id="username" type = "text" name = "username"/>
                    </div>
                    <div style="padding-top: 10px">
                        <input class = "InputBlock" id="password" minlength="6" type = "password" name = "password"/>
                    </div>
                    <div style="padding-top: 10px;">
                        <input class = "InputBlock" id="password2" minlength="6" type = "password" name = "password2"/>
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

