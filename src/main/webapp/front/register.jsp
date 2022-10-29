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
    <title>前台用户注册页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/js/jquery-3.6.0.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/My97DatePicker/WdatePicker.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/address.js"></script>
    <script>
        function validate(){
            //获取手机号码的控件
            let phoneTag = $("#phone")
            //写合法手机正则表达式。
            let phoneRegex =/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/
            let phoneMatchResult = phoneRegex.test(phoneTag.val())
            if(!phoneMatchResult){
                alert("请输入正确的手机号码格式")
                phoneTag.val('')
                phoneTag.focus()
                return false
            }
            //获取邮箱号码的控件
            let emailTag = $("#email")
            //写合法邮箱正则表达式。
            let emailRegex =/^(\w+([-.][A-Za-z0-9]+)*){3,18}@\w+([-.][A-Za-z0-9]+)*\.\w+([-.][A-Za-z0-9]+)*$/
            let emailMatchResult = emailRegex.test(emailTag.val())
            if(!emailMatchResult){
                alert("请输入正确的邮件格式")
                emailTag.val('')
                emailTag.focus()
                return false
            }

            return true
        }
        function keyvalid() {
            var pw1 = document.getElementById("password").value;
            var pw2 = document.getElementById("repassword").value;
            if(pw1 == pw2) {
                document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
                document.getElementById("submit").disabled = false;
            }
            else {
                document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
                document.getElementById("submit").disabled = true;
            }
        }

    //    失去光标
        $(function (){
            $("#account").blur(function () {
                console.log("失去光标了。")
                $.post(
                    "/userCheckAccount",
                    {'account': $("#account").val(),'time':new Date()},
                    function (data){
                        console.log(data)
                        if (data =='true'){
                            alert($("#account").val()+'已经被注册过了！')
                            $("#account").val('')//清理值
                            $("#account").focus()

                        }
                    }
                )

            })

        })

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

    <style>
        body{
            background-image:url('/imags/register.png');
            background-repeat:no-repeat ;
            background-size:100% 100%;
            margin-top: 5%;

            background-attachment: fixed;
        }

    </style>

</head>
<body>
    <div class="container">
<%--        加一行,并设置样式style--%>
        <div class="row" style="margin-top: 30px">
            <div class="col-md-12" style="text-align: center">
                <h3>用户注册</h3>
<%--                ${requestScope.videoList}--%>
            </div>
        </div>

<%--响应式布局，任意的都分成12列，为了居中选择中间4列，左边做4个字节，右边做8个字节--%>
        <div class="row" style="margin-top: 20px">
            <div class="col-md-1">
<%--                留两块不要那么挤--%>
            </div>
            <div class="col-md-10">
<%--                视频添加，enctype修改,文本格式是默认，因为此用二进制方式传--%>

                <form class="form-horizontal" action="/userAdd" method="post" enctype="multipart/form-data" onsubmit="validate()">
                    <div class="form-group">
                        <label for="nickName" class="col-sm-2 control-label"><i>*</i>昵称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nickName" name="nickName" placeholder="请输入您的昵称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="account" class="col-sm-2 control-label"><i>*</i>账号:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="account" name="account" placeholder="请输入账号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label"><i>*</i>密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="repassword" class="col-sm-2 control-label">确认密码:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="password" class="form-control" id="repassword" name="repassword" placeholder="请确认您的密码">--%>
<%--                            <span id="password_err" style="color: #FF2F2F">${msg1}</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="form-group">
                        <label for="repassword" class="col-sm-2 control-label"><i>*</i>确认密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="repassword" onkeyup="keyvalid()" placeholder="请再次输入密码">
                            <span id="tishi"></span>
                        </div>
                    </div>
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
                        <label for="phone" class="col-sm-2 control-label"><i>*</i>手机号码:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入手机号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label"><i>*</i>Email:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" placeholder="请输入电子邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="col-sm-2 control-label">出生日期:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="birthday" name="birthday" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"  placeholder="请输入出生日期" readonly="readonly">
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label class="col-sm-2 control-label">兴趣:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest1" name="interest" value="1" checked="checked">编程--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest2" name="interest" value="2">音乐--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest3" name="interest" value="3">美食--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest4" name="interest" value="4">电影--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest5" name="interest" value="5">游戏--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest6" name="interest" value="6">旅游--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest7" name="interest" value="7">运动--%>
<%--                            </label>--%>
<%--                            <label class="checkbox-inline">--%>
<%--                                <input type="checkbox" id="interest8" name="interest" value="8">阅读--%>
<%--                            </label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="email" class="col-sm-2 control-label">籍贯:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <select class="form-control" name="birthplace">--%>
<%--                                <option value="0">=请选择=</option>--%>
<%--                                <option value="1">南京</option>--%>
<%--                                <option value="2">镇江</option>--%>
<%--                                <option value="3">常州</option>--%>
<%--                                <option value="4">无锡</option>--%>
<%--                                <option value="5">苏州</option>--%>
<%--                                <option value="6">扬州</option>--%>
<%--                                <option value="7">南通</option>--%>
<%--                                <option value="8">宿迁</option>--%>
<%--                                <option value="9">淮安</option>--%>
<%--                                <option value="10">泰州</option>--%>
<%--                                <option value="11">盐城</option>--%>
<%--                                <option value="12">徐州</option>--%>
<%--                                <option value="13">连云港</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"><i>*</i>所在地址</label>
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
<%--                            <input type="text" class="form-control" id="birthplace" name="birthplace" placeholder="请输入出生地">--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">自我介绍:</label>
                        <div class="col-sm-10">
                            <textarea id="description" name="description" style="resize: none;" class="form-control" rows="5" placeholder="随便留下点什么吧..."></textarea>
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="coverPath" class="col-sm-2 control-label">封面:</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="file" class="form-control" id="coverPath" name="coverPath" >--%>
<%--                        </div>--%>
<%--                    </div>--%>


                    <div class="form-group">
                        <div class="col-md-4"></div>
                        <div class="col-md-4" style="text-align: center">
                            <input class="btn btn-success" type="submit" value="注册"/>
                            <input class="btn btn-info" style="margin-left: 20px" type="reset" value="重置"/>
                            <input class="btn btn-primary" style="margin-left: 20px" type="button" value="返回" onclick="history.back()"/>
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
