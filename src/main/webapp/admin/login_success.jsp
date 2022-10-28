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
    <title>后台管理员登录成功页面</title>
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
            <h3>欢迎你，${sessionScope.admin.name}!</h3>
        </div>
    </div>


</div>


</body>
</html>

