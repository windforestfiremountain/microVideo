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
    <title>后台用户明细页面</title>
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
                <h3>用户信息明细</h3>
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
            <form class="form-horizontal" action="#" method="post" >
<%--因为是查看，所以不需要id和name,直接给一个值,并设置只读--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">昵称:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"  value="${requestScope.user.nickName}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">账号:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"  value="${requestScope.user.account}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码:</label>
                    <div class="col-sm-10">
                        <input type="password" value="${requestScope.user.password}" readonly="readonly">
                    </div>
                </div>
<%--                    下拉菜单,但是查看的时候已经是值了--%>

                <div class="form-group">
                    <label class="col-sm-2 control-label">性别:</label>
                    <div class="col-sm-10">
                        <input type="text" value="${requestScope.user.gender}" readonly="readonly">
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-2 control-label">手机号码:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.user.phone}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.user.email}" readonly="readonly">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">出生日期:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.user.birthday}" readonly="readonly">
                    </div>
                </div>


                <%--封面TODO--%>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">出生地:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.user.birthplace}" readonly="readonly">
                    </div>
                </div>


                <div class="form-group">
                    <label  class="col-sm-2 control-label">自我介绍:</label>
                    <div class="col-sm-10">
                        <textarea style="resize: none;" class="form-control" rows="5" readonly="readonly">${requestScope.user.description}}</textarea>
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
        </div>

    </div>


</body>
</html>
