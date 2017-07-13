<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<%@include file="head-js-css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../js/activity/activity_phone_main.js" type="text/javascript"></script>

<style>
input.l-bar-button{
  line-height: 35px!important;
  height: 35px!important;
}

.box { 
-moz-border-radius: 15px; /* Firefox */ 
-webkit-border-radius: 15px; /* Safari and Chrome */ 
border-radius: 15px; /* Opera 10.5+, future browsers, and now also Internet Explorer 6+ using IE-CSS3 */ 
-moz-box-shadow: 10px 10px 20px #000; /* Firefox */ 
-webkit-box-shadow: 10px 10px 20px #000; /* Safari and Chrome */ 
box-shadow: 10px 10px 20px #000; /* Opera 10.5+, future browsers and IE6+ using IE-CSS3 */ 
behavior: url(。。/js/base/css/ie-css3.htc); 
} 
.l-grid-body {
    overflow: hidden;
}
input#search-tool-btn{
	line-height:100%!important;
}
table input[type=radio], table input[type=checkbox]{
	width:13px;
}
.slds-form-element__label{
font-size:12px;
}
</style>

<script type="text/javascript">
var typeLayer;
var phonemanager;
 function strToJson( str )
 {
 var json = eval('(' + str + ')');
 	return json;
 } 

</script>


</head>

<body id="phone">
 <div  style="width:98%;margin-left:10px;" >
 <div class="slds-grid slds-size--1-of-1 slds-text-align--right" style="width:100%;margin-top:15px" >
 <table  style="border-collapse:separate; border-spacing:10px;table-layout:fixed;width:100%;" class="slds-text-align--right" >
 		
 	<tr>
 		<td width="50" align="left">
          	<label class=" slds-form-element__label">渠道名称</label>
 		</td>
 		<td width="100">
 			<input class="slds-input" id="channelName" type="text" />
 		</td>
 		<td width="50" align="left">
          	<label class=" slds-form-element__label">归属地市</label>
 		</td>
 		<td width="90">
 			<select id="cityName" class="slds-select">
				<option value="">全部</option>
			 	<c:forEach items="${bo.orgList}" var="org">
                      <option value="${org.cityName}">${org.cityName}</option>
                </c:forEach>
			</select>
 		</td>
 		<td width="50" align="left">
           <label class=" slds-form-element__label">渠道状态</label>
 		</td>
 		<td width="90">
 			<select id="isValid" class="slds-select">
				<option value="">全部</option>
                      <option value="1">有效</option>
                      <option value="0">无效</option>
			</select>
 		</td>
 		
 		<td width="50" align="right">
 				<label class="slds-form-element__label">业务类型</label>
 		</td>
 		<td width="90">
			<select id="typeId" class="slds-select">
				<option value="">全部</option>
			 	<c:forEach items="${bo.serviceTypeList}" var="type">
                      <option value="${type.typeId}">${type.typeName}</option>
                </c:forEach>
			</select>
 		</td>
		<td width="2" align="right">
  		</td>
        <td width="350" style="padding:0 2px">
            <button id="portsearch-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" onclick="reloadPort();">
			<span style="color:white" class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;查询
		</button>
  		
  			<button  id="portadd-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary" onclick="portAdd()">
				<span style="color:white;" class="epm-icon glyphicon glyphicon-plus"></span>&nbsp;新增
			</button>
 		
            <button  id="portmodify-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary" onclick="portModify()">
				<span style="color:white" class="epm-icon glyphicon glyphicon-pencil"></span>&nbsp;修改
			</button>
  		
  			<button  id="portdeletes-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary" onclick="deletePort();">
				<span style="color:white" class="epm-icon glyphicon glyphicon-trash"></span>&nbsp;删除
			</button>
 		</td>
 	</tr>
 </table>
 
 </div>
		<input name="userId" type="hidden" value="${bo.loginUserId}"/>
		<input type="hidden" id="ftpType" value="${bo.ftpType}"/> 
	</div>
<div class="slds-container--left slds-p-horizontal--small" style="width:100%;margin-top:5px">
	<div id="phoneList" class=""></div>
</div>

</body>
</html>