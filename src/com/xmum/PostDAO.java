package com.xmum;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PostDAO {
    static Connection conn;
    private static PreparedStatement pst;

    public static int insertPost(PostBean u){
        int status = 0;
        try {
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("insert into posts values(?,?)");
            pst.setString(1, u.getAuthor());
            pst.setString(2, u.getMessage());
            status = pst.executeUpdate();
            conn.close();
        } catch(Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
