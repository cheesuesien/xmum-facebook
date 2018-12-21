package com.xmum.Post;

import com.xmum.User.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDateTime;

@WebServlet("/post")
public class PostServlet extends HttpServlet {
    // no request parameters needed
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("PostServlet: doGet activated!");
        ResultSet rs = PostDAO.getPosts();
        int pinned_count = PostDAO.getPinnedTotal();
        ResultSet ps = PostDAO.getPinnedPost(pinned_count);

        //SET POSTBEAN ARRAY CAPACITY TO THE NUMBER OF NORMAL POSTS + 1 (pinned post) AND INSERT POSTS FROM LAST INDEX
        //POST IN INDEX 0 IS PINNED POST
        //WHEN PRINTING POSTS, LOOP FROM INDEX 0 THUS PINNED POST WILL BE PRINTED FIRST
        PostBean[] postBeans = new PostBean[PostDAO.getTotal()+1];
        for(int i = postBeans.length-1; i >= 0; i--){
            try{
                String id;
                UserBean author;
                String userlevel;
                String message;
                LocalDateTime datetime;
                int postid;

                if(i != 0){
                    rs.next();

                    // setting id attribute
                    id = rs.getString("authorid");
                    request.setAttribute("id", id);
                    System.out.println("ID: ok");

                    //sends "id" given by request to userServlet to get "user" (author)
                    RequestDispatcher rd = request.getRequestDispatcher("/user");
                    rd.include(request,response);
                    author = (UserBean)(request.getAttribute("user"));
                    if (author == null)
                        System.out.println("Author is null.");
                    System.out.println("Author: OK");
                    userlevel = author.getLevel();
                    System.out.println(userlevel);
                    System.out.println("Level:OK");

                    // initialise postBean array
                    message = rs.getString("message");
                    System.out.println("Message: OK");
                    datetime = rs.getTimestamp("timestamp").toLocalDateTime();
                    System.out.println("Date: OK");
                    //postid = rs.getInt("postid");
                    postBeans[i] = new PostBean(author, message, datetime, userlevel);

                }else{
                    //PINNED POST WHEN INDEX == 0
                    ps.next();
                    datetime = ps.getTimestamp("timestamp").toLocalDateTime();
                    message = ps.getString("message");
                    System.out.println("Pinpost Message: OK");
                    System.out.println("Pinpost date: OK");
                    postBeans[i] = new PostBean(message, datetime, "admin");
                }


            }catch(Exception e){
//                System.out.println("PostServlet: problem initialising postBean array");
//                System.out.println(e);
                e.printStackTrace();
            }
        }



        // set "posts" session attribute"
        request.getSession().setAttribute("posts", postBeans);

        //redirect back to publicWall.jsp
        response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("postMessage");
        System.out.println("PostServlet: dopost activated");
        System.out.println(message);
        UserBean user = (UserBean)(request.getSession(false).getAttribute("user"));
        System.out.println(user);
        String userlevel = user.getLevel();
        PostBean post = new PostBean(user, message, LocalDateTime.now(), userlevel);
        System.out.println("PostServlet: create postbean successful");
        int status = PostDAO.insertPost(post);
        if (status > 0){
            System.out.println("PostServlet: insert post successful");
        } else {
            System.out.println("PostServlet: insert post failed");
        }
        //doGet(request, response);

        response.sendRedirect(request.getContextPath() + "/post");
    }
}
