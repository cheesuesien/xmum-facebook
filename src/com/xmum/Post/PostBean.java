package com.xmum.Post;

import com.xmum.User.UserBean;

import java.time.LocalDateTime;

public class PostBean {

    //NOTE: POST ID IS NEEDED TO STORE DATA FETCHED FROM DATABASE. POST ID IS AUTO INCREMENTED IN DATABASE.
    private UserBean author;
    private String message;
    private LocalDateTime timeStamp;
    private String userlevel;
    private int postid;

    public PostBean(){
        author = null;
        message = "";
        timeStamp = LocalDateTime.now();
        userlevel = "";
        postid = 0;
    }

    public PostBean(UserBean author, String message, LocalDateTime datetime, String userlevel){
        this.author = author;
        this.message = message;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
    }

    public PostBean(UserBean author, String message, LocalDateTime datetime, String userlevel, int postid){
        this.author = author;
        this.message = message;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
        this.postid = postid;
    }

    public PostBean(UserBean author, String message, LocalDateTime datetime){
        this.author = author;
        this.message = message;
        this.timeStamp = datetime;
    }

    public String getAuthorId(){
        return author.getId();
    }
    public UserBean getAuthor() {
        return author;
    }

    public void setAuthor(UserBean author) {
        this.author = author;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getTimeStamp() { return timeStamp; }

    public int postid() { return postid; }

    public String getUserlevel() {
        return userlevel;
    }

    public void setUserlevel(String userlevel) {
        this.userlevel = userlevel;
    }
//public void setPinned(boolean pinned) { this.pinned = pinned; }

}
