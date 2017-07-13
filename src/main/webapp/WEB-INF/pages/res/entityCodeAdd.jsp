<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<title>数据源类型 修改 添加</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css"rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/entityCodeAdd.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
	<style>
	.l-form {margin-top:20px;}
	.l-form button { margin-top: 180px;}
	   .ztree{ position: absolute;top: 145px;left: 100px;display:none;}
	   .btn_group{    position: relative;
    left: 88px;
    top: 100px;}
	</style>
</head>
<body>
	<div align="center" id="form1">
		<table align="center">
			<tr>
				<td>类型：</td>
				<td><select id="code_type_id">
						<option value='NULL'>请选择</option>
						<c:forEach items="${tlist}" var="i">
							<option
								<c:if test="${i.code_type_id eq entityCode.code_type_id}">selected</c:if>
								value="${i.code_type_id}">${i.code_type_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="l-filter-value"><label for="id">码表名称：</label></td>
				<td class="l-filter-value">
					<div class="l-text">
						<input id="code_name" name="code_name" type="text"
							class="ui-textbox l-text-field" value="${entityCode.code_name}">
					</div>
				</td>
			</tr>
			<tr>
				<td class="l-filter-value"><label for="id">码表说明：</label></td>
				<td class="l-filter-value">
					<div class="l-text">
						<input id="code_desc" name="code_desc" type="text"
							class="ui-textbox l-text-field" value="${entityCode.code_desc}">
					</div>
				</td>
			</tr>
			<tr>
				<td class="l-filter-value"><label for="parentTree">父码表：</label></td>
				<td class="l-filter-value">
						<input id="parentTree" type="text"
							class="ui-textbox l-text-field" value="${entityCode.parent_id}">
				</td>
			</tr>
		
		</table>
		</div>
	<div id="typeTree" class="ztree"></div>
	<div class="btn_group">
		<button id="confirm" class="l-button l-button-brand btn_query">&nbsp;确认</button>
		<button id="cancel" class="l-button l-button-brand btn_query">&nbsp;取消</button>
	</div>
	
		
</body>
<script type="text/javascript">
	$(function() {
		$("#form1").ligerForm({
			inputWidth : 135,
			height : 500
		});
	});
	var contextPath = "${pageContext.request.contextPath}";
	var tenant_id = "${entityCode.tenant_id}";
	var sort_num = "${entityCode.sort_num}";
	var code_id = "${entityCode.code_id}";
	var parentid ="";
	parentid = "${entityCode.parent_id}";
	if (code_id != null && code_id != "") {
		action = "/epmwxwl/entityCodeMessage/update";
	} else {
		action = "/epmwxwl/entityCodeMessage/save";
	}
	/* var treelist = strToJson('${JSONStr}');
	function strToJson(str) {
		var json = eval('(' + str + ')');
		return json;
	} */
</script>
</html>