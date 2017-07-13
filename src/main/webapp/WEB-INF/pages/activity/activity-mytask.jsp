<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title> 

<%@include file="head-js-css.jsp" %>
<%-- <script src="${pageContext.request.contextPath}/js/activity/activityExamine-mytask.js" type="text/javascript"></script> --%>
<!-- <link href="../js/activity/css/boncXpersonality.css" rel="stylesheet" type="text/css" /> -->
<link href="../js/activity/css/allActs.css" rel="stylesheet" type="text/css" />
<!-- <script type="text/javascript">
$(function(){
    if($("#type").val()=="2"){
        document.getElementById("yibantask").contentWindow.refreshList;
    }     
});
var typeLayer;
var manager;
 function strToJson( str )
 {
 var json = eval('(' + str + ')');
 	return json;
 }
</script> -->
<style>
table input[type="checkbox"], table input[type="radio"]{
	width:13px;
}
</style>
</head>
<body>
 <input type="hidden" name="" id="classLevel" value="${bo.po.orgLevel}"/>
 <input type="hidden" name="" id="type" value="${bo.type}"/>
 <div id="navtab1" class="liger-tab" lselected="true">
         <div tabid="changeYiBan" title="我的待办" >
          	<iframe src="../activityExamine/daibantask" id="daibantask" scrolling="no" frameborder="no" border="0"></iframe>
           
        </div>
        <div tabid="changeDaiBan" title="我的已办" >          		
           	<iframe src="../activityExamine/yibanTask" id="yibantask" scrolling="no" frameborder="no" border="0"></iframe>
        </div>
     </div>
</body>
</html>