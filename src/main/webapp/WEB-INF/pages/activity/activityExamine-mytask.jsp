<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title> 

<%@include file="head-js-css.jsp" %>
<script src="../js/activity/activityExamine-daibantask.js" type="text/javascript"></script>
<script type="text/javascript">
var typeLayer;
var managerdaiban;
 function strToJson( str )
 {
 var json = eval('(' + str + ')');
 	return json;
 } 
</script>
<style>
table input[type="checkbox"], table input[type="radio"]{
	width:13px;
}
</style>
</head>
<body>
 <input type="hidden" name="" id="classLevel" value="${bo.po.orgLevel}"/>
 <input type="hidden" name="bo.po.examineDetailCheck" id="examineDetail" value="1"/>
 <div id="form2" class="container" style="margin-top:40px;width:100%;margin-left: 50px">
		<div class="slds-form-element" >
			<label  for="code_type_name">活动名称：</label>
			<div class="slds-form-element__control">
				<input id="activityName" class="ui-textbox" type="text" />
			</div>
		</div>		
		   <button  id="search-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" style="margin-left: 60%">
				<span style="color:white" class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;查询
			</button>	
</div>
<div class="slds-container--left slds-p-horizontal--small" style="width:100%;margin-top: 35px;">
	<div id="examineiddaiban"></div>
</div>
<div id="modifyMenu" class="boxMenu"></div>
</body>
</html>