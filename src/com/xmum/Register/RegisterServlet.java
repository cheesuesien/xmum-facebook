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
        String id = request.getParameter("id").toLowerCase();
        id = id.replaceAll("[\'\"]", "");
        String nickname = request.getParameter("nickname");
        nickname = nickname.replaceAll("[\'\"]", "");
        String password = request.getParameter("password");
        password = password.replaceAll("[\'\"]", "");
        String password2 = request.getParameter("password2");
        password2 = password2.replaceAll("[\'\"]", "");
        String register_result;
        RequestDispatcher rd = request.getRequestDispatcher("/pages/landingPage.jsp");

        RegisterBean obj =  new RegisterBean(id, nickname, password, password2);
        boolean result = RegisterDAO.validate(obj);
        if(result){
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