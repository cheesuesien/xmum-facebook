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
        ResultSet usersRs = UserDAO.getUser(id);
        UserBean user = null;
        try {
            if(usersRs.next()){
                String nickname = usersRs.getString("nickname");
                String level = usersRs.getString("level");
                user = new UserBean(id, nickname, level);
            } else {
                System.out.println("no user returned");
            }


        } catch (Exception e){
            System.out.println("userServlet failed");
            System.out.println(e);
        }

        request.setAttribute("user", user);

    }
}
