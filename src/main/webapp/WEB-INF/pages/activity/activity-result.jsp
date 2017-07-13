<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'activity-result.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%@include file="head-js-css.jsp" %>
     <script src="../js/activity/activity-result.js" type="text/javascript"></script>
      <style type="text/css">
        .pop-box {   
            z-index: 9999; /*这个数值要足够大，才能够显示在最上层*/  
            margin-bottom: 3px;   
            display: none;   
            position: absolute;   
            background: #f5f5f5;   
            border:solid 1px #f5f5f5;   
        }   
          
        .pop-box h4 {   
            color: #FFF;   
            cursor:default;   
            height: 18px;   
            font-size: 14px;   
            font-weight:bold;   
            text-align: left;   
            padding-left: 8px;   
            padding-top: 4px;   
            padding-bottom: 2px;   
            background: url("../images/header_bg.gif") repeat-x 0 0;   
        }   
          
        .pop-box-body {   
            clear: both;   
            margin: 4px;   
            padding: 2px;   
        } 
        
        
        .mask {
            background-color:f5f5f5;
            position:absolute;
            top:0px;
            left:0px;
            filter: Alpha(Opacity=60);
        } 
        .ysc{
          	transition-duration: 0.4s;
  			width: 100%;
  			height: 100%;
  			
  			visibility: hidden;
  			position: fixed;
  			top: 0;
  			right: 0;
  			bottom: 0;
  			left: 0;
  			background: rgba(126, 140, 153);
  			z-index: 0;
            visibility: visible;
            opacity: 1;
            transition: opacity 0.4s linear;
            background-color:rgb(126, 140, 153) \9;
            *background-color:rgb(126, 140, 153);
            _background-color:rgb(126, 140, 153);
        
        }
    </style>
  </head>
  
  <body>
    <input type="hidden" id="menuName1" value=""/>
    <input type="hidden" id="menuName2" value=""/>
    <input type="hidden" id="resultCode" value="${bo.resultCode}"/>
    <input type="hidden" id="bpmUrl" value="${bo.bpmUrl}"/>
    <input type="hidden" id="processInstanceId" value="${bo.activityBasicInfo.processInstanceId}" />
    <input type="hidden" id="saveType" value="${bo.saveType}" />
    <input type="hidden" id="activityId" value="${bo.po.activityId}" />
    <input type="hidden" id="state" value="${bo.po.state}" />
    <input type="hidden" id="loginId" value="${bo.activityBasicInfo.loginUserId}"/>
    <input type="hidden" id="activityName" value="${bo.activityBasicInfo.activityName}"/>
    <input type="hidden" id="tenantId" value="${bo.activityBasicInfo.tenantId}"/>
    <input type="hidden" id="activityTheme" value="${bo.activityBasicInfo.themeName}"/>
    <input type="hidden" id="orgLevel" value="${bo.activityBasicInfo.orgLevelName}"/>
    <input type="hidden" id="activityCycle" value="${bo.activityBasicInfo.activityCycle}"/>
    <input type="hidden" id="startDate" value="${bo.activityBasicInfo.startDate}"/>
    <input type="hidden" id="endDate" value="${bo.activityBasicInfo.endDate}"/>
    <input type="hidden" id="createDate" value="${bo.activityBasicInfo.createDate}"/>
    <input type="hidden" id="stateDesc" value="${bo.activityBasicInfo.stateDesc}"/>
    <input type="hidden" id="orgRange" value="${bo.activityBasicInfo.orgRange}"/>
    <input type="hidden" id="createUserName" value="${bo.activityBasicInfo.createUserName}"/>
    <input type="hidden" id="userGroupId" value="${bo.activityBasicInfo.userGroupId}"/>
    <input type="hidden" id="channelCheck" value="${bo.activityBasicInfo.channelCheck}"/>
    <input type="hidden" id="orgPath" value="${bo.activityBasicInfo.orgPath}"/>
    <input type="hidden" id="createOrgPath" value="${bo.activityBasicInfo.createOrgPath}"/>
    <input type="hidden" id="rejectChannel" value="${bo.rejectChannel}"/>
    <input type="hidden" id="isSubActivity" value="${bo.activityBasicInfo.isSubActivity}"/>
<!--     <div id="ccwwcc" style="width: 300px;" class="pop-box">
    <div class="pop-box-body">
    <span>审批人：</span>
    <select id="taskLoginId" >
    </select>
    <button type="button" class="slds-button slds-button--brand" data-dismiss="modal"
						id="confirm-btn">&nbsp 确认 &nbsp</button>
	</div>
	</div> -->
	
	<!-- <div class="container">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-769817" href="#modal-container-769817" role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>
			
			<div id="modal-container-769817" style="height:80px;width:100px;z-index:50"  class="modal  fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						审批
					</h3>
				</div>
				<div class="modal-body">
					<div class="row">
         <div class="col-md-12">
         <div class="col-md-3 col-md-offset-3" style="padding:15px 0;">
         <span>审批人：</span>
         </div> 
         	<div class="col-md-3" style="padding:15px 0;">
    		<select id="taskLoginId" >
    		</select>
 			</div>
         </div>
         </div>
         <div class="row">
          <div class="col-md-10" >
          <div class="col-md-3" style="padding:15px 0;">
            <button  type="button" class="slds-button slds-button--brand pull-right" data-dismiss="modal"
						id="confirm-btn">&nbsp 确认 &nbsp</button>
          </div>
          </div>
         
         </div>
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button> <button class="btn btn-primary">保存设置</button>
				</div>
			</div>
		</div>
	</div>
</div> -->
    <div style="height:100px"></div>
    <div class="col-md-12" style = "margin:20px" align="center">
    		<label>请选择审批人：</label>
		    <select id="taskLoginId"></select>
	</div>
	<div class="col-md-12" style = "margin:20px" align="center">
    		<button type="button" class="slds-button slds-button--brand" data-dismiss="modal" id="confirm-btn">确认</button>  		
	</div>
	<div class="col-md-12" style = "margin:20px" align="center">
    		<a onclick="shuochukou()">查看活动详情</a>
	</div>
	 <!-- <div class="row col-md-12" style="margin-top:10px;" style="position:relative;margin-top:20px;height:30px;">
			<div class="col-md-4"></div>
			<div class="form-group col-md-8">
				<div class="row">
					<div class="col-md-1"></div>
					<button type="button" class="slds-button slds-button--brand" data-dismiss="modal"
						id="confirm-btn">确认</button>
				</div>
			</div>
	</div> -->
	<div class="row" id="shuochukou" style="margin-top:20px">
	   <div class="col-md-12">
		<iframe src="../activity/detail?po.activityId=${bo.po.activityId}&po.examineDetailCheck=${bo.po.examineDetailCheck}"
		width="100%" height="100%"></iframe>
		</div>
	</div>
  </body>
 
</html>
