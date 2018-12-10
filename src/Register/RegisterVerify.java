package Register;

import DatabaseConnection.ConnectionProvider;

import java.sql.*;

public class RegisterVerify{

    static Connection conn;
    static PreparedStatement pst;

    public static int insertUser(RegisterBean u){
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