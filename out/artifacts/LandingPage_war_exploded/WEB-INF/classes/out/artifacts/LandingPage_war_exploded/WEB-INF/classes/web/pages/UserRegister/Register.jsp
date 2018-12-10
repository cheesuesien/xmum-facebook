<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../components/LoginBar/LoginBar.jsp" %>

<link rel="stylesheet" type="text/css" href="../body.css"/>
<link rel="stylesheet" type="text/css" href="Register.css"/>

    <div id="main-body">
        <div style="margin: 250px auto; width: 390px; border: black solid 2px; height: 195px;">
            <form name="RegisterVerify" method="get" action="../../includes/Register/RegisterProcess.java">
                <div class = "RegisterBlock">
                    Register
                </div>
                <div style="display: inline-block">
                    <div class ="block">
                        Email:
                    </div>
                    <div class = "block">
                        NewPassword:
                    </div>
                    <div class = "block">
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

<%@ include file="../../includes/footer.jsp" %>
