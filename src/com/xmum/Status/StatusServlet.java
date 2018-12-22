package com.xmum.Status;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Controller2")
public class StatusServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String user_status = request.getParameter("user_status");
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("pages/publicWall.jsp");

        StatusBean obj = new StatusBean(user_status);
        int status = StatusDAO.insertStatus(obj);
        if(status>0)
            System.out.println("Insert successful.");
        else{
            System.out.println("Failed");
        }
        rd.forward(request,response);

    }

}
