/*iframe父页面设置全局变量*/
var managerUp;
var managerDown;

/**
 * 如果不选成功标准类型,则成功标准相关的元素都不可操作
 */
function defaultSucc (){
	if($('#successType option:selected').html() == null || $('#successType option:selected').html() == "请选择.."){
		$("#btn2").attr("disabled","true");
		$("#desRules").attr("disabled","true");
	}	
}
/**
 * 获取跳转页面传递过来的参数
 * @param name
 * @returns
 */
function acceptParameter(){
/**
 * 接收跳转页面传递参数
 */
	if($("#ciwaId").val()!=null && $("#ciwaId").val() != ""){
		$('input[name="po.userGroupId"]').val($("#ciwaId").val());
		$.ajax({
			async : false,
			type : "POST",
			url : "../activity/queryUserGroupMess",  
			data : {
				"userGroupId":$('input[name="po.userGroupId"]').val()
			},
			success : function(data) {
				$('input[name="po.userGroupName"]').val(data.bo.userGroupName);
				$('input[name="po.userGroupType"]').val(data.bo.userGroupType);
				$('input[name="USERGROUP_FILTERCON"]').val(data.bo.userGroupDesc);
			}
		});
	}
}
function strategyCom(){
/**
 * 修改页面进入时给变量赋值
 */
	if($('#successType option:selected').html() != null && $('#successType option:selected').html() != "请选择.."){
		successTypeName = "成功标准类型为：" + $('#successType option:selected').html() + "；";
	}
	if($("#selectedNames").val() != null && $("#selectedNames").val() != ""){
		successmatchtype = "匹配类型为："+matchTypeName+"；"+"产品名称为："+$("#selectedNames").val()+"；";	
	}
	if($("#successCondition").val() != null && $("#successCondition").val() != ""){
		succcondition = "成功标准附加条件为：" + $("#successCondition").val() + "；";   
	}
	if($("#desRules").val() != null && $("#desRules").val() != ""){
		succreword = "成功标准奖励描述为：" + $("#desRules").val() + "；";		
	}
}
function matchingType(){
/**
 * 进入修改页面时动态控制匹配类型
 */
	var succType = $('#successType').find('option:selected').attr('lev');
	succTypeConditon();
	 document.getElementById("productrel1").value=succType;
	if(succType==0 || succType == undefined){
		$("#match").hide();
		$("#match1").hide();
		$("#match2").hide();
	}else{
		//$("#match2").show();
		//$("#match").show();
		//$("#match1").show();
	}
}
function succTypeConditon(){
	/**
	 * 根据成功标准类型显示成功标准类型描述
	 */
	var condition = $('#successType').find('option:selected').attr('str');
	if(condition){
		$("#succcondition").show();
		$("#successTypeCondition").css("fontsize","8px");
		$("#successTypeCondition").css("color","#199ED8");
		//$("#successTypeCondition").css("text-indent","8em");
		$("#successTypeCondition").text(condition);	
	}else{
		$("#succcondition").hide();
		$("#successTypeCondition").text("");	
	}
}
var manager;
function userGrouplist(){
/**
 * 选择用户群操作
 */
	
	/*if(manager){
	 	manager.toggleLoading();
	 	manager.reload();
	 	return;
	}*/
	manager = $("#userGroupList22").ligerGrid(
		{
		
		columns : [
		    {display : '',align : 'center',width:'5%', 
		    	render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style='max-height:30px;'><input name='aa' type='radio'></div>";
			}},
	        { display : '用户群类型',name : 'CI_WA_TYPE',align : 'left',width:'10%',
	        	render : function(rowdata, rowindex, value) {
	        		var str = '';
					if (value == "0") {
						str = "移动";
					} else if (value == "1") {
						str = "固网";
					} else if (value == "2") {
						str = "全部";
					}else{
						str = "无类型";
					}
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='"+str+"'>" +str+ "</div>";
				}
	        },
			{ display : '<td style="text-align:left">用户群名称</td>',name : 'CI_WA_NAME',align : 'left',width:'20%',
	        	render:function(rowdata,index,value){	        		
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.CI_WA_NAME+"'>" +rowdata.CI_WA_NAME+ "</div>";
	        		}	
			},
			{ display : '<td style="text-align:right">原用户群数</td>',name : 'CI_WA_NUM',align : 'left',width:'10%'},
			{ display : '<td style="text-align:left">用户群条件</td>',name : 'CI_WA_DESC',align : 'left',width:'20%',
				render:function(rowdata,index,value){
					var CI_WA_DESC = "";
					if(value == undefined){
						CI_WA_DESC = ""
					}else{
						CI_WA_DESC = value;
					}			
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+ CI_WA_DESC+"'>" +CI_WA_DESC+ "</div>";
					}
			},
			{ display : '<td style="text-align:left">创建人</td>',name : 'createUserName',align : 'left',width:'10%',
				render:function(rowdata,index,value){	
					var createUserName = "";
					if(value == undefined){
						createUserName = ""
					}else{
						createUserName = value;
					}
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='"+createUserName+"'>" +createUserName+ "</div>";						}
			},
			{ display : '创建时间',name : 'CI_WA_CREATEDATE',align : 'center',width:'20%',
				render:function(rowdata,index,value){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='"+rowdata.CI_WA_CREATEDATE+"'>" +rowdata.CI_WA_CREATEDATE+ "</div>";
				}
			},
			
			{name : 'CI_WA_ID', hide : 'hide'},
			{name : 'FACT_TABLE_NAME', hide : 'hide'},
			{name : 'QUERY_SQL' , hide : 'hide'}
						
],
			isScroll : true,
			url : '../activity/usergroup',
			checkbox : false,
			isSingleCheck :true,
			isChecked: function(rowdata){
				if(($("input[name='po.userGroupId']").val()  != null) && ($("input[name='po.userGroupId']").val()  != "")){
					if (rowdata.CI_WA_ID.indexOf($("input[name='po.userGroupId']").val() ) == 0) 
						return true;
				}
				return false;
			},
			onSelectRow: function(rowdata, rowindex, rowDomElement){
				$(".l-selected").find("td:eq(0)>div input").prop("checked",true);
			},
			pageSize:5,
			rownumbers : false,
			usePager : true,
			fixedCellHeight:false,
			width:890
		});
	
	$("#userGroupList22 .l-grid-header-table tr:first td:first").html("");
	$(function(){
		loadData();
	});
	
}
function loadData(){
	manager.reload(1);
}
var newgroup;
function userGrouplistNew(){
/**
 * 新建用户群
 */
	newgroup = $.ligerDialog.open({
				url:"/" + services.xbuilderoracle + "/lable/index.e?activityFlag=1&callBack=window.parent.setNewUserGroup",
				title:"新建用户群",
				height: 500,
				width: 900,
				isResize: true,
				isDrag:true,
				buttons : [ {
					text : '关闭',
					onclick: function (item, dialog) { dialog.close(); } 
				}]
			});
	//window.open("/xbuilderoracle/lable/index.e?activityFlag=1&callBack=window.opener.setNewUserGroup");
}

var importuser;
function userGrouplistImport(){
/**
 * 导入用户群
 */
	importuser=	$.ligerDialog.open({
					url:"/"+services.usertool+"/extractupload.action?activityFlag=1&callBack=window.parent.setImportUserGroup",
					title:"用户群导入",
					height: 500,
					width: 900,
					isResize: true,
					isDrag:true,
					buttons : [ {
						text : '关闭',
						onclick: function (item, dialog) { dialog.close(); } 
					}]
				}); 
	
}

function setNewUserGroup(obj){
/**
 * 接收新建用户群返回参数
 */
	$('input[name="po.userGroupId"]').val(obj.usergroupid);
	$('input[name="po.userGroupName"]').val(obj.usergroupname);
	$('input[name="po.userGroupType"]').val(obj.usergrouptype);
	newgroup.close();
	$.ajax({
		async : false,
		type : "POST",
		url : "../activity/queryUserGroupMess",  
		data : {
			"userGroupId":$('input[name="po.userGroupId"]').val()
		},
		success : function(data) {
			$('input[name="USERGROUP_FILTERCON"]').val(data.bo.userGroupDesc);
		}
	});
	refreshUserGroupNum();
}

function setImportUserGroup(obj){
/**
 * 接收导入用户群返回参数
 */
	$('input[name="po.userGroupId"]').val(obj.usergroupid);
	$('input[name="po.userGroupName"]').val(obj.usergroupname);
	$('input[name="po.userGroupType"]').val(obj.usergrouptype);
	importuser.close();
	$.ajax({
		async : false,
		type : "POST",
		url : "../activity/queryUserGroupMess",  
		data : {
			"userGroupId":$('input[name="po.userGroupId"]').val()
		},
		success : function(data) {
			$('input[name="USERGROUP_FILTERCON"]').val(data.bo.userGroupDesc);
		}
	});
	refreshUserGroupNum();
}

function resetForm(){
/**
 * 用户群模糊查询功能
 */
	var userGroupName=$.trim($("#queryUserGroup").val());
	var userGroupCreater = $.trim($("#queryUserGroupCreater").val());
	userGroupName = userGroupName!=null?userGroupName:"";
	userGroupCreater = userGroupCreater!=null?userGroupCreater:"";
	manager.options.page = 1 ;
	manager.options.parms = 
	{"po.userGroupName": userGroupName,
	 "po.createName"   : userGroupCreater
	};
	manager.reload(1);
}

function choose(){
/**
 * 点击选择按钮时触发方法
 */
	$('#myModal').modal({backdrop: 'static', keyboard: false});
	if($(".l-selected").find("td:eq(2)>div").html() == "" || $(".l-selected").find("td:eq(2)>div").html() == undefined){	
		$.ligerDialog.warn('请先选择用户群,或点击关闭按钮关闭');
	}else{
		switch($(".l-selected").find("td:eq(1)>div").text()){ 
			case "移动": 
				$("#userGroupType").val("0"); 
				break; 
			case "固网": 
				$("#userGroupType").val("1"); 
				break;
			case "全部": 
				$("#userGroupType").val("2"); 
				break;
		}
		$("#userGroupName").val($(".l-selected").find("td:eq(2)>div").text());
		$("#userGroupId").val($(".l-selected").find("td:eq(7)>div").text());
		$("#USERGROUP_FILTERCON").val($(".l-selected").find("td:eq(4)>div").text());
		$("#close1").trigger("click");
		refreshUserGroupNum();
	}
}
function getUserGroupNumberChannel() {
	userGroupId = $("#userGroupId").val();
	var data1=null;
	$.ajax({
		url : "../activity/getUserGroupNumber?userGroupId=" + userGroupId,
		type : "POST",
		async : false,
		success : function(data) {
		    data1=data;
		}
	
	});
	return data1;
}
/**
 * 成功标准  策略拼接
 */
var successTypeName = "" //成功标准类型名称
var successmatchtype = ""  //成功标准匹配类型
var productName= ""  //产品名称
var succcondition = ""   //成功标准条件
var succreword = ""   //奖励描述

function selectOnchang(obj){
/**
 * 根据成功标准类型动态加载匹配类型
 * @param obj
 */
	var succType = $('#successType').find('option:selected').attr('lev');
	succTypeConditon();
	 document.getElementById("productrel1").value=succType;
	if(succType==0 || !succType){
		$("#match2").hide();
		$("#match").hide();
		$("#match1").hide();
		$("#productTrDown").hide();
		$("#productTr").hide();
		$("#successProductIds").val("");
		$("#orderProductIds").val("");
		$("#selectedNames").val("");
		$("#orderSelectedNames").val("");
		$($("#match :radio")[0]).attr("checked",false);
		$($("#match :radio")[1]).attr("checked",false);
		successmatchtype="";
	}else{
		//$("#match2").show();
		//$("#match").show();
		//$("#match1").show();
		$("#xuanZe").removeAttr("checked");
		$("#successProductIds").val("");
		$("#orderProductIds").val("");
		$("#selectedNames").val(""); 
		$("#orderSelectedNames").val("");
		$('#iframeLeft').contents().find("#queryLeftVal").val('');
		$('#iframeRight').contents().find("#queryRig htVal").val('');
		jQuery("#match :radio")[1].click();		
		//successmatchtype="匹配类型为：全部匹配；";
	}
		successTypeName = "";
			productName	= "";//产品名称置空
		successTypeName = successTypeName+"成功标准类型为："+$('#successType option:selected').html()+ "；";
		if($('#successType option:selected').html() != null && $('#successType option:selected').html() != "请选择.."){
			strategyDesc();
			$("#btn2").removeAttr('disabled');
			$("#desRules").removeAttr('disabled');
		}else{
			$("#btn2").attr("disabled","true");
			$("#desRules").attr("disabled","true");
			$("#desRules").val("");
			$("#strategyDesc").val("");
			$("#successCondition").val("");	
			$("#strategyDesc").val("");
			successTypeName=" ";
			successmatchtype=" ";
			productName=" ";
			succcondition=" ";
			succreword="";
		}
			$("#successProductIds").val("");
			$("#orderProductIds").val("");
}

function choosesucc(){
/**
 * 成功标准条件框回值
 */
	//var sCondition = $("#successCondition").val();
	//if(typeof(sCondition) == undefined) sCondition = "";
	var sSqlCondition = $("#successSqlCondition").val();
	if(typeof(sSqlCondition) == undefined) sSqlCondition = "";
	conditionObj.taskCond(sSqlCondition,"2","", function(sql, resume,conditions) {
		$("#successCondition").val(resume);
		$("#successConditionSQL").val(sql);
		$("#successSqlCondition").val(conditions);
		if(resume != null && resume != ""){
			succcondition = "";
			succcondition = succcondition +"成功标准附加条件为："+resume + "；";
			strategyDesc();
		}else{
			succcondition = "";
			strategyDesc();
		}
	});
}

function reward(){
	/**
	 * 奖励积分描述规则
	 */
	succreword = "";
	$("#desRules").val($("#desRules").val().replace(/(^\s*)|(\s*$)/g, "")); 
	if($("#desRules").val()!=null && $("#desRules").val()!=""){
		succreword = succreword +"成功标准奖励描述为："+$("#desRules").val() +"；";
		strategyDesc();
	}else{
		succreword = "";
		strategyDesc();
	}
}

/**
 * 点击全部匹配触发事件
 */
	function matchAll() {
		$("#lili").show();
		$("#productTrDown").hide();
		$("#productTr").hide();
		jQuery("#match #xuanZe").attr("checked",false);
		$("#successProductIds").val("");
		$("#orderProductIds").val("");
		$("#selectedNames").val("");
		$("#orderSelectedNames").val("");
		refreshUp();
		refreshDown();
		productName="";
		successmatchtype="匹配类型为：全部匹配；";
		strategyDesc();
		//本地短信产品
		productOnchang();
		$("#orderProduct option").removeAttr("selected");
	}
	/**
	 * 点击精确匹配触发事件
	 */
	function matchAccurate() {
		$("#xuanZe").removeAttr("checked");
		$("#lili").hide();
		$("#productTrDown").show();
		$("#productTr").show();
		$("#successProductIds").val("");
		$("#selectedNames").val("");
		$("#orderSelectedNames").val("");
		$("#orderProductIds").val("");
		refreshUp();
		refreshDown();
		//successmatchtype="匹配类型为：精确匹配；";
		productName="";
		strategyDesc();
		//本地短信产品
		productOnchang();
		$("#orderProduct option").removeAttr("selected");
	}
	/**
	 * 点击优选选择产品触发事件
	 */
function matchFirst(){
		if($("#xuanZe").is(":checked")==true){
			$("#productTr").show();
			$("#productTrDown").show();
			$("#successProductIds").val("");
			$("#orderProductIds").val("");
			$("#selectedNames").val("");
			$("#orderSelectedNames").val("");
			refreshUp();
			refreshDown();
		}else{
			$("#productTr").hide();
			$("#productTrDown").hide();
			$("#successProductIds").val("");
			$("#orderProductIds").val("");
			$("#selectedNames").val("");
			$("#orderSelectedNames").val("");
			productName="";
			strategyDesc();
		}
		$("#successProductIds").val("");	
		$("#orderProductIds").val("");
		//本地短信产品
		productOnchang();
		$("#orderProduct option").removeAttr("selected");
	}


/**
 * 库有产品表模糊查询
 */
function refreshUp(){	
	var successTypeId=$('#successType option:selected').val();
	var rst1=$('#successType').find('option:selected').attr('rst');
	if(!rst1){
		rst1="";
	}
	var isLeft = "left";
	var successProductIds = $("#successProductIds").val();
	var productCode=$.trim($('#iframeLeft').contents().find("#queryLeftVal").val());
	//var querySuccproType=$('#iframeLeft').contents().find('#querySuccproType option:selected').val();
	var querySuccproService=$('#iframeLeft').contents().find('#querySuccproService option:selected').val();
	var querySuccproPaymode=$('#iframeLeft').contents().find('#querySuccproPaymode option:selected').val();
	productCode = productCode!=null?productCode:"";
	if(managerUp != undefined){
		managerUp.options.page = 1 ;
		managerUp.options.parms = {
				"successProductPo.productCode":productCode,
				//"successProductPo.productSuccesstype":querySuccproType,
				"successProductPo.serviceType":querySuccproService,
				"successProductPo.payMode":querySuccproPaymode,
				"successStandardPo.successProductIds":successProductIds,
				"successStandardPo.successTypeId":successTypeId,
				"successStandardPo.rst1":rst1
		};
		if($($("#match :radio")[1]).is(':checked')==true){
			managerUp.reload(1);			
		}
		
	}
//	iframeHeightLeft();
}
/**
 * 已选产品表模糊查询
 */
function refreshDown(){
	var successTypeId=$('#successType option:selected').val();
	var rst1=$('#successType').find('option:selected').attr('rst');
	if(!rst1){
		rst1="";
	}
	var isLeft = "right";
	var successProductIds = $("#successProductIds").val();
	var productCode=$.trim($('#iframeRight').contents().find("#queryRightVal").val());
	//var querySuccproType=$('#iframeRight').contents().find('#querySuccproType option:selected').val();
	var querySuccproService=$('#iframeRight').contents().find('#querySuccproService option:selected').val();
	var querySuccproPaymode=$('#iframeRight').contents().find('#querySuccproPaymode option:selected').val();
	productCode = productCode!=null?productCode:"";
	var activityId= $("input[name='po.activityId']").val();
	if(managerDown != undefined){
		managerDown.options.page = 1 ;
		managerDown.options.parms = {
				"isLeft":isLeft,
				"successProductPo.productCode":productCode,
				//"successProductPo.productSuccesstype":querySuccproType,
				"successProductPo.serviceType":querySuccproService,
				"successProductPo.payMode":querySuccproPaymode,
				"successStandardPo.successProductIds":successProductIds,
				"successStandardPo.successTypeId":successTypeId,
				"successStandardPo.rst1":rst1,
				"po.activityId":activityId
		};
		if($($("#match :radio")[1]).is(':checked')==true){
			managerDown.reload(1);			
		}
	}
//	iframeHeightRight();
}
/**
 * 策略描述自动生成
 */
function strategyDesc(){
	$("#strategyDesc").val(successTypeName+" "+successmatchtype+" "+productName+" "+succcondition+" "+succreword);
}

/**
 * 进入修改页面时动态加载产品
 */
function productBack(){
	var idsIds= $("#successProductIds").val();
	var orderid = $("#orderProductIds").val();
	if(idsIds==null||idsIds==""){
		$("#successProductIds").val("");
	}else{
		idsIds=idsIds.substring(0,idsIds.length-1);
		$("#successProductIds").val(idsIds);
	}
	if(orderid==null||orderid==""){
		$("#orderProductIds").val("");
	}else{
		orderid=orderid.substring(0,orderid.length-1);
		$("#orderProductIds").val(orderid);
	}

//修改页面获取已选产品名称
$.ajax({
	async : false,
	type : "POST",
	url : "getProductNames",  
	data : {
		"successStandardPo.successProductIds":$("#successProductIds").val()
	},
	// dataType:"json",
	success : function(data) {
		var a = data.length;
		$("#selectedNames").val(data.substring(0, a - 1));
	}
});

//修改页面获取短信订购产品名称
$.ajax({
	async : false,
	type : "POST",
	url : "getOrderProductNames",  
	data : {
		"successStandardPo.successProductIds":$("#successProductIds").val()
	},
	// dataType:"json",
	success : function(data) {
		$("#orderSelectedNames").val(data.productNames);
		$("#orderProductIds").val(data.productids);
	}
});

if($($("#match :radio")[0]).is(':checked')==true && $("#successProductIds").val()!=""){
	$("#successProductIds").val($("#successProductIds").val());
	$("#orderProductIds").val($("#orderProductIds").val());
	$("#lili").show();
	$("#xuanZe").attr("checked",true);
	$("#productTr").show();
	$("#productTrDown").show();
	refreshUp(); 
	refreshDown();
	successmatchtype="匹配类型为：全部匹配；";
	strategyDesc();
}
if($($("#match :radio")[1]).is(':checked')==true){
	$("#xuanZe").removeAttr("checked");
	$("#lili").hide();
	$("#productTrDown").show();
	$("#productTr").show();
	refreshUp();
	refreshDown();
	successmatchtype="匹配类型为：精确匹配；";
	strategyDesc();
}
if($("#selectedNames").val() != null && $("#selectedNames").val() != ""){	
	productName ="产品名称为："+$("#selectedNames").val()+"；";
	strategyDesc();
}
chooseOrderProduct();
}
//库有产品表iframe高度自适应
function iframeHeightLeft(){
	var mainheight = $("#iframeLeft").contents().find("body").height();
	$("#iframeLeft").height(mainheight);
}
//已选产品表iframe高度自适应
function iframeHeightRight(){
	var mainheight = $("#iframeRight").contents().find("body").height();
	$("#iframeRight").height(mainheight);
}
