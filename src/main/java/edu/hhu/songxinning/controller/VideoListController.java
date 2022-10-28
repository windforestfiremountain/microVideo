package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.Admin;
import edu.hhu.songxinning.entity.Video;
import edu.hhu.songxinning.service.AdminService;
import edu.hhu.songxinning.service.VideoService;
import edu.hhu.songxinning.service.impl.AdminServiceimpl;
import edu.hhu.songxinning.service.impl.VideoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/videoList")
public class VideoListController extends HttpServlet {

    private VideoService videoService = new VideoServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Video> videoList =videoService.queryAll();
        //放到请求里。
        request.setAttribute("videoList",videoList);
//        response.sendRedirect("/admin/video/list.jsp");//这里是返回结果
        //这里是返回页面。
        request.getRequestDispatcher("/admin/video/list.jsp").forward(request,response);
    }
}
