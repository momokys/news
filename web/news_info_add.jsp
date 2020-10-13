<%@ page import="cn.momoky.news.service.NewsTypeService" %>
<%@ page import="cn.momoky.news.domain.NewsType" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统</title>
    <link rel="stylesheet" href="./layui/css/layui.css" />
    <script src="./layui/layui.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/util/ajax.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="./formwork/head.jsp" flush="true"/>

    <jsp:include page="./formwork/side.jsp" flush="true">
        <jsp:param name="pageName" value="new_info" />
        <jsp:param name="item" value="add"/>
    </jsp:include>

    <%
        NewsTypeService newsTypeService = new NewsTypeService();
        List<NewsType> typeList = newsTypeService.findAll();
    %>

    <div class="layui-body" style="background-color: #f1f2f7;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>新闻信息添加</legend>
            </fieldset>
            <form id="news_info_edit" class="layui-form" method="post" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">新闻标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="newstitle" placeholder="新闻标题" class="layui-input" />
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">新闻类别</label>
                    <div class="layui-input-block">
                        <select name="typeid">
                            <option value="">请选择新闻类别</option>

                            <%
                                for (NewsType newsType: typeList) {
                            %>

                            <option value="<%= newsType.getTypeid() %>"><%= newsType.getTypename() %></option>

                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新闻内容</label>
                    <div class="layui-input-block">
                        <textarea name="content" placeholder="请输入内容..." class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">关键字</label>
                    <div class="layui-input-block">
                        <input type="text" name="keyword" placeholder="关键字" class="layui-input" />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传图片</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn">添加</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        &copy;momoky.cn
    </div>
</div>


<script>
    layui.use('element', function(){
        let element = layui.element;
    });
</script>
<script>
    layui.use('form', function(){
        let form = layui.form;



    });
</script>
</body>
</html>
