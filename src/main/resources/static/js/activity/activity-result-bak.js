$(function(){
	console.log($("#bpmUrl").val());
	var resultCode = $("#resultCode").val();
	var processInstanceId = $("#processInstanceId").val();
	var state = $("#state").val();
	//var saveType = $("#saveType").val();
	var flag = false;
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
						console.log(flag);
						console.log(processInstanceId);
					}
				});
				if( flag == true && state != "12"){
					if(resultCode=="1"){
						$.ligerDialog.warn("提交成功");
						//请求下一节点信息开始
						bpmServer.getNextTaskInfo(loginId,
										tenantId,
										processInstanceId,
										function(json){
											console.log(json);
											var taskId = json.data[0].taskId;
											console.log(taskId);
											console.log(processInstanceId);
											bpmServer.setProcessVariables(loginId,tenantId,processInstanceId,{"taskLoginId":"aibl1"},function(json){console.log(json);});
											//请求下一节点信息成功执行完成节点开始
											bpmServer.completeTask(loginId,
															tenantId,
															taskId,
															"",
															"",
															{"processInstanceId":processInstanceId,
															 "taskId":taskId},
															 function(json){
																 console.log(json); 
																 if(top.closeTab==undefined){
																		location.href="../activity/main";
																	}else{
																			 top.openTab("活动列表","/clyxactivity/activity/main");
																			 $("#iframe_call_tab").attr("href","/clyxactivity/activity/main");
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
																            	top.openTab(data.menuName,"clyxactivity/activity/main");
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
															 });//完成任务节点结束
											
										});	//请求下一节点信息结束
						}else if(resultCode == '2'){
							$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
							bpmServer.deleteProcInstById(loginId,
									tenantID,
									processInstanceId,
									function(json){
										console.log(json);
									});
						}else if(resultCode == '3'){
							$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
							bpmServer.deleteProcInstById(loginId,
											tenantID,
											processInstanceId,
											function(json){
												console.log(json);
											});
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
	});