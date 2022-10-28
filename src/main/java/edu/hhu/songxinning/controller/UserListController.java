package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.User;
import edu.hhu.songxinning.entity.Video;
import edu.hhu.songxinning.service.UserService;
import edu.hhu.songxinning.service.VideoService;
import edu.hhu.songxinning.service.impl.UserServiceImpl;
import edu.hhu.songxinning.service.impl.VideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userList")
public class UserListController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList =userService.queryAll();
        //放到请求里。
        request.setAttribute("userList",userList);
//        response.sendRedirect("/admin/video/list.jsp");//这里是返回结果
        //这里是返回页面。
        request.getRequestDispatcher("/admin/user/list.jsp").forward(request,response);
    }
}
