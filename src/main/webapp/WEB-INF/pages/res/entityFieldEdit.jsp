<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/res/entityFieldEdit.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
</head>
<style type="text/css">
#code_sql{
	width:133px;
	margin-top:5px;
}
</style>
<body>
<div align="center" id="form1">
		<table align="center">
				<tr>
					<td>码表类型：</td>
					
					 <td><select id="code_type_id">
						<option>请选择</option>
						<c:forEach items="${list}" var="i">
							<option
								<c:if test="${i.code_id eq entityField.code_type_id}">selected</c:if>
								value="${i.code_id}">${i.code_name}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr >
					<td><label for="code_sql">码表sql：</label></td>
					<td ><textarea id="code_sql"  class="ui-textarea">${entityField.code_sql}</textarea>
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
var field_id = "${entityField.field_id}";		
</script>
</html>