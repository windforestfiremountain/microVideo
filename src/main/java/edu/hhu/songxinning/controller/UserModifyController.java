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

@WebServlet("/userModify")
public class UserModifyController extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1. 获取用户填写的信息。在此之前需要修改编码信息。
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String nickName =request.getParameter("nickName");
        String account =request.getParameter("account");
        String password =request.getParameter("password");
        String gender =request.getParameter("gender");
        String birthday =request.getParameter("birthday");
        String phone =request.getParameter("phone");
        String email =request.getParameter("email");
        String description =request.getParameter("description");
//        String birthplace =request.getParameter("birthplace");
        String birthplace =request.getParameter("input_area");
        System.out.println("!birthplace="+birthplace);

        //2. 将信息封装成一个video对象。
        User user = new User();
        //id属性没有值
        user.setId(id);
        user.setNickName(nickName);
        user.setAccount(account);
        user.setPassword(password);
        user.setGender(gender);
        user.setBirthday(birthday);
        user.setPhone(phone);
        user.setEmail(email);
        user.setDescription(description);
        System.out.println("@birthplace="+birthplace);
        user.setBirthplace(birthplace);




        //3. 调用VideoService的修改方法,将数据更新到数据库中
        userService.modify(user);


        // 4. 将页面跳转到视频列表页面
        response.sendRedirect("/userList");



    }
}
