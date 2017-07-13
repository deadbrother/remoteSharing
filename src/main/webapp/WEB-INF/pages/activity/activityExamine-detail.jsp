<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file="head-js-css.jsp"%>

<script
	src="${pageContext.request.contextPath}/js/activity/activityExamine-detail.js"
	type="text/javascript"></script>
<body>
	<input type="hidden" name="bo.po.activityId" id="idAgree"
		value="${bo.po.activityId}" />
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="form-group col-md-10">
				<label class="control-label" style="font-size:25px;margin-top:15px">活动审批</label>
			</div>
		</div>
	</div>
	<hr>
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<textarea rows="3" style="resize:none;width:80%" id="remark"
					align="center" name="bo.activityExecuteInfo.remark"">${bo.activityExecuteInfo.remark}</textarea>
			</div>
		</div>

	</div>
	<div class="col-md-12" style="height:30px"></div>
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="form-group col-md-8">
				<div class="row">
					<div class="col-md-1"></div>
					<button type="button" class="slds-button slds-button--brand" data-dismiss="modal"
						id="pass-tool-btn">&nbsp 同意 &nbsp</button>
					<button type="button" class="slds-button slds-button--brand" data-dismiss="modal"
						id="nopass-tool-btn">不同意</button>
					<button type="button" class="slds-button slds-button--brand" data-dismiss="modal"
						onclick="history.go(-1)">&nbsp 取消 &nbsp</button>
				</div>
			</div>
		</div>
	</div>
	<iframe src="../activity/detail?po.activityId=${bo.po.activityId}&po.examineDetailCheck=${bo.po.examineDetailCheck}"
		width="100%" height="500" scrolling="no"></iframe>
</body>
</html>
