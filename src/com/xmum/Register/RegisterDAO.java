package com.xmum.Register;

import com.xmum.DatabaseConnection.ConnectionProvider;

import java.sql.*;

public class RegisterDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static boolean validate(RegisterBean bean){
        boolean id=false;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("select password from student where username=?");

            pst.setString(1,bean.getUsername());

            ResultSet rs=pst.executeQuery();
            id=rs.next();
            String password = rs.getString("password");
            if(password == null)
                id = true;
            else
                id = false;
        }catch(Exception ex){}
        return id;
    }

    public static int insertUser(RegisterBean bean){
        int status = 0;
        try{
            conn = ConnectionProvider.getCon();
            pst = conn.prepareStatement("update student set password = ? where username = ?");
            pst.setString(1,bean.getPassword());
            pst.setString(2,bean.getUsername());
            status = pst.executeUpdate();
            System.out.println("register succeeded");
            conn.close();
        }catch(Exception ex){
            System.out.println("register failed");
            ex.printStackTrace();
        }
        return status;
    }
}