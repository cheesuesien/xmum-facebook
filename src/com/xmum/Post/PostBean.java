package com.xmum.Post;

import com.xmum.User.UserBean;

import java.time.LocalDateTime;

public class PostBean {
    private UserBean author;
    private String message;
    private LocalDateTime timeStamp;
    private String[] images;
    private static final int MAX_IMAGES = 20;

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

    public String[] getImages() {
        return images;
    }

    public void setImages(String[] images) {
        if(this.images != null){
            for (int i = this.images.length, j = 0; i<MAX_IMAGES; i++, j++){
                this.images[i] = images[j];
            }
        }
        else {
            this.images = new String[MAX_IMAGES];
            for (int i = 0; i< MAX_IMAGES; i++){
                this.images[i] = images[i];
            }
        }
        this.images = images;
    }

}
