package com.xmum;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private static Connection conn;
    private static PreparedStatement pst;

    public static ResultSet getUser(UserBean u){
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from users where username = ?");
            pst.setString(1, u.getUsername());
            result = pst.executeQuery();
            conn.close();
        } catch(Exception e) {
            System.out.println("unsuccessful query");
            System.out.println(e);
        }
        return result;
    }

    public static int updateUser(UserBean u){
        int status = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("update users set username = ?, intro = ? where id = ?");
            pst.setString(1, u.getUsername());
            pst.setString(2, u.getIntro());
            pst.setString(3, u.getId());
            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println("update unsuccessful");
            System.out.println(e);
        }
        return status;
    }
}