;( 
function($,window,undefined){
	"use strict";
 
	var config={
			bpmServerAddr:"",
			multiTenant:true
	};
	var bpmClientServer={
		startFlow:function(loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	
				modelKey/*流程编码,必传*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回json格式示意：
				{processInstanceId: "816579519203770368", success: true }
				如果接口出错,返回示意:
				{success: false,message:"xxxx",messageDetail:"xxxxx" }
				*/){
			params=params||{};
			params["modelKey"]=modelKey;			
			return ajaxCall(config,"/process/startProcessByModelKey",loginId,tenantId,params,completFun);
		},
		setProcessVariables:function(/*设置流程变量*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	
				processInstanceId/*流程实例ID，必传*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意:{success:true} or {success:false,message:'xxx',messageDetail:'xxxxx'}*/){
			params=params||{};
			params["processInstanceId"]=processInstanceId;			
			return ajaxCall(config,"/process/setVariables",loginId,tenantId,params,completFun);
		},
		getDaibanTasks:function(/*获取待办任务列表*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				modelKey/*流程编码*/,
				processInstIds/*流程实例编号，根据流程实例id过滤待办，可以为以逗号分隔开的多个流程实例编号，该参数优先级高,该参不为空，则忽略modelkey参数*/,
				loginIds/*用户LoginId，根据用户LoginId过滤待办，可以为以逗号分隔开的多个用户LoginId，该参数优先级高*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数,
				内部可包含参数:
				start:列表结果记录集开始行号，默认从0开始
				size:列表结果记录集每页行数，默认每页20条
				sort:列表结果记录集排序字段
				order:列表结果记录集排序字段排序顺序,asc:升序，desc:降序
				login:登陆用户账号，比如admin
				fetchVars:["entityName","entityMan","entityArea"],在任务信息中包含指定变量信息，任务返回信息会包含类似信息："fetchVars":{"entityArea":"","entityMan":"","entityName":""}
				taskKey:任务节点编码
				qtaskname:任务名称
				qname:流程名称
				taskedesc:任务描述
				qstarttime:按照任务创建时间过滤，qstarttime过滤范围的开始时间，
				qstarttime_e过滤范围的截至时间
				queryVars:一个json格式的参数，[{name:'startname',type:'string',value:'bd.w'},{name:'xxx',sqlop:'not',type:'string',value:'bd.w,rs.w'}]
				多个queryVars参数在查询的时候是and关系，注sqlop==not,意思是变量不匹配value中的值，value中的值可以为逗号分割开的多个变量值*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{"total":1,"data":[{"PROC_CATEGORY":"测试","NAME":"TEST_A","TASK_DEF_KEY":"sid-37DC8AED-FBC2-4CF6-83A4-BAD6097A2577","CREATE_TIME":"2017-01-04 17:38","assignee":["admin"],"EXECUTION_ID_":"816579519203770368","PROC_START_TIME":"2017-01-04 17:38","PROC_NAME":"test_parent","PROC_INST_ID":"816579519203770368","ID":"816579519270879233","taskVariables":{},"EXECUTION_COUNT":1,"PROC_KEY":"test_parent","PROC_DEF_ID":"test_parent:1:805971869806100480","fetchVars":{"entityArea":"xxx","entityMan":"xxx","entityName":"xxx"}}]}
				*/){
			params=params||{};
			if(processInstIds)
				params["processInstIds"]=processInstIds;	
			if(modelKey)
				params["modelKey"]=modelKey;	
			if(loginIds)
				params["userIds"]=loginIds;	
			return ajaxCall(config,"/worktask/daibanTasks",loginId,tenantId,params,completFun);
		},
		getYibanTasks:function(/*获取已办任务列表*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				modelKey/*流程编码*/,
				processInstIds/*流程实例编号，根据流程实例id过滤待办，可以为以逗号分隔开的多个流程实例编号，该参数优先级高,该参不为空，则忽略modelkey参数*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数,
				内部可包含参数:
				start:列表结果记录集开始行号，默认从0开始
				size:列表结果记录集每页行数，默认每页20条
				sort:列表结果记录集排序字段
				order:列表结果记录集排序字段排序顺序,asc:升序，desc:降序
				login:登陆用户账号，比如admin
				taskKey:任务节点编码
				qtaskname:任务名称
				qname:流程名称
				taskedesc:任务描述
				qstarttime:按照任务创建时间过滤，qstarttime过滤范围的开始时间，
				qstarttime_e过滤范围的截至时间
				qendtime:按照任务完成时间过滤，qendtime过滤范围的开始时间，
				qendtime_e过滤范围的截至时间*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{"total":1,"data":[{"PROC_CATEGORY":"测试","NAME":"TEST_C_A","TASK_DEF_KEY":"sid-6A7FA756-A975-490C-A51B-C16780A31799","CREATE_TIME":"2016-12-0611:57","START_TIME":"2016-12-0611:57","CAN_GET_BACK":false,"EXECUTION_ID_":"805984358962823168","variables":{"LAST_ACTOR":"admin","LOGIN_ID":"admin","sourceTaskId":"805978344876146688","sourceUserName":"管理员","sourceUserId":"admin","sourceTaskName":"TEST_A","sourceOpAction":"pass","sourceTaskKey":"sid-37DC8AED-FBC2-4CF6-83A4-BAD6097A2577"},"ASSIGNEE":"admin","PROC_START_TIME":"2016-12-0611:57","PROC_NAME":"test_child","PROC_INST_ID":"805984358962823168","ID":"805984359004766208","EXECUTION_COUNT":0,"END_TIME":"2016-12-1909:09","PROC_END_TIME":"2016-12-1909:09","PROC_KEY":"test_child","EXECUTION_ID":"805984358962823168","PROC_DEF_ID":"test_child:1:805971745226883072"}]}
				*/){
			params=params||{};
			if(processInstIds)
				params["processInstIds"]=processInstIds;	
			if(modelKey)
				params["modelKey"]=modelKey;	
			 
			return ajaxCall(config,"/worktask/yibanTasks",loginId,tenantId,params,completFun);
		},
		completeTask:function(/*完成任务*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				taskId/*任务实例ID*/,
				action/*任务办理动作[pass:同意，nopass不同意，reject：回退，jump：跳转，cancel：撤销，getback：收回；其他]*/,
				message/*处理意见*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{ "success": true}
				*/
				){
			
			params=params||{};
			if(!taskId){
				alert("任务ID不能为空")
				return false;
			}
			params["taskId"]=taskId;	
			if(action)
				params["action"]=action;	
			if(message)
				params["message"]=message;	
			 
			return ajaxCall(config,"/worktask/completeTask",loginId,tenantId,params,completFun);
		},
		jiaQianTask:function(/*任务加签*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				taskId/*加签任务实例ID*/,
				userIds/*加签人员LoginId,数组型*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{ "success": true}
				*/){
			var params={};
			if(!taskId){
				alert("任务ID不能为空")
				return false;
			}
			params["taskId"]=taskId;	
			if(!userIds){
				alert("加签人不能为空");
				return false;
			}
			params["userIds"]=userIds;	
			 
			return ajaxCall(config,"/worktask/startXieTong",loginId,tenantId,params,completFun);
		},
		claimTask:function(/*任务签收*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				taskId/*任务实例ID*/,			 
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{ "success": true}
				*/){
			var params={};
			if(!taskId){
				alert("任务ID不能为空")
				return false;
			}
			params["taskId"]=taskId;	
	 
			return ajaxCall(config,"/worktask/claimTask",loginId,tenantId,params,completFun);
		},
		unClaimTask:function(/*任务反签收*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				taskId/*任务实例ID*/,			 
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{ "success": true}
				*/){
			var params={};
			if(!taskId){
				alert("任务ID不能为空")
				return false;
			}
			params["taskId"]=taskId;	
	 
			return ajaxCall(config,"/worktask/unclaimTask",loginId,tenantId,params,completFun);
		},
		cancelProcess:function(/*撤销流程实例*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				processInstanceId/*流程实例ID*/,		
				message/*流程实例撤销原因*/,
				forceCancel/*是否强制撤销true:强制撤销流程,false:用户发起流程实例后，如果下一步操作人没有处理，则可以撤销，否则，只能强制撤销*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{ "success": true}
				*/){
			var params={};
			if(!processInstanceId){
				alert("流程实例ID不能为空")
				return false;
			}
			params["processInstanceId"]=processInstanceId;	
			if(message)
				params["message"]=message;	
			if(forceCancel)
				params["force"]=true;
			else
				params["force"]=false;	
	 
			return ajaxCall(config,"/worktask/cancelProcess",loginId,tenantId,params,completFun);
		},
		getbackTask:function(/*从已办任务中收回下一步任务*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,
				taskId/*已办任务实例ID*/,
				destTaskKey/*已办任务实例节点key，在没有传taskId参数的情况下，必须传destTaskKey参数*/,
				processInstanceId/*流程实例ID*/,
				message/*任务收回原因*/,
				forceBack/*是否强制收回任务*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意
				{ "success": true}
				*/){
			if(!processInstanceId){
				alert("流程实例ID不能为空")
				return false;
			}
			params["processInstanceId"]=processInstanceId;	
			if(!taskId&&!destTaskKey){
				alert("任务ID与任务点KEY至少一个不能为空")
				return false;
			}
			if(taskId)
				params["taskId"]=taskId;	
			if(destTaskKey)
				params["destTaskKey"]=destTaskKey;	
			if(message)
				params["message"]=message;	
			if(forceBack)
				params["forceBack"]=true;
			else
				params["forceBack"]=false;	
			return ajaxCall(config,"/worktask/getbackTask",loginId,tenantId,params,completFun);
		},
		getOneTaskByPId:function(/*根据流程实例ID得到用户的一个待办任务*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	 
				processInstanceId/*流程实例ID，必传*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {
					"success": true，
					pId:xxx,
					taskId:xxx
					}
				*/){
			var params={};
			if(!processInstanceId){
				alert("流程实例ID不能为空")
				return false;
			}
			params["processInstanceId"]=processInstanceId;	
			params["userId"]=loginId;
		 
			return ajaxCall(config,"/worktask/getUserTaskByPId",loginId,tenantId,params,completFun);
		},
		getTaskDealInfo:function(/*任务办理界面可选功能信息*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	 
				taskId/*任务实例ID，必传*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {
				    "taskDealInfo": {
				        "showform": true,//显示业务表单
				        "formUrl":"xxxx",
				        "formParams":"..&xx=xx..",
				        "approval": {//审批操作
				            "show_detail": false,//是否显示操作历史
				            "show_op": false,//是否显示审批操作选项
				            "advice_can_null": true//办理意见是否可以为空
				        },
				        "funs": [],//其他办理操作
				        "extendOps": {},//扩展操作
				        "success": "true"
				    }
				} 
				*/){
			var params={};
			if(!taskId){
				alert("任务实例ID不能为空")
				return false;
			}
			params["taskId"]=taskId;	 
			return ajaxCall(config,"/worktask/getTaskDealInfo",loginId,tenantId,params,completFun);
		},
		
		getTaskViewInfo:function(/*任务查看界面信息*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	 
				taskId/*任务实例ID，必传*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {
				    "taskDealInfo": {
				        "showform": true,//显示业务表单
				        "formUrl":"xxxx",
				        "formParams":"..&xx=xx..",
				        "approval": {//审批操作
				            "show_detail": false,//是否显示操作历史
				            "show_op": false,//是否显示审批操作选项
				            "advice_can_null": true//办理意见是否可以为空
				        },
				        "funs": [],//其他办理操作
				        "extendOps": {},//扩展操作
				        "success": "true"
				    }
				} 
				*/){
			var params={};
			if(!taskId){
				alert("任务实例ID不能为空")
				return false;
			}
			params["taskId"]=taskId;	 
			return ajaxCall(config,"/worktask/getTaskViewInfo",loginId,tenantId,params,completFun);
		},
		getVariables:function(/*得到流程变量*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	 
				taskId/*任务实例ID，优先级高于流程实例id参数*/,
				scope/*任务实例ID的配套参数，global:全局变量，local:局部变量*/,
				processInstanceId/*流程实例ID */,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				{"success":true,"variables":{"loginId":"admin","LOGIN_ID":"admin","GROUP_ID":"1","b":"2","a":"1","tenant_id":"tenant_system","ROLE_ID":["root"],"LAST_ACTOR":"","__huiqian_scope_tasks__":"816898985418555392,816898985611493376","modelKey":"test_parent","autoClaim":"true","FLOW_CREATER":"admin","callbackFun":"callback"}}
				*/){
			var params={};
			if(!taskId&&!processInstanceId){
				alert("任务实例ID与流程实例ID至少一个不能为空")
				return false;
			}
			if(taskId)
				params["taskId"]=taskId;	 
			if(scope)
				params["scope"]=scope;	 
			if(processInstanceId)
				params["processInstanceId"]=processInstanceId;	 
			return ajaxCall(config,"/worktask/getVariables",loginId,tenantId,params,completFun);
		},
		yiJiaoTask:function(/*移交任务,把任务移交给其它用户*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	 
				taskId/*任务实例ID，优先级高于流程实例id参数*/,
				destUser/*任务移交的用户对象loginId*/,			 
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				{"success":true}
				*/){
			var params={};
			if(!taskId&&!processInstanceId){
				alert("任务实例ID与流程实例ID至少一个不能为空")
				return false;
			}
			if(taskId)
				params["taskId"]=taskId;	 
			if(destUser)
				params["destUser"]=destUser;	 
 
			return ajaxCall(config,"/worktask/taskYiJiao",loginId,tenantId,params,completFun);
		},
		getCategory:function(/*得到流程类型*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	  
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				{"totalProperty":2,"resultList":[{"KEY_":"测试"},{"KEY_":"能力申请"}]}
				*/){
			var params={};
		 
			return ajaxCall(config,"/worktask/getCategory",loginId,tenantId,params,completFun);
		},
		getNextTaskInfo:function(/*得到下一步任务信息*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	  
				processInstanceId/*流程实例ID */,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {"total":3,"data":[{"taskId":"816579519270879233","taskDealInfo":{"showform":false,"approval":{"show_detail":false,"show_op":false,"advice_can_null":true},"funs":[],"extendOps":{},"success":"true"},"processInstanceId":"816579519203770368","taskUsers":["admin"],"assignee":"admin","taskName":"TEST_A-"},{"taskId":"816898985418555392","taskDealInfo":{"showform":false,"approval":{"show_detail":false,"show_op":false,"advice_can_null":true},"funs":[],"extendOps":{},"success":"true"},"processInstanceId":"816579519203770368","taskUsers":["zb_ld_01"],"assignee":"zb_ld_01","taskName":"TEST_A--由用户admin发起的会签"},{"taskId":"816898985611493376","taskDealInfo":{"showform":false,"approval":{"show_detail":false,"show_op":false,"advice_can_null":true},"funs":[],"extendOps":{},"success":"true"},"processInstanceId":"816579519203770368","taskUsers":["zb_yg_01"],"assignee":"zb_yg_01","taskName":"TEST_A--由用户admin发起的会签"}]}
				*/){
			var params={};
			if(!processInstanceId){
				alert("流程实例ID不能为空")
				return false;
			}
			params["processInstanceId"]=processInstanceId;	 
		 
			return ajaxCall(config,"/worktask/getNextTaskInfo",loginId,tenantId,params,completFun);
		},
		getStartedProcess:function(/*得到用户已发起流程实例信息*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	  
				modelKey/*流程模型编码 */,
				params,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {"total":1,"data":[{"NAME":"test_daian_with_variable","start_TIME_":{"date":27,"day":1,"hours":11,"minutes":52,"month":1,"nanos":0,"seconds":13,"time":1488167533000,"timezoneOffset":-480,"year":117},"STARTTIME":"2017-02-27 11:52","START_USER_ID":"admin","TASK_COUNT":2,"CAN_CANCEL":true,"CATEGORY":"测试","DESCRIPTION_":"","VERSION":2,"SUSPENSION_STATE":1,"PROC_INST_ID":"836061350672203776","ID":"test_daian_with_variable:2:836059952245112832","KEY_":"test_daian_with_variable","EXECUTION_COUNT":1,"fetchVars":{"entityArea":"河南","entityMan":"张三","entityName":"测试活动一"}}]}
				*/){
			 
			if(!modelKey){
				alert("流程模型编码不能为空")
				return false;
			}
			params["modelKey"]=modelKey;	 
		 
			return ajaxCall(config,"/worktask/startedProcess",loginId,tenantId,params,completFun);
		},
		getNextTaskUsers:function(/*得到下一步任务操作人*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	  
				taskId/*当前待办任务实例ID */,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {"total":3,"data":[{"userInfos":["管理员[admin]","河南领导01[hn_ld_01]"],"userIds":["admin","hn_ld_01"],"taskName":"sub","success":true},{"userInfos":["test2[test2]"],"userIds":["test2"],"taskName":"test2","success":true},{"userInfos":["test3[test3]"],"userIds":["test3"],"taskName":"test4","success":true}]}
				*/){
			if(! params)params={};
			if(!taskId){
				alert("任务实例ID不能为空")
				return false;
			}
			if(params["action"]){
				params["AUDIT"]=params["action"];
			}
			params["taskId"]=taskId;	 
		 
			return ajaxCall(config,"/worktask/getNextTaskAssigners",loginId,tenantId,params,completFun);
		},
		deleteProcInstById:function(/*删除流程实例*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	  
				processInstanceId/*当前待删除流程实例ID */,			 
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				 {"success":true}
				*/){
			var params={};
			if(!processInstanceId){
				alert("流程实例ID不能为空")
				return false;
			}
			params["processInstanceId"]=processInstanceId;	 
			params["force"]=true;	 
		 
			return ajaxCall(config,"/entity/deleteProcInstById",loginId,tenantId,params,completFun);
		},
		getHistoryTaskList:function(/*得到历史任务信息*/loginId/*用户LoginId,必传*/,
				tenantId/*租户ID，非多租户版可以传undefined*/,	  
				processInstanceId/*流程实例ID */,
				direction/*获取实例操作日志方向，up:取当前实例及其所有父级实例的操作日志，不包含父实例的其他子流程实例的操作日志，down：取当前实例及其所有子流程实例的操作日志*/,
				params/*json格式参数对象，形如{a:1,b:2}，a,b为传递给接口的参数,
				内部可包含变量
				queryVars:一个json格式的参数，[{name:'startname',type:'string',value:'bd.w'},{name:'xxx',sqlop:'not',type:'string',value:'bd.w,rs.w'}]
				多个queryVars参数在查询的时候是and关系，注sqlop==not,意思是变量不匹配value中的值，value中的值可以为逗号分割开的多个变量值
				*/,
				completFun/*接口调用完毕后回调业务系统js函数，回调函数第一个参数必须是一个json对象以接受接口返回结果
				返回结果示意:
				{
				    "total": 1, 
				    "data": [
				        {
				            "START_TIME_": "2017-01-04 17:38", 
				            "ACT_TYPE_": "startEvent", 
				            "DELETE_REASON_": "任务由[<b>系统用户</b>]执行完成", 
				            "TASK_DEF_KEY_": "sid-594AB357-AB0B-4383-A90D-82D267396CA1", 
				            "ACT_ID_": "sid-594AB357-AB0B-4383-A90D-82D267396CA1", 
				            "ACTION_": "执行", 
				            "OP_TIME_": "2017-01-04 17:38", 
				            "ASSIGNEE_": null, 
				            "USER_ID_": "系统用户", 
				            "EXECUTION_COUNT": 0, 
				            "ID_": 816579519233130500, 
				            "PROC_INST_ID_": "816579519203770368"
				        } 
				    ]
				}


				*/){
			 
			if(!processInstanceId){
				alert("流程实例ID不能为空")
				return false;
			}
			if(direction)
				params["direction"]=direction;	
			params["processInstanceId"]=processInstanceId;	 
		 
			return ajaxCall(config,"/flowtrace/procTaskList",loginId,tenantId,params,completFun);
		},
		help:function(method){
			var methodQM="";
			if(method){
				if(this[method]){
					this[method].toString().replace(/[\s]*function[\s]*\(([^\)]+)\)/g,function(m,code){
						alert(method+'('+code+')')
						methodQM=method+'('+code+')'+"\n";
					});
				}else{
					alert('没有方法'+method)
					methodQM='方法：'+method+"没有定义"
				}
			}else{
				for(var p in this){
					if(p!='help'){
						this[p].toString().replace(/[\s]*function[\s]*\(([^\)]+)\)/g,function(m,code){
							
							methodQM+=p+'('+code+')'+"\n";
						});
					}
				}
				alert(methodQM)
			}
			return methodQM;
		}
		
	};
	if(!String.prototype.trim){
		String.prototype.trim = function() 
		{ 
		return this.replace(/(^\s*)|(\s*$)/g, ""); 
		} 
	};
	window.callback=function(str){	 
		(0,eval)(str);
	}
	function ajaxCall(config,url,loginId,tenantId,jsonParam,completFun){
		var result={};
		if(!getBpmServerAddr()){
			result={success:false,message:"没有设置bpm应用地址，bpm应用地址要与当前应用处于同一域中"}
			return result;
		}
		if(!completFun||(typeof completFun)!='function'){
			alert("没有传递回调函数,执行bpmServer.help(method)查看方法签名")
			result={success:false,message:"没有传递回调函数"}
			return result;
		}
		 
		url=getBpmServerAddr()+"/bpmservice"+url+"?loginId="+loginId+(config.multiTenant==true&&tenantId?"&tenant_id="+tenantId:"");
		for(var prop in jsonParam){
			if((typeof jsonParam[prop])=='object'){
				jsonParam[prop]=JSON.stringify(jsonParam[prop]);
			}
		 
		}
		//console.log(jsonParam)
		var lock=true;
		$.ajax({
            url:    url    ,  
            type: 'post',
            cache:false,
            async:false,
            data:jsonParam||{},
            dataType:"jsonp",
            jsonp: "callbackFun",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            jsonpCallback:"callback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
            success: function (data) {           	 
            // console.log("world")
            //console.log(data)
              
           	 if(data){ 
           		 result=data;	           	  
           	 }
             (0,completFun)(data);
             lock=false;
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
            	//console.log(XMLHttpRequest)
            	result={success:false,message:"返回状态："+XMLHttpRequest.status+"--错误信息："+textStatus};
            	lock=false;
            	(0,completFun)(result);
            }
		});
  
		 
	};
	function getBpmServerAddr(){
		var bpmServerAddr=config.bpmServerAddr;
		if(!bpmServerAddr ||(typeof bpmServerAddr)!='string'||bpmServerAddr.trim()==""){
			window.alert("请调用window.initBpmServerAddr(url,notMultiTenant)初始化bpm应用地址");
			return false;
		}	
		
		bpmServerAddr=bpmServerAddr.trim();
		
		return bpmServerAddr.lastIndexOf("/")+1==bpmServerAddr.length?bpmServerAddr.substring(0,bpmServerAddr.lastIndexOf("/")):bpmServerAddr;
	};
	window.initBpmServerAddr=function(url,notMultiTenant){
		config.bpmServerAddr=url;
		
		if(arguments.length>1){
			config.multiTenant=!notMultiTenant?false:true;
		}	
	};
	window.bpmServer=(function(){return bpmClientServer})();
	window.bpmServer.getBpmServerAddr=getBpmServerAddr;
}
)(jQuery,window,undefined);