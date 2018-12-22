<%@ page import="com.xmum.User.UserBean" %>
<%@ page import="com.xmum.User.UserDAO" %>
<%@ page import="java.sql.ResultSet" %>
<link rel="stylesheet" type="text/css" href="styles/body.css"/>
<link rel="stylesheet" type="text/css" href="styles/accountPage.css"/>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/sideBar.jsp" %>
<%@ include file="../components/navBar.jsp" %>


<div id="main-body">
    <div class="title">My Account</div>
    <img class="profile" src="../img/${user.getProfilePic()}" alt="Avatar">
        <form id="profilePicForm" method="POST" action="${pageContext.request.contextPath}/uploadImage" enctype="multipart/form-data">
            <input type="hidden" name="uploadType" value="profilePic" />
            <input type="file" name="myFile" id="profilePicInput"/>
        </form>

    <div class="content">
        <form id="userDetailsForm" method="POST" action="${pageContext.request.contextPath}/user" onsubmit="console.log('submitting form');">
            <div>
                <div>Name: </div>
                <div class="userInfo">${user.getNickname()}</div>
                <input style="display:none;" type="text" name="username" class="input" id="username"/>
            </div>
            <input type="submit" style="display:none" id="submitButton"/>
        </form>
        <button id="changeInputButton" onclick="changeToInput()">Edit</button>
    </div>
</div>

<script>

    const profileInput = document.getElementById('profilePicInput');
    profileInput.addEventListener("change", submitForm, false);

    function submitForm(){
        document.getElementById("profilePicForm").submit();
    }

    function changeToInput(){
        const inputs = document.getElementsByClassName("input");
        const userInfo = document.getElementsByClassName("userInfo");
        for(i = 0; i< inputs.length; i++){
            inputs[i].style.display = '';
            userInfo[i].style.display = 'none';
        }
        document.getElementById("submitButton").style.display = '';
        document.getElementById("changeInputButton").style.display = 'none';
    }
</script>

<%@ include file="../includes/footer.jsp" %>
