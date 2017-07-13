<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>划配设置列表</title>
    <meta name="keywords" content="">  
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/wxwl/utils/constants.js"></script> 
	<script src="${pageContext.request.contextPath}/js/wxwl/utils/common.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/wxwl/distribution/distribution.js"></script>
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
#menuContent {display: none;z-index: 100;height:180px;position: absolute;overflow: auto;width:200px;border: 1px solid rgb(216, 221, 230);border-radius: 0.25rem;background-color: rgb(255, 255, 255);}
#menuContent div{font-weight: normal;padding: 0.3rem 0.5rem;}    
#TagTree{margin-top: 0; width: 144px; height: auto;}
.slds-select {
  background-color: white;
  color: #16325c;
  border: 1px solid #d8dde6;
    border-radius: 0.25rem;
  width: 60%;
  transition: border 0.1s linear, background-color 0.1s linear;
  height: calc(1.875rem + (1px * 2)); }
  .slds-select:focus, .slds-select:active {
    outline: 0;
    border-color: #1589ee;
    background-color: white;
    box-shadow: 0 0 3px #0070D2; }
  .slds-select[disabled], .slds-select.slds-is-disabled {
    background-color: #e0e5ee;
    border-color: #a8b7c7;
    cursor: not-allowed;
    user-select: none; }
    .slds-select[disabled]:focus, .slds-select[disabled]:active, .slds-select.slds-is-disabled:focus, .slds-select.slds-is-disabled:active {
      box-shadow: none; }
  .slds-select[size], .slds-select[multiple] {
    min-height: calc(1.875rem + (1px * 2));
    height: inherit; }
    .slds-select[size] option, .slds-select[multiple] option {
      padding: 0.5rem; }
  .slds-select_container {
    position: relative; }
    .slds-select_container .slds-select {
      -moz-appearance: none;
      -webkit-appearance: none;
      padding-left: 0.5rem;
      padding-right: 1.5rem; }
      .slds-select_container .slds-select::-ms-expand {
        display: none; }
    .slds-select_container:before, .slds-select_container:after {
      position: absolute;
      content: '';
      display: block;
      right: 0.5rem;
      width: 0;
      height: 0;
      border-left: 3px solid transparent;
      border-right: 3px solid transparent; }
    .slds-select_container:before {
      border-bottom: 5px solid #061c3f;
      top: calc((1.75rem / 2) - 6px); }
    .slds-select_container:after {
      border-top: 5px solid #061c3f;
      bottom: calc((1.75rem / 2) - 6px); }

</style>
</head>
<body>
	<div id="form1">
	<table>
			<tr>
				<td><label for="textbox1">划配机构：</label></td>
				<td>
				<div class="l-text" >
				<input id="orgOption" type="text" class="ui-textbox l-text-field" readonly="readonly" onclick=""/>
				</div>
				<input id="dept_id" type="hidden" value=""/>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</div>
	<div style="width: 100%;">
	<button class="l-button l-button-green btn_save" onclick="Rulebutton.doRule()" style="float: right">执行</button>
	<button class="l-button l-button-pink btn_open" onclick="Rulebutton.deleRule()" style="float: right">删除</button>
	<button class="l-button l-button-brand btn_add" onclick="Rulebutton.addclick()" style="float: right">新增</button>
	</div>
	<div id="maingrid" style="margin-top:40px">  </div>
	<script type="text/javascript">
	var jsonStr=strToJson('${jsonStr}');
	function strToJson(str){
	    var json = eval('(' + str + ')');
	    return json;
	}
	var Data={Rows:jsonStr};
	</script>
</body>
</html>