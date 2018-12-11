<link rel="stylesheet" type="text/css" href="../components/styles/Register.css"/>

    <div id="main-body">
        <div style="margin: 250px auto; width: 390px; border: black solid 2px; height: 195px;">
            <form name="RegisterVerify" method="get" action="${pageContext.request.contextPath}/Controller">
                <div id = "RegisterBlock">
                    Register
                </div>
                <div style="display: inline-block">
                    <div class ="line">
                        Email:
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
                        <input class = "InputBlock" type = "text" name = "email"/>
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
                            out.println(request.getAttribute("result") != null? request.getAttribute("result") : "0");
                        %>
                    </div>
                </div>
            </form>
        </div>
    </div>

