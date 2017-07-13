<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>码表类型</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/entityCodeTypelist.js" type="text/javascript"></script>
<script type="text/javascript">
var typeLayer;
var manager;
 function strToJson( str )
 {
 var json = eval('(' + str + ')');
 	return json;
 } 
</script>
</head>
<body>
 <div id="form1" class="container">
		<div class="slds-form-element">
			<label class="slds-form-element__label" for="code_type_name">类型名称：</label>
			<div class="slds-form-element__control">
				<input id="code_type_name" class="ui-textbox" type="text" />
			</div>
		</div>
		<div class="slds-form-element">
			<button id="search-tool-btn"  class="l-button l-button-brand btn_query">&nbsp;查询</button> 
		</div>
		<div class="slds-container--right slds-container--large" style="margin-top:14px;">
			<div class="slds-p-horizontal--small ">
				<div class="slds-container--right">
					<button class="l-button l-button-brand btn_add" id="addbutton">&nbsp;新增</button>
				</div>
			</div>
		</div>
	</div>
<div class="container">
	<div id="maingrid"></div>
</div>
<div id="modifyMenu" class="boxMenu"></div>
</body>
</html>