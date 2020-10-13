<%@ page import="cn.momoky.news.domain.NewsType" %>
<%@ page import="cn.momoky.news.service.NewsTypeService" %>
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
    <script src="js/util/ajax.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="formwork/head.jsp" flush="true"/>

    <jsp:include page="formwork/side.jsp" flush="true">
        <jsp:param name="pageName" value="new_info" />
        <jsp:param name="item" value="query"/>
    </jsp:include>

    <%
        NewsTypeService newsTypeService = new NewsTypeService();
        List<NewsType> typeList = newsTypeService.findAll();
    %>

    <div class="layui-body" style="background-color: #f1f2f7;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>新闻信息如下</legend>
            </fieldset>
            <%-- 表格 --%>
            <table class="layui-hide" id="info" lay-filter="info"></table>
            <%-- 头工具蓝 --%>
            <script type="text/html" id="toolbar">
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-sm" lay-event="delSelect">删除选中行数据</button>
                    <button class="layui-btn layui-btn-sm" lay-event="query">查询数据</button>
                </div>
            </script>
            <%-- 行工具 --%>
            <script type="text/html" id="bar">

                <a class="layui-btn layui-btn-xs" lay-event="edit">
                    <i class="layui-icon layui-icon-edit"></i>
                </a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
                    <i class="layui-icon layui-icon-delete"></i>
                </a>
            </script>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        &copy;momoky.cn
    </div>
</div>


<form id="news_info_edit" class="layui-form" lay-filter="edit" style="display: none;padding: 15px;" method="post" action="">
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
</form>

<script>
    layui.use('element', function(){
        let element = layui.element;

    });

    layui.use(['table', 'form'], function(){
        let table = layui.table;

        let form = layui.form;

        table.render({
            elem: '#info',
            toolbar: '#toolbar',
            url:'/news/news_info/find',
            page: {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'],
                curr: 1,
                groups: 5,
                first: true,
                last: true,
            },
            cols: [[
                {type: 'checkbox'},
                {field: 'newsid', title: '新闻ID'},
                {field: 'newstitle', title: '标题'},
                {field: 'typeid', title: '类别ID', hide: true},
                {field: 'typename', title: '类别'},
                {field: 'newstime', title: '发表时间'},
                {field: 'uid', title: '作者ID', hide: true},
                {field: 'username', title: '作者'},
                {field: 'click', title: '点击数'},
                {field: 'content', title: '内容'},
                {field: 'picpath', title: '封面'},
                {field: 'keyword', title: '关键字'},
                {fixed: 'right', title:'操作', toolbar: '#bar'}
            ]]
        });

        //头工具栏事件
        table.on('toolbar(info)', function(obj){
            let checkStatus = table.checkStatus(obj.config.id);
            if (obj.event === 'delSelect') {
                layer.confirm('真的删除行么', function(index) {
                    let data = checkStatus.data
                    for (let i = 0;i < data.length;i++) {
                        ajax.get('news_type/del?typeid='+data[i].typeid, null)
                    }
                    obj.del()
                    layer.close(index);
                });
            }
        });

        //监听行工具事件
        table.on('tool(info)', function(obj){
            let data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                    ajax.get('news_type/del?typeid='+data.typeid, null)
                });
            } else if(obj.event === 'edit'){

                form.val("edit", {
                    "newstitle": data.newstitle,
                    "content": data.content,
                    "typeid": data.typeid,
                    "keyword": data.keyword,
                });

                layer.open({
                    type: 1,
                    title: '编辑',
                    content: $('#news_info_edit'),
                    area: ['80%', '90%'],
                    btn: ['确定', '取消'],
                    btn1: function (index, layero) {

                        obj.update({
                            typename: layero.find('[name="typename"]').val(),
                            remark: layero.find('[name="remark"]').val()
                        })
                        layer.close(index)
                    },
                    btn2: function (index, layero) {
                        layer.close(index)
                    }
                })
            }
        });
    });
</script>



</body>
</html>
