var loginId;
var tenantId;
var bpmFlowCode;
var bpmFlowCodes;
var bpmServerUrl;
var saveApprovalMessUrl;
var updateApprovalMessUrl;
var startActivityUrl;
var stopActivityUrl;
var queryStartChannel;
var smsSendUrl;
var isSendSms;
$(function(){
	getBpmSettingInfo();
	//console.log(bpmServerUrl);
	window.initBpmServerAddr(bpmServerUrl);	
}
);

function startProcess(){
	var result;
	var params = {};
	bpmServer.startFlow(loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	
				flowCode/*流程编码,必传*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
				function(json){
					//console.log(json);
					result = json;
			});
	return result;
}

function completeTask(processInstanceId,taskId){
	var result;
	var action;
	var message;
	var params = {};
	bpmServer.completeTask(loginId,
					tenantId,
					taskId,
					action,
					message,
					params,
					function(json){
						//console.log(json);
						result = json;
					});
	return result;
}
function aa(json){
	//console.log(json);
}
function getNextInfo(processInstanceId){
	
	var result= bpmServer.getNextTaskInfo(loginId,
					tenantId,
					processInstanceId,
					function(json){
						aa(json);
						
					});
	return result;
}

function daiban(){
	var result;
	var params ={};
	bpmServer.getDaibanTasks(loginId,
					tenantId,
					"",
					"",
					"",
					params,
					function(json){
						//console.log(json);
						result = json;
					});
	return result;
}

function deleteProcess(processInstanceId){
	var result;
	var params;
	bpmServer.deleteProcInstById(loginId,
					tenantId,
					processInstanceId,
					function(json){
						//console.log(json);
						result = json;
					}
	);
}
function getBpmSettingInfo(){
	$.ajax({
		url : "../activityExamine/bpmSettingInfo",
		type : "POST",
		async : false,
		success : function(data) {
			//console.log(data);
			var json = eval("("+data+")");
			loginId = json.loginId;
			//console.log(loginId);
			tenantId = json.tenantId;
			bpmFlowCode = json.bpmFlowCode;
			bpmFlowCodes = json.bpmFlowCodes;
			bpmServerUrl = json.bpmServerUrl;
			saveApprovalMessUrl = json.saveApprovalMessUrl;
			updateApprovalMessUrl = json.updateApprovalMessUrl;
			startActivityUrl = json.startActivityUrl;
			stopActivityUrl = json.stopActivityUrl;
			queryStartChannel = json.queryStartChannel;
			smsSendUrl = json.smsSendUrl;
			isSendSms = json.isSendSms;
		}
	});
	
}