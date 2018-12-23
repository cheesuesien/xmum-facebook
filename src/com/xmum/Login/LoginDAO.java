package com.xmum.Login;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.*;

public class LoginDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static boolean validate(LoginBean bean){
        boolean status=false;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select * from login where id=? and password=?");

            pst.setString(1,bean.getId());
            pst.setString(2,bean.getPassword());

            ResultSet rs=pst.executeQuery();
            status=rs.next();

        }catch(Exception ex){
            System.out.println("LoginDAO: validate failed");
            System.out.println(ex);
        }
        return status;
    }
}