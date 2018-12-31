package com.xmum.upvotedownvote;
import com.xmum.DatabaseConnection.ConnectionProvider;
import java.sql.*;

public class UpvoteDownvoteDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static boolean validate(int postid, String author, String userlevel, boolean action) {
        boolean id = false;
        System.out.println(postid);
        System.out.println(author);
        System.out.println(userlevel);
        System.out.println(action);

        try {
            conn = ConnectionProvider.getCon();
            System.out.println("UpvoteDownvoteDAO validate called");
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select * from votes where postid=? and ispinned = true and voterid = ?");
                pst.setInt(1,postid);
                pst.setString(2,author);
                ResultSet rs = pst.executeQuery();
                if(rs.next()){
                    pst = conn.prepareStatement("select vote from votes where postid=? and ispinned = true and voterid = ?");
                    pst.setInt(1,postid);
                    pst.setString(2,author);
                    ResultSet rs2 = pst.executeQuery();
                    rs2.next();
                    boolean vote = rs2.getBoolean("vote");
                    if(vote == action){
                        pst = conn.prepareStatement("delete from votes where vote = ? and postid = ? and ispinned = true and voterid = ?");
                        pst.setBoolean(1,action);
                        pst.setInt(2,postid);
                        pst.setString(3,author);
                        pst.executeUpdate();
                        id = true;
                        conn.close();
                    }
                    else{
                        pst = conn.prepareStatement("update votes set vote = ? where postid = ? and ispinned = true and voterid = ?");
                        pst.setBoolean(1,action);
                        pst.setInt(2,postid);
                        pst.setString(3,author);
                        pst.executeUpdate();
                        id = true;
                        conn.close();
                    }
                }
                else{
                    System.out.println("Inserting vote...");
                    pst = conn.prepareStatement("insert into votes values(?, ?, ?, ?)");
                    pst.setInt(1,postid);
                    pst.setBoolean(2, true);
                    pst.setString(3,author);
                    pst.setBoolean(4,action);
                    pst.executeUpdate();
                    id = true;
                    conn.close();
                }
            }
            else{
                pst = conn.prepareStatement("select * from votes where postid = ? and ispinned = false and voterid = ?");
                pst.setInt(1,postid);
                pst.setString(2,author);
                ResultSet rs = pst.executeQuery();
                if(rs.next()){
                    pst = conn.prepareStatement("select vote from votes where postid=? and ispinned = false and voterid = ?");
                    pst.setInt(1,postid);
                    pst.setString(2,author);
                    ResultSet rs2 = pst.executeQuery();
                    rs2.next();
                    boolean vote = rs2.getBoolean("vote");
                    if(vote == action){
                        pst = conn.prepareStatement("delete from votes where vote = ? and postid = ? and ispinned = false and voterid = ?");
                        pst.setBoolean(1,action);
                        pst.setInt(2,postid);
                        pst.setString(3,author);
                        pst.executeUpdate();
                        id = true;
                        conn.close();
                    }
                    else {
                        pst = conn.prepareStatement("update votes set vote = ? where postid = ? and ispinned = false and voterid = ?");
                        pst.setBoolean(1, action);
                        pst.setInt(2, postid);
                        pst.setString(3, author);
                        pst.executeUpdate();
                        id = true;
                        conn.close();
                    }
                }
                else{
                    System.out.println("Inserting vote...");
                    pst = conn.prepareStatement("insert into votes values(?, ?, ?, ?)");
                    pst.setInt(1,postid);
                    pst.setBoolean(2, false);
                    pst.setString(3,author);
                    pst.setBoolean(4,action);
                    pst.executeUpdate();
                    id = true;
                    conn.close();
                }
            }
        }
        catch (Exception ex) {
        }
        return id;
    }

    public static int likes(int postid, String userlevel){
        System.out.println("UpvoteDownvoteDAO likes called");
        System.out.println(postid);
        System.out.println(userlevel);
        try {
            conn = ConnectionProvider.getCon();
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select COUNT(*) FROM votes WHERE postid= ? and ispinned = true and vote = true;");
                pst.setInt(1,postid);
                ResultSet rs=pst.executeQuery();
                if(rs.next())
                    return rs.getInt(1);
                conn.close();
            }
            else{
                pst = conn.prepareStatement("select COUNT(*) FROM votes WHERE postid = ? and ispinned = false and vote = true;");
                pst.setInt(1,postid);
                ResultSet rs=pst.executeQuery();
                if (rs.next())
                    return rs.getInt(1);
                conn.close();
            }
        }
        catch (Exception ex) {
            System.out.println("UpvoteDownvoteDAO: can't get likes");
        }
        return 0;
    }

    public static int unlikes(int postid, String userlevel){
        System.out.println("UpvoteDownvoteDAO unlikes called");
        try {
            conn = ConnectionProvider.getCon();
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select COUNT(*) FROM votes WHERE postid = ? and ispinned = true and vote = false;");
                pst.setInt(1,postid);
                ResultSet rs=pst.executeQuery();
                if (rs.next())
                    return rs.getInt(1);
                conn.close();
            }
            else{
                pst = conn.prepareStatement("select COUNT(*) FROM votes WHERE postid = ? and ispinned = false and vote = false;");
                pst.setInt(1,postid);
                ResultSet rs=pst.executeQuery();
                if (rs.next())
                    return rs.getInt(1);
                conn.close();
            }
        }
        catch (Exception ex) {
            System.out.println("UpvoteDownvoteDAO: can't get unlikes");
        }
        return 0;
    }
}