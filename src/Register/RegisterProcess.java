package Register;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Controller")
public class RegisterProcess extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String result;
        RequestDispatcher rd;

        rd = request.getRequestDispatcher("pages/UserRegister/Register.jsp");

        if(password.equals(password2)){

            RegisterBean obj =  new RegisterBean(email, password, password2);
            int status = RegisterVerify.insertUser(obj);
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