$(function(){
	//console.log($("#bpmUrl").val());
	var resultCode = $("#resultCode").val();
	var processInstanceId = $("#processInstanceId").val();
	var state = $("#state").val();
	var activityId = $("#activityId").val();
	$("#shuochukou").hide();
	//var saveType = $("#saveType").val();
	
	if(processInstanceId!=null&&processInstanceId!=""&& state != "12"){
		if(resultCode=="1"){
			//$.ligerDialog.warn("提交成功");
			$.ligerDialog.waitting("页面跳转中,请稍候...");
		    $.ajax({
				url:"../activityExamine/beginExamine",
				type:"POST",
				data:{"processInstanceId":processInstanceId,
					  "po.activityId"    :activityId,
					  "po.state"         :"12"},
				async: false,
				success : function(data){
					if(data.success){
						//console.log("状态变更成功");
					}else{
						//console.log("状态变更失败");
					}
				}
			 });
				completeNext(processInstanceId,activityId);
			}else if(resultCode == '2'){
				$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
				
			}else if(resultCode == '3'){
				$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
				
			}
	}else if((processInstanceId==null||processInstanceId=="")&&state != "12"){
		if(resultCode=="1"){
			$.ligerDialog.waitting("页面跳转中,请稍候...");
			 $.ajax({
					url:"../activityExamine/beginExamine",
					type:"POST",
					data:{"processInstanceId":processInstanceId,
						  "po.activityId"    :activityId,
						  "po.state"         :"12"},
					async: false,
					success : function(data){
						if(data.success){
							//console.log("状态变更成功");
						}else{
							//console.log("状态变更失败");
						}
					}
				 });
			/**
			 * 流程传递活动信息（基于审批页面需要信息）
			 */
			var params = {};
			params.setTaskUser = 0;
            params.taskLoginId = "initwhartever";
        	var orgIds1  = $("#createOrgPath").val().split("/");
        	if(orgIds1.length < 4){
        		orgIds1.push("");
        		orgIds1.push("");
        	}
			params.provId = orgIds1[1];
			params.cityId = orgIds1[2];
			params.countyId = orgIds1[3];
			params.tenantId = tenantId;
			//params.activityId=$(":input[name='po.activityId']").val();
			bpmServer.startFlow(loginId/*用户LoginId,必传*/,
					tenantId/*租户ID，非多租户版可以传undefined*/,	
					bpmFlowCode/*流程编码,必传*/,
					params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
					function(json){
						//console.log(json);
						processInstanceId = json.processInstanceId;
						if(json.success == true){
							$.ajax({
								url:"../activityExamine/saveProcessInstanceId",
								type:"POST",
								data:{"processInstanceId":processInstanceId,
									  "po.activityId"    :activityId,
									  "po.state"         :"12"},
								async: false,
								success : function(data){
									if(data.success){
										//console.log("流程id保存成功");
									}else{
										//console.log("流程id保存失败");
									}
								}
							 });
						    completeNext(processInstanceId,activityId);					    
						}else{
							deleteActivityAndInstance(processInstanceId,activityId);
						}
			});			
		}else if(resultCode == '2'){
			$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
		}else if(resultCode == '3'){
			$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
		}
	}else{
		if(resultCode=="1"){
			//$.ligerDialog.waitting("页面跳转中,请稍候..."); setTimeout(function () { $.ligerDialog.closeWaitting(); }, 1000);
			$.ligerDialog.warn("提交成功");
			if(top.closeTab==undefined){
				location.href="../activity/main";
	
			}else{
					 top.openTab("活动列表","/"+services.clyxactivity+"/activity/main");
					 $("#iframe_call_tab").attr("href","/"+services.clyxactivity+"/activity/main");
					 top.closeTab("活动策划","活动列表",true);
					 top.closeTab("活动修改","活动列表",true);	
			}
		}else if(resultCode == '2'){
			$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
		}else if(resultCode == '3'){
			$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
		}
	}
	/*var flag = false;
	//请求代办列表进行逻辑判断开始
	bpmServer.getDaibanTasks(loginId,
			tenantId,
			"",
			"",
			"",{},
			function(json){
				console.log(json.data);
				$(json.data).each(function(){
					if(this.TASK_DESC == $("#activityId").val()){
						flag = true;
						processInstanceId = this.PROC_INST_ID;
						//console.log(flag);
						//console.log(processInstanceId);
					}
				});
				if( flag == true && state != "12"){
					if(resultCode=="1"){
						$.ligerDialog.warn("提交成功");
							completeNext(processInstanceId,activityId);
						}else if(resultCode == '2'){
							$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
							
						}else if(resultCode == '3'){
							$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
							
						}
					}else if(flag == false && state != "12"){
						if(resultCode=="1"){
							$.ligerDialog.warn("提交成功");
							*//**
							 * 流程传递活动信息（基于审批页面需要信息）
							 *//*
							var params = {};
							params.startActivityUrl = startActivityUrl;
							params.activityName = $("#activityName").val().trim();
							//var activityThemeCode = $(":input[name='po.activityThemeCode']").val();
							var activityTheme = $("#activityTheme").val();
							params.activityTheme = activityTheme;
							params.orgLevel = $("#orgLevel").val();
							params.startDate = $("#startDate").val();
							params.endDate = $("#endDate").val();
							params.stateDesc = $("#stateDesc").val();
							params.createDate = $("#createDate").val();
							params.activityCycle = $("#activityCycle").val();
							params.orgRange = $("#orgRange").val();
							params.createUserName = $("#createUserName").val();
							params.createUser = $("#loginId").val();
							params.activityId = $("#activityId").val();
							params.parentId = "";
							params.userGroupId = $("#userGroupId").val();
							params.createOrgPath = $("#createOrgPath").val();
							var orgIds  = $("#createOrgPath").val().split("/");
							if(orgIds.length < 4){
								orgIds.push("");
								orgIds.push("");
							}
							var provId = orgIds[1];
							var cityId = orgIds[2];
							var countyId = orgIds[3];
							params.provId = provId;
							params.cityId = cityId;
							params.countyId = countyId;
							params.orgPath = $("#orgPath").val();
							var channelCheck =","+$("#channelCheck").val()+",";
							params.channelCheck =channelCheck;
							params.isContact2 = 0;
							params.isContact3 = 0;
							if(channelCheck.indexOf("7,") != -1){
								params.isContact3 = 1;
							}
							if(channelCheck.indexOf("1,") != -1 || channelCheck.indexOf("2,") != -1 || channelCheck.indexOf("9,") != -1 || channelCheck.indexOf("11,") != -1){
								params.isContact2 = 1;
							}
							params.tenantId = tenantId;
							params.setTaskUser = 0;
							params.taskLoginId = "initwhartever";
							//params.activityId=$(":input[name='po.activityId']").val();
							bpmServer.startFlow(loginId用户LoginId,必传,
									tenantId租户ID，非多租户版可以传undefined,	
									bpmFlowCode流程编码,必传,
									paramsjson格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数,
									function(json){
										//console.log(json);
										processInstanceId = json.processInstanceId;
										if(json.success == true){
										    completeNext(processInstanceId,activityId);
										}else{
											deleteActivityAndInstance(processInstanceId,activityId);
										}
							});
							
							}else if(resultCode == '2'){
								$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
							}else if(resultCode == '3'){
								$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
							}
							
					}else{
						if(resultCode=="1"){
							$.ligerDialog.warn("提交成功");
							if(top.closeTab==undefined){
								location.href="../activity/main";
							}else{
									 top.openTab("活动列表","/clyxactivity/activity/main");
									 $("#iframe_call_tab").attr("href","/clyxactivity/activity/main");
									 top.closeTab("活动策划","活动列表",true);
									 top.closeTab("活动修改","活动列表",true);	
							}
						}else if(resultCode == '2'){
							$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
						}else if(resultCode == '3'){
							$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
						}
				}
			});//请求代办列表结束
*/	});

function deleteActivityAndInstance(processInstanceId,activityId){
	$.ligerDialog.warn("流程启动失败，请联系管理处理后再次策划提交活动");
	$.ajax({
		url : "../activity/delete",
		type : "POST",
		async : false,
		data : {
			"ids" : activityId
		},
		success : function(data) {
			//console.log(data);
			bpmServer.deleteProcInstById(loginId,
					tenantId,
					processInstanceId,
					function(json){
						//console.log(json);
					});
		}
	});
}
function completeNext(processInstanceId,activityId){
	//请求下一节点信息开始
	bpmServer.getNextTaskInfo(loginId,
					tenantId,
					processInstanceId,
					function(json){
						//console.log(json);
						var taskId = json.data[0].taskId;

						bpmServer.getNextTaskUsers(loginId,
											tenantId,
											taskId,
											{},
											function(json){
												//console.log(json);
												var userInfos = json.data[0].userInfos;
												$("#taskLoginId").append("<option value='' selected>请选择..</option>");
												for(var i in userInfos){												
													$("#taskLoginId").append("<option value=" +userInfos[i].loginId + ">" +userInfos[i].userName+"</option>");
												}
												$.ligerDialog.closeWaitting();
												popupDiv("ccwwcc");
												
												$("#confirm-btn").click(function(){
													if($("#taskLoginId").val()!=""&&$("#taskLoginId").val()!=null){
														hideDiv("ccwwcc");
														var examineName=$("option[value='"+$("#taskLoginId").val()+"']").html();
														$.ligerDialog.waitting("活动正在流转至"+examineName+"审批,请稍候...");
																	//请求下一节点信息成功执行完成节点开始
																	var params = {};
																	getParams(params);
																	params.taskId=taskId ;
																	params.processInstanceId = processInstanceId;
																	params.taskLoginId = $("#taskLoginId").val();
																	params.setTaskUser = 1;
																	bpmServer.completeTask(loginId,
																					tenantId,
																					taskId,
																					"",
																					"",
																					params,
																					 function(json){
																						 //console.log(json);
																						 if(json.success == true){
																							 bpmServer.setProcessVariables(loginId,
																									 				tenantId,
																									 				processInstanceId,
																									 				{"setTaskUser":0},
																									 				function(json){
																									 					//console.log(json);
																													    $.ajax({
																															url:"../activityExamine/beginExamine",
																															type:"POST",
																															data:{"processInstanceId":processInstanceId,
																																  "po.activityId"    :activityId,
																																  "po.state"         :"13"},
																															async: false,
																															success : function(data){
																																if(data.success){
																																	//console.log("流程id保存成功");
																																}else{
																																	//console.log("流程id保存失败");
																																}
																															}
																														 });
																									 					$.ajax({
																									 						url:"../activityExamine/saveApprovalMess",
																									 						type:"POST",
																									 						data:{"po.channelCheck":$("#channelCheck").val(),
																									 							"po.activityId":activityId,
																									 							"modifiedChannel":$("#rejectChannel").val()},
																									 						async:false,
																									 						success : function(data){
																																if(data.success){
																																	//console.log("渠道初始审批状态保存成功");
																																}else{
																																	//console.log("渠道初始审批状态保存失败");
																																}
																															}	
																									 					})
																									 					if(top.closeTab==undefined){
																															location.href="../activity/main";
													
																														}else{
																																 top.openTab("活动列表","/"+services.clyxactivity+"/activity/main");
																																 $("#iframe_call_tab").attr("href","/"+services.clyxactivity+"/activity/main");
																																 top.closeTab("活动策划","活动列表",true);
																																 top.closeTab("活动修改","活动列表",true);
																															$.ajax({
																																url : "/portal/rest/menus/menuinfo/clyx_hn_activity_add",
																																type : "GET",
																																async : false,
																													            success : function(data) {
																																		menuName=data.menuName;
																																}
																													        });
																															$.ajax({
																																url : "/portal/rest/menus/menuinfo/clyx_hn_activity",
																																type : "GET",
																																async : false,
																													            success : function(data) {
																													            	top.openTab(data.menuName,"/"+services.clyxactivity+"/activity/main");
																													        		top.closeTab(undefined,data.menuName,true);
																																}
																													        });
																															$.ajax({
																																url : "/portal/rest/menus/menuinfo/clyx_examine",
																																type : "GET",
																																async : false,
																													            success : function(data) {
																																		menuName2=data.menuName;
																																}
																													        });
																															
																														}
																									 				});
																							
																						 }else{
																							 deleteActivityAndInstance(processInstanceId,activityId);
																						 }
																						 
																					 });
													}else{
														$.ligerDialog.warn("请选择下一步的审批人");
														return;
													}
												});
												
											});
						
					});	//请求下一节点信息结束
}

function getParams(params){
	params.saveApprovalMessUrl = saveApprovalMessUrl;
	params.updateApprovalMessUrl = updateApprovalMessUrl;
	params.startActivityUrl = startActivityUrl;
    params.stopActivityUrl = stopActivityUrl;
    params.queryStartChannel = queryStartChannel;
    params.isSendSms = isSendSms;
	params.activityName = $("#activityName").val();
	//var activityThemeCode = $(":input[name='po.activityThemeCode']").val();
	var activityTheme = $("#activityTheme").val();
	params.activityTheme = activityTheme;
	params.orgLevel = $("#orgLevel").val();
	params.startDate = $("#startDate").val();
	params.endDate = $("#endDate").val();
	params.stateDesc = $("#stateDesc").val();
	params.createDate = $("#createDate").val();
	params.activityCycle = $("#activityCycle").val();
	params.orgRange = $("#orgRange").val();
	params.createUserName = $("#createUserName").val();
	params.createUser = $("#loginId").val();
	params.activityId = $("#activityId").val();
	params.parentId = "";
	params.userGroupId = $("#userGroupId").val();
	params.createOrgPath = $("#createOrgPath").val();
	params.isSubActivity = $("#isSubActivity").val();
	var orgIds  = $("#createOrgPath").val().split("/");
	if(orgIds.length < 4){
		orgIds.push("");
		orgIds.push("");
	}
	var provId = orgIds[1];
	var cityId = orgIds[2];
	var countyId = orgIds[3];
	params.provId = provId;
	params.cityId = cityId;
	params.countyId = countyId;
	params.orgPath = $("#orgPath").val();
	params.channelchecked = $("#channelCheck").val();
	var channelCheck =","+$("#channelCheck").val()+",";   //判断下面节点用
	params.channelCheck =channelCheck;
	params.isContact1 = 1;
	params.isContact2 = 0;
	params.isContact3 = 0;
	params.isContact4 = 0;
	params.isContact5 = 0;
	if(channelCheck.indexOf(",7,") != -1){
		params.isContact2 = 1;
	}
	/*if(channelCheck.indexOf(",1,") != -1 && channelCheck.indexOf(",2,") != -1 && channelCheck.indexOf(",9,") != -1 && channelCheck.indexOf(",11,") == -1 && channelCheck.indexOf(",7,") == -1 && channelCheck.indexOf(",8,") != -1 && (channelCheck.indexOf(",5,") != -1 || channelCheck.indexOf(",12,") != -1)){
		params.isContact1 = 0;
	}*/
	if($("#isSubActivity").val()=="1"){
		params.isContact1 = 0;
	}
	if(channelCheck.indexOf(",8,") != -1){
		params.isContact4 = 1;
	}
	if(channelCheck.indexOf(",11,") != -1){
		params.isContact3 = 1;
	}
	if(channelCheck.indexOf(",1,") != -1 || channelCheck.indexOf(",2,") != -1 || channelCheck.indexOf(",9,") != -1){
		params.isContact5 = 1;
	}
	if(params.isContact2 == 0 && params.isContact3 == 0){
		params.isContact1 = 0;
	}
	params.tenantId = tenantId;
	params.setTaskUser = 0;
	params.taskLoginId = "initwhartever";
	params.taskLoginId2 = "";
	params.taskLoginId3 = "";
	params.remark="";
	params.smsSendUrl = smsSendUrl;
	//params.enterChannel = 0;
	//params.roleList = "";
	return params;
}

function popupDiv(div_id) {
    var div_obj = $("#"+div_id);  
    var windowWidth = document.body.clientWidth;       
    var windowHeight = document.body.clientHeight;  
    var popupHeight = div_obj.height();       
    var popupWidth = div_obj.width();    
    //添加并显示遮罩层   
/*    $("<div id='maskccwwcc'></div>").addClass("mask")   
                              .width(windowWidth + document.body.scrollWidth)   
                              .height(windowHeight + document.body.scrollHeight)   
                              .click(function() {})   
                              .appendTo("body")   
                              .fadeIn(200);*/   
    div_obj.css({"position": "absolute"})   
           .animate({left: windowWidth/2-popupWidth/2,    
                     top: windowHeight/2-popupHeight/2, opacity: "show" }, "slow");   
                    
}
function hideDiv(div_id) {   
    //$("#maskccwwcc").remove();   
    $("#" + div_id).animate({left: '0px', top: '110px', opacity: "hide" }, "slow");   
}  

function shuochukou(){
	$("#shuochukou").toggle();
}
