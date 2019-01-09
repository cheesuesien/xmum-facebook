package com.xmum.PasswordReset;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.*;

public class ResetDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static boolean validate(ResetBean bean){
        boolean result=false;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from login where id=? and password=?");

            pst.setString(1,bean.getId());
            pst.setString(2,bean.getPassword());
            ResultSet rs=pst.executeQuery();
            result=rs.next();
            String id = rs.getString("id");
            String password = rs.getString("password");
            if(id != null && password != null)
                result = true;
            else
                result = false;
        }catch(Exception ex){}
        return result;
    }

    public static int ResetPassword(ResetBean bean){
        int status = 0;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("update login set password = ? where id = ?");
            pst.setString(1,bean.getNewpassword());
            pst.setString(2,bean.getId());
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
