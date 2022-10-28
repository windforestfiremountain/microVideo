package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.Admin;
import edu.hhu.songxinning.service.AdminService;
import edu.hhu.songxinning.service.impl.AdminServiceimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginController extends HttpServlet {

    private AdminService adminService = new AdminServiceimpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //1.获取管理员账号和密码,getParameter放账号
        String account = request.getParameter("account");

        String password = request.getParameter("password");

        //2.进行数据验证(根据账号和密码去数据库查找，是否有此人,如果有就不是null)
        Admin admin = adminService.login(account,password);

        //3.登录成功
        if(admin!=null){
            request.getSession().setAttribute("admin",admin);
            //页面响应.登录成功之后，过来。路径1.
//            response.sendRedirect("/admin/video/list.jsp");
            response.sendRedirect("/videoList");//登录成功直接发这个请求
        }

        //4.登陆失败
        else{
            response.sendRedirect("/admin/login_fail.jsp");

        }
    }
}
