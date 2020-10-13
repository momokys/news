<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>新闻管理系统</title>
  <link rel="stylesheet" href="../layui/css/layui.css" />
  <script src="../layui/layui.js"></script>
  <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="../js/util/ajax.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <jsp:include page="../formwork/head.jsp" flush="true"/>

  <jsp:include page="../formwork/head.jsp" flush="true">
    <jsp:param name="pageName" value="new_type" />
  </jsp:include>

  <div class="layui-body" style="background-color: #f1f2f7;">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">

    </div>
  </div>

  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © momoky.cn
  </div>
</div>


<script>
  layui.use('element', function(){
    let element = layui.element;

  });
</script>


</body>
</html>
