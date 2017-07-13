<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="head-js-css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../js/activity/activity_phone_main.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(window).on('load', function() {
		$('#cityName').selectpicker({
			'selectedText' : 'cat'
		});
	});
</script>
</head>
<body>
	<div class="modal-dialog" style="width:600px;">
		<%-- <input type="hidden" id="portId" value="${bo.activitySmsProtConfig.id}"/>--%>
	<input type="hidden" id="ftpType" value="${bo.ftpType}"/> 
	<input type="hidden" id="provinceId" value="${bo.provinceIdString}"/>
		<div class="modal-content" style="margin: 0 auto;width:600px;">
			<table class="activeLayout">
				<colgroup>
					<col width="25%" />
					<col width="50%" />
					<col width="25%" />
				</colgroup>
				<tr>
					<td></td>
				</tr>
				<tr>
				<input class="slds-input" id="channelId" type="hidden" value="${bo.tpInfo.channelId}"/>
				<input class="slds-input" id="phoneNameList" type="hidden" value="${bo.phoneNameList}"/>
					<td width="50" align="left"><label
						class=" slds-form-element__label">渠道名称</label></td>
					<td width="100"><input class="slds-input" id="channelName"
						type="text" value="${bo.tpInfo.channelName}"/></td>
					<td></td>
				</tr>
				<tr>
					<td><label class=" slds-form-element__label">业务类型</label></td>
					<td><select id="typeId" class="slds-select">
							<option value="">请选择..</option>
							<c:forEach items="${bo.serviceTypeList}" var="type">
								<option value="${type.typeId}"${bo.tpInfo.typeId == type.typeId? 'selected': ''}>${type.typeName}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td><label class=" slds-form-element__label">归属地市</label></td>
					<td><select id="cityName" name="cityName"
						class="selectpicker show-tick form-control" multiple
						data-live-search="false">
						<option value="${bo.provinceIdString}">全省</option>
							<c:forEach items="${bo.orgList}" var="org">
								<option value="${org.cityId}"${bo.tpInfo.cityId.contains(org.cityId)? 'selected': ''}>${org.cityName}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td><label class=" slds-form-element__label">渠道状态</label></td>
					<td width="90"><select id="isValid" class="slds-select">
							<option value="">请选择..</option>
							<option value="1"${bo.tpInfo.isValid == 1? 'selected': ''}>有效</option>
							<option value="0"${bo.tpInfo.isValid == 0? 'selected': ''}>无效</option>
					</select></td>
					<td></td>
				</tr>
			
				<tr>
				<c:if test="${bo.ftpType==1}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">SFTP下发路径</label></td>
				</c:if>
				<c:if test="${bo.ftpType==0}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">FTP下发路径</label></td>
				</c:if>
					<td width="100">
						<ul>
							<li le="width:95%">
								<input class="slds-input" id="downPath" type="text" value="${bo.tpInfo.downPath}" />
							</li>
							<li>
							<c:if test="${bo.ftpType==1}">  
								<i data-toggle="tooltip" data-placement="right" title="示例：/test" class="fa fa-question-circle-o" aria-hidden="true"></i>
	                        </c:if>
	                        <c:if test="${bo.ftpType==0}">  
								<i data-toggle="tooltip" data-placement="right" title="示例：test" class="fa fa-question-circle-o" aria-hidden="true"></i>
	                        </c:if>
	                        </li>
						
						</ul>
					</td>
					<td></td>
				</tr>
				<tr>
				<c:if test="${bo.ftpType==1}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">SFTP回执路径</label></td>
				</c:if>
				<c:if test="${bo.ftpType==0}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">FTP回执路径</label></td>
				</c:if>
					<td width="100">
						<ul>
							<li le="width:95%">
								<input class="slds-input" id="returnPath" type="text" value="${bo.tpInfo.returnPath}" />
							</li>
							<li>  
								<c:if test="${bo.ftpType==1}">  
								<i data-toggle="tooltip" data-placement="right" title="示例：/test" class="fa fa-question-circle-o" aria-hidden="true"></i>
	                        </c:if>
	                        <c:if test="${bo.ftpType==0}">  
								<i data-toggle="tooltip" data-placement="right" title="示例：test" class="fa fa-question-circle-o" aria-hidden="true"></i>
	                        </c:if>
	                        </li>
						</ul>
					</td>
					<td></td>
				</tr>
				
				<tr>
				<c:if test="${bo.ftpType==1}">
					<td width="50" align="left"><label class=" slds-form-element__label">sftpIp</label></td>
				</c:if>
				<c:if test="${bo.ftpType==0}">
					<td width="50" align="left"><label class=" slds-form-element__label">ftpIp</label></td>
				</c:if>
					<td width="100">
						<ul>
							<li le="width:95%">
								<input class="slds-input" id="ftpId" type="text" value="${bo.tpInfo.ftpId}"/>
							</li>
							<li>  
								<i data-toggle="tooltip" data-placement="right" title="示例：134.0.76.57" class="fa fa-question-circle-o" aria-hidden="true"></i>
	                        </li>
						</ul>
					</td>
					<td></td>
				</tr>
				<c:if test="${bo.ftpType==0}">
					<tr>
					<td width="50" align="left"><label
						class=" slds-form-element__label">FTP端口</label></td>
					<td width="100"><input class="slds-input" id="ftpPort"
						type="text" value="${bo.tpInfo.ftpPort}"/></td>
					<td></td>
				</tr>
				</c:if>
				
				<tr>
				<c:if test="${bo.ftpType==0}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">FTP用户名</label></td>
				</c:if>
				<c:if test="${bo.ftpType==1}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">SFTP用户名</label></td>
				</c:if>
					<td width="100"><input class="slds-input" id="ftpUsername"
						type="text" value="${bo.tpInfo.ftpUsername}" /></td>
					<td></td>
				</tr>
				<tr>
				<c:if test="${bo.ftpType==1}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">SFTP密码</label></td>
				</c:if>
				<c:if test="${bo.ftpType==0}">
					<td width="50" align="left"><label
						class=" slds-form-element__label">FTP密码</label></td>
				</c:if>
					<td width="100"><input class="slds-input" id="ftpPassword"
						type="password" value="${bo.tpInfo.ftpPassword}" /></td>
					<td></td>
				</tr>
				<tr>
					<td width="50" align="left"><label
						class=" slds-form-element__label">文件密钥</label></td>
					<td width="100"><input class="slds-input" id="fileKey"
						type="text" disabled="disabled" value="${bo.tpInfo.fileKey}"/></td>
					<td><button type="button" class="slds-button slds-button--brand"
							id="clickReload" onclick="setKeyFile()">生成</button></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="button" class="slds-button slds-button--brand"
							id="clickReload" onclick="phoneSave()">保存</button>
						<button type="button" class="slds-button slds-button--brand"
							data-dismiss="modal" id="close1" onclick="closePort()">取消</button>
						<input type="text" value="${bo.phoneIsSave}" id="phoneIsSave"
						style="display:none;">
					</td>
					<td></td>
				</tr>
			</table>
			<div id="modifyMenu" class="boxMenu"></div>
		</div>
	</div>
</body>
</html>