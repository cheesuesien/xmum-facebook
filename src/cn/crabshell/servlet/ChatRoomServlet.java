package cn.crabshell.servlet;



import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChatRoomServlet
 */
@WebServlet("/ChatRoomServlet")
public class ChatRoomServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    List<String> OnLineUserList = new ArrayList<String>();
    static List<String> strSendConentList=new ArrayList<String>();

    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
        //get user action , name, pass, content
        String idmember = request.getParameter("id");
        String groupnickname = request.getParameter("nickname")     ;
        String strAction = request.getParameter("action");
        String strContent = request.getParameter("content");
        HttpSession session = request.getSession();
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        //base on action to do things
        if("Enter".equals(strAction)){

            String res=UserEnter(idmember,groupnickname,session);
            out.print(res);
            out.close();

        }else if("ChatList".equals(strAction)){
            String result1=AllChatList();
            out.println(result1);
            out.close();

        }else if("OnLineList".equals(strAction)){
            String result2=GetOnlineUserList(session);
            out.println(result2);
            out.close();

        }else if("SendContent".equals(strAction)){
            Boolean res2=AddSendContent(strContent,session);
            String result="";
            if(res2){
                result="1";
            }else{
                result="2";
            }
            out.println(result);
            out.close();

        }else if("Logout".equals(strAction)){
            boolean res3=Logout(session);
            out.println(res3);
            out.close();
        }
    }

    //check user login
    public String UserEnter(String id, String nickname , HttpSession session){
        String flag = "no";

            if (OnLineUserList.size() == 0)//check use if empty
            {
                OnLineUserList = new ArrayList<String>();// in use is empty , init the arraylist
            }
            OnLineUserList.add(nickname);//add use to the arrayList
            session.setAttribute("LOGINUSER",id);//session to set user info
            flag = "ok";

        return flag;
    }

    //get chat content
    public String AllChatList(){
        String result="";
        if (strSendConentList.size()
                == 0)
        {
            result = "No chat history yet";
        }
        else
        {
            Iterator<String> it=strSendConentList.iterator();
            while(it.hasNext()){
                result += it.next() + "</br>";
            }
        }
        result= result.replace("<:", "<img src='Face/");
        result= result.replace(":>", ".gif '/>");
        return result;
    }

    //user list
    public String GetOnlineUserList(HttpSession session){
        String result="";
        if (OnLineUserList.size()==0)
        {
            result="No one is online now";
        }else{
            Iterator<String> it=OnLineUserList.iterator();
            while(it.hasNext()){
                result += it.next() + "</br>";
            }
        }
        return result;
    }

    //send message
    public Boolean AddSendContent(String strContent,HttpSession session){
        String user=(String) session.getAttribute("LOGINUSER,nickname");


        //String name = session.getAttribute("LOGINUSER").toString();
        if(null==user){
            return false;
        }
        String strSendConent = user + " at " + new java.util.Date(System.currentTimeMillis()) + " said: " + strContent;
        if (strSendConentList.size() == 0)
        {
            strSendConentList = new ArrayList<String>();
        }
        strSendConentList.add(strSendConent);
        return true;
    }
    //logout
    public boolean Logout(HttpSession session){
        if(null==session.getAttribute("LOGINUSER")){
            return false;
        }
        String name = session.getAttribute("LOGINUSER").toString();
        session.removeAttribute("LOGINUSER");
        if(OnLineUserList.size()!=0){
            for(int i=0;i<OnLineUserList.size();i++) {
                if(name.equals(OnLineUserList.get(i))) {
                    OnLineUserList.remove(i);
                }
                return true;
            }
        }
        return false;
    }

}

