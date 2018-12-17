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
            pst = conn.prepareStatement("select * from student where username=? and password=?");

            pst.setString(1,bean.getUsername());
            pst.setString(2,bean.getPassword());

            ResultSet rs=pst.executeQuery();
            status=rs.next();

        }catch(Exception ex){}
        return status;
    }
}