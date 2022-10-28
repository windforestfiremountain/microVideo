<%--
  Created by IntelliJ IDEA.
  User: songx
  Date: 2022/10/26
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>前台用户登录页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/js/jquery-3.6.0.js"></script>
    <script src="/js/bootstrap.js"></script>
<%--    <script src="js/My97DatePicker/WdatePicker.js"></script>--%>
</head>
<body>
    <div class="container">
<%--        加一行,并设置样式style--%>
        <div class="row" style="margin-top: 30px">
            <div class="col-md-12" style="text-align: center">
                <h3>用户登录</h3>
            </div>
        </div>
<%--响应式布局，任意的都分成12列，为了居中选择中间4列--%>
        <div class="row">
            <div class="col-md-12" style="text-align: right">
<%--                用户注册--%>
                <a class="btn btn-primary" href="/front/register.jsp">注册用户</a>
            </div>
        </div>
        <div class="row" style="margin-top: 30px">
            <div class="col-md-4"></div>
            <div class="col-md-4">
<%--                action为后台提交地址，这里adminLogin就是后台处理请求的地址--%>
                <form class="form-horizontal" action="/userLogin" method="post">
                    <div class="form-group">
                        <label for="account" class="col-sm-2 control-label">账号:</label>
                        <div class="col-sm-10">
<%--                            name属性为key,用户输入的属性值为值。--%>
                            <input type="text" class="form-control" id="account" name="account" value="zhangsan" placeholder="请输入账号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" value="123" placeholder="请输入密码">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3"></div>
                        <div class="col-md-6" style="text-align: center">
                            <input class="btn btn-success" type="submit" value="登录"/>
                            <input class="btn btn-info" style="margin-left: 20px" type="reset" value="重置"/>
                        </div>
                        <div class="col-md-3"></div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-3"></div>
                        <div class="col-md-6" style="text-align: center">
                            <a class="btn btn-danger"  style="margin-bottom: 10px" href="/admin/login.jsp">切换为管理员登录</a>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>

    </div>


</body>
</html>
