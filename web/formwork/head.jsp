<%@ page import="cn.momoky.news.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: 77825
  Date: 2020/10/11
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User)(session.getAttribute("user"));
%>

<div class="layui-header">
    <div class="layui-logo">新闻管理系统</div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                <%= user == null ? "请登录":user.getUsername() %>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
</div>
