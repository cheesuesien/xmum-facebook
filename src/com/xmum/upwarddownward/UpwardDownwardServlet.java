package com.xmum.upwarddownward;

import com.xmum.Post.PostBean;
import com.xmum.User.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpwardDownwardServlet")
public class UpwardDownwardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postid = (int)request.getAttribute("postid");
        String author = (String)request.getAttribute("user");
        String userlevel = (String)request.getAttribute("userlevel");
        boolean action = (boolean)request.getAttribute("action");
        int totallikes;
        int totalunlikes;
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/upward&downward.js");

        boolean id = UpwardDownwardDAO.validate(postid, author, userlevel, action);

        if(id){
            totallikes = UpwardDownwardDAO.likes(postid, userlevel);
            totalunlikes = UpwardDownwardDAO.unlikes(postid, userlevel);
        }
        request.setAttribute("likes", totallikes);
        request.setAttribute("unlikes", totalunlikes);
        rd.forward(request,response);
    }
}

