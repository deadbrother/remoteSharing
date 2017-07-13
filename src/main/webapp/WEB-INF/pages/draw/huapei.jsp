<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类信息</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/draw/huapei.js" type="text/javascript"></script>
<script type="text/javascript">
	/* var Data; */
	var typeLayer;
	var manager;
	/* var list = strToJson('${jslist}');
	Data = {
		Rows : list
	}; */
	var dtstr = strToJson('${dtstr}');
	function strToJson(str) {
		var json = eval('(' + str + ')');
		return json;
	}
</script>
<body>
	<div class="container" id="form1">
		<table class="slds-table">
			<tr>
				<td><label for="draw_type_id" class="slds-form-element__label">ID：</label></td>
				<td><input id="draw_type_id" type="text" class="ui-textbox" /></td>

				<td><label for="rowtypet_name" class="slds-form-element__label">名称：</label></td>
				<td><input id="rowtypet_name" type="text"
					class="ui-textbox" /></td>

				<td><label for="resources_id" class="slds-form-element__label">资源：</label></td>
				<td><input id="resources_id" type="text"  class="ui-textbox"/></td>


				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>

				<td><input class="l-button l-button-brand btn_query"
					type="button" id="search-btn" value="&nbsp;&nbsp;查询 &nbsp;"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>

				<td><button class="l-button l-button-brand btn_add"
						id="addType">&nbsp;新增类型</button></td>
			</tr>
		</table>
	</div>
	<div class="container">
		<div id="maingrid"></div>
	</div>
	<div id="modifyMenu" class="boxMenu"></div>
</body>