<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/ruleTypeAdd.js" type="text/javascript"></script>
</head>
<style>
select{
width:20px;
}

</style>
<body>
	<div align="center" id="form1">
		<table align="center">
				<tr>
					<td class="l-filter-value"><label for="id">编号：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="id" name="res_type_id" type="text"
									class="ui-textbox l-text-field" 
									value="${res.res_type_id}">
								</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="res_type_name">类型名称：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="res_type_name" name="res_type_name" type="text"
									class="ui-textbox l-text-field" 
									value="${res.res_type_name}">
								</div>
					</td>
				</tr>
				<tr>
					<td>状态：</td>
					<td>
					 <select id="stutas" name="stutas" >
							<option value="0">正常</option>
							<option value="1">停用</option>
					 </select>
					 </td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="sort">序号：</label></td>
					<td class="l-filter-value">
								<div class="l-text" >
									<input id="sort" name="sort_num" type="text"
									class="ui-textbox l-text-field" 
									onkeyup="change(document.getElementById('sort').value)"
									value="${res.sort_num}">
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
//回显
var sta="${res.stutas}";
if(sta!=null&&sta.length>0){
	document.getElementById("stutas").value=sta;  
}
//document.getElementById("stutas")[${res.stutas}].selected= true;  
var res_type_id = $("#id").val();
var str=$("#sort").val();
str=str.replace(/\D/gi,"");
var action;
if(res_type_id!=null&&res_type_id!=""){
	 $("#id").attr("readOnly",true); 
	action="/epmwxwl/resRuleType/update.do";
}else{
	action="/epmwxwl/resRuleType/save.do";
}
$(function ()
{
$("#form1").ligerForm({
	inputWidth: 135
});
});
</script>
</html>