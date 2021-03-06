package com.xmum.upvotedownvote;
import com.xmum.DatabaseConnection.ConnectionProvider;
import java.sql.*;

public class UpvoteDownvoteGetDataDAO {
    private static Connection conn;
    private static PreparedStatement pst;
    public static int getlikedata(int postid, String userlevel) {
         int totallikes=0;
        try{
            System.out.println("before connecting");
            conn = ConnectionProvider.getCon();
            System.out.println("after connecting");
            System.out.println(userlevel);
            if(userlevel.equals("admin")){
                System.out.println(userlevel);
                pst = conn.prepareStatement("select COUNT(*) from votes where postid = ? and ispinned = true and vote = true");
                pst.setInt(1, postid);
                System.out.println("Before executeQuery for pinned post");
                ResultSet rs=pst.executeQuery();
                System.out.println("after executequery for pinned post");
                rs.next();
                System.out.println("going to next");
                totallikes = rs.getInt(1);
                conn.close();
            }
            else{
                System.out.println(userlevel);
                pst = conn.prepareStatement("select COUNT(*) from votes where postid = ? and ispinned = false and vote = true");
                System.out.println("preparing statement");
                pst.setInt(1,postid);
                System.out.println("Before executeQuery for normal post");
                ResultSet rs=pst.executeQuery();
                System.out.println("After executeQuery for normal post");
                rs.next();
                System.out.println("going to next");
                totallikes = rs.getInt(1);
                conn.close();
            }
            System.out.println("get data successful");
        }
        catch (Exception ex) {
            System.out.println("get like data fail");
        }
        return totallikes;
    }
    public static int getunlikedata(int postid, String userlevel) {
        int totalunlikes = 0;
        try{
            conn = ConnectionProvider.getCon();
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select COUNT(*) from votes where postid = ? and ispinned = true and vote = false");
                pst.setInt(1,postid);
                ResultSet rs=pst.executeQuery();
                rs.next();
                totalunlikes = rs.getInt(1);
                conn.close();
            }
            else{
                pst = conn.prepareStatement("select COUNT(*) from votes where postid = ? and ispinned = false and vote = false");
                pst.setInt(1,postid);
                ResultSet rs=pst.executeQuery();
                rs.next();
                totalunlikes = rs.getInt(1);
                conn.close();
            }
            System.out.println("get data successful");
        }
        catch (Exception ex) {
            System.out.println("get unlike data fail");
        }
        return totalunlikes;
    }
}
