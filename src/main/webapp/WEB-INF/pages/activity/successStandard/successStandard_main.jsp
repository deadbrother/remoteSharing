<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<script type="text/javascript">
	var docPath = "${pageContext.request.contextPath}/", docBase = docPath
			+ "clyx/activity/";
</script>


<div data-target="#table-example2" data-offset="50" data-spy="scroll"
	class="slds-container--fluid" >
	<div  style="margin-top:23px">		
		
			
			<div class="slds-p-horizontal--small slds-size--1-of-1 slds-grid" style="margin-left:-10px" style="float:left">		
			    <label style="white-space: nowrap;margin-top: 5px;margin-right:18px">组织机构：</label>			
				<span style="margin: 0; style="float:left">
				 	<span class="content_wrap slds-size--7-of-8 slds-text-align--left" style="height:20px">
	                    <span class="zTreeDemoBackground left" style="height:20px">
		                    <input type="hidden" id="orgIds"/>
			                <input type="text" style="width:100px" id="orgSelect" name="bo.successStandardPo.orgId" readonly value="${bo.activityBasicInfo.ORG_RANGE }" onclick="showMenu()"
							             class="form-control select-obj">                               		                
	                    </span>
                    </span>  
                    <span class=" slds-p-horizontal--small slds-size--1-of-1 slds-grid"
							style="margin-top:5px; z-index:100">		
						<span class="slds-grid slds-grid--align-left">
							<div id="menuContent" class="menuContent" style="position:absolute;display:none;z-index:100;">
				              <ul id="orgtree" class="ztree" style="margin-top:5px;margin-left:127px"></ul>
			             	</div>
					    </span>
				 	</span>
					
				</span>
			
		
		
		
		
		
		<div class="slds-grid slds-grid--vertical-stretch slds-p-horizontal--small slds-size--2-of-12" style="float:left">
			<label style="width:60%;white-space: nowrap;text-overflow: ellipsis;vertical-align: middle;margin-top: 5px;margin-right:18px;margin-left:25px" for="successCode">成功标准编码：</label>
			<input class="slds-input slds-size--1-of-2"  type="text" id="activityName" style="margin-right:18px;width:100px" readOnly="readonly">
		</div>
		
		<div style="float:left">
			<label style="white-space: nowrap;text-overflow: ellipsis;vertical-align: middle;margin-top: 5px;margin-right:18px;margin-left:95px" for="successName">成功标准名称：</label>
			<input class="slds-input slds-size--1-of-2"  type="text" id="successName" style="margin-right:18px;width:100px" >
		</div>
		
		<div class="slds-grid slds-grid--vertical-stretch slds-p-horizontal--small slds-size--2-of-12" style="padding-right:21px" style="float:left">
			<label style="white-space: nowrap;text-overflow: ellipsis;vertical-align: middle;margin-top: 5px;margin-right:18px;margin-left:5px">成功标准类型：</label>
			
			<select id="successType" class="slds-select" style="width:100px">
				<option value="">请选择：</option>
				<c:forEach items="${bo.successStandardTypeList}" varStatus="index" var="sst">
					<option value="${sst.typeId}">${sst.typeName}</option>
				</c:forEach>
			</select>	
		</div>
		

		
	</div>
	      <div  style="display:block;margin-top:10px;margin-left:755px">
	      		
			
		
			<button  id="search-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-file"></span>&nbsp;查询
			</button>
			<button  id="add-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
				<span style="color:white" class="epm-icon glyphicon glyphicon-repeat"></span>&nbsp;新增
			</button>
	
	
		</div>
	<div class="slds-grid slds-wrap slds-grid--pull-padded slds-col--padded-large" style="margin-top: 30px">		
		<div class="page-container" style=" margin-top: 1px; margin-bottom:; height: auto;border-radius: 10px;position: static;">
			<div id="content" class="content"  style="position:absolute;z-index:-1;"></div>
		</div>
	</div>
  </div>
</div>
