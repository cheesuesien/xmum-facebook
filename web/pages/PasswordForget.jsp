<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/LoginBar.jsp" %>

<link rel="stylesheet" type="text/css" href="styles/body.css"/>

<div id="main-body" style="display: flex; flex-direction: column; justify-content: center;width: 100%;">
    <div style="margin: 250px auto; width: 340px; border: black solid 2px; height: 150px;">
        <form name="RegisterVerify" method="get" action="Controller">
            <div style="color: white; padding: 10px; text-align: center; background-color: #383838; margin: 0 auto;font-size: 1.5em;">
                Password Reset
            </div>
            <div style="display: inline-block">
                <div style="font-size: 1.2em;margin-top: 20px; margin-bottom: 20px; margin-left: 10px;text-align: right;">
                    Email:
                </div>
            </div>
            <div style="display: inline-block">
                <div>
                    <input style=" background-color: #565656; height: 25px; width: 250px; color: white;
                        border: 1px white solid;" type = "text" name = "email"/>
                </div>
            </div>
            <div>
                <div style="text-align: right; width: 260px; display: inline-block;">
                    <input style="width: 150px; text-align: center; background-color: #383838; color: white; padding: 10px;
                    margin-left: 0px; margin-right: 0px; cursor: pointer; border: none;" type="submit"/>
                </div>
            </div>
        </form>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
