$(function() {
	//loginId  = "prov_ma";
	//loginId="prov_ms";
	//loginId = "chan_chuang1";
	//loginId = "prov_weixin1";
	//loginId = "prov_dianqv1";
	//bpmServer.getStartedProcess(loginId,
	var tableWidth=screen.width;      
	if(screen.width<= 1930&&screen.width>1380 )
	{   tableWidth=tableWidth-screen.width*0.05;    }  
	if(screen.width<= 1380&&screen.width>1028 ){   tableWidth=tableWidth-screen.width*0.05;    }  
	if(screen.width<= 1028){   tableWidth=tableWidth-screen.width*0.05;  }
	bpmServer.getDaibanTasks(loginId,
			tenantId,
			bpmFlowCodes,
			"",
			"",
			{"size":"5",fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"]},
			function(json){
				var data = json.data;
				//console.log(json);
				var str = '[]';
				var dataAll = JSON.parse(str);
				//var dataAll = eval("("+str+")");
				var list = '[]';
				var dataList = JSON.parse(list);
				//var dataList = eval("("+list+")");
				dataAll.totalCount = json.total;	
				var newData=[];
				var newActivityId=[];
				var p=0;
				for(var i=0;i<data.length;i++){
					var items=data[i].fetchVars.activityId;
					if($.inArray(items,newActivityId)==-1&&(items!=""&&items!=null)){
						newActivityId.push(items);
						newData.push(data[i]);
					}
				}
				
				for(var i in newData){
					processInstanceId = newData[i].PROC_INST_ID;
					taskId = newData[i].ID;
					newData[i].fetchVars.processInstanceId = processInstanceId;
					newData[i].fetchVars.taskId = taskId;
					dataList.push(newData[i].fetchVars);
					p++;
				}
				/*for(var i in data){
					processInstanceId = data[i].PROC_INST_ID;
					taskId = data[i].ID;
					data[i].fetchVars.processInstanceId = processInstanceId;
					data[i].fetchVars.taskId = taskId;
					dataList.push(data[i].fetchVars);
					p++;
				}*/
				//"nextPage":2,"pageCount":1,"pageNo":1,"pageSize":10,"prePage":1,"totalCount":290,"totalPage":29
				dataAll.firstPage = true;
				dataAll.firstResult = 0;
				dataAll.lastPage = false;
				dataAll.list = dataList;
				dataAll.nextPage = 2;
				dataAll.pageCount = 1;
				dataAll.pageNo = 1;
				dataAll.pageSize = 5;
				dataAll.prePage = 1;
				dataAll.totalCount=p;
				dataAll.totalPage = p/5;
				//console.log(dataAll);
				var height = $(window).height();
				managerdaiban = $("#examineiddaiban").ligerGrid(
						{
							columns : [
									{
										align : 'left',
										width : '5%',
										render : function(rowdata, index, value) {
											return "<input type='radio' id='radio"
													+ rowdata.__id
													+ "' name='yipuliuradio' class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'/>";
										}
									},
									{
										display : '活动名称',
										name : 'activityName',
										align : 'left',
										width : '15%',
										render:function(rowdata,index,value){										
												return "<div class='l-grid-row-cell-inner' style=' text-align:left;' title='"+rowdata.activityName+"'>" +rowdata.activityName+"</div>";
											}
									},
									{
										display : '活动主题',
										name : 'activityTheme',
										align : 'left',
										width : '10%'
									},
									{
										display : '活动行政级别',
										name : 'orgLevel',
										align : 'center',
										width : '5%'
									},
									{
										display : '活动类型',
										name : 'activityCycle',
										align : 'center',
										width : '8%',
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
									},
									{
										display : '开始时间',
										name : 'startDate',
										align : 'center',
										width : '8%'
									},
									{
										display : '结束时间',
										name : 'endDate',
										align : 'center',
										width : '8%'
									},
									{
										display : '活动状态',
										name : 'stateDesc',
										align : 'center',
										width : '5%'
									},
									{
										display : '适用范围',
										name : 'orgRange',
										align : 'left',
										width : '10%',
										render : function(rowdata, index, value) {
											if (rowdata.orgRange == undefined
													|| rowdata.orgRange == ""
													|| rowdata.orgRange == null) {
												return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
											} else {
												return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"
														+ rowdata.orgRange
														+ "'>"
														+ rowdata.orgRange
														+ "</div>";
											}

										}
									},
									{
										display : '创建人',
										name : 'createUserName',
										align : 'center',
										width : '8%',
										render : function(rowdata, index, value) {
											if (rowdata.createUserName == undefined
													|| rowdata.createUserName == ""
													|| rowdata.createUserName == null) {
												return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' ></div>";
											} else {											
												return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.createUserName+"'>" +rowdata.createUserName+ "</div>";					
										}
										}
											
									}, {
										display : '创建时间',
										name : 'createDate',
										align : 'center',
										width : '8%'
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
										name:"taskId",
										hide:"hide"	
									},{
										name:"processInstanceId",
										hide:"hide"
									} ,{
										display:"操作",
										align : 'center',
										width : '10%',
										render:function(rowdata,index,value){										
											var operate = "<a href='#' onclick=banli('"+rowdata.processInstanceId + "','" + rowdata.taskId +"','" + rowdata.activityId +"')>办理</a>" + " "
											 + "<a href='#' onclick=yibangenzong('"+rowdata.processInstanceId+"')>跟踪</a>";
											return operate;
										}
									}],
							isScroll : false,
							//url : '../activityExamine/main',
							data:dataAll,
							method : 'post',
							pageSize : 5,
							fixedCellHeight : false,
							rownumbers : false,							
							onSelectRow : selectRow,
							height: height,
							width : tableWidth,
							usePager : true
						});
			});
	function selectRow(rowdata, rowid, rowobj) {
		$("#radio"+rowdata.__id).prop("checked",true);
	}
	// 查询
	$("#search-tool-btn").click(function() {
		reload();
	});

});
/**
 * 办理
 * @param processInstanceId
 * @param taskId
 */
function banli(processInstanceId,taskId,activityId) {	
	var url;
	var formUrl;
	var formParams;
	bpmServer.getNextTaskInfo(loginId,
			tenantId,
			processInstanceId,
			function(json){
				//console.log(json);
				var taskDealInfo = "";
				for(var i=0;i<json.data.length;i++){
					if(loginId==json.data[i].taskUsers[0]){
						taskDealInfo = json.data[i].taskDealInfo;
					}
				}
				formUrl = taskDealInfo.formUrl;
				formParams = taskDealInfo.formParams;
				url = formUrl + formParams;
				url = url.replace("processInstanceId=","processInstanceId=" + processInstanceId);
				url = url.replace("taskId=","taskId=" + taskId);
				//console.log("请求地址为 :" + url);
				var examineDetail = $("#examineDetail").val();
				if(top.openTab!=undefined){
					top.openTab("活动办理","/"+services.clyxactivity+"/activityExamine/"+url + "&po.activityId="
							+ activityId
							+ "&po.examineDetailCheck=" + examineDetail);
					//top.closeTab("活动审批","活动修改",true);
				}else{
					parent.location.href = url + "&po.activityId="
					+ activityId
					+ "&po.examineDetailCheck=" + examineDetail;
				}			
	});
	
}
// 刷新页面
function reload() {
	var activityName = $.trim($("#activityName").val());
	activityName = activityName != null ? activityName : "";
	if(activityName != ""){
		$(".l-tab-loading").removeClass("hide");
		bpmServer.getDaibanTasks(loginId,
				tenantId,
				bpmFlowCodes,
				"",
				"",
				{"size":"100000",fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"],
			queryVars:[{name:"activityName",type:"string",value:activityName,compare:"like"}]},
			function(json){
				var data = json.data;
				//console.log(json);
				var str = '[]';
				var dataAll = JSON.parse(str);
				//var dataAll = eval("("+str+")");
				var list = '[]';
				var dataList = JSON.parse(list);
				//var dataList = eval("("+list+")");
				dataAll.totalCount = json.total;
				var newData=[];
				var newActivityId=[];
				var p=0;
				for(var i=0;i<data.length;i++){
					var items=data[i].fetchVars.activityId;
					if($.inArray(items,newActivityId)==-1&&(items!=""&&items!=null)){
						newActivityId.push(items);
						newData.push(data[i]);
					}
				}
				
				for(var i in newData){
					processInstanceId = newData[i].PROC_INST_ID;
					taskId = newData[i].ID;
					newData[i].fetchVars.processInstanceId = processInstanceId;
					newData[i].fetchVars.taskId = taskId;
					dataList.push(newData[i].fetchVars);
					p++;
				}
				
				/*for(var i in data){
					processInstanceId = data[i].PROC_INST_ID;
					taskId = data[i].ID;
					data[i].fetchVars.processInstanceId = processInstanceId;
					data[i].fetchVars.taskId = taskId;
					dataList.push(data[i].fetchVars);
				}*/
				dataAll.firstPage = true;
				dataAll.firstResult = 0;
				dataAll.lastPage = false;
				dataAll.list = dataList;
				dataAll.nextPage = 2;
				dataAll.pageCount = 1;
				dataAll.pageNo = 1;
				dataAll.pageSize = 5;
				dataAll.prePage = 1;
				dataAll.totalCount=p;
				dataAll.totalPage = p/5;
				managerdaiban.set({
					data:dataAll
				});
				//managerdaiban.data=dataAll;
				//managerdaiban.reload(1);
				$(".l-tab-loading").addClass("hide");
			});
	}else{
		$(".l-tab-loading").removeClass("hide");
		bpmServer.getDaibanTasks(loginId,
				tenantId,
				bpmFlowCodes,
				"",
				"",
				{"size":"100000",fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"]},
			function(json){
				var data = json.data;
				//console.log(json);
				var str = '[]';
				var dataAll = JSON.parse(str);
				//var dataAll = eval("("+str+")");
				var list = '[]';
				var dataList = JSON.parse(list);
				//var dataList = eval("("+list+")");
				dataAll.totalCount = json.total;
				var newData=[];
				var newActivityId=[];
				var p=0;
				for(var i=0;i<data.length;i++){
					var items=data[i].fetchVars.activityId;
					if($.inArray(items,newActivityId)==-1&&(items!=""&&items!=null)){
						newActivityId.push(items);
						newData.push(data[i]);
					}
				}
				
				for(var i in newData){
					processInstanceId = newData[i].PROC_INST_ID;
					taskId = newData[i].ID;
					newData[i].fetchVars.processInstanceId = processInstanceId;
					newData[i].fetchVars.taskId = taskId;
					dataList.push(newData[i].fetchVars);
					p++;
				}
				
				/*for(var i in data){
					processInstanceId = data[i].PROC_INST_ID;
					taskId = data[i].ID;
					data[i].fetchVars.processInstanceId = processInstanceId;
					data[i].fetchVars.taskId = taskId;
					dataList.push(data[i].fetchVars);
				}*/
				dataAll.firstPage = true;
				dataAll.firstResult = 0;
				dataAll.lastPage = false;
				dataAll.list = dataList;
				dataAll.nextPage = 2;
				dataAll.pageCount = 1;
				dataAll.pageNo = 1;
				dataAll.pageSize = 5;
				dataAll.prePage = 1;
				dataAll.totalCount=p;
				dataAll.totalPage = p/5;
				managerdaiban.set({
					data:dataAll
				});
				$(".l-tab-loading").addClass("hide");
				//managerdaiban.data=dataAll;
				//managerdaiban.reload(1);
			});
	}
	
}
/**
 * 已办跟踪
 * @param abc
 */
function yibangenzong(abc){
	if(top.openTab==undefined){
		window.open("http://clyxys.bonc.yz/bpm/bpm/ModelMonitor!xulie.action?params.pId="+abc);
	}else{
		top.openTab("流程跟踪","/" + services.bpm  + "/bpm/ModelMonitor!xulie.action?params.pId="+abc);
	}
	
	
}