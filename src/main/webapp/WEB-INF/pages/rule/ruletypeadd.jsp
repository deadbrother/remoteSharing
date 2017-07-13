<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/utils/common.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/rule/rule.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
</head>
<style>
</style>
<body>
<div align="center">
	<form id="rule"  method="post">
		<table style="width: 700px">
		<thead>
		<input type="hidden" id="doType" value="${doType}">
		<input type="hidden" id="rule_type_id" value="${rule_type_id}">
		<tr><th><font color="red" size="large">1.配置执行参数</font></th></tr>
		</thead>
				<tr>
					<td class="l-filter-value"><label for="id">划配类型：</label></td>
					<td class="l-filter-value">
					<input type="text" id="drsele">
					<input type="hidden" id="drseleid">
								
				              <%--   <c:forEach items="${drlist}" var="dr">
				                <option value="${dr.draw_type_id}">
				                ${dr.rowtypet_name}
				                </option>
				                </c:forEach> --%>
					</td>
					<td class="l-filter-value"><label for="id">当前租户：</label></td>
					<td class="l-filter-value">
							<input id="" name="" type="text" class="ui-textbox" 
									value="${tenant_name}" readonly>
								
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="res_type_name">规则名称：</label></td>
					<td class="l-filter-value">
								<div>
									<input id="ruleTypeName" name="res_type_name" type="text"
									class="ui-textbox" 
									value="">
								</div>
					</td>
					<td class="l-filter-value"><label for="sort">规则分类：</label></td>
					<td class="l-filter-value">
								<input type="text" id="rrsele">
								<input type="hidden" id="rrseleid">
								<%-- <c:forEach items="${rrlist}" var="rr">
				                <option value="${rr.res_type_id}">
				                ${rr.res_type_name} 
				                </option>
				                </c:forEach> --%>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="sort">条件：</label></td>
					<td class="l-filter-value">
					 <input type="button" style="width: 60px" class="l-button l-button-brand btn_query" id="ruleadd" value="&nbsp;条件">
					 <span id="ruleDesc"></span>
					 <input type="hidden" id="rulesql" value="">
					</td>
				</tr>
		</table>
		<br/>
			<table id="twoinfo" width="700px">
				<thead>
					<tr>
						<th><font color="red" size="large"><span>2.配置规则</span></font></th>
					</tr>
				</thead>
				<tr>
					<td align="right">
					 <input type="button" style="width: 60px" class="l-button l-button-brand btn_add" id="addFileds" value="&nbsp;新增分组">
					</td>
				</tr>
			</table>
		<br/>
		<div id="maingridarv"> </div>
		<div id="maingridfir"> </div>
		 <%--   	
		   <table id="arv" width="700px" border="1px">
		   <thead>
		   <th>分组名称</th>
		   <th>分组规则</th>
		   <th>分组规则(字段)</th>
		   <th>执行顺序</th>
		   <th>调整顺序</th>
		   <th>操作</th>
		   </thead>
		   <tbody id="arvtbody">
		    <c:if test="${doType=='save'}">
		    </c:if>
		    <c:if test="${doType='edit' }">
		    </c:if>
		   </tbody>
		   </table> --%>
			<!-- <button  type="button" id="confirm" class="l-button l-button-brand btn_query">&nbsp;确认</button>
		<button  type="submit" class="l-button l-button-brand btn_query">&nbsp;取消</button> -->
		</form>
		</div>
</body>
<script type="text/javascript">
</script>
</html>