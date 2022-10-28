package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.Video;
import edu.hhu.songxinning.service.VideoService;
import edu.hhu.songxinning.service.impl.VideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/videoModify")
public class VideoModifyController extends HttpServlet {

    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1. 获取用户填写的信息。在此之前需要修改编码信息。
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name =request.getParameter("name");
        String author =request.getParameter("author");
        String type =request.getParameter("type");
        String creatTime =request.getParameter("creatTime");
        Integer timeLength =Integer.parseInt(request.getParameter("timeLength"));
        String description =request.getParameter("description");

        //2. 将信息封装成一个video对象。
        Video video = new Video();
        video.setId(id);
        video.setName(name);
        video.setAuthor(author);
        video.setType(type);
        video.setCreateTime(creatTime);
        video.setTimeLength(timeLength);
        video.setDescription(description);



        //3. 调用VideoService的修改方法,将数据更新到数据库中
        videoService.modify(video);


        // 4. 将页面跳转到视频列表页面
        response.sendRedirect("/videoList");



    }
}
