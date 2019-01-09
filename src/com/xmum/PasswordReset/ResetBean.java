package com.xmum.PasswordReset;

public class ResetBean {
    String id, password, newpassword, newpassword2;

    public ResetBean(String id, String password, String newpassword, String newpassword2){
        this.id = id;
        this.password = password;
        this.newpassword = newpassword;
        this.newpassword2 = newpassword2;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
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
