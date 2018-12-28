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
        <form id="profilePicForm" method="POST" action="${pageContext.request.contextPath}/user" enctype="multipart/form-data">
            <input type="hidden" name="uploadType" value="profilePic" />
            <input type="file" name="myFile" id="profilePicInput"/>
        </form>

    <div class="content">
        <form id="userDetailsForm" method="POST" action="${pageContext.request.contextPath}/user" onsubmit="console.log('submitting form');">
            <input type="hidden" name="uploadType" value="profileDetails" />
            <div>
                <div>Nickname: </div>
                <div class="userInfo">${user.getNickname()}</div>
                <input style="display:none;" type="text" name="username" class="input" id="username" value="${user.getNickname()}"/>
            </div>
            <div>
                <div>Gender: </div>
                <div class="userInfo">${user.getProfile().getGender()}</div>
                <input style="display:none;" type="text" name="gender" class="input" id="gender" value="${user.getProfile().getGender()}"/>
            </div>
            <div>
                <div>Phone number: </div>
                <div class="userInfo">${user.getProfile().getPhonenum()}</div>
                <input style="display:none;" type="text" name="phonenum" class="input" id="phonenum" value="${user.getProfile().getPhonenum()}"/>
            </div>
            <div>
                <div>Email: </div>
                <div class="userInfo">${user.getProfile().getEmail()}</div>
                <input style="display:none;" type="text" name="email" class="input" id="email" value="${user.getProfile().getEmail()}"/>
            </div>
            <div>
                <div>Intro: </div>
                <div class="userInfo">${user.getProfile().getIntro()}</div>
                <input style="display:none;" type="text" name="intro" class="input" id="intro" value="${user.getProfile().getIntro()}"/>
            </div>
            <div>
                <div>Birthdate: </div>
                <div class="userInfo">${user.getProfile().getBirthdate()}</div>
                <input style="display:none;" type="date" name="birthdate" class="input" id="birthdate" value="${user.getProfile().getBirthdate()}"/>
            </div>
            <div>
                <div>Star Sign: </div>
                <div class="userInfo">${user.getProfile().getStarsign()}</div>
                <input style="display:none;" type="text" name="starsign" class="input" id="starsign" value="${user.getProfile().getStarsign()}"/>
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
