package com.xmum.Post;

import com.xmum.User.UserBean;

import java.time.LocalDateTime;

public class PostBean {
    private UserBean author;
    private String message;
    private LocalDateTime timeStamp;
    private boolean pinned;

    public PostBean(){
        author = null;
        message = "";
        timeStamp = LocalDateTime.now();
        pinned = false;
    }

    public PostBean(UserBean author, String message, boolean pinned){
        System.out.println("postbean constructor start");
        this.author = author;
        this.message = message;
        this.timeStamp = LocalDateTime.now();
        this.pinned = pinned;
        System.out.println("postbean constructor end");
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

    public boolean isPinned() { return pinned; }

    public void setPinned(boolean pinned) { this.pinned = pinned; }
}
