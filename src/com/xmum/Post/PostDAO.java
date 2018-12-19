package com.xmum.Post;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

public class PostDAO {
    static Connection conn;
    private static PreparedStatement pst;
    public static int insertPost(PostBean u){
        int status = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("insert into normalposts(authorid, message, timestamp) values(?,?,?)");
            pst.setString(1, u.getAuthorId());
            pst.setString(2, u.getMessage());
            pst.setObject(3, LocalDateTime.now());
            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println("insertpost failed");
            System.out.println(e);
        }
        return status;
    }

    public static int getTotal(){
        int total = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select count(*) from normalposts");
            ResultSet rs = pst.executeQuery();
            rs.next();
            total = rs.getInt(1);
            conn.close();
        } catch(Exception e){
            System.out.println("get total failed");
            System.out.println(e);
        }
        return total;
    }

    public static ResultSet getPosts(){
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from normalposts");
            result = pst.executeQuery();
            System.out.println("getting posts");
            conn.close();
        } catch(Exception e) {
            System.out.println("unsuccessful query");
            System.out.println(e);
        }
        return result;
    }
}
