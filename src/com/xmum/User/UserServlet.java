package com.xmum.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    //expects request attribute "id", sets "user" attribute in request.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String)(request.getAttribute("id"));
        System.out.println(id);
        ResultSet usersRs = UserDAO.getUser(id);
        UserBean user = null;
        try {
            if(usersRs.next()){
                String username = usersRs.getString("username");
                String intro = usersRs.getString("intro");
                String pfp = usersRs.getString("pfp");
                String level = usersRs.getString("level");
                user = new UserBean(id, username, intro, pfp, level);
            } else {
                System.out.println("UserServlet: no user returned");
            }

            System.out.println("/user inside try block.");

        } catch (Exception e){
            System.out.println("UserServlet: failed");
            System.out.println(e);
        }

        if (user != null)
            System.out.println("User is fine.");
        else
            System.out.println("User is null.");
        request.setAttribute("user", user);

    }
}
