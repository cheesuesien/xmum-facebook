package com.xmum.User;

import com.xmum.Profile.ProfileBean;

public class UserBean {
    private String id;
    private String nickname;
    private String level;
    private String profilePic;
    private ProfileBean profile;

    public UserBean(){
        this.id = "";
        this.nickname = "";
        this.level = "";
        this.profilePic = "";
    }

    public UserBean(String id, String nickname, String profilePic){
        this.id = id;
        this.nickname = nickname;
        this.profilePic = profilePic;
    }

    public UserBean(String id, String nickname, String level, String profilePic){
        this.id = id;
        this.nickname = nickname;
        this.level = level;
        this.profilePic = profilePic;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public ProfileBean getProfile() {
        return profile;
    }

    public void setProfile(ProfileBean profile) {
        this.profile = profile;
    }
}
