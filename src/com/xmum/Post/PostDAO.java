package com.xmum.Post;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.*;
import java.time.LocalDateTime;


//NOTE: TWO SEPARATE TABLES FOR PINNED POSTS AND NORMAL POSTS

public class PostDAO {
    static Connection conn;
    private static PreparedStatement pst;
    public static int insertPost(PostBean u){
        int status = 0;

        try {
            conn = ConnectionProvider.getCon();
            String userlevel = u.getUserlevel();
            if(userlevel.equals("admin")){
                //ADMIN POSTS ARE ALWAYS PINNED POSTS
                pst = conn.prepareStatement("insert into pinnedposts (message,images,timestamp) values(?,?,?)");

                //pst.setInt(4, u.postid());
            }else{
                pst = conn.prepareStatement("insert into normalposts (message,images,timestamp,authorid) values(?,?,?,?)");
                pst.setString(4, u.getAuthorId());
            }
            pst.setString(1, u.getMessage());
            if(u.getImages() != null){
                Array sqlArray = conn.createArrayOf("VARCHAR", u.getImages());
                pst.setArray(2, sqlArray);
            } else {
                pst.setArray(2, null);
            }

            pst.setObject(3, LocalDateTime.now());

            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println("PostDAO: insert post failed");
            System.out.println(e);
        }
        return status;
    }

    //TO GET THE TOTAL NUMBER OF NORMAL POSTS
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
            System.out.println("PostDAO: get total failed");
            System.out.println(e);
        }
        return total;
    }

    //THIS TOTAL IS TO DETERMINE THE CURRENT PINNED POST ID (LATEST POST ID = TOTAL PINNED POSTS)
    public static int getPinnedTotal(){
        int total = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select count(*) from pinnedposts");

            ResultSet rs = pst.executeQuery();
            rs.next();
            total = rs.getInt(1);
            conn.close();
        } catch(Exception e){
            System.out.println("PostDAO: get pinned total failed");
            System.out.println(e);
        }
        return total;
    }

    //ONLY FOR PINNED POSTS : ONLY GETTING THE LATEST POST
    public static ResultSet getPinnedPost(int count){
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from pinnedposts where postid = ?");
            pst.setInt(1, count);
            result = pst.executeQuery();
            System.out.println("PostDAO: getting pinned post");
        } catch(Exception e) {
            System.out.println("PostDAO: unsuccessful query");
            System.out.println(e);
        }
        return result;
    }

    //ONLY FOR NORMAL POSTS
    public static ResultSet getPosts(){
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from normalposts");
            result = pst.executeQuery();

            System.out.println("PostDAO: getting posts");
        } catch(Exception e) {
            System.out.println("PostDAO: unsuccessful query");
            System.out.println(e);
        }
        return result;
    }

    //TO KNOW THE TOTAL COUNT OF POSTS OF A PARTICULAR USER
    public static int getUserPostTotal(String userid){
        int total = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select count(*) from normalposts where authorid = ?");
            pst.setString(1, userid);
            ResultSet rs = pst.executeQuery();
            rs.next();
            total = rs.getInt(1);
            conn.close();
        } catch(Exception e){
            System.out.println("PostDAO: get user post total failed");
            System.out.println(e);
        }
        return total;
    }

    //TO RETRIEVE POSTS FROM ONE USER ONLY
    public static ResultSet getUserPost(String userid) {
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from normalposts where authorid = ?");
            pst.setString(1, userid);
            result = pst.executeQuery();
            System.out.println("PostDAO: getting posts written by " + userid);
        } catch (Exception e) {
            System.out.println("PostDAO: getUserPost unsuccessful");
            System.out.println(e);
        }
        return result;
    }

    public static void closeConn() throws SQLException {
        System.out.println("closed connection");
        conn.close();
    }
}
