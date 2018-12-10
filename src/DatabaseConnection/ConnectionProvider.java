package DatabaseConnection;

import java.sql.*;

public class ConnectionProvider implements Provider {
    static Connection con = null;
    public static Connection getCon(){
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
            System.out.println("Connection established");
        }catch(Exception ex) {
            System.out.println("Connection failed");
            System.out.println(ex);
        }
        return con;
    }
}