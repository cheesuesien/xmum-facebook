<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/chatRoom.css"/>

<%@ include file="../includes/header.jsp" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/landingPage.jsp");
    }
%>

<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/chat.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/styles/chatRoom.css"/>

<div id="divMain">
    <div class="divtop">
        <div class="divL">
            <p style="margin: 20px auto;color:#d1cc6e;text-align:center;font-size:2.5em;border-bottom: 1px solid #d1cc6e;width: 70%;padding: 10px;">CHAT ROOM</p>
            <div class="divShow" id="divContent"></div>
        </div>
        <div class="divR">
            <p style="color:#d1cc6e; text-align:center; font-size:2.5em;">Online Members</p>
            <div class="divShow" id="divOnLine"></div>
        </div>
    </div>
    <div class="divBot">
        <table cellpadding="0" cellspacing="0">
            <%--<tr><td colspan="2" id="divFace" class="pb"></td></tr>--%>
            <tr><td>
            <textarea id="txtContent" placeholder="Type your message here..."  cols="64" rows="3" class="txt"></textarea></td><td class="pl">
            <button id="Button1" class="btn">Send</button>
            <button id="Button2" class="btn">Exit</button>

        </td></tr><tr><td colspan="2" class="pt">Content Cannot Be Empty</td></tr></table>
    </div>
    <span id="divMsg" class="clsTip">Sending Data...</span>
    <div class="upload" id="file">
        <div id="fileQueue"></div>
        <input type="file" name="uploadify" id="uploadify" />
        <p>
            <a href="javascript:$('#uploadify').uploadify('upload')">Start To Upload</a>
            <a href="javascript:$('#uploadify').uploadify('cancel','*')">Cancel Upload</a>
        </p>
    </div>

</div>
</body>
</html>

<%@ include file="../includes/footer.jsp" %>