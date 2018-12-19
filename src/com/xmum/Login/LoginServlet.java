package com.xmum.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginController")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String submit_result;
        RequestDispatcher rd = request.getRequestDispatcher("pages/landingPage.jsp");

        LoginBean obj =  new LoginBean(username, password);
        boolean status = LoginDAO.validate(obj);

        if(status) {
            //request.getSession(true).setAttribute("username", username);
            request.getSession(true).setAttribute("user", userobject);
            Cookie loginCookie = new Cookie("user", username);
            //setting cookie to expiry in 10 mins
            loginCookie.setMaxAge(10*60);
            response.addCookie(loginCookie);
            response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
        }
        else {
            submit_result = "Sorry, username or password error";
            request.setAttribute("submit_result", submit_result);
            rd.forward(request,response);
        }
    }
}