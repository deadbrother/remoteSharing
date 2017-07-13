<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	var docPath = "${pageContext.request.contextPath}/", docBase = docPath
			+ "clyx/activity/";// propertyInfo = JSON.parse('${propertyInfo}');
</script>

<div class="slds-container--fluid">
	<div class="slds-grid slds-wrap slds-grid--pull-padded">
		<!--  活动名称 -->
		<div class="slds-p-horizontal--small slds-size--1-of-1"
			style="margin-top: 10px">
			<input id="userId" value="${bo.fil.userId }" style="display: none;" />
			<input id="logUserPhone" value="${bo.fil.userPhone}"
				style="display: none;"> <input id="logDesc"
				value="${bo.fil.desc}" style="display: none;"> <input
				id="logFilteType" value="${bo.fil.filteType}" style="display: none;">
			<input id="logOperator" value="${bo.fil.operator}"
				style="display: none;"> <input id="logOperateTime"
				value="<fmt:formatDate value="${bo.fil.operatorTime}"    pattern="yyyy-MM-dd hh:mm:ss"/>  "
				style="display: none;">
			<div style="margin-top: 20px; margin: 0, 20px, 0, 0;"
				class="slds-grid slds-grid--align-left">
				<label class="slds-size--0-of-8 slds-text-align--left">手机号:<span
					style="color: #F00; font-weight: bold">*</span></label> <input
					class="slds-input  slds-size--7-of-8" type="text"
					placeholder="请输入手机号码" name="bo.fil.userPhone" id="userPhone"
					style="width: 37.5%; margin-left: 2%;" maxlength="200"
					value="${bo.fil.userPhone}" /> <input type="hidden"
					id="checkNameValid" value="0" /> <input id="isConflict"
					class="hide">
			</div>
			<div style="margin-top: 20px; margin: 0, 20px, 0, 0;"
				class="slds-grid slds-grid--align-left">
				<label class="slds-size--0-of-8 slds-text-align--left">描述:<span
					style="color: #F00; font-weight: bold">*</span></label> <input
					class="slds-input  slds-size--7-of-8" type="text" placeholder=""
					name="bo.fil.desc" id="desc" style="width: 50.5%; margin-left: 2%;"
					maxlength="200" value="${bo.fil.desc}" /> <input type="hidden"
					id="checkNameValid" value="0" />
			</div>
			<div style="margin-top: 20px; margin: 0, 20px, 0, 0;"
				class="slds-grid slds-grid--align-left">
				<label class="slds-size--0-of-8 slds-text-align--left">用户类型:<span
					style="color: #F00; font-weight: bold">*</span></label> <select
					id="filteType" name="bo.fil.filteType" class="slds-select"
					style="width: 37.5%; margin-left: 2%;" value="${bo.fil.filteType}">
					<option value="00">请选择...</option>
					<option value="黑名单" ${bo.fil.filteType=='黑名单'?'selected':'' }>黑名单</option>
					<option value="白名单" ${bo.fil.filteType=='白名单'?'selected':'' }>白名单</option>
				</select>
			</div>
		</div>

	</div>

</div>
