<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动详情</title>
<%@include file="head-js-css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../js/activity/activityPolicy-detail.js" type="text/javascript"></script>

</head>
  
  <body>
    
 <div data-target="#table-example2" data-offset="50" data-spy="scroll"
	class="slds-container--center slds-container--large" style="width:730px;margin-left:auto;margin-right:auto"> 
  
   <div class="slds-grid" style="margin-top:20px">
		<div>
			<h4>
				<b>政策信息  <input type="button"  name="button1"   value="返回"   onclick="history.go(-1)" class="btn btn-info" style="margin-left:700px;padding:0px 12px;margin-bottom:5px;line-height:100%!important"></b>
				
			</h4>
			
		</div>
	</div>
	<div class="slds-grid"
		style="border: 1px solid #bfbfbf; margin-top: 1px; margin-bottom: 30px; height: auto; border-radius: 10px;">
		
		
		<div class="container" style="width:100%;margin-left:auto;margin-right:auto">
			<table class="slds-size--1-of-1" style="width:700px;margin-left: 10px; margin-right: 20px;">
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 10%;">政策名称：</td>
					<td>${bo.policyInfo.policyName}</td>
				</tr>
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 10%;">政策类型；</td>
					<td>${bo.policyInfo.policyClassName}</td>
				</tr>
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 15%;">开始时间：</td>
					<td>${bo.policyInfo.startTime}</td>
				</tr>
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 15%;">结束时间：</td>
					<td>${bo.policyInfo.effectiveTime}</td>
				</tr>
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 15%;">创建人：</td>
					<td>${bo.policyInfo.createUserName}</td>
				</tr>
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 15%;">创建时间：</td>
					<td>${bo.policyInfo.createTime}</td>
				</tr>
				
				
				
				
				<tr style="white-space: nowrap; height: 30px;">
					<td style="width: 15%;">附件：</td>
					<td>
					    <div align="left">
						     <a class="blink"  onclick="window.location.href='../activityPolicy/download?po.policyId=${bo.policyInfo.policyId}'"  style="text-decoration: none;cursor: hand;">${bo.policyInfo.uploadFileName}</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	</div>
	
  </body>
</html>
