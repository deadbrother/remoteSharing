<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>话术变量维护</title>
<%@include file="head-js-css.jsp"%>
<script src="../js/activity/huashu-main.js" type="text/javascript"></script>
</head>
<body>
<div id="form1" class="container"  style="margin-top: 40px">
        <table  width="450px">
        <tr>
        <td style="width: 100px">
         <label  for="code_type_name">&nbsp;&nbsp;&nbsp;变量名称：</label>
        </td>
        <td>
		<span class="slds-grid slds-size--2-of-8"> <input  id="huahsuName" name='name' class="slds-input" type="text" />
        </span>
        </td>
        <td style="width: 100px">
		<button id="search-tool-btn"
			class="slds-button slds-button--brand slds-size--2-of-16">
			<span style="color:white"
				class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;查询
		</button>
		</td>
		<td style="width: 100px">
		<button id="add-tool-btn"
			class="slds-button slds-button--brand slds-size--2-of-16">
			<span style="color:white" class="epm-icon glyphicon glyphicon-file"></span>&nbsp;新增
		</button>
		</td>
		<td  style="width:100px">
		<button id="modify-tool-btn"
			class="slds-button slds-button--brand slds-size--2-of-16">
			<span style="color:white" class="epm-icon glyphicon glyphicon-pencil"></span>&nbsp;修改
		</button>
		</td>
		<td  style="width:100px">
		<button id="delete-tool-btn"
			class="slds-button slds-button--brand slds-size--2-of-16">
			<span style="color:white" class="epm-icon glyphicon glyphicon-trash"></span>&nbsp;删除
		</button>
		</td>
		<tr>
        </table>
	</div>
<div class="slds-container--left slds-p-horizontal--small"
		style="width:100%;margin-top:30px" >
		<div id="huashu" class=""></div>
	</div>
</body>
</html>