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
            pst = conn.prepareStatement("select nickname from users where id=?");

            pst.setString(1,bean.getId());

            ResultSet rs=pst.executeQuery();

            id=rs.next(); // id = true (can register) if user exists in database
            String nickname = rs.getString("nickname");
            if(nickname == null) // id = true (can register) if user has no nickname yet (hasn't registered).
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
            pst = conn.prepareStatement("update users set nickname = ?, level = 'student', profilepic = 'logo.jpg' where id = ?;");
            pst.setString(1,bean.getNickname());
            pst.setString(2,bean.getId());
            status = pst.executeUpdate();
            if (status < 0){
                System.out.println("can't update users");
            }

            pst = conn.prepareStatement("insert into login(id, password) values(?,?);");
            pst.setString(1, bean.getId());
            pst.setString(2, bean.getPassword());
            status = pst.executeUpdate();
            if (status < 0){
                System.out.println("can't insert into login");
            }

            pst = conn.prepareStatement("insert into profile(id) values(?);");
            pst.setString(1, bean.getId());
            status = pst.executeUpdate();
            if (status<0){
                System.out.println("can't create a profile for the user");
            }
            else {
                System.out.println("register succeeded");
            }
            conn.close();
        }catch(Exception ex){
            System.out.println("register failed");
            ex.printStackTrace();
        }
        return status;
    }
}