package com.xmum.Profile;

import java.time.LocalDate;

public class ProfileBean {
    private String userid;
    private String gender;
    private String phonenum;
    private String email;
    private String intro;
    private LocalDate birthdate;
    private String starsign;

    public ProfileBean(String userid, String gender, String phonenum, String email, String intro, LocalDate birthdate, String starsign) {
        this.userid = userid;
        this.gender = gender;
        this.phonenum = phonenum;
        this.email = email;
        this.intro = intro;
        this.birthdate = birthdate;
        this.starsign = starsign;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public String getStarsign() {
        return starsign;
    }

    public void setStarsign(String starsign) {
        this.starsign = starsign;
    }
}
