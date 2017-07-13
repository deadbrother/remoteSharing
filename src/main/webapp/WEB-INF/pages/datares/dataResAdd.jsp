<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加数据源</title>
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
	<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
	<script src="${pageContext.request.contextPath}/js/wxwl/datares/dataResAdd.js" type="text/javascript"></script>
	<style type="text/css">
.tdwidth{width:150px;}
	</style>
</head>
<body>
	<div align="center" style="padding-top:30px">
		<form id="addForm">
				<input type="hidden" name="sort_num" id="sort_num" value="${dataRes.sort_num}"/>
			<table align="center">
				<tr id="data_res_id_tr">
					<td class="l-filter-value"><label>数据源编号：</label></td>
					<td class="l-filter-value tdwidth">
						<div class="l-text" >
							<input id="data_res_id" name="data_res_id" type="text" class="ui-textbox l-text-field" value="${dataRes.data_res_id}">
						</div>
					</td>
					<td class="l-filter-value"><label>数据源名称：</label></td>
					<td class="l-filter-value">
						<div class="l-text" >
							<input id="data_res_name" name="data_res_name" type="text" class="ui-textbox l-text-field" value="${dataRes.data_res_name}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>数据源说明：</label></td>
					<td class="l-filter-value tdwidth">
						<div class="l-text" >
							<input id="data_res_desc" name="data_res_desc" type="text" class="ui-textbox l-text-field" value="${dataRes.data_res_desc}">
						</div>
					</td>
					 <td><label for="textbox1">类型：</label></td>
					 <td colspan="2">
					 	<select id="dataType">
					 	 <c:forEach items="${drtList}" var ="li" >
					 	 	<option  value="${li.id}">${li.text}</option>
					 	 </c:forEach>
					 	</select>
					 </td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>数据源地址：</label></td>
					<td class="l-filter-value" colspan="4">
							<textarea rows="2" cols="70" id="data_res_url" name="data_res_url">${dataRes.data_res_url}</textarea>
					</td>
				</tr>
				<tr id="tenant_id">
					<td class="l-filter-value"><label>数据库用户：</label></td>
					<td class="l-filter-value">
						<div class="l-text" >
							<input name=tenant_id type="text" class="ui-textbox l-text-field" value="${dataRes.tenant_id}" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>数据库说明：</label></td>
					<td class="l-filter-value" colspan="4">
						<div class="" >
							<textarea rows="2" cols="70" id="resume" name="resume">${dataRes.resume}</textarea>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="l-filter-value"><label>用户名：</label></td>
					<td class="l-filter-value">
						<div class="l-text" >
							<input id="username" name="username" type="text" class="ui-textbox l-text-field" value="${dataRes.username}">
						</div>
					</td>
					<td class="l-filter-value"><label>密码：</label></td>
					<td class="l-filter-value">
						<div class="l-text" >
							<input id="password" name="password" type="password" class="ui-textbox l-text-field" value="${dataRes.password}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>状态：</label></td>
					<td class="l-filter-value">
						<div>
							<select id="data_status" name="data_status" value="${dataRes.data_status}" class="">
								<option value="0">启用</option>
								<option value="1">停用</option>
					 		</select>
						</div>
					</td>
				</tr>
		</table>
			<br/>
		<button  id="addBtn" class="l-button l-button-brand btn_query">&nbsp;确认</button>
		<button  id="cancel" class="l-button l-button-brand btn_query">&nbsp;取消</button>
		</form>
	</div>
</body>
</html>