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
            pst = conn.prepareStatement("insert into posts values(?,?,?,?)");
            pst.setString(1, u.getAuthorId());
            pst.setString(2, u.getMessage());
            pst.setObject(3, LocalDateTime.now());
            pst.setBoolean(4, u.isPinned());
            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static ResultSet getPosts(){
        ResultSet result = null;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from posts");
            result = pst.executeQuery();
            conn.close();
        } catch(Exception e) {
            System.out.println("unsuccessful query");
            System.out.println(e);
        }
        return result;
    }
}
