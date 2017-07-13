<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>划配设置列表</title>
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/wxwl/rule/rulesetlist.js"></script>
</head>
<body>
	<div id="form1" class="container">
		<table class="slds-table"> 
			<tr>
				<td><label for="selOption" class="slds-form-element__label">划配类型：</label></td>
				<td><input id="selOption" type="text" class="ui-textbox"/></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><button onclick='addRuleSet()' class="l-button l-button-brand btn_add">&nbsp;新增划配规则</button></td>
				</tr>
		</table>
	</div>
	<div class="container">
		<div id="maingrid">  </div>
	</div>
	<div id="modifyMenu" class="boxMenu"></div>
    <script type="text/javascript">
    var dtstr=strToJson('${dtstr}');
    dtstr = dtstr != null? dtstr:"";
	function strToJson(str){
	     var json = eval('(' + str + ')');
	     return json;
	}
    </script>
</body>
</html>