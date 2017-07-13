<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<%@include file="head-js-css.jsp"%>
<script
	src="${pageContext.request.contextPath}/js/activity/activityPolicy-main.js"
	type="text/javascript"></script>
<script type="text/javascript"></script>
</head>
<style>
/* input.l-bar-button {
	line-height: 35px !important;
	height: 35px !important;
} */
</style>
<body>
	<div id="form3" class="container"
		style="margin-top:40px;width:80%;margin-left:8%;margin-right: auto;">
		<table>
			<tr>
				<td style="width:10%"><label class="slds-form-element__label"
					for="code_type_name">政策名称：</label></td>
				<td style="width:200px"><input id="policyName"
					class="slds-input" type="text" /></td>
				<td>&nbsp;&nbsp;&nbsp;
					<button id="search-tool-btn"
						class="slds-button slds-button--brand slds-size--2-of-16">
						<span style="color:white"
							class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;查询
					</button>
				</td>
			</tr>
		</table>
	
	<div class="slds-p-horizontal--small slds-size--1-of-1 "
		style="margin-top: 5px">
		<div class="slds-container--right slds-size--6-of-12">
			<input name="loginUserOrgPath" type="hidden" value="${bo.po.loginUserOrgPath}"/>
			<button id="add-tool-btn"
				class="slds-button slds-button--brand slds-size--2-of-16"
				type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-file"></span>&nbsp;新增
			</button>
            <button id="modify-tool-btn"
				class="slds-button slds-button--brand slds-size--2-of-16"
				type="primary">
				<span style="color:white"
					class="epm-icon glyphicon glyphicon-pencil"></span>&nbsp;修改
			</button>
             <button id="delete-tool-btn"
				class="slds-button slds-button--brand slds-size--2-of-16"
				type="primary">
				<span style="color:white"
					class="epm-icon glyphicon glyphicon-trash"></span>&nbsp;删除
			</button>
			<button id="details-tool-btn"
				class="slds-button slds-button--brand slds-size--4-of-16"
				type="primary">
				<span style="color:white"
					class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;查看详情
			</button>
		</div>
	</div>
	</div>
	<div class="slds-container--left slds-p-horizontal--small"
		style="width:90%;margin-left: 5%;margin-top: 15px">
		<div id="Policy"></div>
	</div>
	<div id="modifyMenu" class="boxMenu"></div>
	<!--[if IE 8]> 
 
 
 <style>
 button.slds-button{
	  line-height:32px!important;
	  height: 32px!important;
	    color: #fff;
	  background-color: #428bca;
	  border-color: #357ebd;
	  margin:15px 2px;
	}
 
</style>


 <![endif]-->
</body>
</html>
