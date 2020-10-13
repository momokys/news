<%--
  Created by IntelliJ IDEA.
  User: 77825
  Date: 2020/10/11
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String pageName = request.getParameter("pageName");
    String item = request.getParameter("item");
%>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree">

            <li class="layui-nav-item <%= pageName.equals("new_type") ? "layui-nav-itemed":"" %>">
                <a class="" href="javascript:;">
                    <i class="layui-icon layui-icon-note"></i>
                    新闻类别管理
                </a>
                <dl class="layui-nav-child">
                    <dd class="<%= pageName.equals("new_type")&&item.equals("query") ? "layui-this":"" %>"  >
                        <a href="<%= request.getContextPath() %>/news_type.jsp">新闻类别查询</a>
                    </dd>
                    <dd class="<%= pageName.equals("new_type")&&item.equals("add") ? "layui-this":"" %>" >
                        <a href="<%= request.getContextPath() %>/news_type_add.jsp">新闻类别添加</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item <%= pageName.equals("new_info") ? "layui-nav-itemed":"" %>">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-read"></i>
                    新闻信息管理
                </a>
                <dl class="layui-nav-child">
                    <dd class="<%= pageName.equals("new_info")&&item.equals("query") ? "layui-this":"" %>">
                        <a href="<%= request.getContextPath() %>/news_info.jsp">新闻信息查询</a>
                    </dd>
                    <dd class="<%= pageName.equals("new_info")&&item.equals("add") ? "layui-this":"" %>">
                        <a href="<%= request.getContextPath() %>/news_info_add.jsp">新闻信息添加</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-dialogue"></i>
                    评论管理
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">评论查询</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon ayui-icon-user"></i>
                    用户信息管理
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">用户信息查询</a></dd>
                    <dd><a href="javascript:;">用户信息维护</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
