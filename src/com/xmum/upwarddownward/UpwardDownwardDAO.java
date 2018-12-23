package com.xmum.upwarddownward;
import com.xmum.DatabaseConnection.ConnectionProvider;
import com.xmum.Post.PostBean;
import com.xmum.User.UserBean;

import java.sql.*;

public class UpwardDownwardDAO {

    static Connection conn;
    static PreparedStatement pst;

    public static boolean validate(int postid, String author, String userlevel, boolean action) {
        boolean id = false;
        try {
            conn = ConnectionProvider.getCon();
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select * from Votes where postid='postid' and ispinned = 'true' and voterid = 'author' and vote = 'action'");
                ResultSet rs = pst.executeQuery();
                if(rs.next()==true){
                    pst = conn.prepareStatement("update Votes set vote = 'action' where postid='postid'and ispinned = 'true' and voterid = 'author'");
                    /*if(vote=='true'){
                        pst = conn.prepareStatement("update PinnedPost set upvotes = upward+1 where postid='postid'");
                    }*/
                    id = true;
                    conn.close();
                }
                else{
                    pst = conn.prepareStatement("insert into Votes values postid='postid' and ispinned = 'true'and voterid = 'author' and vote = 'action'");
                    id = true;
                    conn.close();
                }
            }
            else{
                pst = conn.prepareStatement("select * from Votes where postid='postid' and ispinned = 'false' and voterid = 'author' and vote = 'action'");
                ResultSet rs = pst.executeQuery();
                if(rs.next()==true){
                    pst = conn.prepareStatement("update Votes set vote = 'action' where postid='postid' and ispinned = 'false' and voterid = 'author'");
                    id = true;
                    conn.close();
                }
                else{
                    pst = conn.prepareStatement("insert into Votes values postid='postid' and ispinned = 'false' and voterid = 'author' and vote = 'action'");
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
        try {
            conn = ConnectionProvider.getCon();
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select COUNT(*) FROM Votes WHERE postid= 'postid' and ispinned = 'true' and vote = 'true'");
                ResultSet rs=pst.executeQuery();
                return rs.getInt(1);
                conn.close();
            }
            else{
                pst = conn.prepareStatement("select COUNT(*) FROM Votes WHERE postid='postid' and ispinned = 'false' and vote = 'true'");
                ResultSet rs=pst.executeQuery();
                return rs.getInt(1);
                conn.close();
            }
        }
        catch (Exception ex) {
        }
    }

    public static int unlikes(int postid, String userlevel){
        try {
            conn = ConnectionProvider.getCon();
            if(userlevel.equals("admin")){
                pst = conn.prepareStatement("select COUNT(*) FROM Votes WHERE postid='postid' and ispinned = 'true' and vote = 'false'");
                ResultSet rs=pst.executeQuery();
                return rs.getInt(1);
                conn.close();
            }
            else{
                pst = conn.prepareStatement("select COUNT(*) FROM Votes WHERE postid='postid' and ispinned = 'false' and vote = 'false'");
                ResultSet rs=pst.executeQuery();
                return rs.getInt(1);
                conn.close();
            }
        }
        catch (Exception ex) {
        }
    }
}