<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<title>实体设置分类</title>
<link
	href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.3.2.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script
	src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
</head>
<body>
	<div align="center" id="form1">
		<table align="center">
			<tr>
				<td class="l-filter-value"><label for="id">字段类型名称：</label></td>
				<td class="l-filter-value">
					<div class="l-text">
						<input id="field_type_name" name="code_name" type="text"
							class="ui-textbox l-text-field" value="${resFieldType.res_field_type_name}">
					</div>
				</td>
			</tr>
		</table>
			<br/>
			<br/>
	<button id="confirm" class="l-button l-button-brand btn_query">&nbsp;确认</button>
	<button id="cancel" class="l-button l-button-brand btn_query">&nbsp;取消</button>
	</div>
	<input id="field_type_id"  type="hidden" value="${resFieldType.res_field_type_id}">
</body>
<script type="text/javascript">
	$(function() {
		$("#form1").ligerForm({
			inputWidth : 135,
			height :200
		});
	});
	$("#confirm").click(function() {
	var field_type_name = $("#field_type_name").val();
	var field_type_id = $("#field_type_id").val();
	if(field_type_id!=null && field_type_id.length>0){
		parent.updateEntityFieldTypeName(field_type_id,field_type_name);	
	}else{
		parent.saveEntityFieldTypeName(field_type_name);
	}
	});
	$("#cancel").click(function() {
	parent.closeDilog();
	});
</script>
</html>