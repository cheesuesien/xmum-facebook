package com.xmum.Login;

import com.xmum.Profile.ProfileBean;
import com.xmum.User.UserBean;
import com.xmum.User.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;

@WebServlet("/LoginController")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        System.out.println("LoginServlet: got id and password params");
        String submit_result;
        RequestDispatcher rd = request.getRequestDispatcher("pages/landingPage.jsp");

        LoginBean obj =  new LoginBean(id, password);
        boolean status = LoginDAO.validate(obj);

        if(status) {
            System.out.println("loginServlet: validate successful");
            ResultSet userResult = UserDAO.getUser(id);
            System.out.println("loginServlet: got user from db");
            try{
                if (userResult.next()){
                    UserBean thisUser = new UserBean( userResult.getString("id"), userResult.getString("nickname"), userResult.getString("level"), userResult.getString("profilepic") );
                    ProfileBean userProfile = new ProfileBean(id, userResult.getString("gender"), userResult.getString("phonenum"),
                            userResult.getString("email"), userResult.getString("intro"),
                            userResult.getObject("birthdate", LocalDate.class), userResult.getString("starsign"));
                    thisUser.setProfile(userProfile);
                    request.getSession(true).setAttribute("user", thisUser);
                    System.out.println("LoginServlet: set session user attribute");
                } else {
                    System.out.println("no user selected from db");
                }
            } catch (Exception e){
                System.out.println("get user failed");
                System.out.println(e);
            }

            Cookie loginCookie = new Cookie("user", id);
            //setting cookie to expiry in 10 mins
            loginCookie.setMaxAge(10*60);
            response.addCookie(loginCookie);
            response.sendRedirect(request.getContextPath() + "/post");
        }
        else {
            submit_result = "Sorry, id or password error";
            request.setAttribute("submit_result", submit_result);
            rd.forward(request,response);
        }
    }
}