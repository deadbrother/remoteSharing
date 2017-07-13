<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="head-js-css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../js/activity/activity_sms_portconfig.js" type="text/javascript"></script>
<script type="text/javascript">
	window.onload =function()
	{
	    if($("#portIsSucces").val()=="1"){
	    	//$.ligerDialog.warn("短信端口获取成功！");
	    }else{
	    	$.ligerDialog.warn("短信端口获取失败！");
	    }
	}
</script>
</head>
<body>
<div class="modal-dialog" style="width:600px;">
	<input type="hidden" id="portId" value="${bo.activitySmsProtConfig.id}"/>
	<input type="hidden" id="portIsSucces" value="${bo.portIsSucces}"/>
	<div class="modal-content" style="margin: 0 auto;width:600px;" >
		<table class="activeLayout">
			<colgroup>
        				<col width="25%" />
        				<col width="50%" />
        				<col width="25%" />
      			</colgroup>
			<tr><td></td></tr>
			<tr>
				<td>
        					<label class=" slds-form-element__label">活动分类</label>
					</td>
					<td>
						<select check_select check_name="活动分类" id="activityClassify" class="slds-select" onchange="selectTypeOnchang(this)">
						<option value="">请选择..</option>
	 					<c:forEach items="${bo.activityClassifyList}" var="Classify">
                    			<option value="${Classify.activityClassifyId}"${bo.activitySmsProtConfig.activityClassify == Classify.activityClassifyId? 'selected': ''}>${Classify.activityClassifyName}</option>
              				</c:forEach>
					</select>
					</td>
					<td></td>
			</tr>
			<tr>
				<td>
         					<label class=" slds-form-element__label">创建机构</label>
					</td>
					<td>
						<select id="createMechanism" class="slds-select" check_select check_name="创建机构">
						<option value="">请选择..</option>
	 					<c:forEach items="${bo.createMechanismList}" var="create">
                    			<option value="${create.createMechanismId}"${bo.activitySmsProtConfig.createMechanism == create.createMechanismId? 'selected': ''}>${create.createMechanismName}</option>
              				</c:forEach>
					</select>
					</td>
					<td></td>
			</tr>
			<tr id="typeacti">
				<td>
         					<label class=" slds-form-element__label">活动类型</label>
					</td>
					<td>
						<select id="activityType2" class="slds-select" check_select check_name="活动类型">
						<option value="">请选择..</option>
	 					<c:forEach items="${bo.activityTypeList2}" var="type">
                    			<option value="${type.activityTypeId}"${bo.activitySmsProtConfig.activityType == type.activityTypeId? 'selected': ''}>${type.activityTypeName}</option>
              				</c:forEach>
					</select>
					</td>
					<td></td>
			</tr>
			<tr>
				<td>
						<label class="slds-form-element__label" >营销类型</label>
					</td>
					<td>
					<select id="marketingType" class="slds-select" check_select check_name="营销类型">
						<option value="">请选择..</option>
		 				<c:forEach items="${bo.marketingTypeList}" var="st">
                     			<option value="${st.marketingTypeId}"${bo.activitySmsProtConfig.marketingType == st.marketingTypeId? 'selected': ''}>${st.marketingTypeName}</option>
               				</c:forEach>
					</select>
 				</td>
 				<td></td>
			</tr>
			<tr>
				<td>
						<label class="slds-form-element__label" >使用端口</label>
					</td>
					<td>
					<select id="activityPort" class="slds-select" check_select check_name="使用端口">
						<option value="">请选择..</option>
		 				<c:forEach items="${bo.smsSetIdsList}" var="sms">
                     			<option value="${sms.smsSetId}"${bo.activitySmsProtConfig.usePort == sms.smsSetId? 'selected': ''}>${sms.spPhone}</option>
               				</c:forEach>
					</select>
 				</td>
 				<td></td>
			</tr>
			<tr>
				<td></td>
				<td> 
					<button type="button" class="slds-button slds-button--brand" id="clickReload" onclick="portSave();">保存</button>
					<button type="button" class="slds-button slds-button--brand" data-dismiss="modal"  id="close1" onclick="closePort()">取消</button>
					<input type="text" value="${bo.portIsSave}" id="portIsSave" style="display:none;">
				</td>
				<td></td>
			</tr>
		</table>
		<div id="modifyMenu" class="boxMenu"></div>
	</div>
		</div>
</body>
</html>