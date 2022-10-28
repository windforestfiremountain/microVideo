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
    <title>后台用户修改页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/js/jquery-3.6.0.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/My97DatePicker/WdatePicker.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/address.js"></script>
    <script>

        // 省市三级菜单
        $(function () {
            var html = "";
            $("#input_city").append(html);
            $("#input_area").append(html);
            $.each(pdata, function (idx, item) {
                if (parseInt(item.level) == 0) {
                    html += "<option value=" + item.code + " >" + item.names + "</option> ";
                }
            });
            $("#input_province").append(html);

            $("#input_province").change(function () {
                if ($(this).val() == "") return;
                $("#input_city option").remove();
                $("#input_area option").remove();
                //var code = $(this).find("option:selected").attr("exid");
                var code = $(this).find("option:selected").val();
                code = code.substring(0, 2);
                var html = "<option value=''>--请选择--</option>";
                $("#input_area option").append(html);
                $.each(pdata, function (idx, item) {
                    if (parseInt(item.level) == 1 && code == item.code.substring(0, 2)) {
                        html += "<option value=" + item.code + " >" + item.names + "</option> ";
                    }
                });
                $("#input_city ").append(html);
            });

            $("#input_city").change(function () {
                if ($(this).val() == "") return;
                $("#input_area option").remove();
                var code = $(this).find("option:selected").val();
                code = code.substring(0, 4);
                var html = "<option value=''>--请选择--</option>";
                $.each(pdata, function (idx, item) {
                    if (parseInt(item.level) == 2 && code == item.code.substring(0, 4)) {
                        html += "<option value=" + item.code + " >" + item.names + "</option> ";
                    }
                });
                $("#input_area ").append(html);
            });
        });
    </script>

</head>
<body>
    <div class="container">
<%--        加一行,并设置样式style--%>
        <div class="row" style="margin-top: 30px">
            <div class="col-md-12" style="text-align: center">
                <h3>修改用户</h3>
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

                <form class="form-horizontal" action="/userModify" method="post" >
                    <div class="form-group">
                        <label for="nickName" class="col-sm-2 control-label">昵称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nickName" name="nickName" value="${requestScope.user.nickName}">
<%--                            form有的信息一起带到后台去--%>
                            <input type="hidden" name="id" value="${requestScope.user.id}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="account" class="col-sm-2 control-label">账号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="account" name="account" value="${requestScope.user.account}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" value="${requestScope.user.password}">
                        </div>
                    </div>
<%--                    下拉菜单--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="male" value="true" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="female" value="false">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">手机号码:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phone" name="phone" value="${requestScope.user.phone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" value="${requestScope.user.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">出生日期:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="birthday" name="birthday" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"  value="${requestScope.user.birthday}" >
                        </div>
                    </div>


<%--封面TODO--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><i>*</i>出生地:</label>
                        <div class="col-sm-3">
                            <select name="input_province" id="input_province" class="form-control">
                                <option value="">--请选择--</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select name="input_city" id="input_city" class="form-control">
                                <option value=""></option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select name="input_area" id="input_area" class="form-control">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label for="birthplace" class="col-sm-2 control-label">出生地:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="text" class="form-control" id="birthplace" name="birthplace" placeholder="请输入出生地" value="${requestScope.user.birthplace}" >--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">自我介绍:</label>
                        <div class="col-sm-10">
                            <textarea id="description" name="description" style="resize: none;" class="form-control" rows="5" >${requestScope.user.description}"</textarea>
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
