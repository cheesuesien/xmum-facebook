package com.xmum.Login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie: cookies) {
                if (cookie.getName().equals("user")) {
                    System.out.println("Clearing cookies..");
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }

        HttpSession currentSession = request.getSession(false);
        currentSession.removeAttribute("user");
        currentSession.invalidate();
        response.sendRedirect(request.getContextPath() + "/pages/landingPage.jsp");
    }
}
