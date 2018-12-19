package com.xmum.User;

import com.xmum.DatabaseConnection.ConnectionProvider;

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
            System.out.println("unsuccessful query");
            System.out.println(e);
        }
        return result;
    }

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



}
