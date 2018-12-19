package com.xmum.User;

public class UserBean {
    private String id;
    private String username;
    private String intro;

    public UserBean(){
        this.id = "";
        this.username = "";
        this.intro = "";
    }
    public UserBean(String id, String username, String intro){
        this.id = id;
        this.username = username;
        this.intro = intro;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}
