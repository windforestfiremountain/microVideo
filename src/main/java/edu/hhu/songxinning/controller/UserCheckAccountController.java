package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.User;
import edu.hhu.songxinning.service.UserService;
import edu.hhu.songxinning.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userCheckAccount")
public class UserCheckAccountController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //1.获取管理员账号和密码,getParameter放账号
        String account = request.getParameter("account");
        boolean isExist = userService.userCheckAccount(account);
        //把值输出到前端去
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out =response.getWriter();
        out.write(""+isExist);
        out.close();

    }
}
