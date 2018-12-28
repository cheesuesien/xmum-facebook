$(document).ready(function(){

    // like and unlike click
    $(".like, .unlike").click(function(){
        var id = this.id; //Getting Button id
        var split_id = id.split("_"); //split out id with "_" to get "like" and "postid" and "userid" from "like_postid_userid"

        var text = split_id[0];
        var postid = split_id[1]; //postid
        var userid = split_id[2]; //userid
        var userlevel = split_id[3]; //post userlevel

        // Finding click type
        var type;
        if(text === "like"){
            type = "true";
        }else{
            type = "false";
        }

        //AJAX Request
        $.ajax({
            type: 'post',
            url: rootPath + '/UpvoteDownvoteServlet',
            data: {
                action:type,
                postid:postid,
                user:userid,
                userlevel:userlevel
            },
            success: function(data){
                data = data.split("_");
                var likes = data[0];
                var unlikes = data[1];

                $("#likes_" + postid + "_" +  userid + "_" + userlevel).html(likes);        // setting likes
                $("#unlikes_" + postid + "_" + userid + "_" + userlevel).html(unlikes);     // setting unlikes
            }
        });

    });
});

