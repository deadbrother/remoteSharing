<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源注册</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />	
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/resRegisterlist.js" type="text/javascript"></script>
<script type="text/javascript">
	var Data;
	var typeLayer;
	var manager;
	var status;
	function strToJson(str) {
		var json = eval('(' + str + ')');
		return json;
	}
	
</script>
<style>
.boxMenu {
	position: absolute;
	z-index: 10;
	background-color: white;
	border: solid 1px #ddd;
	width: 80px;
	height: 80px;
	padding-top: 5px;
	padding-left: 3px;
	display: none;
	box-shadow: 3px 3px 3px #aaa;
}
</style>
<body>
<div class="container">
 <div id="form1">
	<div class="container">
		<div class="slds-form-element">
			<label class="slds-form-element__label" for="res_name">资源名称：</label>
			<div class="slds-form-element__control">
				<input id="res_name" class="ui-textbox" type="text" />
			</div>
		</div>
		<div class="slds-form-element">
			<label class="slds-form-element__label" for="res_resume">资源说明：</label>
			<div class="slds-form-element__control">
				<input id="res_resume" class="ui-textbox" type="text" />
			</div>
		</div>
		<div class="slds-form-element">
			<button id="search-btn"  class="l-button l-button-brand btn_query">&nbsp;查询</button> 
		</div>
		<div class="slds-container--right slds-container--large" style="margin-top:14px;">
			<div class="slds-p-horizontal--small ">
				<div class="slds-container--right">
					<button class="l-button l-button-brand btn_add" id="registerbut">&nbsp;注册</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div id="maingrid"></div>
</div>
<div id="modifyMenu" class="boxMenu"></div>
</div>
</body>