package com.xmum.User;

public class UserBean {
    private String id;
    private String username;
    private String intro;
    private String pfp;
    private String level;

    public UserBean(){
        this.id = "";
        this.username = "";
        this.intro = "";
        this.pfp = "";
        this.level = "";
    }


    public UserBean(String id, String username, String intro, String pfp, String level){
        this.id = id;
        this.username = username;
        this.intro = intro;
        this.pfp = pfp;
        this.level = level;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getPfp() {
        return pfp;
    }

    public void setPfp(String pfp) {
        this.pfp = pfp;
    }
}
