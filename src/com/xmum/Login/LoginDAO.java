package com.xmum.Login;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class LoginDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static int insertUser(LoginBean u){
        int status = 0;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("insert into xmum_user values(?,?)");
            System.out.println(u.getEmail());
            pst.setString(1,u.getEmail());
            pst.setString(2,u.getPassword());
            status = pst.executeUpdate();
            conn.close();
        }catch(Exception ex){

        }
        return status;
    }
}