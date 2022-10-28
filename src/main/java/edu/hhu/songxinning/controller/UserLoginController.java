package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.Admin;
import edu.hhu.songxinning.entity.User;
import edu.hhu.songxinning.service.AdminService;
import edu.hhu.songxinning.service.UserService;
import edu.hhu.songxinning.service.impl.AdminServiceimpl;
import edu.hhu.songxinning.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userLogin")
public class UserLoginController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //1.获取管理员账号和密码,getParameter放账号
        String account = request.getParameter("account");

        String password = request.getParameter("password");

        //2.进行数据验证(根据账号和密码去数据库查找，是否有此人,如果有就不是null)
        User user = userService.login(account,password);

        //3.登录成功
        if(user!=null){
            request.getSession().setAttribute("user",user);
            //页面响应.登录成功之后，过来。路径1.
//            response.sendRedirect("/user/video/list.jsp");
//            TO-DO,userList??只有数据查找功能。
            response.sendRedirect("/userVideoList");//登录成功直接发这个请求
//            response.sendRedirect("/front/login_success.jsp");
        }

        //4.登陆失败,front前台登录？？
        else{
            response.sendRedirect("/front/login_fail.jsp");

        }
    }
}
