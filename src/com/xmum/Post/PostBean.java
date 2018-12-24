package com.xmum.Post;

import com.xmum.User.UserBean;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PostBean {

    //NOTE: POST ID IS NEEDED TO STORE DATA FETCHED FROM DATABASE. POST ID IS AUTO INCREMENTED IN DATABASE.
    private UserBean author;
    private String message;
    private LocalDateTime timeStamp;
    private String[] images;
    private int totalImages;
    private static final int MAX_IMAGES = 20;
    private String userlevel;
    private int postid;

    public PostBean(){
        author = null;
        message = "";
        timeStamp = LocalDateTime.now();
        images = null;
        totalImages = 0;
        userlevel = "";
        postid = 0;
    }

    public PostBean(UserBean author, String message, String[] images, LocalDateTime datetime, String userlevel){
        this.author = author;
        this.message = message;
        this.images = images;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
    }

    public PostBean(UserBean author, String message, LocalDateTime datetime, String userlevel){
        this.author = author;
        this.message = message;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
    }

    public PostBean(UserBean author, String message, String[] images, LocalDateTime datetime, String userlevel, int postid){
        this.author = author;
        this.message = message;
        this.images = images;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
        this.postid = postid;
    }

    public PostBean(String message, LocalDateTime datetime, String userlevel){
        this.message = message;
        this.timeStamp = datetime;
        this.userlevel = userlevel;
    }

    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E dd MMM yyyy HH:mm");
        String formatDateTime = this.timeStamp.format(formatter);
        return formatDateTime;
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
            for (int i = this.totalImages, j = 0; i<MAX_IMAGES; i++, j++){
                this.images[i] = images[j];
                this.totalImages++;
            }
        }
        else {
            this.images = new String[images.length];
            for (int i = 0; i<images.length; i++){
                this.images[i] = images[i];
                this.totalImages++;
            }
            //this.images = images;
        }
    }
    public int postid() { return postid; }

    public String getUserlevel() {
        return userlevel;
    }

    public void setUserlevel(String userlevel) {
        this.userlevel = userlevel;
    }

}
