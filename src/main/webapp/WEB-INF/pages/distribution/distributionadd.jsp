<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加用户划配规则</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/utils/constants.js"></script> 
<script src="${pageContext.request.contextPath}/js/wxwl/utils/common.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/distribution/distributionadd.js"></script> 
<style type="text/css">
		.tdwidth{
			width:200px;
		}
		body{
		margin-top: 10px;
		}
#menuContent {display: none;z-index: 100;height:180px;position: absolute;overflow: auto;width:200px;border: 1px solid rgb(216, 221, 230);border-radius: 0.25rem;background-color: rgb(255, 255, 255);}
#menuContent div{font-weight: normal;padding: 0.3rem 0.5rem;}    
#TagTree{margin-top: 0; width: 144px; height: auto;}
	</style>
</head>
<body>
	<div align="center" style="padding-top:30px">
		<form id="addForm">
			<table align="center">
				<input type="hidden" value="${doType}" id="doType"/>
			<input type="hidden" value="${dept_id }" id="parentorgid"/>
				<tr id="data_res_id_tr">
					<td class="l-filter-value"><label>规则名称：</label></td>
					<td class="l-filter-value tdwidth">
						<div class="l-text" >
							<input id="clientsetname" name="clientsetname" type="text" class="ui-textbox l-text-field" value="${roleSet.clientsetname}">
						</div>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>用户筛选：</label></td>
					<td class="l-filter-value tdwidth">
					<input type="button" onclick="RuleButton.click()" value="条件" id="dorule" />
					<input type="hidden"  id="cond_resume" name="cond_resume" value="${roleSet.cond_resume }"/>
					<input type="hidden"  id="cond_sql" name="cond_sql" value="${roleSet.cond_sql }"/>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>目标部门：</label></td>
					<td class="l-filter-value tdwidth">
						<div class="l-text" >
						<input type="text"  id="target_dept_name" readonly="readonly" onclick="option.showMenu()" class="ui-textbox l-text-field"  value="">
						</div>
						<input type="hidden" name="target_dept_id" id="target_dept_id"  value="${roleSet.target_dept_id }">
						<div id="menuContent" class="menuContent" >
							<div>选择部门</div>
							<ul id="orgTree" class="ztree" ></ul>
						</div>
					</td>
				</tr>
				<tr id="tenant_id">
					<td class="l-filter-value"><label>划配规则：</label></td>
					<td class="l-filter-value tdwidth">
						<div class="l-text" >
						<input type="text" name="rule_type_name" id="rule_type_name" class="ui-textbox l-text-field" value="${roleSet.rule_type_name }">
						</div>
						<input type="hidden" name="rule_type_id" id="rule_type_id" value="${roleSet.rule_type_id }"/>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label>规则说明：</label></td>
					<td class="l-filter-value">
						<div class="" >
							<textarea rows="3" cols="23" id="resume" name="resume"></textarea>
						</div>
					</td>
				</tr>
		</table>
			<br/>
		</form>
	</div>
</body>
</html>