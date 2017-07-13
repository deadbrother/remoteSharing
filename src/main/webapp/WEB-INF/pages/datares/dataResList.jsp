<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据源</title>     
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/wxwl/datares/dataResList.js" type="text/javascript"></script>
    <script type="text/javascript">
      var  Data ;
	  var typeLayer;
	  var manager;
    </script>
<body>
	<div id="form1" class="container">
		<table class="slds-table">
			<tr>
				<td><label for="dataId" class="slds-form-element__label">编号：</label></td>
				<td><input id="dataId" type="text" class="ui-textbox"/></td>
				
				<td><label for="dataName" class="slds-form-element__label">名称：</label></td>
				<td><input id="dataName" type="text" class="ui-textbox"/></td>
				<td><label for="dataType" class="slds-form-element__label">类型：</label></td>
				<td>
					<select id="dataType">
						<option value="">请选择</option>
					 	 <c:forEach items="${drtList}" var ="li" >
					 	 	<option  value="${li.id}">${li.text}</option>
					 	 </c:forEach>
					</select>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input  class="l-button l-button-brand btn_query" type="button" id="search-btn" value="&nbsp;&nbsp;查询 &nbsp;"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><button class="l-button l-button-brand btn_add" id="addType" >&nbsp;新增</button></td>
			</tr>
		</table>
	</div>
	<div class="container">
		<div id="maingrid"></div>
	</div>
		
    <div id="modifyMenu" class="boxMenu"></div>
</body>
</html>