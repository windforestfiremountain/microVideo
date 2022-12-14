package edu.hhu.songxinning.controller;

import edu.hhu.songxinning.entity.User;
import edu.hhu.songxinning.entity.Video;
import edu.hhu.songxinning.service.UserService;
import edu.hhu.songxinning.service.VideoService;
import edu.hhu.songxinning.service.impl.UserServiceImpl;
import edu.hhu.songxinning.service.impl.VideoServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@WebServlet("/userAdd")
public class UserAddController extends HttpServlet{

    private UserService userService = new UserServiceImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> itemList = null;
        User user = new User();
//        //上传目录的准备。
//        File videoUploadDir = new File(request.getServletContext().getRealPath("/video_upload"));
//        //如果目录不存在就去建立
//        if(!videoUploadDir.exists()){
//            videoUploadDir.mkdirs();//创建
//
//        }
//
//        File coverUploadDir = new File(request.getServletContext().getRealPath("/cover_upload"));
//        //如果目录不存在就去建立
//        if(!coverUploadDir.exists()){
//            coverUploadDir.mkdirs();//创建
//
//        }

        //文本不能直接用String传入。
//        String name = request.getParameter("name");
//        String author = request.getParameter("author");
//        String type = request.getParameter("type");
//        String createTime = request.getParameter("createTime");
//        String timeLength = request.getParameter("timeLength");
//        String name = request.getParameter("name");

        //1， 获取用户填写或者选择的信息
        try {
            itemList = upload.parseRequest(request);
            //2, 将信息封装成Video对象
            for(FileItem fileItem : itemList){
                // 如果是普通文本
                if(fileItem.isFormField()){
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString("UTF-8");
//                    String province ="";
//                    String city ="";
//                    String area ="";
//                    String [] strs= new String[3];
                    String birthPlace="";
                    if(name.equals("nickName")){
                        user.setNickName(value);
                    }
                    if(name.equals("account")){
                        user.setAccount(value);
                    }
                    if(name.equals("password")){
                        user.setPassword(value);
                    }

                    if(name.equals("gender")){
                        user.setGender(value);
                    }
                    if(name.equals("birthday")){
                        user.setBirthday(value);
                    }
                    if(name.equals("phone")){
                        user.setPhone(value);
                    }
                    if(name.equals("email")){
                        user.setEmail(value);
                    }
                    if(name.equals("email")){
                        user.setEmail(value);
                    }
                    if(name.equals("input_province")){
                        birthPlace = birthPlace + value +",";
                        System.out.println("birthPlace="+birthPlace);
                    }
                    if(name.equals("input_city")){
                        birthPlace = birthPlace + value +"," ;
                        System.out.println("birthPlace="+birthPlace);
                    }
                    if(name.equals("input_area")){
                        birthPlace = birthPlace + value ;
                        System.out.println("birthPlace="+birthPlace);
                        user.setBirthplace(birthPlace);
                    }

//                    if(name.equals("birthplace")){
//                        user.setBirthplace(value);
//                    }
                    if(name.equals("description")){
                        user.setDescription(value);
                    }
                }
                // 如果不是普通文本(就是文件上传域)
//                else{
//                    String fileName = fileItem.getName(); // xxx.mp4
//                        System.out.println("fileName = "+fileName);
//                        // 获取文件的后缀名,这里一定要有值
//                    String fileSuffix = fileName.substring(fileName.lastIndexOf(".")); // .mp4
//                    //UUID的值很长。
//                    fileName = UUID.randomUUID().toString();
//                    if(fileSuffix.equalsIgnoreCase(".mp4")|| fileSuffix.equalsIgnoreCase(".avi")){
//                        String uploadFileName = request.getServletContext().getRealPath("/video_upload")+"/"+ fileName+fileSuffix;
//                        // 将视频路径设置给Video对象
//                        video.setVideoPath("/"+fileName+fileSuffix);
//
//                        // 使用IO流将数据上传到服务器指定位置
//                        InputStream is = fileItem.getInputStream();
//                        OutputStream os = new FileOutputStream(uploadFileName);
//                        byte[] bytes = new byte[1024*4];
//                        int length = 0;
//                        while((length=is.read(bytes))!=-1){
//                            os.write(bytes,0,length);
//                        }
//                        is.close();
//                        os.close();
//                    }
//                    else{
//                        //处理封面图片
//                        String uploadFileName = request.getServletContext().getRealPath("/cover_upload")+"/"+ fileName+fileSuffix;
//                        //将封面路径设置给Video对象
//
//                        video.setCoverPath("/"+fileName+fileSuffix);
//
//                        // 使用IO流将数据上传到服务器指定位置
//                        InputStream is = fileItem.getInputStream();
//                        OutputStream os = new FileOutputStream(uploadFileName);
//                        byte[] bytes = new byte[1024*4];
//                        int length = 0;
//                        while((length=is.read(bytes))!=-1){
//                            os.write(bytes,0,length);
//                        }
//                        is.close();
//                        os.close();
////                        video.setCoverPath("/test.png");
//                    }
//
//                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        //检查
        System.out.println("User =>" +user);

        //3,调用服务方法添加到数据库中
        userService.add(user);

        //4.将页面跳转到视频到表页面。
        response.sendRedirect("/userList");
    }
}
