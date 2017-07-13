<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css"rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css"rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/draw/huapeiadd.js"  type="text/javascript"></script>
<style>

.slds-form-element__label,.l-text{margin-bottom:20px;}
.l-button{width:100px;}
</style>
</head>
<body>
	<div id="form1" class="container" align="center">
		 <input type="hidden" value="${drawType.sort_num}" id="sort_num" /> 
		<table class="slds-table">
			<tr>
				<td ><label for="draw_type_id" class="slds-form-element__label">划配类型ID：</label></td>
				<td>
					<input id="draw_type_id" name="draw_type_id" type="text"
							class="ui-textbox" value="${drawType.draw_type_id }">
				</td>
			</tr>
			<tr>
				<td><label for="rowtypet_name" class="slds-form-element__label">划配类型名称：</label></td>
				<td>
					<input id="rowtypet_name" name="rowtypet_name" type="text" 
						class="ui-textbox" value="${drawType.rowtypet_name }">
				</td>
			</tr>
			<tr>
				<td><label for="resources_id" class="slds-form-element__label">划配资源：</label></td>
				<td><select id="resources_id" name="resources_id">
						<c:forEach items="${reList}" var="li">
							<option <c:if test="${drawType.resources_id eq li.res_id}">selected</c:if> value="${li.res_id}">${li.res_name}</option>
						</c:forEach>

					</select>
				</td>
			</tr>
			<tr>
				<td><label for="resp_id" class="slds-form-element__label">责任体：</label></td>
				<td><select id="resp_id" name="resp_id" >
						<c:forEach items="${reList}" var="li">
							<option <c:if test="${drawType.resp_id eq li.res_id}">selected</c:if> value="${li.res_id}">${li.res_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><label for="resume" class="slds-form-element__label">划配类型说明：</label></td>
				<td>
					<input id="resume" name="resume" type="text"
						class="ui-textbox" value="${drawType.resume}">
				</td>
			</tr>
			<tr>
				<td><label class="slds-form-element__label">状态：</label></td>
				<td>
					<select id="stutas" name="stutas" value="${drawType.stutas}">
						<option value="0">启用</option>
						<option value="1">停用</option>
					</select>
				</td>
			</tr>
		</table>
		<br />
		 <input type="button" id="confirm" class="l-button l-button-brand btn_query" value="&nbsp;确认"> 
		 <input type="button" id="cancel" class="l-button l-button-brand btn_query" value="&nbsp;取消">

	</div>
</body>
</html>