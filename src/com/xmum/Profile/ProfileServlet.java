package com.xmum.Profile;

import com.xmum.User.UserBean;
import com.xmum.User.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userid = request.getParameter("id");
        ResultSet userRs = UserDAO.getUser(userid);
        UserBean user = null;
        try {
            if(userRs.next()){
                user = new UserBean(userid, userRs.getString("nickname"), userRs.getString("profilepic"));
                ProfileBean profile = new ProfileBean(userid, userRs.getString("gender"), userRs.getString("phonenum"),
                        userRs.getString("email"), userRs.getString("intro"),
                        userRs.getObject("birthdate", LocalDate.class), userRs.getString("starsign"));
                user.setProfile(profile);
                request.setAttribute("stalkUser", user);
                System.out.println(request.getAttribute("stalkUser"));
                System.out.println(user.getId() + user.getProfilePic() + user.getProfile().getIntro());
                //response.sendRedirect(request.getContextPath() + "/pages/accountPage.jsp");
                request.getRequestDispatcher("/pages/accountPage.jsp").forward(request, response);
            } else {
                System.out.println("User not found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

