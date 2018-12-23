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
        <input type="file" name="myFile" id="profilePicInput"/>
    <div class="content">
        <form id="userDetailsForm" method="POST" action="${pageContext.request.contextPath}/user" onsubmit="console.log('submitting form');">
            <div>
                <div>Name: </div>
                <div class="userInfo">${user.getNickname()}</div>
                <input style="display:none;" type="text" name="username" class="input" id="username"/>
            </div>
            <div>
                <div>Introduction: </div>
                <div class="userInfo"></div>
                <input style="display:none;" type="text" name="intro" class="input" id="intro"/>
            </div>
            <input type="submit" style="display:none" id="submitButton"/>
        </form>
        <button id="changeInputButton" onclick="changeToInput()">Edit</button>
    </div>
</div>

<script>

     const profileInput = document.getElementById('profilePicInput');
     profileInput.addEventListener("change", handleFiles, false);

    function handleFiles(){

        let formData = new FormData();
        formData.append("fileToUpload", profileInput.files[0]);

        const xhr = new XMLHttpRequest();
        xhr.open('POST', '../uploadImage');
        xhr.onload = () => {
            console.log("profile updated");
            location.reload(true);
        };
        xhr.send(formData);
    }

    function changeToInput(elementId){
        const inputs = document.getElementsByClassName("input");
        const userInfo = document.getElementsByClassName("userInfo");
        for(i = 0; i< inputs.length; i++){
            inputs[i].style.display = '';
            userInfo[i].style.display = 'none';
        }
        document.getElementById("submitButton").style.display = '';
        document.getElementById("changeInputButton").style.display = 'none';
        // const divElement = document.getElementById(elementId);
        // const inputElement = document.getElementById(elementId + "Input");
        // const buttonElement = document.getElementById(elementId + "Button");
        // divElement.style.display = 'none';
        // inputElement.style.display = '';
        // buttonElement.style.display = '';
    }

    function sendData(){

        let formData = new FormData(document.querySelector('form'));
        console.log(formData);

        // const username = document.getElementById("username").value;
        // const intro = document.getElementById("intro").value;
        //
        // console.log(username, intro);
        //
        // let formData = new FormData();
        // formData.append('username', username);
        // formData.append('intro', intro);
        //
        // console.log(formData);

        const xhr = new XMLHttpRequest();
        xhr.open('POST', '../user');
        xhr.onload = () => {
            console.log("profile updated");
            //location.reload(true);
        };
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(formData);
    }
</script>

<%@ include file="../includes/footer.jsp" %>
