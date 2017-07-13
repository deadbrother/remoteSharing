var yonghuqunzhuanyong = 0;
$(function(){
	if($("input[name='po.activityId']").val()!=""){
		$("#cDiv").removeClass("hide");
	/*	$("#cityOrgPath").attr("value",$("#companyId").val());*/
	}
	isMonth();
	//如果不选成功标准类型,则成功标准相关的内容都变的不可操作
	defaultSucc();
	//接收跳转页面用户群参数
	acceptParameter();
	//策略描述修改时相关方法
	strategyCom();
	//进入修改页面时动态控制匹配类型
	matchingType();
	//进入修改页面时动态加载产品
	productBack();
	
	if($("input[name='po.state']").val()=="11"){
		$("#pauseSaveActivity").attr("type","hidden");
		$("select[name='po.activityThemeCode']").attr("disabled",true);
		$("select[name='successStandardPo.successTypeId']").attr("disabled",true);
		$("input[name='po.activityType123']").attr("disabled",true);
		$("input[name='po.activityFunction']").each(function() {
			$(this).attr("disabled",true);
		});
		$("input[name='po.activityCycle']").each(function() {
			$(this).attr("disabled",true);
		});
		/*$("input[name='IssuedRule']").each(function() {
			$(this).attr("disabled",true);
		});*/
		$("#chooseUserGroupButton").addClass("hide");
		$("#newUserGroupButton").addClass("hide");
		$("#importUserGroupButton").addClass("hide");
	}
	if($("input[name='po.isSubActivity']").val()=="1"){
	    $("input[name='po.startDate']").attr("disabled",true);
		$("input[name='po.endDate']").attr("disabled",true);
		$("select[name='successStandardPo.successTypeId']").attr("disabled",true);
		$("select[name='po.parentActivity']").attr("disabled",true);
		$("#chooseUserGroupButton").attr("disabled",true);
		$("#newUserGroupButton").attr("disabled",true);
		$("#importUserGroupButton").attr("disabled",true);
	}
	//刷新用户数
	if($("#userGroupId").val()){
		refreshUserGroupNum();
	}
	getRejectChannel();
	
	//控制需要隐藏的功能
	hideFunction();
	//控制需要隐藏的渠道
	hideChannel();
	
});
/**
 * 控制需要隐藏渠道
 */
function hideChannel(){
	var channelIdArray = $("#hideChannelId").val();
	var channelId = channelIdArray.substring(1,channelIdArray.length-1);
	if(channelIdArray != null && channelIdArray.length>0){
		var channelIds = channelId.split(",");
		for(var i=0;i<channelIds;i++){
			$("#channelIds"+channelIds[i]).hide();
			$("#channelIdsgj"+channelIds[i]).hide();
		}
	}
}
/**
 * 控制需要隐藏的功能
 */
function hideFunction(){
	var hideId = $("#hideFunctionId").val();
	if(hideId != null && hideId != ""){
		var idArray = hideId.split(",");
		for(var i=0;i<idArray.length;i++){
			$("#"+idArray[i]).removeAttr("check_empty");
			$("#"+idArray[i]).removeAttr("check_size");
			$("#"+idArray[i]).hide();
		}
	}
}
//js加载完毕后执行加载产品数据的方法
window.onload =function(){
	window.frames[0].loadLeft();
	window.frames[1].loadRight();
};
/**
 * 屏蔽客户经理 扩展规则列表更新
 */
function fobidSpecialListChange(){
	$("#pauseToRemove").removeAttr("onclick");
	$("i.fa.fa-trash").removeAttr("onclick");
}

/**
 * 暂停时点击提交去掉diable事件
 */
function removeDisabled(){
	
	if($("input[name='po.state']").val()=="11"){
		$("select[name='po.activityThemeCode']").attr("disabled",false);
		$("select[name='successStandardPo.successTypeId']").attr("disabled",false);
		$("input[name='po.activityType123']").attr("disabled",false);
		$("input[name='po.activityFunction']").each(function() {
			$(this).attr("disabled",false);
		});
		$("input[name='po.activityCycle']").each(function() {
			$(this).attr("disabled",false);
		});
		$("input[name='IssuedRule']").each(function() {
			$(this).attr("disabled",false);
		});
	}else if($("input[name='po.isSubActivity']").val()=="1"){
		$("input[name='po.startDate']").attr("disabled",false);
		$("input[name='po.endDate']").attr("disabled",false);
		$("select[name='successStandardPo.successTypeId']").attr("disabled",false);
		$("select[name='po.parentActivity']").attr("disabled",false);
		/*$("#chooseUserGroupButton").attr("disabled",false);
		$("#newUserGroupButton").attr("disabled",false);
		$("#importUserGroupButton").attr("disabled",false);*/
	}
	$("input[name='isSubmit']").val("1");
}
/**
 * 根据用户群id,得到用户群的渠道偏好用户数
 * @param userGroupId用户群ID
 */
function getUserGroupNumberChannel(orgPath,userGroupId) {
	$.ajax({
		url : "../activity/getUserGroupNumber?userGroupId=" + userGroupId + "&orgPath=" + orgPath,
		type : "POST",
		async : false,
		success : function(data) {
			return data;
		}
	});
}
/**
 * 
 * @param userGroupId
 */
function getUserGroupNumberChannelAsync(orgPath,userGroupId,func,funcSuccess) {
	if(func){
		func();
	}
	$.ajax({
		url : "../activity/getUserGroupNumber?userGroupId=" + userGroupId + "&orgPath=" + orgPath,
		type : "POST",
		async : true,
		success : function(data) {
			if(funcSuccess){
				funcSuccess(data.success);
			}
		}
	});
}

/**
 * 根据用户群id 和附加sql 进行用户数统计
 * @param userGroupId
 * @param choice
 */
function getUserGroupNumberByChoice(orgPath,userGroupId,choice) {
	if(choice!=''&& choice){
		choice=" and "+choice;
	}
	var result;
	$.ajax({
		url : "getUserGroupNumberByChoice",
		type : "POST",
		data : {"orgPath":orgPath,"userGroupId":userGroupId,"choice":choice},
		async : false,
		success : function(data) {
			result= data.success;
		}
	});
	return result;
}

/**
 * 根据用户群id 和多附加sql条件 进行用户数统计
 * @param userGroupId
 * @param choices
 */
/*function getUserGroupNumberByRuleChoices(userGroupId,choices,frontFilterConditionSql) {
	if(choices!=''&& choices){
		choices=" and "+choices;
	}
	var result;
	$.ajax({
		url : "getUserGroupNumberByRuleChoices",
		type : "POST",
		data : {"userGroupId":userGroupId,"choice":choices,"po.frontlineChannelPo.filterConditionSql":frontFilterConditionSql},
		async : false,
		success : function(data) {
			result= data.success;
		}
	});
	return result;
}*/

function getUserGroupNumberByRuleChoices(orgPath,userGroupId,choices,frontFilterConditionSql,func,funcSuccess) {
	if(func){
		func();
	}
	$.ajax({
		url : "getUserGroupNumberByRuleChoices",
		type : "POST",
		data : {"orgPath":orgPath,"userGroupId":userGroupId,"choice":choices,"po.frontlineChannelPo.filterConditionSql":frontFilterConditionSql},
		async : true,
		success : function(data) {
			if(funcSuccess){
				funcSuccess(data.success);
			}
		}
	});
}
/**
 * 根据用户群id 和附加sql 异步查询用户数
 * @param userGroupId 用户群ID
 * @param choice 追加sql
 * @param func 查询前事件
 * @param funcSuccess  查询结果事件
 */
function getUserGroupNumberByChoiceAsync(orgPath,userGroupId,choice,func,funcSuccess) {
	if(choice!='' && choice){
		choice=" and "+choice;
	}
	if(func){
		func();
	}
	$.ajax({
		url : "getUserGroupNumberByChoice",
		type : "POST",
		data : {"orgPath":orgPath,"userGroupId":userGroupId,"choice":choice},
		async : true,
		success : function(data) {
			if(funcSuccess){
				funcSuccess(data.success);
			}
		}
	});
}

function refreshUserGroupNum(){
	yonghuqunzhuanyong=yonghuqunzhuanyong+2;
	$("#pauseSaveActivity").attr("disabled",true);
	$("#saveActivityButton").attr("disabled",true);
	getUserGroupNumberByChoiceAsync($("#orgPath").val(),$("#userGroupId").val(),"",function(){
		jQuery("#userGroupNum").html("加载中");
		jQuery("#userGroupNumAll").html("--");
		jQuery("#userGroupStrategyNum").html("--");
		jQuery("#userGroupPopNum").html("--");
		jQuery(".ChannelOut_activity span[id^=userGroupChannelNum]").html("--");
	},function(val){
		jQuery("#userGroupNum").html(val);
		jQuery("#userGroupNumAll").html(val);
		if(jQuery("#userGroupStrategyNum").html() == "--"){
			jQuery("#userGroupStrategyNum").html(val);
		}
		if(jQuery("#userGroupPopNum").html() == "--"){
			jQuery("#userGroupPopNum").html(val);
		}
		jQuery(".ChannelOut_activity span[id^=userGroupChannelNum]").html(val);
		yonghuqunzhuanyong--;
		if(yonghuqunzhuanyong==0){
			$("#pauseSaveActivity").attr("disabled",false);
			$("#saveActivityButton").attr("disabled",false);
		}
	});
	
	getUserGroupNumberChannelAsync($("#orgPath").val(),$("#userGroupId").val(),function(){
		jQuery(".IndexBlock_activity span[id^=userGroupNum]").html("--");
	},function(val){
		var arrayKey = val[0];
		var arrayVal = val[1];
		var keys = arrayKey.split(";");
		var values = arrayVal.split(";");
		
		var numAll= 0;
		var channelAll=0;
		for(var i=0;i<keys.length-1;i++){
			numAll+=parseInt(values[i]);
			if(jQuery(".IndexBlock_activity #userGroupNum"+keys[i]).size()>0){
				jQuery(".IndexBlock_activity #userGroupNum"+keys[i]).html(values[i]);
				channelAll+=parseInt(values[i]);
			}
			
		}
		jQuery(".IndexBlock_activity #userGroupNumOther").html(numAll-channelAll);
		userNumberShow();
		outerUseRefresh();
		outerUseRefreshPop();//当选则客户经理渠道时规则列表刷新
		yonghuqunzhuanyong--;
		if(yonghuqunzhuanyong==0){
			$("#pauseSaveActivity").attr("disabled",false);
			$("#saveActivityButton").attr("disabled",false);
		}
	});
	/*var obj = $(":input[name='po.frontlineChannelPo.channelSpecialFilterList[1].filterCondition']");
	if(typeof(obj) != undefined){
		ruleNumberChange(obj);
	}*/
	
}

function getActivityLogList( activityId,tenantId) {
	var result;
	$.ajax({
		url : "../activity/getActivityLog?activityExecuteInfo.activityId="+ activityId
		+"&activityExecuteInfo.tenantId="+tenantId,
		type : "POST",
		async : true,
		success : function(data) {
			result= data.log;
		}
	});
	return result;
}


function userNumberShow(){
	/*yonghuqunzhuanyong++;*/
	$("input[name$='filterConditionSql']").each(function(){
		if($(this).val()!=''&&$(this).attr("id")!=""){
			/*getUserGroupNumberByChoice($("#userGroupId").val(),$(this).val(),function(){
				$(this).parent().parent().prev().find("span").html("--");
			},function(val){
				$(this).parent().parent().prev().find("span").html(val);
				});*/
			/*var abc=getUserGroupNumberByChoice($("#userGroupId").val(),$(this).val());
			
			$(this).parent().parent().prev().find("span").html(abc);*/
			var numSpan = $(this).parent().parent().prev().find("span");
			getUserGroupNumberByChoiceAsync($("#orgPath").val(),$("#userGroupId").val(),$(this).val(),function(){
				numSpan.html("渠道条件筛选加载中...");
			},function(val){
				numSpan.html(val);
				/*yonghuqunzhuanyong--;
				if(yonghuqunzhuanyong==0){
					$("#pauseSaveActivity").attr("disabled",false);
					$("#saveActivityButton").attr("disabled",false);
				}*/
				
			});
		}
		});
}

function getRejectChannel(){
	 var rejectChannel = $("#rejectChannel").val();
	if(rejectChannel != null && rejectChannel !=""){
	    $("#mainForm").attr("disabled",true);
        $("form[id='mainForm'] :text").attr("disabled",true);  
        $("form[id='mainForm'] textarea").attr("disabled",true);  
        $("form[id='mainForm'] select").attr("disabled",true);         
        $("form[id='mainForm'] :radio").attr("disabled",true);  
        $("form[id='mainForm'] :checkbox").attr("disabled",true);
        $("form[id='mainForm'] :button").attr("disabled",true);
        $("form[id='mainForm'] [type='url']").attr("disabled",true);
        $("form[id='mainForm'] [type='number']").attr("disabled",true);
        $("form[id='mainForm'] a").addClass("hide");
        $("#advancedActivityBtn").attr("disabled",false);
	    var channel = rejectChannel.split(",");
		for(var i=0;i<channel.length;i++){
			$("[ischannel='"+channel[i]+"']").attr("disabled",false);
			$("[ischannel='"+channel[i]+"'] a").removeClass("hide");
		}
	}
}


