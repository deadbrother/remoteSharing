<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>划配机构树</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css"rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/wxwl/distribution/orgtree.js" type="text/javascript"></script>
<style>
.showData{
	position:absolute;
	top:200px;
	min-width:60px;
	display:none;
	
}
</style>
</head>
<body>
<div class="container" id="form1">
	<div id="TagTree" class="ztree"></div>
	<div id="treetest"></div>
</div>
<button class="showData l-button l-button-brand" style="left:800px;" ></button>
<button class="showData l-button l-button-brand" style="left:900px;"></button>
<button class="showData l-button l-button-brand" style="left:1000px;"></button>
</body>
</html>