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
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js"></script>
    <script src="${pageContext.request.contextPath}/js/wxwl/res/entity.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function ()
	{
		$("#form1").ligerForm();
	});
    var  Data ;
    var typeLayer;
    var manager;
    var list = strToJson('${JSONStr}');
    Data={Rows : list};
    function strToJson(str)
    {
         var json = eval('(' + str + ')');
         return json;
    }
       
    </script>
    <body>
    <div class="container" id="form1">
		<table class="slds-table">
			<tr>
				<td><label for="entity_name" class="slds-form-element__label">实体名称：</label></td>
				<td><input id="entity_name" type="text" class="ui-textbox"  /></td>
				
				<td><label for="entity_table" class="slds-form-element__label">表名：</label></td>
				<td><input id="entity_table" type="text" class="ui-textbox"  /></td>
				
				<td><label for="data_res_id" class="slds-form-element__label">数据源：</label></td>
				<td>
					<select id="data_res_id" >
						 	 <option value='NULL'>请选择数据源</option>
						 <c:forEach items="${dataResLsit}" var ="li" >
						 <option <c:if test="${entity.data_res_id eq li.data_res_id}">selected</c:if> value="${li.data_res_id}">${li.data_res_name}</option>
						 </c:forEach>
					</select>
				</td>
				<td><label for="entity_resume" class="slds-form-element__label">实体说明：</label></td>
				<td><input id="entity_resume" type="text" class="ui-textbox" /></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input  class="l-button l-button-brand btn_query" type="button" id="search-btn" value="&nbsp;&nbsp;查询 &nbsp;"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><button class="l-button l-button-brand btn_add" id="addType" >&nbsp;新增实体</button></td>
			</tr>
		</table>
	</div>
	<div class="cintainer">
    	<div id="maingrid">  </div>
   	</div>
    <div id="modifyMenu" class="boxMenu">
    </div>
  </body>