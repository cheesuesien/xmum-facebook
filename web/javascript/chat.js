
function UserEnter(){
    console.log("UserEnter triggered");
    $.ajax({
        type:"POST",
        url:"chat",  //项目web.xml 内配置了 servlet
        data:"action=Enter&d="+new Date(),
        success:function(msg){
            if(msg == "ok"){
                window.location.href="../pages/Chatroom.jsp";
            }else{
                alert("Information Wrong!");
                return false;
            }
        }
    });
}
/*window.addEventListener('popstate', function(event) {
    alert("you want to go??");
}, false);

$(window).on('beforeunload', function(){
    alert("Don't go!!");
});*/

$(function(){
    //UserEnter();
    if (window.history && window.history.pushState) {

        window.history.pushState('forward', null);

        $(window).on('popstate', function() {
            Logout();
        });

    }
    $("#divMsg").ajaxStart(function(){
        $(this).show();
    })
    $("#divMsg").ajaxStop(function(){
        $(this).html("Success!").hide();
    })

    /*$("#Login").click(function(){
        var $id=$("#txtid");
        var $nickname=$("#txtnickname");

            UserEnter($id.val(),$nickname.val());
    })*/
});


//face icons
function InitFace() {
    var strHTML = "";
    for (var i = 1; i <= 2; i++) {
        strHTML += "![](Face/" + i + ".gif )";
    }
    $("#divFace").html(strHTML);
}
$(function() {

    InitFace();
    console.log('initface just run');
    $("table tr td img").click(function() {
        var strContent = $("#txtContent").val() + "<:" + this.id + ":>";
        $("#txtContent").val(strContent);

    })
});



//face icons
function InitFace() {
    var strHTML = "";
    for (var i = 1; i <= 2; i++) {
        strHTML += "![](Face/" + i + ".gif )";
    }
    $("#divFace").html(strHTML);
}
//get message content
// data is the message content data
function GetMessageList() {
    $.ajax({
        type: "GET",
        url: "../chat",
        data: "action=ChatList&d=" + new Date(),
        success: function (data) {
            $("#divContent").html(data);
        }
    });
    AutoUpdMessageList();
}
function  GetOnLineList() {
    $.ajax({
        type: "POST",
        url: "../chat",
        data: "action=OnLineList",
        success: function(data) {
            $("#divOnLine").html(data);
        }
    });
    AutoUpdOnlineList();
}

//auto update member and message
function AutoUpdMessageList() {
    setTimeout(GetMessageList, 5000);
}
function AutoUpdOnlineList() {
    setTimeout(GetOnLineList, 5000);
}

//send message
function SendContent(content) {
    $.ajax({
        type: "POST",
        url: "../chat",
        data: "action=SendContent&d=" + new Date() + "&content=" + content,
        success: function(data) {
             if (data == 1) {
                GetMessageList();
                $("#txtContent").val("");
            } else {
                GetMessageList();
                alert("请先登录!");
                //window.location.href="http://localhost:8082/LandingPage_war_exploded/pages/Chatroom.jsp";

            }
        }
    });
}

$(function() {

    InitFace();
    GetMessageList();
    GetOnLineList();

    $("#Button1").click(function() { // button
        var $content = $("#txtContent"); //send content
        if ($content.val() != "") {
            SendContent($content.val());
        }
        else {
            alert("No empty content!");
            $content.focus();
            return false;
        }
    })


    $("#Button2").click(function() { //logout
        console.log("Logout clicked!");
        Logout();
    })

    $("table tr td img").click(function() { //image
        var strContent = $("#txtContent").val() + "<:" + this.id + ":>";
        $("#txtContent").val(strContent);

    })
});

function  Logout() {
    $.ajax({
        type: "POST",
        url: "../chat",
        data: "action=Logout&d=" + new Date(),
        success: function(data) {
            if (data) {
                window.location.href="../post";
            }
            else {
                alert("Failure!");
                return false;
            }
        }
    });
}