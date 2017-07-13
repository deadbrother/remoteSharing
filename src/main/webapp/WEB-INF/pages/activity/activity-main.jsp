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
<script src="../js/activity/activity-main.js" type="text/javascript"></script>
<!--  <link href="../js/ztree/css/demo.css" rel="stylesheet" type="text/css" />
<link href="../js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="../js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />  -->
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
var manager;
 function strToJson( str )
 {
 var json = eval('(' + str + ')');
 	return json;
 } 

</script>


</head>
   <div id="zTreeDemoBack" style="position:absolute;z-index:1000;margin-left:20px;margin-top:90px">
       
		 <div id="menuContent" class="menuContent" style="display:none;z-index:1000;margin-left:-100px;margin-top:-5px">
	      <ul id="orgtree" class="ztree" style="margin-left:127px;"></ul>
          </div>         
        
           </div>
<body id="activityMain">
 <div  style="width:98%;margin-left:10px;" >
 <input type="hidden" id="resultCode" value="${bo.resultCode}" />
 <div class="slds-grid slds-size--1-of-1 slds-text-align--right" style="width:100%;margin-top:15px" >
 <table  style="border-collapse:separate; border-spacing:10px;table-layout:fixed;width:100%;" class="slds-text-align--right" >
 		<%-- 	<colgroup>
                    <col width="15%"/>
                    <col width="10%"/>
                    <col width="10%"/>
                    <col width="10%"/>
                   <col width="10%"/>
                     <col width="5%"/>
                     <col width="12%"/>                                           
            </colgroup>  --%>
 	<tr>
 		<!-- <td width=75>
 			&nbsp;
 		</td> -->
 		
 		<td width="50" align="left">
          
 		</td>
 		<td width="100">
 			<select id="activityType" class="slds-select ">
				<option value="0">全部活动</option>
				<option value="1" selected>我创建的活动</option>
				<!-- <option value="2">总部下发活动</option> -->
				<option value="3">上级下发活动</option>
				<option value="4">仅下发活动</option>
			</select>
 		</td>
 		<td width="50" align="left">
           <label class=" slds-form-element__label">活动名称</label>
 		</td>
 		<td width="100">
 			<input class="slds-input" id="activityName" type="text" />
 		</td>
 		
 		<td width="50" align="right">
 				<label class="slds-form-element__label">活动主题</label>
 		</td>
 		<td width="100">
			<select id="activityThemeCode" class="slds-select">
				<option value="">请选择..</option>
			 	<c:forEach items="${bo.activityThemeList}" var="theme">
                      <option value="${theme.themeCode}">${theme.themeName}</option>
                </c:forEach>
			</select>
 		</td>
 		<td width="50" align="right">
 			<label class="slds-form-element__label" >活动状态</label>
 		</td>
 		<td width="100">
			<select id="activityState" class="slds-select">
				<option value="">请选择..</option>
				 <c:forEach items="${bo.activityStateList}" var="st">
                       <option value="${st.stateCode}">${st.stateDesc}</option>
                 </c:forEach>
			</select>
		 </td>
        <td width="50" align="right">
            <label class=" slds-form-element__label">地域</label>
  		</td>
  		<td width="100">
  			<select id="orglevelName" class="slds-select">
 				<option value="">请选择..</option>
 				 <c:forEach items="${bo.orgLevelNameList}" var="st">
                        <option value="${st.orgLevel}">${st.orgLevelName}</option>
                  </c:forEach>
 			</select>
 		</td>
 		<td width="40" align="right">
            <label class=" slds-form-element__label">渠道</label>
  		</td>
  		<td width="90">
  			<select id="channelCode" class="slds-select">
 				<option value="">请选择..</option>
 				 <c:forEach items="${bo.queryAllChannel}" var="st">
                        <option value="${st.channelCode}">${st.channelName}</option>
                  </c:forEach>
 			</select>
 		</td>
 		
 	</tr>
 	<tr>
 		<td width="50" align="left">
 			<label class=" slds-form-element__label" >适用范围</label>
 		</td>
 		<td width="100">
 			<div class="slds-text-align--left" style="height:20px;width:100%">
				<div class="zTreeDemoBackground left" style="height:20px;width:100%">
				   <input type="hidden" id="orgPath" value=""/>
				   <input type="hidden" id="orgId"   value=""/>
				<input type="text" style="cursor:pointer;width:100%;" id="orgSelect" readonly value="" onmouseover="this.title=this.value" onclick="showMenu()"
				class="form-control select-obj">                               		                
				</div>
			</div>  
 		</td>
		<td width="50" align="right">
			<label class="slds-form-element__label">活动周期</label>
		</td>
		<td width="100">
		    <select id="activityCycle" class="slds-select">
				<option value="">请选择..</option>
                <option value="1">周期（月）</option>
                <option value="2">周期（日）</option>
                <option value="3">一次性</option>
			</select>
		 </td>
		<td width="50" align="right">
			<label class=" slds-form-element__label">创建时间</label>
		</td>
		<td width="100">
		<input  class="Wdate" style="width:100%;" id="startDate" type="text" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
		</td>
		<td width="50">
		<label style="padding-left:20px;padding-right:20px; " class="slds-form-element__label">至</label>
		</td>
		<td width="100">
		<input class="Wdate" style="width:100%;" style="padding-left:0px" id="endDate"  type="text" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',minDate:'#F{$dp.$D(\'startDate\')}'})"/>
		</td>
		<td width="50" align="right">
           <label class=" slds-form-element__label">创建人</label>
 		</td>
 		<td width="100">
 			<input class="slds-input" id="createName" type="text" />
 		</td>

         <td colspan="2" style="text-align: right;">
		<input type="button" class=" slds-button slds-button--brand " id="search-tool-btn" value="查询">
		</td>
		
 	</tr>
    <tr>
        
         
 		
    </tr>
 
 </table>
 
 
 </div>
 
 
<!--  原来样式,暂时注掉 -->
		<%-- <div class="slds-grid slds-size--1-of-1" style="margin-top:20px">
			<div class="slds-grid slds-size--16-of-16">
			<div class="slds-grid slds-size--2-of-16">
			<select id="activityType" class="slds-select ">
				<option value="0">全部活动</option>
				<option value="1">我创建的活动</option>
				<option value="4">总部创建的活动</option>
			</select>
			</div>
			<label class="slds-size--1-of-16 slds-form-element__label" >活动名称：</label>
			<div class="slds-size--2-of-16 ">
				<input class="slds-size--7-of-8 slds-input" id="activityName" type="text" />
			</div>
			<label class="slds-size--1-of-16 slds-form-element__label" >活动主题：</label>
			<div class="slds-size--1-of-16 ">
				<select id="activityThemeCode" class="slds-select">
				<option value="">请选择..</option>
				 <c:forEach items="${bo.activityThemeList}" var="theme">
                       <option value="${theme.themeCode}">${theme.themeName}</option>
                 </c:forEach>
			</select>
			</div>
			<label class="slds-size--1-of-16 slds-form-element__label" >活动类型：</label>
			<div class="slds-size--1-of-16 ">
				<select id="activityCycle" class="slds-select">
				<option value="">请选择..</option>
                <option value="1">周期（月）</option>
                <option value="2">周期（日）</option>
                <option value="3">一次性</option>
			</select>
			</div>
			<label class="slds-size--1-of-16 slds-form-element__label" >活动状态：</label>
			<div class="slds-size--1-of-16 ">
				<select id="activityState" class="slds-select">
				<option value="">请选择..</option>
				<option value="8">停用</option>
				<option value="9">启用</option>
				<option value="10">驳回</option>
				<option value="11">暂停</option>
				<option value="12">暂存</option>
				<option value="13">待审批</option>
			</select>
			</div>
			<label class="slds-size--1-of-16 slds-form-element__label" >创建时间：</label>
			<div class="slds-size--2-of-16 ">
				<input type="date" class="slds-size--7-of-8 form-control" id="startDate"  class="ui-textbox" type="text" />
			</div>
			<label class="slds-size--1-of-16 slds-form-element__label" >~</label>
			<div class="slds-size--2-of-16 ">
				<input type="date" class="slds-size--7-of-8 " id="endDate" class="ui-textbox" type="text" />
			</div>
			<div class="slds-size--1-of-12">
			<button class="slds-size--8-of-8 slds-button slds-button--brand" id="search-tool-btn" >&nbsp;查询</button> 
		    </div>
		    </div>
		    
		</div> --%>
		
		<div class="slds-container--right slds-container--large bbtt" style="margin-top:14px">
<div class="slds-p-horizontal--small slds-size--1-of-1 ">
		    <!-- <div class=""> -->
			<div class="slds-container--right slds-size--12-of-12">
			<button  id="add-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white;" class="epm-icon glyphicon glyphicon-plus"></span>&nbsp;新增
			</button>
			<button  id="create-tool-btn" class="slds-button slds-button--brand slds-size--4-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-file"></span>&nbsp;创建子活动
			</button>
			<button  id="modify-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-pencil"></span>&nbsp;修改
			</button>
			<button  id="deletes-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-trash"></span>&nbsp;删除
			</button>
			&nbsp;
			&nbsp;
			<button  id="startactivity-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-play"></span>&nbsp;启用
			</button>
			<button  id="pauseactivity-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-pause"></span>&nbsp;暂停
			</button>
			<button  id="stopactivity-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-stop"></span>&nbsp;停用
			</button>
			&nbsp;
			&nbsp;
			<button  id="genzong-tool-btn" class="slds-button slds-button--brand slds-size--4-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;活动跟踪
			</button>
			<button  id="pinggu-tool-btn" class="slds-button slds-button--brand slds-size--4-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-pencil"></span>&nbsp;活动评估
			</button>
			<!-- <button  id="select-log-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary"
			data-toggle="modal" >
				<span style="color:white" class="epm-icon glyphicon glyphicon-zoom-in"></span>&nbsp;查看日志
			</button> -->
		</div>
		</div>
		</div>
		<input name="userId" type="hidden" value="${bo.loginUserId}"/>
		<input name="createOrgPath" type="hidden" value="${bo.po.createOrgPath}"/>
		<input id="isAdmin" type="hidden" value="${bo.isAdmin}"/>
	</div>
<div class="slds-container--left slds-p-horizontal--small" style="width:100%;margin-top:5px">
	<div id="maingrid" class=""></div>
</div>

<div class="modal fade" id="myModallog" tabindex="-1" role="dialog"
		aria-labelledby="myModallogLabel" aria-hidden="true" style="overflow-y:scroll">
<div class="modal-dialog"  >
			<div class="modal-content" style="width:500px;margin-left:150px" >
			<div class="col-md-12">
			<div class="row">
				<div class="form-group col-md-10">
					<label class="control-label" style="font-size:15px;margin-top:15px">活动名称：
					<span id="activityLogName" name="bo.activityExecuteInfo.activityName"
					 value=""></span>
					</label>
				</div>
				</div></div>
<div class="slds-container--left slds-p-horizontal--lagrge"
					style="width: 95%">
					<div id="activityLogList" class=""></div>
				</div>
				<a href="#" class="slds-button slds-button--brand slds-size--2-of-16" style="margin-left:400px;margin-top:15px" type="primary" data-dismiss="modal">关闭</a>
			</div>
		
			</div></div>
<div id="modifyMenu" class="boxMenu"></div>

<!--[if IE 8]> 
<style>
button.activityButton{
  line-height:32px!important;
  height: 32px!important;
    color: #fff;
  background-color: #0070d2;
  border-color: #0070d2;
  margin:15px 2px;
}
div.bbtt{
  float:right;
  width:1000px;
  left:10%; 
  top:100%;
 }
</style>
<script>
function cc(){
jQuery(".slds-button.slds-button--brand").addClass("l-bar-button activityButton ") 

}
cc();
</script>
 <![endif]-->

</body>
</html>
