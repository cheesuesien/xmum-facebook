package com.xmum.Login;

public class LoginBean {
    String email, password, password2;


    public LoginBean(String email, String password, String password2){
        this.email = email;
        this.password = password;
        this.password2 = password2;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
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