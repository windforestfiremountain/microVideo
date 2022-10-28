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
    <title>后台视频修改页面</title>
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
                <h3>修改视频</h3>
                ${requestScope.videoList}
            </div>
        </div>
        <div class="row" style="margin-top: 30px">
<%--            这一栏是空的--%>
            <div class="col-md-10" ></div>
<%--    这个地方放管理员的名字--%>
            <div class="col-md-2" >${sessionScope.admin.name}</div>
        </div>
<%--响应式布局，任意的都分成12列，为了居中选择中间4列，左边做4个字节，右边做8个字节--%>
        <div class="row" style="margin-top: 20px">
            <div class="col-md-2">
<%--                显示用户列表--%>
                <a href="/userList">用户管理</a>
                <br/><br/>
                <a href="/videoList">视频管理</a>
            </div>
            <div class="col-md-10">
<%--                视频添加，enctype修改,文本格式是默认，因为此用二进制方式传--%>

                <form class="form-horizontal" action="/videoModify" method="post" >
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name" value="${requestScope.video.name}">
                            <input type="hidden" name="id" value="${requestScope.video.id}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="author" name="author" value="${requestScope.video.author}">
                            <input type="hidden" name="id" value="${requestScope.video.id}">
                        </div>
                    </div>
<%--                    下拉菜单--%>

                    <div class="form-group">
                        <label for="type" class="col-sm-2 control-label">视频类型:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="type" name="type">
<%--                                <option value="其他" ${requestScope.video.type=='其他'?selected="selected":''}>=请选择=</option>--%>
<%--                                <option value="战争" ${requestScope.video.type=='战争'?selected="selected":''}>战争</option>--%>
<%--                                <option value="警匪" ${requestScope.video.type=='警匪'?selected="selected":''}>警匪</option>--%>
<%--                                <option value="古装" ${requestScope.video.type=='古装'?selected="selected":''}>古装</option>--%>
<%--                                <option value="言情" ${requestScope.video.type=='言情'?selected="selected":''}>言情</option>--%>
<%--                                <option value="宫廷" ${requestScope.video.type=='宫廷'?selected="selected":''}>宫廷</option>--%>
<%--                                <option value="科幻" ${requestScope.video.type=='科幻'?selected="selected":''}>科幻</option>--%>
<%--                                <option value="生活" ${requestScope.video.type=='生活'?selected="selected":''}>生活</option>--%>

                                    <option value="其他">=请选择=</option>
                                    <option value="战争">战争</option>
                                    <option value="警匪">警匪</option>
                                    <option value="古装">古装</option>
                                    <option value="言情">言情</option>
                                    <option value="宫廷">宫廷</option>
                                    <option value="科幻">科幻</option>
                                    <option value="生活">生活</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="createTime" class="col-sm-2 control-label">创建时间:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="createTime" name="createTime" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  value="${requestScope.video.createTime}" readonly="readonly">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="timeLength" class="col-sm-2 control-label">时长:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="timeLength" name="timeLength" value="${requestScope.video.timeLength}">
                        </div>
                    </div>


<%--封面TODO--%>
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
                        <label for="description" class="col-sm-2 control-label">视频描述:</label>
                        <div class="col-sm-10">
                            <textarea id="description" name="description" style="resize: none;" class="form-control" rows="5" >${requestScope.video.description}"</textarea>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-md-4"></div>
                        <div class="col-md-4" style="text-align: center">
                            <input class="btn btn-success" type="submit" value="修改"/>
                            <input class="btn btn-info" style="margin-left: 20px" type="reset" value="重置"/>
                            <input class="btn btn-primary" style="margin-left: 20px" type="button" value="返回" onclick="history.back()"/>
<%--                            返回。--%>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                </form>

            </div>
        </div>

    </div>


</body>
</html>
