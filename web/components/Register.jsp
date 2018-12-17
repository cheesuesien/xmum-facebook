<link rel="stylesheet" type="text/css" href="../components/styles/Register.css"/>

<script>
    function validate()
    {
        var username = document.getElementsByName("username")[0].value;
        console.log("username", username);
        var password = document.getElementsByName("password")[0].value;
        var password2 = document.getElementsByName("password2")[0].value;

        if (username===null || username==="")
        {
            alert("Username can't be blank");
            return false;
        }

        else if(password.length<6)
        {
            alert("Password must be at least 6 characters long.");
            return false;
        }
        else if (password!=password2)
        {
            alert("Confirm Password should match with the Password");
            return false;
        }
        else
            return true;
    }
</script>

<div id="main-body">
        <div style="flex: 1 1 auto;margin: 250px auto; width: 390px; border: black solid 2px; height: 195px;">
            <form name="RegisterVerify" method="post" action="${pageContext.request.contextPath}/RegisterController" onsubmit="validate()">
                <div id = "RegisterBlock">
                    Register
                </div>
                <div style="display: inline-block">
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
                        <input class = "InputBlock" type = "text" name = "username"/>
                    </div>
                    <div style="padding-top: 10px">
                        <input class = "InputBlock" type = "password" name = "password"/>
                    </div>
                    <div style="padding-top: 10px;">
                        <input class = "InputBlock" type = "password" name = "password2"/>
                    </div>
                </div>
                <div>
                    <div style="text-align: right; width: 260px; display: inline-block;">
                        <input  class="SubmitBlock" type="submit"/>
                    </div>
                    <div style="display: inline-block; color: red;">
                        <%
                            out.println(request.getAttribute("register_result") != null? request.getAttribute("register_result") : "");
                        %>
                    </div>
                </div>
            </form>
        </div>
</div>

