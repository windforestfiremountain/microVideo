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
    <title>后台用户列表页面</title>
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
                <h3>用户列表</h3>
<%--                ${requestScope.videoList}--%>
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
<%--                视频列表，此处为假数据--%>

                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td>序号</td>
                        <td>姓名</td>
                        <td>账号</td>
                        <td>性别</td>
                        <td>手机</td>
                        <td>操作</td>
                    </tr>
<%--                    假数据--%>
<%--                    <tr>--%>
<%--                        <td>1</td>--%>
<%--                        <td>关于我爱水群这件事</td>--%>
<%--                        <td>胡扯</td>--%>
<%--                        <td>5</td>--%>
<%--                        <td>--%>
<%--&lt;%&ndash;                            重要信息点明细看详细信息&ndash;%&gt;--%>
<%--                            <a class="btn btn-info btn-xs" href="#">明细</a>--%>
<%--                            <a class="btn btn-warning btn-xs" href="#">修改</a>--%>
<%--                            <a class="btn btn-danger btn-xs" href="#">删除</a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    集合为后台请求的变量，后台userList传过来--%>
                    <c:forEach var="user" items="${requestScope.userList}" varStatus="status">
                       <tr>d
                            <td>${status.count}</td>
                            <td>${user.nickName}</td>
                            <td>${user.account}</td>
                            <td>${user.gender}</td>
                            <td>${user.phone}</td>
                            <td>
                                    <%--                            重要信息点明细看详细信息--%>
<%--                                点不同明细值id是不一样的--%>
                                <a class="btn btn-info btn-xs" href="/userDetail?id=${user.id}">明细</a>
                                <a class="btn btn-warning btn-xs" href="/userToModify?id=${user.id}">修改</a>
<%--                                        增加提示--%>
                                <a class="btn btn-danger btn-xs" href="/userRemove?id=${user.id}" onclick="return confirm('确定删除嘛？') ">删除</a>
                            </td>
                       </tr>
                    </c:forEach>

                </table>

            </div>
        </div>

    </div>


</body>
</html>
