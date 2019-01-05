
function UserEnter(id,nickname){
    $.ajax({
        type:"POST",
        url:"chat",  //项目web.xml 内配置了 servlet
        data:"action=Login&d="+new Date()+"&id="+id+"&nickname="+nickname,
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


$(function(){
    $("#divMsg").ajaxStart(function(){
        $(this).show();
    })
    $("#divMsg").ajaxStop(function(){
        $(this).html("Success!").hide();
    })
    $("#Login").click(function(){
        var $id=$("#txtid");
        var $nickname=$("#txtnickname");

            UserEnter($id.val(),$nickname.val());
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
$(function() {

    InitFace();

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
    AutoUpdContent();
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
    AutoUpdContent();
}

//auto update member and message
function AutoUpdContent() {
    setTimeout(GetMessageList, 5000);
    setTimeout(GetOnLineList, 5000);
}

//send message
function SendContent(content) {
    $.ajax({
        type: "GET",
        url: "../chat",
        data: "action=SendContent&d=" + new Date() + "&content=" + content,
        success: function() {
            //alert(data);
            // if (data==1) {
                GetMessageList();
                $("#txtContent").val("");
          /*  }else {
                GetMessageList();
                alert("请先登录!");
                window.location.href="http://localhost:8082/LandingPage_war_exploded/pages/Chatroom.jsp";

            }*/
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

    $("table tr td img").click(function() { //image
        var strContent = $("#txtContent").val() + "<:" + this.id + ":>";
        $("#txtContent").val(strContent);

    })
});
$("#Button2").click(function() { //logout
    $.ajax({
        type: "POST",
        url: "chat",
        data: "action=Logout&d=" + new Date(),
        success: function(data) {
            if (data) {
                window.location.href="../pages/ChatList.jsp";
            }
            else {
                alert("Failure!");
                return false;
            }
        }
    });
})
