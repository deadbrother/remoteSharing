$(function() {
	//保存状态提示
	/*var resultCode = $("#resultCode").val();
	if(resultCode != undefined){
		if(resultCode=="1"){
			$.ligerDialog.warn("提交成功");
		}else if(resultCode == '2'){
			$.ligerDialog.warn("用户群状态更新失败，请联系管理处理后再次提交活动");
		}else if(resultCode == '3'){
			$.ligerDialog.warn("活动保存异常，请联系管理后进行提交");
		}
		$("#resultCode").val(null);
		if(top.closeTab!=undefined){
			$("#iframe_call_tab").attr("href","/clyxactivity/activity/main");
			$(".J_menuTab.active").attr("data-id","clyxactivity/activity/main");
			$(".J_iframe[data-title='活动列表']").attr("src","/clyxactivity/activity/main").attr("data-id","/clyxactivity/activity/main");	
		}else{
			history.pushState("", "Title", location.href.replace("?resultCode=1", ""));
		}
	}*/
	
	manager = $("#maingrid").ligerGrid({
		columns : [
        {
	        align : 'left',
	        width : '4%',
	        render: function(rowdata,index,value){
	        	return "<input type='radio' id='radio"+rowdata.__id+"' name='yipuliuradio' class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'/>";
	        }
        },
        {
 			display : '地域',
 			name : 'orgLevel',
 			align : 'center',
 			width : '5%'
		},
		{
			display : '<td style="text-align:left">活动id</td>',
			name : 'activityDailyId',
			align : 'left',
			width : '7%'
		},            
		{
			display : '<td style="text-align:left">活动名称</td>',
			name : 'activityDailyName',
			align : 'left',
			width : '26%',
			render:function(rowdata,index,value){
				/*return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityDailyName+"'><a href='detail?po.activityId=" +rowdata.activityDailyId+ "&po.userGroupId="+rowdata.userGroupId+"'>"+rowdata.activityDailyName+"</a></div>";*/
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityDailyName+"'><a onclick='activityDetail("+rowdata.activityDailyId+","+rowdata.userGroupId+")'>"+rowdata.activityDailyName+"</a></div>";
			}

		}, {
			display : '<td style="text-align:left">活动主题</td>',
			name : 'activityTheme',
			align : 'left',
			width : '10%',
			render:function(rowdata,index,value){
				if(rowdata.activityTheme==undefined||rowdata.activityTheme==""||rowdata.activityTheme==null){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
				}else{
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.activityTheme+"'>" +rowdata.activityTheme+ "</div>";
				}
				
			}
		},  {
			display : '<td style="text-align:left">活动类型</td>',
			name : 'activityCycle',
			align : 'center',
			width : '7%',
			render : function(rowdata, rowindex, value) {
				if (value == "1") {
					return "周期（月）";
				} else if (value == "2") {
					return "周期（日）";
				} else if (value == "3") {
					return "一次性";
				} else {
					return "其他";
				}
			}
		}, {
			display : '<td style="text-align:left">活动分类</td>',
			name : 'parentActivity',
			align : 'left',
			width : '7%',
			render:function(rowdata,index,value){
				if(rowdata.activityFunction=="1"){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='执行活动'>执行活动</div>";
				}else if(rowdata.parentActivity=="1"){
					return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='仅下发活动'><a onclick='expandIframe(this,"+rowdata.activityDailyId+")'>仅下发活动</a></div>";
				}else{
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='仅下发活动'>仅下发活动</div>";
				}
				
			}
		
		}, {
			display : '开始时间',
			name : 'startDate',
			align : 'center',
			width : '7%'
		}, {
			display : '结束时间',
			name : 'endDate',
			align : 'center',
			width : '7%'
		}, {
			display : '活动状态',
			name : 'stateDesc',
			align : 'center',
			width : '5%'
		}, {
			display : '<td style="text-align:left">适用范围</td>',
			name : 'orgRange',
			align : 'left',
			width : '15%',
			hide : 'hide',
			render:function(rowdata,index,value){
				if(rowdata.orgRange==undefined||rowdata.orgRange==""||rowdata.orgRange==null){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
				}else{					
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;' title='"+rowdata.orgRange+"'>" +rowdata.orgRange+ "</div>";
				}
				
				
			}
		}, {
			display : '<td style="text-align:left">创建人</td>',
			name : 'createUserName',
			align : 'center',
			width : '8%',
			render:function(rowdata,index,value){
				if(rowdata.createUserName!=undefined){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.createUserName+"'>" +rowdata.createUserName+ "</div>";
				}else{
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.createUser+"'>" +rowdata.createUser+ "</div>"
				}							
			}
		}, {
			display : '创建时间',
			name : 'createDate',
			align : 'center',
			width : '7%'
		
		}, {
			id : 'activityId',
			name : 'activityDailyId',
			hide : 'hide'
		}, {
			name : 'parentId',
			hide : 'hide'
		}, {
			name : 'userGroupId',
			hide : 'hide'
		}, {
			name : 'createUser',
			hide : 'hide'
		}, {
			name : 'createOrgPath',
			hide : 'hide'
		}, {
			name : 'orgPath',
			hide : 'hide'
		}, {
			name : 'channelCheck',
			hide : 'hide'
		},{
			name : 'cityId',
			hide : 'hide'
		},{
			name : 'activityFunction',
			hide : 'hide'
		},{
			name : 'tenantId',
			hide : 'hide'
		},{
			name : 'state',
			hide : 'hide'
		},{
			name : 'rejectChannel',
			hide : 'hide'
		},{
			name : 'processInstanceId',
			hide : 'hide'
		},{
			name : 'createOrgId',
			hide : 'hide'
		}],
		checkbox : false,
		isSingleCheck :true,
		isScroll : false,
		pageSize:10,
		fixedCellHeight:false,
		pageSizeOptions:[3,4,5,6,7],
		url : '../activity/list',
		method : 'post',
		rownumbers : false,
		usePager : true,
		onSelectRow :cwc,
		width : '100%',
		allowHideColumn:false,
		enabledSort:false

	});

	$(".l-grid-header1").html("");
	function cwc(rowdata, rowid, rowobj){
		// $("#cwc"+rowdata.__id).attr("checked",true);
		//console.log(rowdata.activityDailyId);
		$("#radio"+rowdata.__id).prop("checked",true);
	}
	// 新增
	$("#add-tool-btn").click(function() {
		if(top.openTab==undefined){
			location.href="../activity/add";
			}else{
				top.openTab("活动策划","/"+services.clyxactivity+"/activity/add");
				}
	});
	var genzong;
	$("#genzong-tool-btn").click(function() {
		var id = "";
		var seletedNum = 0;
		var activity_id="";
		var activity_name="";
		var channelCheck=$(".l-selected").find("td:eq(19)>div").html();
		var createOrgId = $(".l-selected").find("td:eq(26)>div").html();
		var flag="false";
		$(".l-selected").find("td:eq(13)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html().trim();
			} else {
				id = $(this).html().trim();
			}
			seletedNum++;
		});
		if (seletedNum == 0) {
			$.ligerDialog.warn("请选择一项活动进行跟踪！");
			// alert("请选择一项活动进行跟踪！");
			return;
		}
		$(".l-selected").find("td:eq(2)>div").each(function() {
			activity_id+=$(this).html().trim();
			//alert(activity_id);
		});
		$(".l-selected").find("td:eq(3)>div>div>a").each(function() {
			activity_name+=$(this).html().trim();
			//alert(activity_name);
		});
		if(channelCheck!=null&&channelCheck!=""){
			var ccsplit = channelCheck.split(",");
			for(var i=0;i<ccsplit.length;i++){
				if(ccsplit[i]=="5"){
					flag="true";
					break;
				}
			}
		}

		/*var state = $(".l-selected").find("td:eq(21)>div").html().trim();
		if (state == "12" || state == "10"){
			$.ligerDialog.warn("暂存或驳回的活动不可跟踪！");
			// alert("暂存或驳回的活动不可跟踪！");
			return;
		}*/
		
		// url:"/epmwxwl/monitor/activityMonitor/"+id,
		var genzongUrl="/"+services.xbuilderoracle+"/pages/xt/orderMonitor/taskExetuteEnd.jsp?activity_id="
			+ activity_id +"&activity_name="+activity_name+"&loginOrgid="+createOrgId+"&flag="+flag;
		if(top.openTab==undefined){
			genzong= $.ligerDialog.open({
				url:genzongUrl,
				title:"活动跟踪",
				height: 450,
				width: 700,
				isDrag:false,
				buttons : [ {
					text : '关闭',
					onclick: function (item, dialog) { dialog.close(); } 
				}]
			});
		}else{
			top.openTab("活动跟踪",genzongUrl);
		}
		//alert(genzongUrl);

	});

	/*活动评估*/
	$("#pinggu-tool-btn").click(function() {
		var id = "";
		var seletedNum = 0;
		var activity_id="";
		var activity_name="";
		$(".l-selected").find("td:eq(13)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html().trim();
			} else {
				id = $(this).html().trim();
			}
			seletedNum++;
		});
		if (seletedNum == 0) {
			$.ligerDialog.warn("请选择一项活动进行跟踪！");
			// alert("请选择一项活动进行跟踪！");
			return;
		}
		$(".l-selected").find("td:eq(2)>div").each(function() {
			activity_id+=$(this).html().trim();
			//alert(activity_id);
		});
		$(".l-selected").find("td:eq(3)>div>div>a").each(function() {
			activity_name+=$(this).html().trim();
			//alert(activity_name);
		});

		/*var state = $(".l-selected").find("td:eq(21)>div").html().trim();
		if (state == "12" || state == "10"){
			$.ligerDialog.warn("暂存或驳回的活动不可跟踪！");
			// alert("暂存或驳回的活动不可跟踪！");
			return;
		}*/
		
		// url:"/epmwxwl/monitor/activityMonitor/"+id,
		var pingguUrl="/"+services.xbuilderoracle+"/pages/xt/evaluation/actEndEvaluate/pages/frame_static/actEvaluateAnalyze.jsp?activity_id="
			+ activity_id;
		if(top.openTab==undefined){
			genzong= $.ligerDialog.open({
				url:pingguUrl,
				title:"活动评估",
				height: 450,
				width: 700,
				isDrag:false,
				buttons : [ {
					text : '关闭',
					onclick: function (item, dialog) { dialog.close(); } 
				}]
			});
		}else{
			top.openTab("活动评估",pingguUrl);
		}
		//alert(genzongUrl);

	});
	
	
	
	$("#stopactivity-tool-btn").click(function() {
		var id = "";
		var seletedNum = 0;
		$(".l-selected").find("td:eq(13)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html().trim();
			} else {
				id = $(this).html().trim();
			}
			seletedNum++;
		});		
		var parentId = $(".l-selected").find("td:eq(14)>div").html().trim();
		var state = $(".l-selected").find("td:eq(23)>div").html().trim();
		var createUser = $(".l-selected").find("td:eq(16)>div").html().trim();
		var userId = $("input[name='userId']").val();
		var status = "2";
		var tenantId = $(".l-selected").find("td:eq(22)>div").html().trim();
		var isAdmin = $("#isAdmin").val();
		if (seletedNum == 0) {
			$.ligerDialog.warn("请选择一项进行停用！");
			// alert("请选择一项进行停用！");
			return;
		}
		if (state == "8") {
			$.ligerDialog.warn("此活动已停用！");
			// alert("此活动已停用！");
			return;
		}
		if (state == "10" || state == "12" ||state == "13") {
			$.ligerDialog.warn("此活动不能停用！");
			// alert("此活动不能停用！");
			return;
		}
		if (parentId != "") {
			$.ligerDialog.warn("您没有停用这个活动的权限！");
			// alert("您没有停用这个活动的权限！");
			return;
		}
		if(isAdmin != "1"){
			if (createUser != userId) {
				$.ligerDialog.warn("您没有操作此活动的权限!");
				// alert("您没有操作此活动的权限!");
				return;
			}			
		}
		 jQuery.ligerDialog.confirm('请确认是否真要停用所选择的活动？', function (confirm) {
                      if (confirm){
                    	  $.ajax({
                  			url : "/"+services.ordercenter+"/activity/setstatus",
                  			type : "POST",
                  			async : false,
                  			contentType : "application/json",
                  			data : JSON.stringify({"activityId":id,
                  				   "activityStatus":status,
                  				   "tenant_id":tenantId
                  			      }),
                  			success : function(data) {
                  				//console.log(data);
                  				if(data.code=="0"){
                  				   //console.log("工单停用成功");
                  				}else{
                  				   //console.log(data.message);
                  				}
                  			}
                  		});
                  		$.ajax({
                  			url : "../activity/stopActivity?po.activityId=" + id,
                  			type : "POST",
                  			async : false,
                  			success : function(data) {
                  				if (data.success) {
                  					$.ligerDialog.warn("停用成功");
                  					// alert("停用成功");
                  					reload();
                  				} else {
                  					$.ligerDialog.warn("停用失败,请联系管理员！");
                  					// alert("停用失败,请联系管理员！");
                  				}
                  			}
                  		});
                      }else{
                    	  return;
                      }
                          
                  });
		// if (!confirm('请确认是否真要停用所选择的活动？'))
			// return;
		

	});

	$("#startactivity-tool-btn")
			.click(
					function() {
						var seletedNum = 0;
						var id = "";
						$(".l-selected").find("td:eq(13)>div").each(function() {
							if (id != "") {
								id = id + "," + $(this).html().trim();
							} else {
								id = $(this).html().trim();
							}
							seletedNum++;
						});
						if (seletedNum == 0) {
							$.ligerDialog.warn("请选择一项进行启用！");
							// alert("请选择一项进行启用！");
							return;
						}
						var channelCheck = $(".l-selected").find(
								"td:eq(18)>div").html().trim();
						var arr = channelCheck.split(",");
						// console.log(channelCheck.split(","));
						
						var parentId = $(".l-selected").find("td:eq(14)>div")
								.html().trim();
						var state = $(".l-selected").find("td:eq(23)>div")
								.html().trim();
						var createUser = $(".l-selected").find("td:eq(16)>div")
								.html().trim();
						var userId = $("input[name='userId']").val();
						var status = "8";
						var isAdmin = $("#isAdmin").val();
						var tenantId = $(".l-selected").find("td:eq(22)>div").html().trim();
						if(isAdmin!="1"){
							if (createUser != userId) {
								$.ligerDialog.warn("您没有操作此活动的权限!");
								// alert("您没有操作此活动的权限!");
								return;
							}
						}					
						if (parentId != "") {
							$.ligerDialog.warn("您没有启用这个活动的权限！");
							// alert("您没有启用这个活动的权限！");
							return;
						}
						if (state == "8" || state == "12"|| state == "10") {
							$.ligerDialog.warn("该活动不能启用！");
							// alert("该活动不能启用！");
							return;
						}
						if (state == "13") {
							$.ligerDialog.warn("该活动正在审批！");
							// alert("该活动正在审批！");
							return;
						}

						if (state == "9") {
							$.ligerDialog.warn("该活动已经启用！");
							// alert("该活动已经启用！");
							return;
						}
						jQuery.ligerDialog.confirm('请确认是否真要启用所选择的活动？', function (confirm) {
		                      if (confirm){
		                    	  $.ajax({
		  							url : "/"+services.ordercenter+"/activity/setstatus",
		  							type : "POST",
		  							async : false,
		  							contentType : "application/json",
		  							data : JSON.stringify({"activityId":id,
		  								   "activityStatus":status,
		  								   "tenant_id": tenantId
		  							      }),
		  							success : function(data) {
		  								//console.log(data);
		  								if(data.code=="0"){
		  								   //console.log("工单启用成功");
		  								}else{
		  								   //console.log(data.message);
		  								}
		  							}
		  						});
		  							$.ajax({
		  									url : "../activity/startActivity?po.activityId="+ id,
		  									type : "POST",
		  									async : false,
		  									success : function(data) {
		  									    if (data.success) {
		  									    	$.ligerDialog.warn("启用成功");
		  											// alert("启用成功");
		  											reload();
		  											} else {
		  												$.ligerDialog.warn("启用失败,请联系管理员！");
		  											// alert("启用失败,请联系管理员！");
		  													}
		  												}
		  									});
		                      }else{
		                    	  return;
		                      }
		                          
		                  });
						
					});

	$("#pauseactivity-tool-btn").click(function() {
		var id = "";
		var seletedNum = 0;
		$(".l-selected").find("td:eq(13)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html().trim();
			} else {
				id = $(this).html().trim();
			}
			seletedNum++;
		});
		if (seletedNum == 0) {
			$.ligerDialog.warn("请选择一项活动进行暂停！");
			// alert("请选择一项活动进行暂停！");
			return;
		}
		var parentId = $(".l-selected").find("td:eq(14)>div").html().trim();
		var state = $(".l-selected").find("td:eq(23)>div").html().trim();
		var createUser = $(".l-selected").find("td:eq(16)>div").html().trim();
		var userId = $("input[name='userId']").val();
		var status ="9";
		var isAdmin = $("#isAdmin").val();
		var tenantId = $(".l-selected").find("td:eq(22)>div").html().trim();
		if(isAdmin !="1"){
			if (createUser != userId) {
				$.ligerDialog.warn("您没有操作此活动的权限!");
				// alert("您没有操作此活动的权限!");
				return;
			}
		}	
		if (parentId != "") {
			$.ligerDialog.warn("您没有暂停这个活动的权限！");
			// alert("您没有暂停这个活动的权限！");
			return;
		}
		if (state == "8") {
			$.ligerDialog.warn("该活动已经停用！不能暂停");
			// alert("该活动已经停用！不能暂停");
			return;
		}
		if (state == "10" || state == "12" || state == "11"||state == "13") {
			$.ligerDialog.warn("此活动不能暂停!");
			// alert("此活动不能暂停!");
			return;
		}
		jQuery.ligerDialog.confirm('请确认是否真要暂停所选择的活动？', function (confirm) {
            if (confirm){
            	$.ajax({
        			url : "/"+services.ordercenter+"/activity/setstatus",
        			type : "POST",
        			async : false,
        			contentType : "application/json",
        			data : JSON.stringify({"activityId":id,
        				   "activityStatus":status,
        				   "tenant_id":tenantId
        			      }),
        			success : function(data) {
        				//console.log(data);
        				if(data.code=="0"){
        				   //console.log("工单停用成功");
        				}else{
        				   //console.log(data.message);
        				}
        			}
        		});
        		$.ajax({
        			url : "../activity/pauseActivity?po.activityId=" + id,
        			type : "POST",
        			async : false,
        			success : function(data) {
        				if (data.success) {
        					$.ligerDialog.warn("暂停成功");
        					// alert("暂停成功");
        					
        		
        					reload();
        				} else {
        					$.ligerDialog.warn("暂停失败,请联系管理员！");
        					// alert("暂停失败,请联系管理员！");
        				}
        			}
        		});
            }else{
          	  return;
            }
                
        });
		


	});

	// 多删除
	$("#deletes-tool-btn").click(
			function() {
				// 设定删除的路径
				var deleteUrl = "../activity/delete";
				// 获取活动选中的活动id
				var inputIds = "";
				var selectdNum = 0;
				var processInstanceId = $(".l-selected").find("td:eq(25)>div").html();
				$(".l-selected").find("td:eq(13)>div").each(function() {
					if (inputIds != "") {
						inputIds = inputIds + "," + $(this).html().trim();
					} else {
						inputIds = $(this).html().trim();
					}
					selectdNum++;
				});
				if(selectdNum==0){
					$.ligerDialog.warn("请选择一条记录进行删除!");
					// alert("您没有操作此活动的权限!");
					return;
				}
				
				var parentId = "";
				var flag = 0;
				var p = 0;
				var createUser = $(".l-selected").find("td:eq(16)>div").html()
						.trim();
				var userId = $("input[name='userId']").val();


				if (createUser != userId) {
					$.ligerDialog.warn("您没有操作此活动的权限!");
					// alert("您没有操作此活动的权限!");
					return;
				}

				$(".l-selected").find("td:eq(14)>div").each(function() {
					flag++;
					return flag;
				});
				if (flag == "1") {
					parentId = $(".l-selected").find("td:eq(14)>div").html()
							.trim();
					if (parentId != "") {
						p = 1;

					}
				} else {
					$(".l-selected").find("td:eq(14)>div").each(function() {
						if ($(this).html().trim() != "") {
							p = 3;
						}
					});
				}
				if (p == "1") {
					$.ligerDialog.warn("选中的活动没有删除权限！");
					// alert("选中的活动没有删除权限！");
					return;
				}
				if (p == "3") {
					$.ligerDialog.warn("选中的某一项活动没有删除权限！");
					// alert("选中的某一项活动没有删除权限！");
					return;
				}
				var message="";
				$(".l-selected").find("td:eq(23)>div").each(
						function() {
							if ($(this).html().trim() == "9" 
								|| $(this).html().trim() == "11"  
								|| $(this).html().trim() == "13" 
								|| $(this).html().trim() == "8") {
								p = 2;
								message=$(this).html().trim();
							}
						});
				if (p == "2") {
					$.ligerDialog.warn("该状态下的活动不能删除");
					// $.ligerDialog.warnrt("选中的某一项活动不能删除");
					return;
				}
				if (selectdNum < 1) {
					("请至少选择一项进行删除！");
					return;
				}
				if (parentId != "") {
					("您没有权限修改这个活动！");
					return;
				}
				

				jQuery.ligerDialog.confirm('请确认是否真要删除所选择的活动？', function (confirm) {
		            if (confirm){
		            	$.ajax({
							url : deleteUrl,
							type : "POST",
							async : false,
							data : {
								"ids" : inputIds
							},
							success : function(data) {
								if (data.success) {
									if(processInstanceId!=null&&processInstanceId!=""){
										bpmServer.deleteProcInstById(loginId,
												tenantId,
												$(".l-selected").find("td:eq(25)>div").html(),
												function(json){
											       $.ligerDialog.warn("删除成功");
											       reload();
												});
									}else{
										$.ligerDialog.warn("删除成功");
										reload();
									}																
								} else {
									$.ligerDialog.warn("删除失败，请联系管理员！");
								}
							}
						});
		            }else{
		          	  return;
		            }
		                
		        });
				// (ids);
			});
	


	// 查看活动详情
	$("#details-tool-btn").click(
					function() {
						// 获取活动选中的活动id
						// var
						// userGroupId=$("input[name='bo.po.userGroupId']").val();.find
						var userGroupId = $('.l-selected')
								.find("td:eq(15)>div").html().trim();
						var id= "";
						var seletedNum = 0;
						var parentId = $(".l-selected").find("td:eq(14)>div")
								.html().trim();
						$(".l-selected").find("td:eq(13)>div").each(function() {
							if (id != "") {
								id = id + "," + $(this).html().trim();
							} else {
								id = $(this).html().trim();
							}
							seletedNum++;
						});
						if (seletedNum != 1) {
							$.ligerDialog.warn("请选择一项进行查看！");
							return;
						}
						if (parentId != "") {
							location.href = "../activity/detailheadquarters?po.activityId="
									+ id + "&po.userGroupId=" + userGroupId;
						} else {
							location.href = "../activity/detail?po.activityId="
									+ id + "&po.userGroupId=" + userGroupId;
						}
					});
	
	
	// 查看日志
	$("#select-log-btn").click(function(){
		var id = "";
		var seletedNum1 = 0;
		var actName;
		$(".l-selected").find("td:eq(13)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html().trim();
			} else {
				id = $(this).html().trim();
			}
			seletedNum1++;
		});
		if (seletedNum1 != 1) {
			$.ligerDialog.warn("请选择一项进行查看！");
			return;
		}
		else{
			$('#myModallog').modal('show');
			document.getElementById('activityLogName').innerHTML=$(".l-selected").find("td:eq(2)>div").html().trim();
			managerLog = $("#activityLogList").ligerGrid(
				{
					columns : [
					          
					  {
						display : '操作人',
						name : 'userName',
						align : 'center',
						width : '20%',
						render:function(rowdata,index,value){
							if(rowdata.userName==undefined||rowdata.userName==""||rowdata.userName==null){
								return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
							}else{
							return "<div class='l-grid-row-cell-inner' style='height:10px;text-align:center;' title='"+rowdata.userName+"'>" +rowdata.userName+ "</div>";
						}}
					},  
					{
						display : '执行状态',
						name : 'status',
						align : 'center',
						width : '20%',
						render:function(rowdata,index,value){
							if(rowdata.status==undefined||rowdata.status==""||rowdata.status==null){
								return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
							}else{
							return "<div class='l-grid-row-cell-inner' style='height:10px;text-align:center;' title='"+rowdata.status+"'>" +rowdata.status+ "</div>";
						}}
					},  
					{
						display : '备注意见',
						name : 'remark',
						align : 'center',
						width : '20%',
						render:function(rowdata,index,value){
							if(rowdata.remark==undefined||rowdata.remark==""||rowdata.remark==null){
								return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
							}else{
							return "<div class='l-grid-row-cell-inner' style='height:10px;text-align:center;' title='"+rowdata.remark+"'>" +rowdata.remark+ "</div>";
						}}
					},  
					{
						display : '操作时间',
						name : 'executeDate',
						align : 'center',
						width : '40%',
						render:function(rowdata,index,value){
							if(rowdata.executeDate==undefined||rowdata.executeDate==""||rowdata.executeDate==null){
								return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
							}else{
							return "<div class='l-grid-row-cell-inner' style='height:10px;text-align:center;' title='"+rowdata.executeDate+"'>" +rowdata.executeDate+ "</div>";
						}}
					},  
					],
					isScroll : true,
					url : '../activity/activityLog?activityExecuteInfo.activityId='+id,
					pageSize:5,
					checkbox : false,
					isSingleCheck :true,
					overflow : scroll,
					rownumbers : false,
					usePager : false,
					height:300,
				    width:475
		/* location.href = "../activity/selectLog?po.activityId=" + id; */
	});}
	})

	// 修改
	$("#modify-tool-btn").click(function() {
		// var selectedCheckbox =
		// $("#tools-demo-table").find(":checkbox[name=ids]:checked");
		// var status = selectedCheckbox[0].nextSibling.nextSibling.value;

		// 获取活动选中的活动id
		var id = "";
		var seletedNum = 0;
		$(".l-selected").find("td:eq(13)>div").each(function() {
			if (id != "") {
				if(browser=="Microsoft Internet Explorer"){
					id = id + "," + $(this).html();
				}else{
					id = id + "," + $(this).html().trim();
				}
			} else {
				if(browser=="Microsoft Internet Explorer"){
					id = $(this).html();					
				}else{
					id = $(this).html().trim();
				}
			}
			seletedNum++;
		});
		if (seletedNum == 0) {
			$.ligerDialog.warn("请选择一项进行修改！");
			return;
		}
		
		var browser=navigator.appName;
		/*
		 * var b_version=navigator.appVersion; var version=b_version.split(";");
		 * var trim_Version=version[1].replace(/[ ]/g,"");
		 */
		
		if(browser=="Microsoft Internet Explorer" ){
			var parentId = $(".l-selected").find("td:eq(14)>div").html();
			var state = $(".l-selected").find("td:eq(23)>div").html();
			var createUser = $(".l-selected").find("td:eq(16)>div").html();
			
		}else{
			var parentId = $(".l-selected").find("td:eq(14)>div").html().trim();
			var state = $(".l-selected").find("td:eq(23)>div").html().trim();
			var createUser = $(".l-selected").find("td:eq(16)>div").html().trim();
		}
		var userId = $("input[name='userId']").val();
		if (createUser != userId) {
			$.ligerDialog.warn("您没有操作此活动的权限!");
			return;
		}

		if (parentId != "") {
			$.ligerDialog.warn("您没有权限修改这个活动！");
			return;
		}
		if (state != "10" && state != "12" && state != "11") {
			$.ligerDialog.warn("此状态下的活动不能修改！");
			return;
		}

		if(top.openTab==undefined){
			location.href="../activity/modify?po.activityId=" + id;
			}else{
				top.openTab("活动修改","/"+services.clyxactivity+"/activity/modify?po.activityId=" + id);
				}
	
		// location.href = "../activity/modify?po.activityId=" + id;
	});

	$("#create-tool-btn").click(function() {
						var id = "";
						var seletedNum = 0;
						$(".l-selected").find("td:eq(13)>div").each(function() {
							if (id != "") {
								id = id + "," + $(this).html().trim();
							} else {
								id = $(this).html().trim();
							}
							seletedNum++;
						});

						if (seletedNum == 0) {
							$.ligerDialog.warn("请选择一项再创建子活动！");
							return;
						}
						var parentId = $(".l-selected").find("td:eq(14)>div")
								.html().trim();
						var state = $(".l-selected").find("td:eq(23)>div")
								.html().trim();
						var orgPath = $(".l-selected").find("td:eq(18)>div")
								.html().trim().split(",");
						/*var createOrgPath = $(".l-selected").find(
								"td:eq(15)>div").html().trim();*/
						var createOrgPath = $("input[name='createOrgPath']").val().trim();
						var activityFunction =$(".l-selected").find("td:eq(21)>div").html().trim();
						var p = 0;

						for (var i = 0; i < orgPath.length; i++) {
							if (createOrgPath != orgPath[i]||activityFunction=="1") {
								p++;
								if (p == orgPath.length) {
									$.ligerDialog.warn("这个活动不能创建子活动!");
									return;
								}
							} else {
								break;
							}
						}
						if(top.openTab==undefined){
							location.href="../activity/createSubactivity?po.activityId="+ id;
							}else{
								top.openTab("活动策划","/"+services.clyxactivity+"/activity/createSubactivity?po.activityId="+ id);
								}
						// location.href =
						// "../activity/createSubactivity?po.activityId="+ id;
					});

	// 查询
	$("#search-tool-btn").click(function() {
		reload();
	});
	

	var setting = {
			check:{
				enable:true,
				chkboxType: {"Y" : "ps", "N" : "ps"}
				// checkboxType:{"Y":"","N":""},
				// chkStyle:"radio"
			},
			view:{
				// 不显示连线
				showLine: false,
				dbClickExpand:true,
				showIcon:false,
				// 不允许多选
				selectedMulti: false
			},
					/*
					 * edit: { enable: true, showRemoveBtn: false,
					 * showRenameBtn: false, drag: { prev: false, next: false,
					 * inner: false } },
					 */
					data: {
						keep: {
							parent: false,
							leaf: true
						},
						simpleData: {
							enable: true
						}
					},
					async: {
						enable: true,
						type:"post",
						autoParam:["id"],
						url: '../activity/range'
					},
					callback: {
						// onClick:showviewclick
						// beforeClick: beforeClick,
						onCheck: onCheck,
						onAsyncSuccess: onAsyncSuccess,
						onAsyncError: onAsyncError
					}
	};

	$.fn.zTree.init($("#orgtree"), setting);
	expandAll();


});

$(document).ready(function(){
	$("#orgSelect").bind("click", expandAll);
});

function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("orgtree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}


function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("orgtree"),
	nodes = zTree.getCheckedNodes(true),
	v = "",
	pa= ""
	c = 0,
	p = "";

	// treeObj.expandAll(true);
	for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			p += nodes[i].id +",";
			if(nodes[i].path!=undefined){
				pa+= nodes[i].path+",";
			}

			if(treeNode.isParent==true){
				c=1;
			}
	}
	if(c=1){
		v=v.substring(v.indexOf(","), v.length);
		v=v.substring(1,v.length);
		p=p.substring(p.indexOf(","),p.length);
		p=p.substring(1,p.length);
	}
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	var orgObj = $("#orgSelect");
	orgObj.attr("value", v);
	if(p.length>0) p = p.substring(0, p.length-1);
	var orgId=$("#orgId");
	orgId.attr("value",p);
	var orgPath=$("#orgPath");
	orgPath.attr("value",pa);
	
}


function showMenu() {
	var cityObj = $("#orgSelect");
	var cityOffset = $("#orgSelect").offset();
	
	$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "orgSelect"||event.target.id == "orgtree" || $(event.target).parents("#orgtree").length>0)&&(event.target.id == "activityMain" || $(event.target).parents("#activityMain").length>0)) {
		hideMenu();
	}
}



function expandNodes(nodes) {
	if (!nodes) return;
	curStatus = "expand";
	var zTree = $.fn.zTree.getZTreeObj("orgtree");
	for (var i=0, l=nodes.length; i<l; i++) {
		zTree.expandNode(nodes[i], true, false, false);
		if (nodes[i].isParent && nodes[i].zAsync) {
			expandNodes(nodes[i].children);
		} else {
			goAsync = true;
		}
	}
}
var curStatus = "init", curAsyncCount = 0, asyncForAll = false,
goAsync = false;
function expandAll() {
	if (!check()) {
		return;
	}
	var zTree = $.fn.zTree.getZTreeObj("orgtree");
	if (asyncForAll) {
		zTree.expandAll(true);
	} else {
		expandNodes(zTree.getNodes());
		if (!goAsync) {
			curStatus = "";
		}
	}
	
}
function check() {
	if (curAsyncCount > 0) {
		return false;
	}
	return true;
}

function onAsyncSuccess(event, treeId, treeNode, msg) {
	curAsyncCount--;
	if (curStatus == "expand") {
		expandNodes(treeNode.children);
	} else if (curStatus == "async") {
		asyncNodes(treeNode.children);
	}
	if (curAsyncCount <= 0) {
		if (curStatus != "init" && curStatus != "") {
			asyncForAll = true;
		}
		curStatus = "";
	}
	checkedBack();
}

function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
	curAsyncCount--;
	if (curAsyncCount <= 0) {
		curStatus = "";
		if (treeNode!=null) asyncForAll = true;
	}
}

function checkedBack(){
	var ids=$("#orgId").val();
	var treeObj = $.fn.zTree.getZTreeObj("orgtree");
	var nodes = treeObj.transformToArray(treeObj.getNodes());
	if(nodes.length>0){
		for (var i=0;i<nodes.length;i++){
			if(ids.indexOf(nodes[i].id) >= 0){
				treeObj.checkNode(nodes[i],true,true);
				// nodes[i].checked = true;
				treeObj.updateNode(nodes[i]); 
		}
	}
	}
}


// 刷新页面
function reload() {
	var activityName = $.trim($("#activityName").val());
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var activityType = $("#activityType").val();
	var activityState = $("#activityState").val();
	var activityThemeCode = $("#activityThemeCode").val();
	var activityCycle = $("#activityCycle").val();
	var orgId =$("#orgId").val();
	var createName = $.trim($("#createName").val());
	var channelCode = $.trim($("#channelCode").val());
	var orglevelName = "";
 	if($("#orglevelName option:selected").val()!=""){
 		orglevelName = $("#orglevelName option:selected").html();
	}
	activityName = activityName != null ? activityName : "";
	startDate = startDate != null ? startDate : "";
	endDate = endDate != null ? endDate : "";
	activityType = activityType != null ? activityType : "";
	activityState = activityState != null ? activityState : "";
	activityThemeCode = activityThemeCode != null ? activityThemeCode : "";
	activityCycle = activityCycle != null ? activityCycle : "";
	createName = createName != null ? createName : "";
	channelCode = channelCode != null ? channelCode : "";
	orgId = orgId != null ? orgId : "";
	manager.options.page = 1;
	manager.options.parms = {
		"po.activityName" : activityName,
		"po.startDate" : startDate,
		"po.endDate" : endDate,
		"po.state"   : activityState,
		"po.activityThemeCode" : activityThemeCode,
		"po.activityCycle" : activityCycle,
		"activityType" : activityType,
		"po.createName" : createName,
		"po.orgIds" : orgId,
		"po.orgLevelName" : orglevelName,
		"po.channelCheck" : channelCode
	};
	manager.reload(1);
}

function activityDetail(activityId,userGroupId){
	if(top.openTab==undefined){
		location.href="../activity/detail?po.activityId="+activityId+"&po.usergroupId="+userGroupId;
	}else{
			top.openTab("活动详情","/"+services.clyxactivity+"/activity/detail?po.activityId="+activityId+"&po.usergroupId="+userGroupId);
		 }
}
var sh;
var timeadd;
function expandIframe(trId,id){
	var pDiv = $(trId).parent();
	var trDiv = pDiv.parent().parent().parent();
	pDiv.html("");
	pDiv.append("<a onclick='recoveryIframe(this,"+id+")'>收起</a>");
	trDiv.after("<tr class='l-grid-row l-grid-row-alt'><td colspan='12' style='width:100%;height:auto'><iframe src='../activity/subList?po.activityId="+id+"' id='"+id+"' style='width:100%;border: #888888 1px dashed;' id='subList' frameborder='no' border='0'></iframe></td></tr>");
	
	sh=setInterval("asc("+id+")",1000);
	
	
	/*var idds="#"+id;
	$(idds).wait(function(){}).hide();
	reinitIframeheight(id);*/
}
function asc(id){
	var idda=document.getElementById(id);
	dds=$(idda).contents().find("#managerSub").height(); 
	reinitIframeheight(id);	
	if(dds!=null&&dds>100){
		clearInterval(sh);	
		
    }
}

function recoveryIframe(trId,id){
	var pDiv = $(trId).parent();
	var trDiv = pDiv.parent().parent().parent().next();
	pDiv.html("");
	pDiv.append("<a onclick='expandIframe(this,"+id+")'>仅下发活动</a>");
	trDiv.remove();
	
}


function reinitIframeheight(iframeheight){
/*	var ifm= document.getElementById(iframeheight);   
	var subWeb = document.frames ? document.frames[iframeheight].document : ifm.contentDocument;   
	if(ifm != null && subWeb != null) {
	   ifm.height = subWeb.body.scrollHeight;
	   console.log(subWeb.body.scrollHeight);
	   ifm.width = subWeb.body.scrollWidth;
	} */  
	
	var iframe = document.getElementById(iframeheight);
	if(iframe!=null){
		var dHeight;
		var idd="#"+iframeheight;		
		dHeight=$(idd).contents().find("#managerSub").height(); 
		/*alert(dHeight);*/
		iframe.height=dHeight+30;
		
	}
	
	//alert(height);
	
	}

	
