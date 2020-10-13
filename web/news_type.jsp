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
        <jsp:param name="pageName" value="new_type" />
        <jsp:param name="item" value="query"/>
    </jsp:include>

    <div class="layui-body" style="background-color: #f1f2f7;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>新闻类别如下</legend>
            </fieldset>
            <%-- 表格 --%>
            <table class="layui-hide" id="type" lay-filter="type"></table>
            <%-- 头工具蓝 --%>
            <script type="text/html" id="toolbar">
                <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delSelect">删除选中行数据</button>
                <div id="search"
                     class="ayui-inline"
                     style="float: right; margin-right: 100px;" >
                    <input type="text"
                           name="typename"
                           style="width: 200px; height: 30px; float: left;"
                           placeholder="类别名称" autocomplete="off" class="layui-input">
                    <input type="text"
                           name="remark"
                           style="width:200px; height:30px; float: left; margin-left: 10px"
                           placeholder="备注信息" autocomplete="off" class="layui-input">
                    <button lay-event="search"
                            class="layui-btn layui-btn-sm"
                            style="margin-left: 10px;" >
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <button lay-event="reset"
                            class="layui-btn layui-btn-sm"
                            style="margin-left: 10px;" >
                        <i class="layui-icon layui-icon-refresh"></i>
                    </button>
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

<form id="news_type_edit" class="layui-form" style="display: none" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">类别名称</label>
        <div class="layui-input-block">
            <input type="text" name="typename" placeholder="类别名称" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注信息</label>
        <div class="layui-input-block">
            <textarea name="remark" placeholder="备注信息" class="layui-textarea"></textarea>
        </div>
    </div>
</form>

<script>
    layui.use('element', function(){
        let element = layui.element;
    });

    layui.use('table', function(){
        let table = layui.table;

        let option = {
            elem: '#type',
            toolbar: '#toolbar',
            url:'/news/news_type/findPage',
            where: {
                typename: '%',
                remark: '%'
            },
            page: {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'],
                curr: 1,
                groups: 5,
                first: true,
                last: true,
            },
            cols: [[
                {type:'checkbox'},
                {field:'typeid', title: '类别ID'},
                {field:'typename', title: '类别名称'},
                {field:'remark', title: '备注'},
                {fixed: 'right', title:'操作', toolbar: '#bar'}
            ]]
        }

        table.render(option);

        //头工具栏事件
        table.on('toolbar(type)', function(obj){
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

            if (obj.event === 'search') {
                let typename = $('#search>input[name="typename"]').val()
                let remark = $('#search>input[name="remark"]').val()

                option.where = {
                    typename,
                    remark
                }

                option.done = function(res, curr, count){
                    $('#search>input[name="typename"]').val(typename)
                    $('#search>input[name="remark"]').val(remark)
                }

                table.render(option);
            }

            if (obj.event === 'reset') {

                option.where = {
                    typename: '%',
                    remark: '%'
                }

                option.done = ()=> {}

                table.render(option);
            }
        });

        //监听行工具事件
        table.on('tool(type)', function(obj){
            let data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                    ajax.get('news_type/del?typeid='+data.typeid, null)
                });
            } else if(obj.event === 'edit'){
                $('#news_type_edit').find('[name="typename"]').val(data.typename)
                $('#news_type_edit').find('[name="remark"]').val(data.remark)

                layer.open({
                    type: 1,
                    title: '编辑',
                    content: $('#news_type_edit'),
                    area: ['50%', '50%'],
                    btn: ['确定', '取消'],
                    btn1: function (index, layero) {

                        ajax.post('news_type/update',{
                            typeid: data.typeid,
                            typename: $('#news_type_edit').find('[name="typename"]').val(),
                            remark: $('#news_type_edit').find('[name="remark"]').val()
                        }, function (resp) {

                        }, 'json')

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
