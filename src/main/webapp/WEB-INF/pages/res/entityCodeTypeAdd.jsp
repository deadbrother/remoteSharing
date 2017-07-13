<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>码表类型、修改、添加</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/entityCodeTypeAdd.js"></script>
</head>
<body>
	<div align="center" id="form1" style="padding-top:34px">
		<table align="center">
			<tr>
				<td class="l-filter-value"><label for="code_type_name">码表类型名称：</label></td>
				<td class="l-filter-value">
					<div class="l-text">
						<input id="code_type_name" name="code_type_name" type="text"
							class="ui-textbox l-text-field"
							value="${code.code_type_name}">
					</div>
				</td>
			</tr>
			<tr>
				<td><label for="code_type_desc">类型说明：</label></td>
				<td><textarea id="code_type_desc" name="code_type_desc" 
				           class="ui-textarea" >${code.code_type_desc}</textarea>
			</tr>
		</table>
		<br />
		<button id="confirm" class="l-button l-button-brand btn_query">&nbsp;确认</button>
		<button id="cancel" class="l-button l-button-brand btn_query">&nbsp;取消</button>
	</div>
<script type="text/javascript">
//回显
var code_type_id="${code.code_type_id}";
var tenant_id="${code.tenant_id}";
var sort_num="${code.sort_num}";
var code_type_name="${code.code_type_name}";
var code_type_desc="${code.code_type_desc}";
var action;
if(code_type_id!=null&&code_type_id!=""){
	action="${pageContext.request.contextPath}/entityCode/update";
}else{
	action="${pageContext.request.contextPath}/entityCode/add";
}
$(function ()
{
$("#form1").ligerForm({
	inputWidth: 135
});
});
</script>
</body>
</html>