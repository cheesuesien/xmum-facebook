package com.xmum.Register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterController")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String register_result;
        RequestDispatcher rd = request.getRequestDispatcher("/pages/landingPage.jsp");

        RegisterBean obj =  new RegisterBean(username, password, password2);
        boolean id = RegisterDAO.validate(obj);
        if(id){
            int status = RegisterDAO.insertUser(obj);
            if(status>0)
                register_result = "Register Successfully";
            else {
                register_result = "Register Fail";
            }
        }
        else
            register_result = "Register Fail";

        request.setAttribute("register_result", register_result);
        rd.forward(request,response);

    }

}