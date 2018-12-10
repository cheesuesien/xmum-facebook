<link rel="stylesheet" type="text/css" href="../body.css"/>
<link rel="stylesheet" type="text/css" href="publicWall.css"/>

<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../components/sideBar/sideBar.jsp" %>
<%@ include file="../../components/navBar/navBar.jsp" %>

<html>
<head>
    <title>XMUM Facebook</title>
</head>
<body>
    <!--Type user status here -->
    <div id="status-input">
        <textarea placeholder=" What's on your mind?" style="width:80%;"></textarea>
        <!--<div class="buttooon" onclick="document.getElementById('log').submit()">Post</div>-->
    </div>

    <!--Pinned post: Admin Posts and Official Announcements-->
    <div class="main">
        <div id="pin-post">
            <h2>THIS IS A PINNED MESSAGE</h2>
            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="../../components/icons/PFP.jpg" alt="Profile Picture"  class="pfp"/>
                    </td>
                    <td class="admin-username">
                        <b>User Name</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        10th December 2018 00:18
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                            Bla bla bla bla bla blabla bla bal bla bla bla saldjasklfjakmkxmckjfklasdsa aldjskfmd adhsajhkasdj khjaskdhjasjksadhkjas adjkahsjk askhsk asldjkdammk sda asd askljaskl
                            <br><br>
                            <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <!--Normal Posts: Normal User Posts and Spams-->
    <div>
        <div class="normal">
            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="#" alt="Profile Picture"  class="pfp"/>
                    </td>
                    <td class="user-username">
                        <b>User Name</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        10th December 2018 00:18
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                            Bla bla bla bla bla blabla bla bal bla bla bla saldjasklfjakmkxmckjfklasdsa aldjskfmd adhsajhkasdj khjaskdhjasjksadhkjas adjkahsjk askhsk asldjkdammk sda asd askljaskl
                            <br><br>
                            <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div>
        <div class="normal">
            <table>
                <tr>
                    <td rowspan="2" width="100px">
                        <img src="#" alt="Profile Picture"  class="pfp"/>
                    </td>
                    <td class="user-username">
                        <b>User Name</b>
                    </td>
                </tr>
                <tr>
                    <td class="date-posted">
                        10th December 2018 00:18
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="content">
                            Bla bla bla bla bla blabla bla bal bla bla bla saldjasklfjakmkxmckjfklasdsa aldjskfmd adhsajhkasdj khjaskdhjasjksadhkjas adjkahsjk askhsk asldjkdammk sda asd askljaskl
                            <br><br>
                            <a href="#" class="tiny-words">Read more</a>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div><br>  <br></div>
</body>
</html>

<%@ include file="../../includes/footer.jsp" %>
