<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="../js/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../js/lib/fontawesome/boncFont.css" rel="stylesheet" type="text/css" />
<link href="../js/lib/easyui/themes/metro/easyui.css" rel="stylesheet" type="text/css" />
<link href="../js/base/css/boncBase@links.css" rel="stylesheet" type="text/css" />
<link href="../js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="../js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<link href="../js/common/epm-ui.css" rel="stylesheet" type="text/css" />

<script src="../js/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../js/activity/js/ligerui.all.js" type="text/javascript"></script>
<script src="../js/activity/activity-statistics.js" type="text/javascript"></script>
<script src="../js/lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/datepicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<table  style="border-collapse:separate; border-spacing:10px;display:table-cell;table-layout:fixed;" class="slds-text-align--right" >
     	<tr>
		<td width="75" align="right">
			<label class=" slds-form-element__label">创建时间：</label>
		</td>
		<td width="130">
		<input  class="Wdate" style="width:130px;" id="startDate" type="text" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
		</td>
		<td width="75">
		<label style="padding-left:20px;padding-right:20px; " class="slds-form-element__label">至</label>
		</td>
		<td width="130">
		<input class="Wdate" style="width:130px;" style="padding-left:0px" id="endDate"  type="text" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',minDate:'#F{$dp.$D(\'startDate\')}'})"/>
		</td>
		<td>
		<input type="button" class=" slds-button slds-button--brand " id="search-tool-btn" value="查询">
		</td>
 	</tr>
</table>
    <div id="maingrid"></div>
    
       <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y:scroll">
		<div class="modal-dialog"  >
			<div class="modal-content" style="margin-left:-40px;width:950px;" >
				<table
					class="slds-table slds-table--bordered slds-table--fixed-layout"
					data-epm="selectable-table" style="margin-bottom: 0px;">
					<tr class="slds-is-sortable slds-is-resizable">
						<td class="slds-grid">
						    <span id="detailName"></span>
						    <a onclick="download123();">导出数据</a>
						    <div id="h">
						       <input type="hidden" id="hid" value=""/>
						       <input type="hidden" id="hstate" value=""/>
						       <input type="hidden" id="hpath" value=""/>
						       <input type="hidden" id="hstartDate" value=""/>
						       <input type="hidden" id="hendDate" value=""/>
						    </div>
							<button type="button" class="slds-button slds-button--brand col-md-1 pull-left" data-dismiss="modal"  id="close1"  style="margin-left: 600px">关闭</button>
						</td>
					</tr>
				</table>
				
				<div class="slds-container--left slds-p-horizontal--lagrge"
					style="width: 98%">
					<div id="detailList" class=""></div>
					<div class="slds-container--left slds-p-horizontal--lagrge" style="margin-top: 10px">
				</div>
				</div>
				
				<div id="modifyMenu" class="boxMenu"></div>
			</div>
		</div>
	</div> 
</body>
</html>
