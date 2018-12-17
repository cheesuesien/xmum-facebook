package com.xmum.PasswordReset;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ResetPassword")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        String newpassword2 = request.getParameter("newpassword2");
        String reset_result;
        RequestDispatcher rd = request.getRequestDispatcher("pages/landingPage.jsp");

        ResetBean obj =  new ResetBean(username, password, newpassword, newpassword2);
        boolean id = ResetDAO.validate(obj);
        if(id){
            int status = ResetDAO.ResetPassword(obj);
            if(status>0)
                reset_result = "Reset Successfully";
            else {
                reset_result = "Username or Password is wrong";
            }
        }
        else
            reset_result = "Username or Password is wrong";

        request.setAttribute("reset_result", reset_result);
        rd.forward(request,response);
    }
}
