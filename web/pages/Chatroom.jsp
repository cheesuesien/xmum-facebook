<%--
  Created by IntelliJ IDEA.
  User: cdtom
  Date: 12/22/2018
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" type="text/css" href="styles/body.css"/>


<%@ include file="../includes/header.jsp" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Chat Room</title>
    <script type="text/javascript" src="../javascript/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../javascript/chat.js"></script>

    <link rel="stylesheet" href="../pages/styles/chatRoom.css"/>

</head>
<body>
<div id="divMain">
    <div class="divtop">
        <div class="divL">
            <h3>Chat Room</h3>
            <div class="divShow" id="divContent"></div>
        </div>
        <div class="divR">
            <h3>Online Member</h3>
            <div class="divShow" id="divOnLine"></div>
        </div>
    </div>
    <div class="divBot">
        <table cellpadding="0" cellspacing="0">
            <tr><td colspan="2" id="divFace" class="pb"></td></tr><tr><td>
            <td>
                <textarea id="txtContent" cols="64" rows="3" class="txt"></textarea></td>
            </td>
            <td >
                <div class="buttontext">
                    <input id="Button1" type="button" value="Send" class="btn"/>
                    <input id="Button2" type="button" value="Exit" class="btn1"/>
                    <input id="Button4" style="display:none" type="button" value="Hide" class="btn"/>
                </div>


            </td>
        </tr>

    <span id="divMsg" class="clsTip">Sending Data...</span>
    <%----%>
    <%--<div class="upload" id="file">--%>
        <%--<div id="fileQueue"></div>--%>
        <%--<input type="file" name="uploadify" id="uploadify" />--%>
        <%--<p>--%>
            <%--<a href="javascript:$('#uploadify').uploadify('upload')">Start To Upload</a>--%>
            <%--<a href="javascript:$('#uploadify').uploadify('cancel','*')">Cancel Upload</a>--%>
        <%--</p>--%>
    <%--</div>--%>

</div>
</div>
</body>
</html>

<%@ include file="../includes/footer.jsp" %>