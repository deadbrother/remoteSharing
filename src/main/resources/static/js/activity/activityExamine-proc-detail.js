$(function() {
		//loginId  = "prov_ma";
		//loginId  = "prov_ms";
		//loginId = "chan_chuang1";
		//loginId = "prov_weixin1";
		//loginId = "prov_dianqv1";
	/*加载中效果控制*/
	var LoadingUtils = {  
	        Open:function(){  
	            var top=  $(this).offset()==undefined?0:$(this).offset().top;  
	            var left=  $(this).offset()==undefined?0:$(this).offset().left;  
	              
	            var appender=null;  
	            if($(this).parent().length==0)  
	            {  
	                appender="body";  
	            }else  
	            {  
	                appender=$(this);  
	            }  
	            $("<div class=\"mask\"></div>").css({  
	                display : "block",  
	                width : $(this).outerWidth(),//100%  
	                height : $(this).outerHeight(),//height  
	                top:top,  
	                left:left,
	           
	            }).appendTo(appender);//body  
	            $("<div class=\"mask-msg\" ></div>").html("<div style='margin-left:30px'>正在处理，请稍候...</div>")  
	                    .appendTo(appender).css({  
	                        display : "block",  
	                         
	                        
	                    });  
	        },  
	        Close:function(){  
	            $(".mask").remove();  
	            $(".mask-msg").remove();  
	        }  
	}; 
	
	
		var processInstanceId = $("#processInstanceId").val();
		var taskId = $("#taskId").val();
		var idAgree=$("#idAgree").val();
		var remark="";
		$("#remark").bind("change",function(){
			remark = $("#remark").val();
		});
		$.ajax({
			url : "../activityExamine/pageInfo?pageId="+$("#pageId").val(),
			type : "GET",
			async : false,
			success : function(data) {
				var json = data.json;
                for (var i in json){
                	//console.log(json[i].resourceId);
                	$("[extral^='resource"+ json[i].resourceId +"']").show();
                } 
			}	
		});
		
		bpmServer.getHistoryTaskList(loginId,
							tenantId,
							processInstanceId,
							"",
							{},
							function(json){
								var data = json.data;
								//console.log(json);
								var str = '[]';
								//var dataAll = eval("("+str+")");
								var dataAll = JSON.parse(str);
								var list = '[]';
								//var dataList = eval("("+list+")");
								var dataList = JSON.parse(list);
								dataAll.totalCount = json.total;
								for(var i in data){
									if(data[i].TASK_NAME_!=""&&data[i].TASK_NAME_!=null){
										dataList.push(data[i]);
										//console.log(data[i].OP_TIME_);
									}
								}
								dataAll.list = dataList;
								//console.log(dataAll);
								var managerprocdetail = $("#managerprocdetail").ligerGrid(
										{
											columns : [
												{
													display : '节点名称',
													name:'TASK_NAME_',
													align : 'left',
													width : '20%'												
												},
												{
													display : '办理人',
													name : 'USER_ID_',
													align : 'left',
													width : '10%'
												},
												{
													display : '接收时间',
													name : 'START_TIME_',
													align : 'center',
													width : '15%'
												},
												{
													display : '办理时间',
													name : 'OP_TIME_',
													align : 'center',
													width : '15%'
												},
												{
													display : '办理意见',
													name : 'MESSAGE_',
													align : 'center',
													width : '25%'
												},
												{
													display : '操作',
													name : 'startDate',
													align : 'center',
													width : '8%',
													render:function(rowdata,index,value){
														if(rowdata.TASK_NAME_=="创建者"){
															return "提交";
														}else{
															return rowdata.OP_TIME_==undefined?"待办":"已办";
														}											
													}													
												}],
											isScroll : true,
											data:dataAll,
											method : 'post',
											fixedCellHeight : false,
											rownumbers : false,
											usePager : false,
											width : '70%'
										});
										bpmServer.getNextTaskUsers(loginId,
												tenantId,
												taskId,
												{"setTaskUser":0},
												function(json){
													
												//console.log(json);
												//暂时逻辑判断json无数据时到达最后节点，之后做优化
												if(json.data[0] != undefined){
													
													for(var j=0;j<json.total;j++){
														var userInfos = json.data[j].userInfos;
														$("#taskUserDiv").append("<select id = 'taskLoginId"+j+"' lev='"+json.data[j].taskKey+"'></select>");
														$("select[lev='"+json.data[j].taskKey+"']").before(json.data[j].taskName);
														$("#taskLoginId"+j).append("<option value='' selected>请选择..</option>");
														for(var i in userInfos){
															//$("#taskLoginId").append("<option value=" +userInfos[i].loginId + ">" +userInfos[i].userName+"</option>");
															$("#taskLoginId"+j).append("<option value=" +userInfos[i].loginId + ">" +userInfos[i].userName+"</option>");
														}
													}
													bpmServer.getVariables(loginId,
													        tenantId,
													        taskId,
													        "global",
													        "",
													        function(json){
														       //console.log(json);
														       if(json.variables.enterChannel==1){
														    	   $("select[lev='chanchuang']").attr("id","taskLoginId0");
														    	   $("select[lev='dianqv']").attr("id","taskLoginId1");
														    	   $("select[lev='wechat']").attr("id","taskLoginId2");
														    	   /*if(json.variables.isContact4==1&&json.variables.isContact3==1&&json.variables.isContact5==0){
														    		   $("#taskLoginId1").attr("id","taskLoginId2");
														    	   }else if(json.variables.isContact4==0&&json.variables.isContact3==0&&json.variables.isContact5==1){
														    		   $("#taskLoginId0").attr("id","taskLoginId1");
														    	   }else if(json.variables.isContact4==0&&json.variables.isContact3==1&&json.variables.isContact5==0){
														    		   $("#taskLoginId0").attr("id","taskLoginId2");
														    	   }else if(json.variables.isContact4==0&&json.variables.isContact3==1&&json.variables.isContact5==1){
														    		   $("#taskLoginId1").attr("id","taskLoginId2");
														    		   $("#taskLoginId0").attr("id","taskLoginId1");
														    	   }*/
														       }
													        }
													)
													$("#taskUserDiv").show();
												}else{
													$("#taskUserDiv").removeAttr("style");
													$("#taskUserDiv").append("<input id = 'taskLoginId0'/>")
													$("#taskUserDiv").hide();
													$("#taskLoginId0").val("uni076");
												}
												// 通过
												$("#pass-tool-btn").click(function() {
												
												if(remark.length < 900){
													var m=0;
													$("select[id^=taskLoginId]").each(function(){
														if($(this).val()!=""&&$(this).val()!=null){
															m++;
														}
													});
													if(m==$("select[id^=taskLoginId]").length){
														 $(document.body).css({
															   "overflow-x":"hidden",
															   "overflow-y":"hidden"
														 });
														jQuery.ligerDialog.confirm('请确认是否要审批通过？', function (confirm) {
															
														     if (confirm){
														    	 LoadingUtils.Open.call(this);
														    	$("#pass-tool-btn").attr("disabled",true);
														    	$("#nopass-tool-btn").attr("disabled",true);
														    	$("[extral='resource7']").attr("disabled",true);
														        bpmServer.completeTask(loginId,
														            				   tenantId,
														            					taskId,
														            					"pass",
														            					remark,
														            					{"taskLoginId":$("#taskLoginId0").val()==undefined?"":$("#taskLoginId0").val(),
														            		             "taskLoginId2":$("#taskLoginId1").val()==undefined?"":$("#taskLoginId1").val(),
														            		             "taskLoginId3":$("#taskLoginId2").val()==undefined?"":$("#taskLoginId2").val(),
														            					 "setTaskUser":1},
														            					function(json){	            						 
														            						if(json.success == true){
														            							
														            							 bpmServer.setProcessVariables(loginId,
																							 				tenantId,
																							 				processInstanceId,
																							 				{"setTaskUser":0},
																							 				function(json){
																							 					//v="1";
																							 					//console.log(json);
																							 					if(top.openTab==undefined){
																													location.href="../activityExamine/mytask";
																													LoadingUtils.Close();
																												}else{
																													top.openTab("活动审批","/"+services.clyxactivity+"/activityExamine/mytask");
																													top.closeTab("活动办理","活动审批",true);
																													LoadingUtils.Close();
																												}								
																							 				});
														            							
														            						}else{
														            					    	$("#pass-tool-btn").attr("disabled",false);
														            					    	$("#nopass-tool-btn").attr("disabled",false);
														            					    	$("[extral='resource7']").attr("disabled",false);
														            							$.ligerDialog.warn("办理失败");
														            							LoadingUtils.Close();
														            							//console.log(json.messageDetail);
														            						}
														            					});
														          }else{
														        	  LoadingUtils.Close();
														        	  $(document.body).css({
														        		   "overflow-x":"auto",
														        		   "overflow-y":"auto"
														        	  });
														        	return;  
														          }
														          });
																
													}else{
														$.ligerDialog.warn("请选择下一步的审批人");
														return;
													}
												}else{
																$.ligerDialog.warn("您输入的审批意见过长(大于900),请减少内容重新输入!");
																LoadingUtils.Close();
															}
															
															//location.href = "../activityExamine/pass?po.activityId="+idAgree+"&activityExecuteInfo.remark="+remark;
				
															});
													});
										});
						
		
		//不通过
		$("#nopass-tool-btn").click(function(){
			
			 $(document.body).css({
				   "overflow-x":"hidden",
				   "overflow-y":"hidden"
				 });
			if(remark.length < 900){
				jQuery.ligerDialog.confirm('请确认是否要驳回此活动？', function (confirm) {
		        if (confirm){
		        	LoadingUtils.Open.call(this);
			    	$("#pass-tool-btn").attr("disabled",true);
			    	$("#nopass-tool-btn").attr("disabled",true);
			    	$("[extral='resource7']").attr("disabled",true);
		        	
		        	bpmServer.completeTask(loginId,
        					tenantId,
        					taskId,
        					"nopass",
        					remark,
        					"",
        					/*{"isExists":"1",
		        		     "remark":remark},*/
        					function(json){
		        		    	 LoadingUtils.Close();
        						if(json.success == true){  							
        							$.ligerDialog.warn("办理成功");
        							if(top.openTab==undefined){
        								location.href="../activityExamine/mytask";
        								LoadingUtils.Close();
        							}else{
        								top.openTab("活动审批","/"+services.clyxactivity+"/activityExamine/mytask");
        								top.closeTab("活动办理","活动审批",true);
        								LoadingUtils.Close();
        							}
        							/*$.ajax({
        								url : "../activityExamine/nopass?po.activityId="+idAgree+"&activityExecuteInfo.remark="+remark,
        								type : "POST",
        								async : false,
        								success : function(data) {
        									location.href="../activityExamine/mytask";
        								}
        							});*/
        						}else{
        					    	$("#pass-tool-btn").attr("disabled",false);
        					    	$("#nopass-tool-btn").attr("disabled",false);
        					    	$("[extral='resource7']").attr("disabled",false);
        							$.ligerDialog.warn("办理失败");
        							LoadingUtils.Close();
        							//console.log(json.messageDetail);
        						}
        					});
		        }else{
		        	LoadingUtils.Close();
		        	 $(document.body).css({
		        		   "overflow-x":"auto",
		        		   "overflow-y":"auto"
		        	 });
		        	return;
		        	}
		        });
			}else{
				$.ligerDialog.warn("您输入的审批意见过长(大于900),请减少内容重新输入!");
				LoadingUtils.Close();
			}
			
			//location.href = "../activityExamine/pass?po.activityId="+idAgree+"&activityExecuteInfo.remark="+remark;
		});
		
		$("#asign-sign-tool-btn").click(function(){
        	bpmServer.completeTask(loginId,
					tenantId,
					taskId,
					"pass",
					"",
					{},
					function(json){
						LoadingUtils.Open.call(this);
						if(json.success == true){
							$.ligerDialog.warn("办理成功");
							if(top.openTab==undefined){
								location.href="../activityExamine/mytask";
								LoadingUtils.Close();
							}else{
								top.openTab("活动审批","/"+services.clyxactivity+"/activityExamine/mytask");
								top.closeTab("活动办理","活动审批",true);
								LoadingUtils.Close();
							}							
						}else{
							$.ligerDialog.warn("办理失败");
							LoadingUtils.Close();
							//console.log(json.messageDetail);
						}
					});
		});
		
		$("#remodify-tool-btn").click(function(){
			LoadingUtils.Open.call(this);
			if(top.openTab==undefined){
				window.open("../activity/modify?po.activityId=" + idAgree);
				LoadingUtils.Close();
			}else{
				top.openTab("活动修改","/"+services.clyxactivity+"/activity/modify?po.activityId=" + idAgree);
				top.closeTab("活动审批","活动修改",true);
				LoadingUtils.Close();
			}
			//window.open("../activity/modify?po.activityId=" + idAgree);
			//location.href = "../activityExamine/pass?po.activityId="+idAgree+"&activityExecuteInfo.remark="+remark;
		});
		
		/*$("#resubmit-tool-btn").click(function(){
			if(remark.length < 900){
				jQuery.ligerDialog.confirm('是否确认已经修改此活动并提交？', function (confirm) {
		        if (confirm){
		        	bpmServer.completeTask(loginId,
        					tenantId,
        					taskId,
        					"",
        					remark,
        					{},
        					function(json){
        						if(json.success == true){
        							$.ligerDialog.warn("办理成功");
        						}else{
        							$.ligerDialog.warn("办理失败");
        							//console.log(json.messageDetail);
        						}
        					});
		        }else{
		        	return;
		        	}
		        });
			}else{
				$.ligerDialog.warn("您输入的审批意见过长(大于900),请减少内容重新输入!");
			}
		});*/
	});

function cancel1(){
	if(top.openTab==undefined){
		location.href="../activityExamine/mytask";
	}else{
		top.openTab("活动审批","/"+services.clyxactivity+"/activityExamine/mytask");
		top.closeTab("活动办理","活动审批",true);
	}
}

