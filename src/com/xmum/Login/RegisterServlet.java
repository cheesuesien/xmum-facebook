package com.xmum.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Controller")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String result;
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("pages/landingPage.jsp");

        if(password.equals(password2)){

            LoginBean obj =  new LoginBean(email, password, password2);
            int status = LoginDAO.insertUser(obj);
            if(status>0)
                result = "Inserted Successfully..";
            else {
                System.out.println("email");
                result = "Insertion Fail..";
            }
            request.setAttribute("result", result);
        }
        rd.forward(request,response);
    }
}