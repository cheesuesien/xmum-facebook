package com.xmum.Post;

import com.xmum.User.UserBean;

import java.time.LocalDateTime;

public class PostBean {

    //NOTE: POST ID IS NEEDED TO STORE DATA FETCHED FROM DATABASE. POST ID IS AUTO INCREMENTED IN DATABASE.
    private UserBean author;
    private String message;
    private LocalDateTime timeStamp;
    private String[] images;
    private static final int MAX_IMAGES = 20;
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

    public PostBean(String message, LocalDateTime datetime, String userlevel){
        this.message = message;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
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
    public int postid() { return postid; }

    public String getUserlevel() {
        return userlevel;
    }

    public void setUserlevel(String userlevel) {
        this.userlevel = userlevel;
    }

}
