var pg = require('pg');
var connectionString = "postgres://userName:password@serverName/ip:port/nameOfDatabase";
var pgClient = new pg.Client(connectionString);
pgClient.connect();
session.getAttribute("id");
session.getAttribute("postid");
function like()
{
    var query = pgClient.query("SELECT * from Votes where postid = 'postid', id = 'id'");
    query.on("end", function(result){

        if(result.rows[0] === undefined){
            var query = pgClient.query("INSERT INTO Votes set likes = 'true' where postid = 'postid', id = 'id'");
            pgClient.query(query);
        }
        else{
            var query = pgClient.query("DELETE FROM Votes where postid = 'postid', id = 'id'");
            pgClient.query(query);
        }
        pgClient.end();
    });
}

function unlike()
{
    var query = pgClient.query("SELECT * from Votes where postid = 'postid', id = 'id'");
    query.on("end", function(result){

        if(result.rows[0] === undefined){
            var query = pgClient.query("INSERT INTO Votes set likes = 'false' where postid = 'postid', id = 'id'");
            pgClient.query(query);
        }
        else{
            var query = pgClient.query("DELETE FROM Votes where postid = 'postid', id = 'id'");
            pgClient.query(query);
        }
        pgClient.end();
    });
}

$(document).ready(function(){
    /*when like button is clicked*/
    $("#like-btn").on('click', function(){
        /*show the ajax loader*/
        //$('#message').html("<img src='loader.gif'>");

        /*send data to the like_unlike.php*/
        $.post("like_unlike.php", {"likes":"likes"}, function(response){
            /*parse response into json*/
            var json = $.parseJSON(response);

            /*update message & like_counter*/
            $("#message").html(json.total);
            $("#likes").css("width", json.likes);
            $('#unlikes').css("width", json.unlikes);
        });
    });

    /*when unlike button is clicked*/
    $("#unlike-btn").on("click", function(){
        /*show the ajax loader*/
        //$('#message').html("<img src='loader.gif'>");

        /*send data to the like_unlike.php*/
        $.post("like_unlike.php", {"unlikes":"unlikes"}, function(response){
            /*parse response into json*/
            var json = $.parseJSON(response);

            /*update message & like_counter*/
            $("#message").html(json.total);
            $("#likes").css("width", json.likes);
            $('#unlikes').css("width", json.unlikes);
        });
    });
});

});
