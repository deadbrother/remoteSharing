<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黑白名单信息</title>
<%@include file="head-js-css.jsp"%>
<script src="../js/activity/activityFilteMain.js" type="text/javascript"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
input.l-bar-button{
  line-height: 35px!important;
  height: 35px!important;
  
}
</style>
</head>
<body>
<!--登录人的机构 类别  -->
<input type="hidden" value="${activityFilteUser.loginClassLevel }"  id="loginClassLevel"  />
<!--登录人所属的地市编码 -->
<input type="hidden" value="${activityFilteUser.loginOrgClassId }"  id="loginOrgClassId"  />
	<div id="" class="container" style="margin-top:20px">
		<div style="width:95%;margin-left:10px">
			<div class="slds-grid slds-size--1-of-1 slds-text-align--right"
				style="margin-top:15px">
				<table
					style="border-collapse:separate; border-spacing:10px;margin-left: -30px"
					class="slds-text-align--right">
					<tr>
						<td width="60px"><label class="slds-form-element__label"
							for="code_type_name">手机号：</label></td>
						<td width="200px"><input id="code_type_name"
							class="slds-input" type="text"  onkeyup="this.value=this.value.replace(/\D/g,'')"  /></td>
						<!-- <td width="75px"><label
							class="slds-size--1-of-9 slds-form-element__label"
							for="code_type_name">&nbsp;用户类型：</label></td>
						<td width="200px"><select id="filtetyp" name="filtetyp"
							 style="width: 200px; margin-left: 2%;">
								<option value="2">请选择...</option>
								<option value="0">黑名单</option>
								<option value="1">白名单</option>
						</select>
						</td> -->
						<td>
							<button id="search-tool-btn"
								class="l-button l-button-brand btn_query" style="width: 65px">&nbsp;查询</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="slds-p-horizontal--small slds-size--1-of-1 "
			style="margin-top: 5px">
			<div class="slds-container--right slds-size--6-of-12">
				<c:if test='${activityFilteUser.loginClassLevel=="1" ||  activityFilteUser.loginClassLevel=="2"}'>
				<button id="import-tool-btn" class="l-button l-button-brand btn_add"
					type="primary">
					<span style="color:white"
						class="epm-icon glyphicon glyphicon-import"></span>&nbsp;导入
				</button>
				<button id="download-tool-btn"
					class="l-button l-button-brand btn_add" type="primary">
					<span style="color:white"
						class="epm-icon glyphicon glyphicon-download-alt"></span>&nbsp;下载模板
				</button>
				<button id="add-tool-btn" class="l-button l-button-brand btn_add"
					type="primary">
					<span style="color:white" class="epm-icon glyphicon glyphicon-file"></span>&nbsp;新增
				</button>
				<button id="modify-tool-btn" class="l-button l-button-brand btn_add"
					type="primary">
					<span style="color:white"
						class="epm-icon glyphicon glyphicon-repeat"></span>&nbsp;修改
				</button>
				<button id="deletes-tool-btn"
					class="l-button l-button-brand btn_add" type="primary">
					<span style="color:white"
						class="epm-icon glyphicon glyphicon-trash"></span>&nbsp;删除
				</button>
                </c:if>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 15px">
		<div id="maingrid"></div>
	</div>
	<div style="display:none; ">
		<div id="importEx" class="container">
			<form action="" name="upFileFrom" id="upFileFrom" method="post"
				enctype="multipart/form-data" target='id_iframe'>

				<input type="file" id="file" name="eventfile"
					accept='application/vnd.ms-excel'>

			</form>
			<iframe id='id_iframe' name='id_iframe' style='display:none;'></iframe>
			<button id="importFile" class="l-button l-button-brand btn_add"
				type="primary" style="margin-top: 15px;">
				<span style="color:white"
					class="epm-icon glyphicon glyphicon-import"></span>&nbsp;导入
			</button><br>
			<div style="margin-top: 10px"><span style="color: red;">注:黑白名单上传的Excel中最多允许两万条数据，<br>只能有一个sheet，否则上传失败,请按照模板添<br>加数据</span></div>
		</div>
	</div>
	<div id="modifyMenu" class="boxMenu"></div>
	<!--  新增页面-->
	<div id="addDialog" style="display: none;">
		<input id="userIdM" value="${activityFilteUser.userId}" type="hidden" />
		<%-- <input id="operatorTime" value="${activityFilteUser.operatorTime}" type="date" /> --%>
		<input type="hidden" id="checkNameValid" value="0" /> <input
			id="isConflict" type="hidden">
		<!--  活动名称 -->
		<div style="margin-top: 20px;margin-left: 40px">

			<div style="margin: 30px 0px 0px 0px">
				<label>手机号:<span style="color: #F00; font-weight: bold">*</span></label>
				<input type="text" placeholder="请输入手机号码" name="userPhone"
					id="userPhoneM" style="width: 60%; margin-left: 9%;"
					maxlength="200" value="${activityFilteUser.userPhone}" />
			</div>
			<div style="margin: 30px 0px 0px 0px">
				<label>描述:<span style="color: #F00; font-weight: bold">*</span></label>
				<input type="text" name="desc" id="descM"
					style="width: 60%; margin-left:12%;" maxlength="200"
					value="${activityFilteUser.desc}" />
			</div>
			<div style="margin: 30px 0px 0px 0px">
				<label>用户类型<span style="color: #F00; font-weight: bold">*</span></label>
				<!-- <select id="filteTypeM" name="filteType"
					style="width: 60%; margin-left: 6%;">
					<option value="2">请选择...</option>
					<option value="0">方打扰名单</option>
					<option value="1">白名单</option>
				</select> -->
				<span  style="margin-left: 100px">防打扰名单</span><input type="hidden" id="filteTypeM"  name="filteType" value="0">
			</div>
		</div>
		<div>
			<button id="submitbutton" class="l-button l-button-brand btn_query"
				style="margin-left: 330px;margin-top: 50px;width: 65px">&nbsp;添加</button>
			<!-- <button id="cancelbutton" class="l-button l-button-brand btn_query" style="margin-left: 50px;margin-top: 30px">&nbsp;取消</button> -->
		</div>
	</div>
</body>
</html>