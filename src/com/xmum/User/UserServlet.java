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
                String username = usersRs.getString("username");
                String intro = usersRs.getString("intro");
                String profilePic = usersRs.getString("profilePic");
                user = new UserBean(id, username, intro, profilePic);
            } else {
                System.out.println("no user returned");
            }


        } catch (Exception e){
            System.out.println("userServlet failed");
            System.out.println(e);
        }

        request.setAttribute("user", user);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("userServlet doPut activated!");
        UserBean user = (UserBean)request.getSession().getAttribute("user");
        System.out.println("userservlet: got session user");
        String picName = (String)request.getAttribute("picName");
        System.out.println("userServlet: got picName attrib");
        System.out.println(picName);
        if (picName != null){
            System.out.println("setting profilePic");
            user.setProfilePic(picName);
        } else {
            System.out.println("setting username and intro");

            user.setUsername(request.getParameter("username"));
            System.out.println("userServlet: got username form param");
            System.out.println(request);
            user.setIntro(request.getParameter("intro"));
            System.out.println("userServlet: got intro form param");
            System.out.println(request.getParameter("intro"));
        }
        int status = UserDAO.updateUser(user);
        if (status > 0){
            System.out.println("UserServlet: update user profilePic successful");
        } else {
            System.out.println("UserServlet: update user profilePic failed");
        }
        response.sendRedirect("/LandingPage_war_exploded/pages/accountPage.jsp");
    }
}
