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
    <title>用户视频明细页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/js/jquery-3.6.0.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <div class="container">
<%--        加一行,并设置样式style--%>
        <div class="row" style="margin-top: 30px">
            <div class="col-md-12" style="text-align: center">
                <h3>视频明细</h3>
                ${requestScope.videoList}
            </div>
        </div>
        <div class="row" style="margin-top: 30px">
<%--            这一栏是空的--%>
            <div class="col-md-10" ></div>
<%--    这个地方放管理员的名字--%>
            <div class="col-md-2" >${sessionScope.user.nickName}</div>
        </div>
<%--响应式布局，任意的都分成12列，为了居中选择中间4列，左边做4个字节，右边做8个字节--%>
        <div class="row" style="margin-top: 20px">
            <div class="col-md-1"></div>
            <div class="col-md-10">
<%--                视频添加，enctype修改,文本格式是默认，因为此用二进制方式传--%>
            <form class="form-horizontal" action="#" method="post" >
<%--因为是查看，所以不需要id和name,直接给一个值,并设置只读--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">名称:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.video.name}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">作者:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.video.author}" readonly="readonly">
                    </div>
                </div>
<%--                    下拉菜单,但是查看的时候已经是值了--%>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">视频类型:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.video.type}" readonly="readonly">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">创建时间:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.video.createTime}" readonly="readonly">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">时长:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.video.timeLength}" readonly="readonly">
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label">视频:</label>
                    <div class="col-sm-10">
                        <video width="320" height="240" poster="/cover_upload${requestScope.video.coverPath}" controls>
<%--                            这个值为target目录下的对应的东西,值是数据库中的值--%>
                            <source src="/video_upload${requestScope.video.videoPath}" type="video/mp4">
                        </video>
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">视频描述:</label>
                    <div class="col-sm-10">
                        <textarea style="resize: none;" class="form-control" rows="5" readonly="readonly">${requestScope.video.description}</textarea>
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-md-4"></div>
                    <div class="col-md-4" style="text-align: center">
<%--                      这里只需要返回--%>
                        <input class="btn btn-primary"  type="button" value="返回" onclick="history.back()"/>
<%--                            返回。--%>
                    </div>
                    <div class="col-md-4"></div>
                </div>

            </form>

            </div>
            <div class="col-md-1"></div>
        </div>

    </div>


</body>
</html>
