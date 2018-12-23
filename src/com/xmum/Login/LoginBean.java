package com.xmum.Login;

public class LoginBean {
    String id, password;

    public LoginBean(String id, String password){
        this.id = id;
        this.password = password;
    }
    public String getId() {
        return id;
    }
    public void setId(String email) {
        this.id = id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
