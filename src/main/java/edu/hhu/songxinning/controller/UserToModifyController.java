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

@WebServlet("/userToModify")
public class UserToModifyController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //首先要获取id>
        int id = Integer.parseInt(request.getParameter("id"));
        //id查出来放到服务里。
        User user = userService.queryById(id);
        request.setAttribute("user",user);
        //页面跳转，放到页面里才能用信息。
        request.getRequestDispatcher("/admin/user/modify.jsp").forward(request,response);

    }
}
