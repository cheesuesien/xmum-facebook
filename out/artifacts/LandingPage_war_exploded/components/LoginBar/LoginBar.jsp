<link href="../../components/LoginBar/LoginBar.css" rel="stylesheet">

<nav>
    <div class="nav-left">
        <img class="icon" src="../../components/icons/main.png" alt="main-icon"/>
        <div>
            <form name="main_page" action="../../pages/landingPage/landingPage.jsp">
            <input style="display:inline-block; background-color: #383838; color: white; border: 0px; font-family: Verdana, san-serif;
            height: 30px;padding-bottom: 25px; font-weight: bold; font-size: 1.2em" type = "submit" value="XMUM FACEBOOK"/>
            </form>
        </div>
    </div>
    <div class="nav-right">
        <form name="ResetPassword" action="../../pages/PasswordForget/PasswordForget.jsp">
            <input style="display:inline-block; background-color: #383838; color: white; border: 0px; font-family: Verdana, san-serif;
            height: 30px; padding: 5px; font-weight: bold;" type = "submit" value="Forget password?"/>
        </form>
        <form name ="Login" method="get" action = "LoginProcess.jsp">
            <div style="display:inline-block; color:white; padding-top: 5px">Email: </div>
            <input style="display:inline-block; background-color: #565656; border: 1px white solid;" type = "text" name = "email"/>
            <div style="display:inline-block; color:white;">Password: </div>
            <input style="display:inline-block; background-color: #565656; border: 1px white solid;" type = "password" name = "password"/>
            <input style="display:inline-block; background-color: #383838; color: white; border: 0px; font-family: Verdana, san-serif;
            height: 30px; padding: 5px; padding-right: 100px; font-weight: bold;" type = "submit" value = "Login"/>
        </form>
    </div>
</nav>
