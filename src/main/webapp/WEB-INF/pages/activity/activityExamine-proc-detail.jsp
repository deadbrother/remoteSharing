<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%@include file="head-js-css.jsp"%>

<script src="../js/activity/activityExamine-proc-detail.js" type="text/javascript"></script>
	<style>
	/* 审批弹出框位置临时修改设置 */
.l-dialog{
	top:50px !important;	
	
}
.mask {  
  position: absolute;  
  left: 0;  
  top: 0;  
  width: 100%;  
  height: 100%;   
  display: none;  
  background: #ffffff;  
  z-index:2;
}  
.mask-msg {  
  position: absolute;  
  padding: 12px 5px 10px 30px;  
  width: auto;  
  height: 50px;
  top:200px !important;
  left:45% !important;
  border-width: 2px;  
  border-style: solid;  
  display: none;  
  border-color: #ddd;  
  font-size:12px;  
  background: #fff url('../js/ligerui/lib/ligerUI/skins/Gray2014/images/bigloading.gif') no-repeat scroll 5px center;
  z-index:3;  
}  		
	</style>
<body>
	<input type="hidden" id="pageId" value="${bo.procPage.pageId}" />
	<input type="hidden" name="bo.po.activityId" id="idAgree"
		value="${bo.po.activityId}" />
	<input type="hidden" id="processInstanceId" value="${bo.processInstanceId}" />
	<input type="hidden" id="taskId" value="${bo.taskId}" />
	

		<div class="row" style=" background-color: #fefdfd;padding-left: 10px;border-bottom: 1px solid #e0e0e0;">
			<div class="col-md-1"></div>
			<div class="form-group col-md-11">
				<label class="control-label" style="font-size:25px;margin-top:15px">${bo.procPage.title}</label>
			</div>
		</div>
	
	<!-- <hr> -->

	<!-- <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="80%" color=#987cb9 SIZE=10> -->
	<div id="taskUserDiv" class="col-md-10 col-md-offset-2" style="display:none;position:relative;margin-top:20px;height:30px;">
		<label>请选择审批人：</label>
<!-- 		<select id="taskLoginId">
			
		</select> -->
	</div>
	<div class="row" style="position:relative;left:-2%;height:30px;margin-top:50px;width:100%">
		
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<textarea rows="3" style="display:none;resize:none;width:80%" id="remark" extral="resource1"
					align="center" name="bo.activityExecuteInfo.remark"">${bo.activityExecuteInfo.remark}</textarea>
			</div>
		

	</div>
	 <div class="row col-md-12" style="margin-top:10px;">
			<div class="col-md-4"></div>
			<div class="form-group col-md-8">
				<div class="row">
					<div class="col-md-1"></div>
					<button type="button" style="display:none;" class="slds-button slds-button--brand" data-dismiss="modal"	extral="resource2"
						id="pass-tool-btn">&nbsp 同意 &nbsp</button>
					<button type="button" style="display:none;" class="slds-button slds-button--brand" data-dismiss="modal"	extral="resource3"
						id="nopass-tool-btn">不同意</button>
					<button type="button" style="display:none;" class="slds-button slds-button--brand" data-dismiss="modal"	extral="resource4"
						id="remodify-tool-btn">修改</button>
					<button type="button" style="display:none;" class="slds-button slds-button--brand" data-dismiss="modal"	extral="resource5"
						id="resubmit-tool-btn">提交</button>
					<button type="button" style="display:none;" class="slds-button slds-button--brand" data-dismiss="modal"	extral="resource6"
						id="asign-sign-tool-btn">&nbsp 已阅 &nbsp</button>
					<button type="button" style="display:none;" class="slds-button slds-button--brand" data-dismiss="modal"	extral="resource7"
						onclick="cancel1()">&nbsp 取消 &nbsp</button>
				</div>
			</div>
		</div>
	<div class="row">
	<div class="col-md-offset-2" style="margin-top:80px">
		<div id="managerprocdetail"></div>
	</div>
	</div>
   
	<div class="row" style="margin-top:20px">
	   <div class="col-md-12">
		<iframe src="../activity/detail?po.activityId=${bo.po.activityId}&po.examineDetailCheck=${bo.po.examineDetailCheck}"
		width="100%" height="500"></iframe>
		</div>
	</div>
	
	


		
	
	

</body>
</html>
