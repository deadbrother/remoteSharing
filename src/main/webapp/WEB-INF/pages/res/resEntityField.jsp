<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源字段设置</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/wxwl/res/resEntityField.js" type="text/javascript"></script>
<script type="text/javascript">
	hideRMenu();
	var resId ='${resId}';
       $(function ()
       {
       	$("#form1").ligerForm();
       	$("#layout1").ligerLayout({ leftWidth: 1000 ,allowLeftCollapse:false,allowRightCollapse:false,allowLeftResize: false});
       });
       var manager;
       
</script> 
<style type="text/css">
body    { padding:10px; margin:10px;}
#layout1{    width:100%; margin:40px; 
			 height:400px;
              margin:0; padding:0;}      
 h4{ margin:20px;}
 td {padding: 5px;}
td button {padding: 5px;}
.btn_query:before {content: "\2601";}
.btn-move{width:30px;display:inline-block;}
#movetd{
	padding-left:300px;
} 
li{
cursor:pointer;
}
</style>
</head>
<body style="padding:10px">
<div class="container">
		<div align="right"><a href="../../resRegister/list">返回上一级</a></div>
        <div id="layout1">
             <div  position="left">
             <div id="form1">
	            	<table>
		            	<tr>
		            		<td><label for="entityId">实体选择：</label></td>
							<td>
								<select id="entityId">
								 <c:forEach items="${entityList}" var ="li" >
								 <option  value="${li.entity_id}">${li.entity_name}</option>
								 </c:forEach>
								</select>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
		            	<tr>
							<td><label for="field_name">字段名称：</label></td>
							<td><input id="field_name" type="text" class="ui-textbox" 
								></td>
							<td><label for="field_type">分类：</label></td>
							<td>
								<select id="field_type">
								 <option value="NULL">全部</option>
								 <c:forEach items="${entityTypeList}" var ="li" >
								 <option  value="${li.res_field_type_id}">${li.res_field_type_name}</option>
								 </c:forEach>
								</select>
							</td>
							<td><button id="search" class="l-button l-button-brand btn_query">&nbsp;查询</button></td>
							<td id="movetd"><input class="l-button l-button-brand btn-move" type="button"  value=">"></td>   
						</tr>
	            	</table>
            	</div>
            	<div id="maingrid">  </div>
             </div>
            <div position="center" title="分类">
            	<div id="typeTree" class="ztree"></div>
            </div>
        </div> 
    
<input id="resId" type="hidden" value="${resId }">
 <div id="rMenu" style="background:#F5F5F5; color:#000000 ;display:none;" >
	<ul>
		<li id="m_add" onclick="addTreeNode();">&nbsp;&nbsp;&nbsp;&nbsp;增加类型&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li id="m_update" onclick="updateTreeNode();">&nbsp;&nbsp;&nbsp;&nbsp;修改类型&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li id="m_del" onclick="removeTreeNode();">&nbsp;&nbsp;&nbsp;&nbsp;删除类型&nbsp;&nbsp;&nbsp;&nbsp;</li>
	</ul>
	</div>
</div>
</body>
</html>