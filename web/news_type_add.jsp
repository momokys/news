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
        <jsp:param name="pageName" value="new_type" />
        <jsp:param name="item" value="add"/>
    </jsp:include>

    <div class="layui-body" style="background-color: #f1f2f7;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>新闻类别添加</legend>
            </fieldset>
            <form id="news_type_edit" class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">类别名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="typename" lay-verify="required" placeholder="类别名称" class="layui-input"  />
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">备注信息</label>
                    <div class="layui-input-block">
                        <textarea name="remark" lay-verify="remark" placeholder="备注信息" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="add" >添加</button>
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

    layui.use('form', function(){
        let form = layui.form;

        form.verify({
            typename: [/^.+$/, '类别名称为必填项'],
            remark: [/^.+$/, '备注不能为为必填项']
        })

        form.on('submit(add)', function(data){
            ajax.post('news_type/add', data.field, function (resp) {

            }, 'json')
            return false;
        });
    });

</script>


</body>
</html>
