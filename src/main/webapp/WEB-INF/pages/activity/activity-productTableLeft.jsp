<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../js/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../js/ligerui/lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
<script src="../js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>  
<script src="../js/activity/productTableLeft.js" type="text/javascript"></script> 
<link href="../js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="../js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<link href="../js/common/epm-ui.css" rel="stylesheet" type="text/css" />

<!--  上方未选择产品列表-->
<div class="container">
<div cklass="row">
<table  style="border-collapse:separate;display:table-cell;table-layout:fixed;" class="activeLayout">
	<tr>
 		<td width="15%" style="font-size: 15px;color: #16325C;text-align: right">
           名称/编码:
 		</td>
 		<td width="15%">
 			<input class="slds-input" id="queryLeftVal" type="text" placeholder="请输入产品编码或产品名称"/>
 		</td>
 		<!-- <td width="30px" align="right">
 				<label class="slds-form-element__label">产品分类:</label>
 		</td>
 		<td width="22%">
 			<select id="querySuccproType" class="slds-select ">
 				<option value="">请选择..</option>
				<option value="3">流量包</option>
				<option value="4">合约</option>
				<option value="5">套餐</option>
			</select>
 		</td> -->
 		<td width="15%" style="font-size: 15px;color: #16325C;text-align:right;">
 				产品网别:
 		</td>
 		<td width="10%">
 			<select id="querySuccproService" class="form-control">
				<option value="">请选择..</option>
				<c:forEach items="${bo.productServiceTypeList}" var="type">
					<option value="${type.typeCode}">${type.typeName}</option>
				</c:forEach>
			</select>
 		</td>
 		
 		<td width="15%" style="font-size: 15px;color: #16325C;text-align:right;">
 			付费类型:
 		</td>
 		<td width="10%">
 			<select id="querySuccproPaymode" class="form-control">
				<option value="">请选择..</option>
				<c:forEach items="${bo.productPayModeList}" var="pay">
					<option value="${pay.payModeCode}">${pay.payModeName}</option>
				</c:forEach>
			</select>
 		</td>
	 	<td width="10%">
	 		<button  type="button" id="queryLeft" onclick="window.parent.refreshUp();"  class="slds-button slds-button--brand" style="margin-left: 10px;">查询</button>
	 	</td>
	 	<td width="10%">
	 		<button  type="button" id="chooseUpPro" onclick="chooseUpPro();"  class="slds-button slds-button--brand" style="margin-left: 10px;">添加</button>
 		</td>
 	</tr>
</table>	
</div>
</div>
<div class="slds-container--left slds-p-horizontal--small"
					style="width:88%;margin-top:10px">
					
	<div id="maingridOne" class="" ></div>
</div>


