package web.includes.Login;

import java.sql.*;
public class LoginVerify {

    public static boolean validate(LoginBean u){
        boolean status=false;
        try{
            Connection con = web.includes.ConnectionProvider.getCon();

            PreparedStatement ps=con.prepareStatement("select * from xmum_user where email=? and password=?");

            ps.setString(1,u.getEmail());
            ps.setString(2,u.getPassword());

            ResultSet rs=ps.executeQuery();
            status=rs.next();

        }catch(Exception ex){}
        return status;
    }
}
