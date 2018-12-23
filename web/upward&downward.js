$(document).ready(function(){
    /*when like button is clicked*/
    $("#like-btn").on('click', function(){
        /*show the ajax loader*/
        //$('#message').html("<img src='loader.gif'>");

        /*send data to the like_unlike.php*/
        $.post("${pageContext.request.contextPath}/UpwardDownwardServlet", {"action":"true", "postid":"postid", "user":"user", "userlevel":"userlevel"}, function(response){
            /*parse response into json*/
            var json = $.parseJSON(response);
            var likes = data['likes'];

            /*update message*/
            $("#likes"+${post.postid()}).text(likes);        // setting likes
        });
    });

    /*when unlike button is clicked*/
    $("#unlike-btn").on("click", function(){
        /*show the ajax loader*/
        //$('#message').html("<img src='loader.gif'>");

        /*send data to the like_unlike.php*/
        $.post("${pageContext.request.contextPath}/UpwardDownwardServlet", {"action":"false", "postid":"postid", "user":"user", "userlevel":"userlevel"}, function(response){
            /*parse response into json*/
            var json = $.parseJSON(response);
            var unlikes = data['unlikes'];

            /*update message*/
            $("#unlikes"+postid).text(unlikes);    // setting unlikes
        });
    });
});

