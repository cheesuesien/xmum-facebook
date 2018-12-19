package com.xmum.PasswordReset;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.*;

public class ResetDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static boolean validate(ResetBean bean){
        boolean id=false;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from student where username=? and password=?");

            pst.setString(1,bean.getUsername());
            pst.setString(2,bean.getPassword());
            ResultSet rs=pst.executeQuery();
            id=rs.next();
            String username = rs.getString("username");
            String password = rs.getString("password");
            if(username != null && password != null)
                id = true;
            else
                id = false;
        }catch(Exception ex){}
        return id;
    }

    public static int ResetPassword(ResetBean bean){
        int status = 0;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("update student set password = ? where username = ?");
            pst.setString(1,bean.getPassword());
            pst.setString(2,bean.getUsername());
            status = pst.executeUpdate();
            System.out.println("reset succeeded");
            conn.close();
        }catch(Exception ex){
            System.out.println("reset failed");
            ex.printStackTrace();
        }
        return status;
    }
}
