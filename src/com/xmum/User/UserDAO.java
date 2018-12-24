package com.xmum.User;

import com.xmum.DatabaseConnection.ConnectionProvider;
import com.xmum.Profile.ProfileBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private static Connection conn;
    private static PreparedStatement pst;

    public static ResultSet getUser(UserBean u){
        return getUser(u.getId());
    }

    public static ResultSet getUser(String studentId){
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from users where id = ?");
            pst.setString(1, studentId);
            result = pst.executeQuery();
            conn.close();
        } catch(Exception e) {
            System.out.println("UserDAO: unsuccessful query");
            System.out.println(e);
        }
        return result;
    }

/*
    public static int updateUser(UserBean u){
        int status = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("update users set nickname = ?, level = ? where id = ?");
            pst.setString(1, u.getNickname());
            pst.setString(2, u.getLevel());
            pst.setString(3, u.getId());
            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println("update unsuccessful");
            System.out.println(e);
        }
        return status;
    }
*/

    public static int updateProfilePic(UserBean u){
        int status = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("update users set profilepic = ? where id = ?");
            pst.setString(1, u.getProfilePic());
            pst.setString(2, u.getId());
            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println("update profilePic unsuccessful");
            System.out.println(e);
        }
        return status;
    }

    public static int updateProfileDetails(UserBean u) {
        int status = 0;
        ProfileBean profile = u.getProfile();
        try {
            conn = ConnectionProvider.getCon();

            pst = conn.prepareStatement("update users set nickname = ? where id = ?");
            pst.setString(1, u.getNickname());
            pst.setString(2, u.getId());
            status = pst.executeUpdate();

            if (status > 0){
                pst = conn.prepareStatement("update profile set gender = ?, phonenum = ?, email = ?, intro = ?, birthdate = ?, starsign = ? where id = ?");
                pst.setString(1, profile.getGender());
                pst.setString(2, profile.getPhonenum());
                pst.setString(3, profile.getEmail());
                pst.setString(4, profile.getIntro());
                pst.setObject(5, profile.getBirthdate());
                pst.setString(6, profile.getStarsign());
                pst.setString(7, u.getId());
                status = pst.executeUpdate();
            } else {
                System.out.println("update nickname unsuccessful");
            }
            conn.close();
        } catch(Exception e) {
            System.out.println("update profileDetails unsuccessful");
            System.out.println(e);
        }
        return status;
    }


}
