<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title></title>

<%@include file="head-js-css.jsp"%>
<script
	src="${pageContext.request.contextPath}/js/activity/activityPolicy-add.js"
	type="text/javascript"></script>
<script src="../js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript"></script>
<style>
.activity {
	font-size: 18px;
	line-height: 50px;
	background-color: #fefdfd;
	padding-left: 10px;
	border-bottom: 1px solid #e0e0e0;
}

.policylayout {
	border-collapse: separate;
	border-spacing: 0px 20px;
	padding: 10px 4px;
}

body {
	color: #2f332a;
	font: 15px/21px Arial, Helvetica, simsun, sans-serif;
}
</style>
</head>

<body>
	<div class="container"
		style="margin-right: auto;margin-left: auto;width:800px;margin-top: 25px">

		<div class="slds-container--large slds-container--center">
			<h2 class="activity">政策名称</h2>
		</div>
		<div class="slds-container--large slds-container--center">
			<form name="policyInputForm" id="policyInputForm"
				action="../activityPolicy/save" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" id="docPath"
					value="${pageContext.request.contextPath}"> <input
					type="hidden" name="po.policyId" value="${bo.policyInfo.policyId }">
				<input type="hidden" name="saveType" value="${bo.saveType}">
				<div class="slds-grid slds-wrap slds-grid--pull-padded ">
					<div class="slds-container--large slds-container--center ">



						<div class=" container slds-modal--form">
							<!-- 	兼容性的页面 -->
							<table style="margin-left:auto;margin-right:auto;">
								<!--[if IE]> 
             <colgroup>
              <col width="120px"/>
             <col width="*"/>
           </colgroup> 
           
            <![endif]-->
								<!--[if !IE]><!-->


								<colgroup>
									<col width="5%" />
									<col width="*" />

								</colgroup>
								<!--<![endif]-->
								<tr>
									<td></td>
									<td>
										<table class="policylayout" style="width:700px">
											<!--[if IE]> 
             <colgroup>
              <col width="200px"/>
              <col width="220px"/>
              <col width="220px"/>
              <col width="200px" />
           </colgroup> 
           
            <![endif]-->
											<!--[if !IE]><!-->


											<colgroup>
												<col width="10%" />
												<col width="20%" />
												<col width="10%" />
												<col width="20%" />
											</colgroup>
											<!--<![endif]-->


											<tr>
												<td>政策名称:<span style="color:#F00;font-weight:bold">*</span>
												</td>
												<td colspan="2"><input
													class="slds-input  slds-size--7-of-8" type="text"
													placeholder="请输入政策名称" name="po.policyName" maxlength="200"
													value="${bo.policyInfo.policyName }" /> <input
													type="hidden" id="checkNameValid" value="0"></td>
												<td></td>
											</tr>
											<tr>
												<td>政策类型:<span style="color:#F00;font-weight:bold">*</span>
												</td>
												<td colspan="2"><c:if
														test="${ bo.policyInfo.policyClassId==null || bo.policyInfo.policyClassId==''}">
														<select id="opFlag" name="po.policyClassId"
															class="slds-select slds-size--7-of-8">
															<option value="">请选择...</option>
															<c:forEach items="${ bo.policyTypeList}" var="policyList">

																<option value="${policyList.policyClassId}">${policyList.policyClassName}</option>
															</c:forEach>
														</select>
													</c:if> <c:if
														test="${ bo.policyInfo.policyClassId!=null && bo.policyInfo.policyClassId!=''}">
														<select id="opFlag" name="po.policyClassId"
															class="slds-select slds-size--7-of-8">
															<option value="">请选择...</option>
															<c:forEach items="${ bo.policyTypeList}" var="policyList">
																<option value="${policyList.policyClassId}"
																	${bo.policyInfo.policyClassId == policyList.policyClassId? 'selected': ''}>${policyList.policyClassName}</option>
															</c:forEach>

														</select>
													</c:if></td>
												<td></td>
											</tr>
											<tr>
												<td>开始时间:<span style="color:#F00;font-weight:bold">*</span>
												</td>
												<td>
													<div class="" style="margin: 0;">
														<div class="slds-size--3-of-8" style="margin: 0;">

															<input id="queryStartTime" name="po.startTime"
																class="Wdate" type="text"
																onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',maxDate:'#F{$dp.$D(\'queryEffectiveTime\')}'})"
																value="${bo.policyInfo.startTime}" />

														</div>
													</div>
												</td>
												<td>结束时间:<span style="color:#F00;font-weight:bold">*</span>
												</td>
												<td>
													<div class="" style="margin: 0;">
														<div
															class="input-group form_date col-sm-12 form_date_flag">
															<input id="queryEffectiveTime" name="po.effectiveTime"
																class="Wdate" size="16" type="text"
																onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',minDate:'#F{$dp.$D(\'queryStartTime\')}'})"
																value="${bo.policyInfo.effectiveTime }" /> <input
																type="hidden" id="effectiveTime">
														</div>
													</div>
												</td>
											</tr>
											<tr>


												<td>增加附件
												</td>
												<td >
													<%-- <input type="button" value="浏  览" class="slds-button slds-button--brand"  onClick="scan();" /> 
												<input type="file" name="eventfile"  style="width: 200px;display: none"   value="${bo.policyInfo.uploadFileName}"
													class="slds-button " id="fileId" onchange="fileCheck(this)" /> --%>


											    <!-- <a  style="position:relative;display:block;width:100px;height:30px;background:#EEE;border:1px solid #999;text-align:center;"
													href="javascript:void(0);" onclick="scan()">点击上传文件 
												</a>  --> 
												
												
												<div class="slds-select slds-size--7-of-8"><input type="file" name="eventfile"
													value="${bo.policyInfo.uploadFileName}"
													class="slds-button " id="fileId" onchange="fileCheck(this)" />
													<input type="hidden" name="po.uploadFileName"
													id="uploadFileName" value="${bo.policyInfo.uploadFileName}" />

													<input type="hidden" name="po.fileState" value="0"
													id="fileState"></div>
												<td><!-- <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="支持文件类型为:'.doc'、'.docx'、'.txt'、'.xlsx'、'.xls'、'.pdf'"></i> --></td>
												<td><input type="button" value="删除附件"
													class="slds-button slds-button--brand"
													onclick="deletefile()" id="delButton"/> <input type="hidden"
													name="isClicked" value="0" /></td>

											</tr>
											<tr><td></td><td colspan="4" style="color: rgb(0, 112, 210);">支持附件类型为:'.doc'、'.docx'、'.txt'、'.xlsx'、'.xls'、'.pdf'</td></tr>
											<tr><td>附件名称:</td><td>
											<a href="#"  style="text-decoration:none;"><span id="uploadFileName2">${bo.policyInfo.uploadFileName}</span></a>
											</td><td></td></tr>
											<tr>
												<td>创建人: <span style="color:#F00;font-weight:bold">*</span>

												</td>
												<td>
													<div class="" style="margin: 0;">
														${bo.policyInfo.createUserName == null? bo.userName : bo.policyInfo.createUserName }
														<input type="hidden" name="po.createUser"
															value="${bo.policyInfo.createUser== null? bo.loginUserId : bo.policyInfo.createUser }">
													</div>
												</td>
												<td></td>
												<td></td>
											</tr>
										</table>

									</td>
								</tr>


							</table>

						</div>
					</div>
				</div>
			</form>



		</div>

		<div class="slds-container--large slds-container--center"
			style="border-top: 1px solid #e0e0e0">
			<button class="slds-button slds-button--brand"
				onclick="history.go(-1)" style="margin-left: 75%;margin-top:30px">返回</button>
			<button class="slds-button slds-button--brand" id="save-policy-btn"
				onmouseover="checkPolicyName()" style="margin-top: 30px">提交</button>


		</div>
	</div>
</body>
</html>
