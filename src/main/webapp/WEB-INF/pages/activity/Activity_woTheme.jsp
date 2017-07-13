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
<script src="../js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="../js/activity/activity-woTheme.js" type="text/javascript"></script>
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
</style>

<script type="text/javascript">
var typeLayer;
var manager;
 function strToJson( str )
 {
 var json = eval('(' + str + ')');
 	return json;
 } 

</script>


</head>
<body id="activityMain">
 <div  style="width:98%;margin-left:10px;" >
 <div class="slds-grid slds-size--1-of-1 slds-text-align--right" style="width:100%;margin-top:15px" >
 <table  style="border-collapse:separate; border-spacing:10px;display:table-cell;table-layout:fixed;" class="slds-text-align--right" >
 	 <tr>	
 		<td width="75" align="right">
 				<label class="slds-form-element__label">活动名称：</label>
 		</td>
 		<td width="130">
		<input type="text" id="activityName">
 		</td>
		<td>
		<input type="button" class=" slds-button slds-button--brand " id="search-tool-btn" value="查询">
		</td>
 	</tr>
 </table>
 </div>
		<input name="userId" type="hidden" value="${bo.loginUserId}"/>
		<input name="createOrgPath" type="hidden" value="${bo.po.createOrgPath}"/>
		<input id="isAdmin" type="hidden" value="${bo.isAdmin}"/>
	</div>
<div class="slds-container--left slds-p-horizontal--small" style="width:100%;margin-top:5px">
	<div id="maingrid" class=""></div>
</div>
</body>
</html>
