package com.xmum.DatabaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

    /*public static Connection getCon() throws URISyntaxException, SQLException, ClassNotFoundException {
        URI dbUri = new URI("postgres://ryocrjutucgrrm:ce2e40fbb610fe0efc99daff606182ad5c8c467ce82d6d4044006d8aec769f02@ec2-54-225-196-122.compute-1.amazonaws.com:5432/ddb0ip22plbl8j");
        String USERNAME = dbUri.getUserInfo().split(":")[0];
        String PASSWORD = dbUri.getUserInfo().split(":")[1];
        String CONNECTION_URL = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath();
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
        return conn;
    }*/

    public static Connection getCon() throws SQLException, ClassNotFoundException {
        String USERNAME = "postgres";
        String PASSWORD = "makisa123";
        String CONNECTION_URL = "jdbc:postgresql://localhost:5432/xmum-facebook-db";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
        return conn;
    }

   /* public static Connection getCon() throws URISyntaxException, SQLException, ClassNotFoundException {
        String USERNAME = "postgres";
        String PASSWORD = "swe1609661";
        String CONNECTION_URL = "jdbc:postgresql://localhost:5432/postgres";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
        return conn;
    }*/
}