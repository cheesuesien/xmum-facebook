package com.xmum.Post;

import com.xmum.User.UserBean;
import com.xmum.User.UserDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

//THIS SERVLET WILL REDIRECT TO "/UserTimeline.jsp"
@WebServlet("/timeline")
public class UserTimelineServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        System.out.println("UserTimelineServlet: doGet activated");
        String userid = request.getParameter("id");
        ResultSet rs = PostDAO.getUserPost(userid);
        ResultSet userRs = UserDAO.getUserMinimum(userid);
        UserBean author = null;
        try {
            userRs.next();
            author = new UserBean(userRs.getString("id"), userRs.getString("nickname"), userRs.getString("profilepic"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PostBean[] postBeans = new PostBean[PostDAO.getUserPostTotal(userid)];

        for(int i = postBeans.length-1; i >= 0; i--){
            try{
                String userlevel;
                String message;
                LocalDateTime datetime;
                String[] images;
                rs.next();

                //sends "id" given by request to userServlet to get "user" (author)
//                if (author == null)
//                    System.out.println("Author is null.");
                System.out.println("Author: OK");
                userlevel = author.getLevel();
                System.out.println(userlevel);
                System.out.println("Level:OK");

                // initialise postBean array
                message = rs.getString("message");
                System.out.println("Message: OK");
                datetime = rs.getTimestamp("timestamp").toLocalDateTime();
                System.out.println("Date: OK");

                Array a = rs.getArray("images");
                System.out.println("got SQL array");
                System.out.println(a);

                if (a != null){
                    images = (String[])a.getArray();
                    System.out.println("got JAVA object array");
                    System.out.println("images: OK");
                }
                else {
                    images = null;
                }
                PostDAO.closeConn();
                //postid = rs.getInt("postid");
                postBeans[i] = new PostBean(author, message, images, datetime, userlevel);

            }catch(Exception e){
                System.out.println("UserTimelineServlet: PostBean array error.");
                System.out.println(e);
            }
        }

        // set "posts" session attribute"
        request.getSession().setAttribute("posts", postBeans);

        //redirect back to publicWall.jsp
        try {
            response.sendRedirect(request.getContextPath() + "/pages/UserTimeline.jsp");
        } catch (Exception e) {
            System.out.println("UserTimelineServlet: Redirect fail");
            System.out.println(e);
        }

    }
}
