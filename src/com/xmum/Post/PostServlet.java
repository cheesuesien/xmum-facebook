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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ResultSet rs = PostDAO.getPosts();
        PostBean[] postBeans = new PostBean[PostDAO.getTotal()];
        for(int i = 0; i< postBeans.length; i++){
            try{
                rs.next();

                // setting id attribute
                String id = rs.getString("authorid");
                request.setAttribute("id", id);

                //sends "id" given by request to userServlet to get "user" (author)
                RequestDispatcher rd = request.getRequestDispatcher("/user");
                rd.include(request,response);
                UserBean author = (UserBean)(request.getAttribute("user"));

                // initialise postBean array
                String message = rs.getString("message");
                LocalDateTime datetime = rs.getTimestamp("timestamp").toLocalDateTime();
                postBeans[i] = new PostBean(author, message, datetime);

            }catch(Exception e){
                System.out.println("problem initialising postBean array");
                System.out.println(e);
            }
        }


        // set "posts" session attribute"
        request.getSession().setAttribute("posts", postBeans);

        //redirect back to publicWall.jsp
        response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("postMessage");
        System.out.println("dopost in postservlet activated");
        System.out.println(message);
        UserBean user = (UserBean)(request.getSession(false).getAttribute("user"));
        System.out.println(user);
        System.out.println("get user from session successful");
        PostBean post = new PostBean(user, message, LocalDateTime.now());
        System.out.println("create postbean successful");
        int status = PostDAO.insertPost(post);
        if (status > 0){
            System.out.println("insert post successful");
        } else {
            System.out.println("insert post failed");
        }
        doGet(request, response);
    }
}
