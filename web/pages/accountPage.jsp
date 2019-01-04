<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/body.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/accountPage.css"/>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../components/navBar.jsp" %>


<div id="main-body">
    <div style="background-image:radial-gradient(#ffe066, #af950c); padding:20px;">
        <img class="profile" src="${pageContext.request.contextPath}/img/${stalkUser.getProfilePic()}" alt="Avatar" />
        <form id="profilePicForm" method="POST" action="${pageContext.request.contextPath}/user" enctype="multipart/form-data">
            <input type="hidden" name="uploadType" value="profilePic" />
            <input style="width: 0.1px; height: 0.1px; opacity: 0; overflow: hidden; position: absolute; z-index: -1;" type="file" name="myFile" id="profilePicInput"/>
            <c:if test="${user.getId().equals(stalkUser.getId())}">
            <div style="margin:10px auto; height:20px; width:20px; background-size:contain; background-image: url('${pageContext.request.contextPath}/components/icons/edit-icon.png');">
                <label style="cursor:pointer; height:100%; width:100%; display: inline-block;" for="profilePicInput"></label>
            </div>
            </c:if>
        </form>
        <div style="font-size:1.5em; font-weight:bold;">${stalkUser.getNickname()}</div>
    </div>
    <%--<div class="title">My Profile</div>--%>
    <div style="background-color: white; padding:20px;" class="content">
        <form id="userDetailsForm" method="POST" action="${pageContext.request.contextPath}/user" onsubmit="console.log('submitting form');">
            <input type="hidden" name="uploadType" value="profileDetails" />
            <input type="hidden" name="id" value="${stalkUser.getId()}"/>
            <table>
                <tr>
                    <td class="label">Nickname:</td>
                    <td>
                        <div class="userInfo">${stalkUser.getNickname()}</div>
                        <input style="display:none;" type="text" name="username" class="input" id="username" value="${stalkUser.getNickname()}"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Gender: </td>
                    <td>
                        <div class="userInfo">${stalkUser.getProfile().getGender()}</div>
                        <input style="display:none;" type="text" name="gender" class="input" id="gender" value="${stalkUser.getProfile().getGender()}"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Phone number: </td>
                    <td>
                        <div class="userInfo">${stalkUser.getProfile().getPhonenum()}</div>
                        <input style="display:none;" type="text" name="phonenum" class="input" id="phonenum" value="${stalkUser.getProfile().getPhonenum()}"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Email: </td>
                    <td>
                        <div class="userInfo">${stalkUser.getProfile().getEmail()}</div>
                        <input style="display:none;" type="text" name="email" class="input" id="email" value="${stalkUser.getProfile().getEmail()}"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Intro: </td>
                    <td>
                        <div class="userInfo">${stalkUser.getProfile().getIntro()}</div>
                        <textarea style="display:none; margin-bottom:10px;" rows="4" name="intro" class="input" id="intro">${stalkUser.getProfile().getIntro()}</textarea>
                    </td>
                </tr>
                <tr>
                    <td class="label">Birthdate: </td>
                    <td>
                        <div class="userInfo">${stalkUser.getProfile().getBirthdate()}</div>
                        <input style="display:none;" type="date" name="birthdate" class="input" id="birthdate" value="${stalkUser.getProfile().getBirthdate()}"/>
                    </td>
                </tr>
                <tr>
                    <td class="label">Star Sign: </td>
                    <td>
                        <div class="userInfo">${stalkUser.getProfile().getStarsign()}</div>
                        <input style="display:none;" type="text" name="starsign" class="input" id="starsign" value="${stalkUser.getProfile().getStarsign()}"/>
                    </td>
                </tr>
            </table>
            <input type="submit" style="display:none" id="submitButton"/>
        </form>
        <c:if test="${user.getId().equals(stalkUser.getId())}">
            <button style="cursor:pointer; height:20px; width:20px; border:0; background-color: transparent; background-size:contain; background-image: url('${pageContext.request.contextPath}/components/icons/edit-icon.png');" id="changeInputButton" onclick="changeToInput()"></button>
        </c:if>

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
            inputs[i].style.display = 'inline-block';
            userInfo[i].style.display = 'none';
        }
        document.getElementById("submitButton").style.display = '';
        document.getElementById("changeInputButton").style.display = 'none';
    }
</script>

<%@ include file="../includes/footer.jsp" %>
