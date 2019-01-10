function validate(){
    const nickname = document.getElementById("username").value;
    const gender = document.getElementById("gender").value;
    const phonenum = document.getElementById("phonenum").value;
    const email = document.getElementById("email").value;
    const intro = document.getElementById("intro").value;
    const birthdate = document.getElementById("birthdate").value;
    const starsign = document.getElementById("starsign").value;

    if (!nickname || !gender || !phonenum || !email || !intro || !birthdate || !starsign)
    {
        alert("Don't leave any inputs blank");
        return false;
    }
    else if (nickname.length > 20){
        alert("Nickname must be less than 20 characters");
        return false;
    }
    else if (gender.length > 1){
        alert("Gender can only be M or F");
        return false;
    }

    else
        return true;
}

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