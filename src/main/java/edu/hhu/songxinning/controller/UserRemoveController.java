package edu.hhu.songxinning.controller;

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

@WebServlet("/userRemove")
public class UserRemoveController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //首先要获取id>
        int id = Integer.parseInt(request.getParameter("id"));
        //            删除数据库的数据。数据库里只记录了路径，但是源文件没删。
        userService.remove(id);
        //            删除磁盘上面的数据：视频和封面 TO-DO
        // 提示，java的File类的delete()
        response.sendRedirect("/userList");

    }
}
