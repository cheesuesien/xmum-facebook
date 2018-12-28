package com.xmum.upvotedownvote;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpvoteDownvoteServlet")
public class UpvoteDownvoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postid = Integer.parseInt(request.getParameter("postid"));
        System.out.println(postid);
        String author = request.getParameter("user");
        String userlevel = request.getParameter("userlevel");
        boolean action = request.getParameter("action").equals("true");
        int totallikes = 0;
        int totalunlikes= 0;

        boolean id = UpvoteDownvoteDAO.validate(postid, author, userlevel, action);

        if(id){
            totallikes = UpvoteDownvoteDAO.likes(0, userlevel);
            totalunlikes = UpvoteDownvoteDAO.unlikes(0, userlevel);
        }

        response.setContentType("text/plain");
        response.getWriter().write(totallikes + "_" + totalunlikes);
    }
}

