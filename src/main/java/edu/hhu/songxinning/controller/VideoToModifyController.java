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

@WebServlet("/videoToModify")
public class VideoToModifyController extends HttpServlet {

    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //首先要获取id>
        int id = Integer.parseInt(request.getParameter("id"));
        Video video = videoService.queryById(id);
        request.setAttribute("video",video);
        //页面跳转
        request.getRequestDispatcher("/admin/video/modify.jsp").forward(request,response);

    }
}
