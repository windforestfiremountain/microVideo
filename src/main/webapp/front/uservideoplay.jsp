<%--
  Created by IntelliJ IDEA.
  User: songx
  Date: 2022/10/26
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户视频播放页面</title>
<%--    <link rel="stylesheet" href="/css/bootstrap.css">--%>
<%--    <script src="/js/jquery-3.6.0.js"></script>--%>
<%--    <script src="/js/bootstrap.js"></script>--%>
<%--    <script src="/js/My97DatePicker/WdatePicker.js"></script>--%>
    <style type="text/css">
        *{
            padding: 0px;
            margin: 0px;
        }

        body p.videoBox{
            width: 400px;
            height: 320px;
            margin: 100px auto;
            background-color:#000;
        }

        body p.videoBox video.video
        {
            width: 100%;
            height: 100%;
        }

        :-webkit-full-screen {

        }

        :-moz-full-screen {

        }

        :-ms-fullscreen {

        }

        /*:-o-fullscreen {*/

        /*}*/

        /*:full-screen {*/

        /*}*/

        :fullscreen {

        }

        :-webkit-full-screen video {
            width: 100%;
            height: 100%;
        }
        :-moz-full-screen video{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>

<p id="videoBox" style="text-align: center">
    <video controls="controls" preload="preload" width="1920" height="1280" poster="/cover_upload${requestScope.video.coverPath}" >
        <%--                            这个值为target目录下的对应的东西,值是数据库中的值--%>
        <source src="/video_upload${requestScope.video.videoPath}" type="video/mp4">
    </video>
<%--    <button id="fullScreenBtn">全屏</button>--%>
</p>


<script type="text/javascript">

    //反射調用
    var invokeFieldOrMethod = function(element, method)
    {
        var usablePrefixMethod;
        ["webkit", "moz", "ms", "o", ""].forEach(function(prefix) {
            if (usablePrefixMethod) return;
            if (prefix === "") {
                // 无前缀，方法首字母小写
                method = method.slice(0,1).toLowerCase() + method.slice(1);
            }
            var typePrefixMethod = typeof element[prefix + method];
            if (typePrefixMethod + "" !== "undefined") {
                if (typePrefixMethod === "function") {
                    usablePrefixMethod = element[prefix + method]();
                } else {
                    usablePrefixMethod = element[prefix + method];
                }
            }
        });

        return usablePrefixMethod;
    };

    //進入全屏
    function launchFullscreen(element)
    {
        //此方法不可以在異步任務中執行，否則火狐無法全屏
        if(element.requestFullscreen) {
            element.requestFullscreen();
        } else if(element.mozRequestFullScreen) {
            element.mozRequestFullScreen();
        } else if(element.msRequestFullscreen){
            element.msRequestFullscreen();
        } else if(element.oRequestFullscreen){
            element.oRequestFullscreen();
        }
        else if(element.webkitRequestFullscreen)
        {
            element.webkitRequestFullScreen();
        }else{

            var docHtml  = document.documentElement;
            var docBody  = document.body;
            var videoBox  = document.getElementById('videoBox');
            var  csstext = 'width:100%;height:100%;overflow:hidden;';
            docHtml.style.csstext = csstext;
            docBody.style.csstext = csstext;
            videoBox.style.csstext = csstext+';'+'margin:0px;padding:0px;';
            document.IsFullScreen = true;

        }
    }
    //退出全屏
    function exitFullscreen()
    {
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if(document.oRequestFullscreen){
            document.oCancelFullScreen();
        }else if (document.webkitExitFullscreen){
            document.webkitExitFullscreen();
        }else{
            var docHtml  = document.documentElement;
            var docBody  = document.body;
            var videoBox  = document.getElementById('videoBox');
            docHtml.style.csstext = "";
            docBody.style.csstext = "";
            videoBox.style.csstext = "";
            document.IsFullScreen = false;
        }
    }
//     document.getElementById('fullScreenBtn').addEventListener('click',function(){
//         launchFullscreen(document.getElementById('video'));
//         window.setTimeout(function exit(){
// //檢查瀏覽器是否處於全屏
//             if(invokeFieldOrMethod(document,'FullScreen') || invokeFieldOrMethod(document,'IsFullScreen') || document.IsFullScreen)
//             {
//                 exitFullscreen();
//             }
//         },5*1000);
//     },false);

</script>

</body>
</html>
