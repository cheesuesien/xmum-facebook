package com.xmum.Status;
import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.*;

public class StatusDAO {
    static Connection conn;
    static PreparedStatement pst;

    public static int insertStatus(StatusBean u){
        int status=0;
        try{
            conn= ConnectionProvider.getCon();
            pst=conn.prepareStatement("insert into user_status_posts(username,user_status) values (?,?)");
            pst.setInt(1,123);
            pst.setString(2,u.getUser_status());
            status=pst.executeUpdate();
            conn.close();
        }catch(Exception e){
            System.out.println(e);
        }
        return status;
    }
}
