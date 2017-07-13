<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>存量营销活动新增页面</title>
<%@include file="head-js-css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--   新增总js -->
 <script src="../js/activity/activity-add.js" type="text/javascript"></script>
 <!-- 成功标准条件选择 -->
<!-- <script src="/xbuilderoracle/pages/tag/lable/scripts/rule.js"></script> -->
 <!-- 页面二公用js -->
 <script src="../js/activity/activity-prov-commomFrom.js" type="text/javascript"></script>
<script src="../js/activity/activity-add-usergroupAndsuccesss.js" type="text/javascript"></script>
<!-- 页面三 渠道部分的js -->
<script src="../js/activity/activity-add-channel.js" type="text/javascript"></script>
<script src="../js/activity/activity-grouppop.js" type="text/javascript"></script>
<style type="text/css">
table.activeLayout #maingrid td {
	padding: 0px 0px;
}

table.activeLayout #maingridDown td {
	padding: 0px 0px;
}

input.activityButton{
  line-height:42px!important;
  height: 42px!important;
    color: #fff;
 background-color: #0070d2;
  border-color: #0070d2;
  margin:15px 2px;
}
</style>
</head>
<body>

 <form id="mainForm" action="../activity/save" method="post">
 <input type="hidden" name="saveType" value="${bo.saveType }"/>
 <input type="hidden" name="po.activityId" value="${bo.activityBasicInfo.activityId }"/>
 <input type="hidden" name="po.state" value="${bo.activityBasicInfo.state }" id="activityState"/>
 <input type="hidden" name="po.createName" value="${bo.activityBasicInfo.createUser == null? bo.loginUserId : bo.activityBasicInfo.createUser }"/>
 <input type="hidden" name="po.createDate" value="${bo.activityBasicInfo.createDate }"/>
 <input type="hidden" name="isSubmit" value="${bo.isSubmit }"/>
 <input type="hidden" name="classLevel" id="classLevel" value="${bo.po.orgLevel}"/>
  <input type="hidden" name="CreateOrgId"  id="CreateOrgId" value="${bo.po.createOrgId}"/>
 <input type="hidden" name="tenantid" value="${bo.po.tenantId}"/>
 <input type="hidden" name="orgPath" value="${bo.po.createOrgPath}"/>
 <input type="hidden" name="po.isSubActivity" value="${bo.activityBasicInfo.isSubActivity==null?'0':bo.activityBasicInfo.isSubActivity}"/>
 <input type="hidden" name="isLastStage" value="${bo.isLastStage}"/>
 <input type="hidden" name="processInstanceId" />
 <input type="hidden" name="activityProcInfo.processInstanceId" />
 <input type="hidden" id="rejectChannel" name="rejectChannel" value="${bo.rejectChannel}"/>
 <input type="hidden" id="hideFunctionId" name="hideFunctionId" value="${bo.hideFunctionId}"/>
 <input type="hidden" id="hideChannelId" name="hideChannelId" value="${bo.hideChannelId}"/>
 
<!--  主体内容开始 -->
  <div class="container" style="margin-bottom:100px;">
<!--   页头文字  开始-->
 <h2 class="activity">活动策划</h2>
 <!--   页头文字  结束-->
<!--   三个页面嵌入 开始-->
<div class="activitySetArea">
                      <div id="step-1-basicinfo" >
							<%--动态引用 <jsp:include page="activity-step1.jsp"></jsp:include> --%>
				            <%@include file="activity-add-basicinfo.jsp" %>
						</div>

						<!--2 选择用户群  -->
						
						<div id="step-2-usergroup" >
						      <%@include file="activity-add-usergroupAndsuccesss.jsp" %>
							<%-- <jsp:include page="activity-step2.jsp"></jsp:include> --%>
						</div>
						
						<!--3 配置策略  -->
						
						<div id="step-3-channel" >
						      <%@include file="activity-add-channel.jsp" %>
						<%-- 	<jsp:include page="activity-step3.jsp"></jsp:include> --%>
						</div>
		</div>			
<!-- 	三个页面嵌入结束	 -->		
 		<div id="usernumDiv" style="display:none;"></div>
 
 </div>
<!--  主体内容  结束 -->
<!--  底部提交暂存按钮  开始-->
<div >
<nav class="navbar navbar-default navbar-fixed-bottom" >
<div class="col-md-3 pull-right" style="margin-right:50px;margin-bottom:30px;">
<input type="button" class="l-bar-button activityButton" value="取消" onclick="cancelActivity()"/>
<input type="button" id="pauseSaveActivity" class="l-bar-button activityButton" value="暂存" onclick="pauseSubmit();"/>
<input type="button" id="saveActivityButton" class="l-bar-button activityButton" value="提交" onclick="saveSubmit();"/>
</div>
</nav>
</div>
<!--  底部提交暂存按钮  结束-->

 </form>
	<table style="display:none;">
	<tr id="defaultStrategyRule">
		<td>0</td>
		<td><input type="text"
			name="po.frontlineChannelPo.channelSpecialFilterList[0].filterName"
			class="form-control tableInput" placeholder="请填写规则名称"></td>
		<input type="hidden" id="" ord
			name="po.frontlineChannelPo.channelSpecialFilterList[0].ord" value="0">
		<td filterConditionSql><input type="text" id="" condition
			name="po.frontlineChannelPo.channelSpecialFilterList[0].filterCondition"
			value="" class="tableInput" placeholder="" readOnly="readOnly"> <input
			type="hidden" id="" sql
			name="po.frontlineChannelPo.channelSpecialFilterList[0].filterConditionSql"
			value="" >
			<input
			type="hidden" id="" sqlCondition
			name="po.frontlineChannelPo.channelSpecialFilterList[0].filterSqlCondition"
			value="" >
			<button type="button" id="" class="btn btn-primary"
				onclick="chooseRuleCondition(this,'5')">条件</button></td>
		<td id="userGroupStrategyNum0" numTd>--</td>
		<td><input type="text"
			name="po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords"
			class="form-control tableInput" placeholder="请填写推荐信息">
			<input type="text" name="po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate"
			class="form-control tableInput" placeholder="请输入短信模板"/>
		</td>
		<td><i class="fa fa-trash" aria-hidden="true"
			onclick="deleteStrategyRule(this)"></i></td>
	</tr>
	</table>
	<table style="display:none;">
	<tr id="defaultPopRule">
		<td>0</td>
		<td><input type="text"
			name="popSpecialFilterList[0].filterName"
			class="form-control tableInput" placeholder="请填写规则名称"></td>
		<input type="hidden" id="" ord
			name="popSpecialFilterList[0].ord" value="0">
		<td filterConditionSql><input type="text" id="" condition
			name="popSpecialFilterList[0].filterCondition"
			value="" class="tableInput" placeholder="" readOnly="readOnly"> <input
			type="hidden" id="" sql
			name="popSpecialFilterList[0].filterConditionSql"
			value="" >
			<input
			type="hidden" id="" sqlCondition
			name="popSpecialFilterList[0].filterSqlCondition"
			value="" >
			<button type="button" id="" class="btn btn-primary"
				onclick="chooseRuleCondition(this,'8')">条件</button></td>
		<td id="userGroupPopNum0" numTd>--</td>
		<td><input type="text"
			name="popSpecialFilterList[0].marketingWords"
			class="form-control tableInput" placeholder="请填写推荐信息">
		    <input type="text" name="popSpecialFilterList[0].msmTemplate"
			class="form-control tableInput" placeholder="请输入短信模板"/>	
		</td>
		<td><i class="fa fa-trash" aria-hidden="true"
			onclick="deletePopRule(this)"></i></td>
	</tr>
	</table>
	<table style="display:none;">
	<tr id="defaultTeleRule">
		<td>0</td>
		<td><input type="text"
			name="channelTelePhone.telchannelSpecialFilterList[0].filterName"
			class="form-control tableInput" placeholder="请填写规则名称"></td>
		<input type="hidden" id="" ord
			name="channelTelePhone.telchannelSpecialFilterList[0].ord" value="0">
		<td filterConditionSql><input type="text" id="" condition
			name="channelTelePhone.telchannelSpecialFilterList[0].filterCondition"
			value="" class="tableInput" placeholder="" readOnly="readOnly"> <input
			type="hidden" id="" sql
			name="channelTelePhone.telchannelSpecialFilterList[0].filterConditionSql"
			value="" >
			<input
			type="hidden" id="" sqlCondition
			name="channelTelePhone.telchannelSpecialFilterList[0].filterSqlCondition"
			value="" >
			<button type="button" id="" class="btn btn-primary"
				onclick="chooseRuleCondition(this,'12')">条件</button></td>
		<td id="userGroupTeleNum0" numTd>--</td>
		<td><input type="text"
			name="channelTelePhone.telchannelSpecialFilterList[0].marketingWords"
			class="form-control tableInput" placeholder="请填写推荐信息">
		    <input type="text" name="channelTelePhone.telchannelSpecialFilterList[0].msmTemplate"
			class="form-control tableInput" placeholder="请输入短信模板"/>	
		</td>
		<td><i class="fa fa-trash" aria-hidden="true"
			onclick="deleteTeleRule(this)"></i></td>
	</tr>
	</table>
</body>
</html>
