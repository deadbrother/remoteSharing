<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据源类型 修改 添加</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/dataResTypeAdd.js" type="text/javascript"></script>
</head>
<style type="text/css">
#data_driver{
	width:135px;
	height :40px;
	margin-top:5px;
}

</style>
<body>
<div align="center" id="form1">
		<table align="center">
				<tr>
					<td>数据源分类：</td>
					<td>
					 <select id="res_type">
							<option value="0">oracle</option>
							<option value="1">XCloud</option>
					 </select>
					 </td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="id">编号：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="id" name="data_res_type_id" type="text" 
									class="ui-textbox l-text-field" 
									value="${res.data_res_type_id}">
								</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="res_type_name">类型名称：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="data_res_type_name" name="data_res_type_name" type="text"
									class="ui-textbox l-text-field" 
									value="${res.data_res_type_name}">
								</div>
					</td>
				</tr>
				
				<!-- <tr>
					<td>状态：</td>
					<td>
					 <select id="data_stutas" name="data_stutas" >
							<option value="0">启用</option>
							<option value="1">停用</option>
					 </select>
					 </td>
				</tr> -->
				<tr>
					<td>状态：</td>
					<td>
					 <select id="data_stutas">
							<option value="0">启用</option>
							<option value="1">停用</option>
					 </select>
					 </td>
				</tr>
				<tr >
					<td><label for="data_driver">数据源驱动：</label></td>
					<td ><textarea id="data_driver"  class="ui-textarea">${res.data_driver}</textarea>
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
var sort_num ="${res.sort_num}";
var tenant_id = "${res.tenant_id}";
var res_type="${res.res_type}";
var resume = "${res.resume}";
var data_stutas="${res.data_stutas}";
if(res_type!=null&&res_type.length>0){
	document.getElementById("res_type").value=res_type;  
} 
if(data_stutas!=null&&data_stutas.length>0){
	document.getElementById("data_stutas").value=data_stutas;  
}
var data_res_type_id = $("#id").val();
var action;
if(data_res_type_id!=null&&data_res_type_id!=""){
	$("#id").attr("readonly",true); 
	action="/epmwxwl/dataResType/update";
}else{
	action="/epmwxwl/dataResType/save";
}
</script>
</html>