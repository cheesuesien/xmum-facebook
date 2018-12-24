package com.xmum.User;

import com.xmum.Profile.ProfileBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/user")
@MultipartConfig(
        fileSizeThreshold=1024*1024*10, 	// 10 MB
        maxFileSize=1024*1024*50,      	// 50 MB
        maxRequestSize=1024*1024*100)
public class UserServlet extends HttpServlet {

    //expects request attribute "id", sets "user" attribute in request.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String)(request.getAttribute("id"));
        System.out.println(id);
        ResultSet usersRs = UserDAO.getUser(id);
        UserBean user = null;
        try {
            if(usersRs.next()){
                String nickname = usersRs.getString("nickname");
                String level = usersRs.getString("level");
                String profilePic = usersRs.getString("profilepic");
                user = new UserBean(id, nickname, level, profilePic);
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("userServlet doPut activated!");
        UserBean user = (UserBean)request.getSession().getAttribute("user");

        String uploadType = request.getParameter("uploadType");
        int status = 0;

        switch(uploadType){
            case "profilePic": {
                request.getRequestDispatcher("/uploadImage").include(request, response); //this will set the request attribute "picName"
                String picName = (String)request.getAttribute("picName");
                user.setProfilePic(picName);
                status = UserDAO.updateProfilePic(user);
                break;
            }
            case "profileDetails": {
                System.out.println("setting username and intro");
                user.setNickname(request.getParameter("username"));
                //convert String to LocalDate
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate birthdate = LocalDate.parse(request.getParameter("birthdate"), formatter);
                ProfileBean userProfile = new ProfileBean(user.getId(), request.getParameter("gender"), request.getParameter("phonenum"), request.getParameter("email"),
                        request.getParameter("intro"), birthdate, request.getParameter("starsign"));
                user.setProfile(userProfile);
                status = UserDAO.updateProfileDetails(user);
                break;
            }
        }

        if (status > 0){
            System.out.println("UserServlet: update user profilePic successful");
        } else {
            System.out.println("UserServlet: update user profilePic failed");
        }
        response.sendRedirect("/LandingPage_war_exploded/pages/accountPage.jsp");
    }
}
