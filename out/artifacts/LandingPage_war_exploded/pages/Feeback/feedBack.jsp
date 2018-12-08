<link rel="stylesheet" type="text/css" href="../body.css"/>
<link rel="stylesheet" type="text/css" href="feedBack.css"/>

        <%@ include file="../../includes/header.jsp" %>
<%@ include file="../../components/sideBar/sideBar.jsp" %>
<%@ include file="../../components/navBar/navBar.jsp" %>



<div class="background">
<div id="main-body" >

        <div style="margin:0px auto;">
        <div class="title">Feedback</div>
        <div class="content" style="margin: 20px">What is your feedback for us?</div>
        <form class="form" method="post" data-email="cdtomgreen@gmail.com" action="https://script.google.com/macros/s/AKfycbwvpC8XfAJWPlCKzv1G5AmSPs0-UK9IrQcRlpG3/exec">
                <table width="900px">

                        <tr>

                                <td >
                                       <textarea name="content" style="align-content: center;width: 300px;height:100px;" placeholder="Please type in your comment"></textarea>
                                </td>
                        </tr>
                        <tr>

                                <td width="100px;" >
                                        <h>Your name:</h>

                                        <input type="text" name="name" style="width: 200px;"placeholder="name">
                                </td>
                        </tr>
                        <tr>

                                <td width="100px;"  >
                                        <h>Email:</h>

                                        <input type="text" name="email" style="margin-left:42px;width: 200px;" placeholder="Email(optional)">
                                </td>
                        </tr>
                        <tr>

                                <td>
                                        <button class="button" type="submit">Submit</button>
                                        <button class="button" type="reset">Reset</button>
                                </td>
                        </tr>

                </table>
        </form >
        </div>
</div>
</div>

<%@ include file="../../includes/footer.jsp" %>






















































