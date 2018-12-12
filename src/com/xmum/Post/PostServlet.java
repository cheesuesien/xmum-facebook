package com.xmum.Post;

import com.xmum.User.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/post")
public class PostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("postMessage");
        System.out.println(message);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("postMessage");
        System.out.println(message);
        UserBean user = (UserBean)(request.getSession(false).getAttribute("user"));
        System.out.println("get user from session successful");
        PostBean post = new PostBean(user, message, false);
        System.out.println("create postbean successful");
        int status = PostDAO.insertPost(post);
        if (status > 0){
            System.out.println("insert post successful");
        } else {
            System.out.println("insert post failed");
        }
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("pages/publicWall.jsp");
    }
}
