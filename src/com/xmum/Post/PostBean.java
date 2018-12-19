package com.xmum.Post;

import com.xmum.User.UserBean;

import java.time.LocalDateTime;

public class PostBean {
    private UserBean author;
    private String message;
    private LocalDateTime timeStamp;

    public PostBean(){
        author = null;
        message = "";
        timeStamp = LocalDateTime.now();
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
}
