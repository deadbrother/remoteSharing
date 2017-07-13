<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实体设置</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/entityAdd.js" type="text/javascript"></script>
</head>
<style>
select{
width:20px;
}

</style>
<body>
	<div align="center" id="form1">
		<input id="id" type="hidden" value="${entity.entity_id}">
		<table align="center">
				<tr>
					<td>数据源：</td>
					<td>
					 <select id="data_res_id"  value="${entity.data_res_id}" >
					 	 <option value='Null'>请选择数据源</option>
					 <c:forEach items="${dataResLsit}" var ="li" >
					 <option <c:if test="${entity.data_res_id eq li.data_res_id}">selected</c:if> value="${li.data_res_id}">${li.data_res_name}</option>
					 </c:forEach>
					 </select>
					 </td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="res_type_name">表名：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="entity_table"  type="text"
									class="ui-textbox l-text-field" 
									value="${entity.entity_table}">
								</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="res_type_name">实体名称：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="entity_name"  type="text"
									class="ui-textbox l-text-field" 
									value="${entity.entity_name}">
								</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="res_type_name">实体说明：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="entity_resume"  type="text"
									class="ui-textbox l-text-field" 
									value="${entity.entity_resume}">
								</div>
					</td>
				</tr>
		</table>
		<br/>
		<button  id="confirm" class="l-button l-button-brand btn_query">&nbsp;确认</button>
		<button  id="cancel" class="l-button l-button-brand btn_query">&nbsp;取消</button>
		</div>
</body>
<script type="text/javascript">
$(function ()
{
$("#form1").ligerForm({
	inputWidth: 135
});
});
//回显
 var data_res_id="${data_res_id.stutas}";
if(data_res_id!=null&&data_res_id.length>0){
	document.getElementById("data_res_id").value=data_res_id;  
} 
var entity_id = $("#id").val();
var action;
if(entity_id!=null&&entity_id!=""){
	 $("#id").attr("readOnly",true); 
	action="/epmwxwl/entity/update.do";
}else{
	action="/epmwxwl/entity/save.do";
}

</script>
</html>