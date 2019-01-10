package com.xmum.Post;

import com.xmum.User.UserBean;
import com.xmum.User.UserDAO;
import com.xmum.upvotedownvote.UpvoteDownvoteGetDataDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Array;
import java.sql.ResultSet;
import java.time.LocalDateTime;

@WebServlet("/post")
@MultipartConfig(
        fileSizeThreshold=1024*1024*10, 	// 10 MB
        maxFileSize=1024*1024*50,      	// 50 MB
        maxRequestSize=1024*1024*100
)
public class PostServlet extends HttpServlet {
    // no request parameters needed
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("PostServlet: doGet activated!");
        ResultSet rs = PostDAO.getPosts();
        int pinned_count = PostDAO.getPinnedTotal();
        ResultSet ps = PostDAO.getPinnedPost(pinned_count);



        //SET POSTBEAN ARRAY CAPACITY TO THE NUMBER OF NORMAL POSTS + 1 (pinned post) AND INSERT POSTS FROM LAST INDEX
        //POST IN INDEX 0 IS PINNED POST
        //WHEN PRINTING POSTS, LOOP FROM INDEX 0 THUS PINNED POST WILL BE PRINTED FIRST
        PostBean[] postBeans = new PostBean[PostDAO.getTotal()+1];
        for(int i = postBeans.length-1; i >= 0; i--){
            try{
                UserBean author;
                String userlevel;
                String message;
                LocalDateTime datetime;
                String[] images;
                int postid;

                if(i != 0){
                    rs.next();

                    //sends "id" given by request to userServlet to get "user" (author)
                    ResultSet userRs = UserDAO.getUserMinimum(rs.getString("authorid"));
                    userRs.next();
                    author = new UserBean(userRs.getString("id"), userRs.getString("nickname"),  userRs.getString("level"), userRs.getString("profilepic"));

                    if (author == null)
                        System.out.println("Author is null.");
                    userlevel = author.getLevel();
                    postid = rs.getInt("postid");
                    int likes = UpvoteDownvoteGetDataDAO.getlikedata(postid, userlevel);
                    int dislikes = UpvoteDownvoteGetDataDAO.getunlikedata(postid, userlevel);

                    Array a = rs.getArray("images");

                    if (a != null){
                        images = (String[])a.getArray();
                        System.out.println("got JAVA object array");
                        System.out.println("images: OK");
                    }
                    else {
                        images = null;
                    }

                    PostDAO.closeConn();

                    postBeans[i] = new PostBean(author, rs.getString("message"), images, rs.getTimestamp("timestamp").toLocalDateTime(), userlevel, likes, dislikes, postid);

                }else{
                    //PINNED POST WHEN INDEX == 0
                    ps.next();
                    ResultSet adminRs = UserDAO.getUserMinimum("admin");
                    adminRs.next();
                    author = new UserBean(adminRs.getString("id"), adminRs.getString("nickname"), adminRs.getString("profilepic"));
                    userlevel = author.getLevel();
                    postid = ps.getInt("postid");

                    int likes = UpvoteDownvoteGetDataDAO.getlikedata(postid, userlevel);
                    int dislikes = UpvoteDownvoteGetDataDAO.getunlikedata(postid, userlevel);

                    Array a = ps.getArray("images");

                    if (a != null){
                        images = (String[])a.getArray();
                        System.out.println("got JAVA object array");
                        System.out.println("images: OK");
                    }
                    else {
                        images = null;
                    }


                    PostDAO.closeConn();

                    postBeans[i] = new PostBean(author, ps.getString("message"), images, ps.getTimestamp("timestamp").toLocalDateTime(), "admin", likes, dislikes, postid);
                }


            }catch(Exception e){
//                System.out.println("PostServlet: problem initialising postBean array");
//                System.out.println(e);
                e.printStackTrace();
            }
        }



        // set "posts" session attribute"
        request.getSession().setAttribute("posts", postBeans);

        //redirect back to publicWall.jsp
        response.sendRedirect(request.getContextPath() + "/pages/publicWall.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("dopost in postservlet activated");

        String message = request.getParameter("postMessage");
        System.out.println(message);

        UserBean user = (UserBean)(request.getSession(false).getAttribute("user"));
        System.out.println(user);
        String userlevel = user.getLevel();
        PostBean post = new PostBean(user, message, LocalDateTime.now(), userlevel, 0,0);

        System.out.println("PostServlet: create postBean successful");

        System.out.println(request.getParameter("uploadType"));


        // post contains images
        if (request.getParameter("uploadType").equals("postPic")){
            System.out.println("got pics");
            request.getRequestDispatcher("/uploadImage").include(request,response);
            String[] picNames = (String[])request.getAttribute("picName");
            post.setImages(picNames);
        }


        int status = PostDAO.insertPost(post);
        if (status > 0){
            System.out.println("PostServlet: insert post successful");
        } else {
            System.out.println("PostServlet: insert post failed");
        }


        response.sendRedirect(request.getContextPath() + "/post");
    }
}
