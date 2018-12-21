package com.xmum.PasswordReset;

public class ResetBean {
    String username, password, newpassword, newpassword2;

    public ResetBean(String username, String password, String newpassword, String newpassword2){
        this.username = username;
        this.password = password;
        this.newpassword = newpassword;
        this.newpassword2 = newpassword2;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String email) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getNewpassword() {
        return newpassword;
    }
    public void setNewPassword(String newpassword) {
        this.newpassword = newpassword;
    }
    public String getNewpassword2() {
        return newpassword2;
    }
    public void setNewpassword2(String newpassword2) {
        this.password = newpassword2;
    }
}
