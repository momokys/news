<%--
  Created by IntelliJ IDEA.
  User: 77825
  Date: 2020/10/11
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <!-- jquery -->
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <link rel="stylesheet" href="./layui/css/layui.css" />
    <script src="./layui/layui.js"></script>
    <script src="js/util/ajax.js"></script>

    <style>
        .container {
            width: 340px;
            height: 300px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 15px;
            background-color: white;
        }
        .layui-form-item {
            position: relative;
        }
        .layui-form-item>input {
            padding-left: 25px;
        }
        .layui-form-item>i {
            position: absolute;
            top: 50%;
            left: 5px;
            transform: translateY(-50%);
        }

    </style>
</head>
<body style="background-color: #009688">
<div class="container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>欢迎登录-新闻管理系统</legend>
    </fieldset>
    <form id="login" class="layui-form" method="post" action="">
        <div class="layui-form-item ">
            <input type="text" name="username" lay-verify="username" placeholder="用户名" class="layui-input" />
            <i class="layui-icon layui-icon-username icon"></i>
        </div>
        <div class="layui-form-item">
            <input type="password" name="userpwd" lay-verify="userpwd" placeholder="密码" class="layui-input" />
            <i class="layui-icon layui-icon-password"></i>
        </div>
        <div class="layui-form-item">
            <button type="button" class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">立即登录</button>
        </div>
    </form>
</div>

<script>
    layui.use('form', function(){
        let form = layui.form;
        form.verify({
            username: function (value) {
                if (!/^\S{1,20}$/.test(value)) {
                    return '用户名为不能为空'
                }
            },
            userpwd: function (value) {
                if (!/^\w{6,12}$/.test(value)) {
                    return '密码不能为为空'
                }
            }
        })

        form.on('submit(login)', function(data){
            ajax.post('user/login', data.field, function (resp) {
                if (resp.code === 0) {
                    window.location.href = "/news/index.jsp"
                }
            }, 'json')
            return false;
        });
    });
</script>
</body>
</html>
