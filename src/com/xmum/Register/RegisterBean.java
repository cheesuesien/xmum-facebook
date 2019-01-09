package com.xmum.Register;

public class RegisterBean {
    String id, nickname, password, password2;


    public RegisterBean(String id, String nickname, String password, String password2){
        this.id = id;
        this.nickname = nickname;
        this.password = password;
        this.password2 = password2;
    }

    public String getId(){
        return id;
    }
    public void setId(String id){
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword2() {
        return password2;
    }
    public void setPassword2(String password2) {
        this.password2 = password2;
    }
}