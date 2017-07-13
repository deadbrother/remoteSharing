$(function() {
	//loginId  = "prov_ma";
	//loginId = "prov_ms";
	//loginId = "chan_chuang1";
	//loginId = "prov_weixin1";
	//loginId = "prov_dianqv1";
	//bpmServer.getStartedProcess(loginId,
	var tableWidth=screen.width;      
	if(screen.width<= 1930&&screen.width>1380 )
	{   tableWidth=tableWidth-screen.width*0.05;    }  
	if(screen.width<= 1380&&screen.width>1028 ){   tableWidth=tableWidth-screen.width*0.05;    }  
	if(screen.width<= 1028){   tableWidth=tableWidth-screen.width*0.05;  }
	bpmServer.getYibanTasks(loginId,
			tenantId,
			bpmFlowCodes,
			"",
			{"size":"100","order":"desc",fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"]},
			function(json){
				var dataYiBan = json.data;
				//console.log(json);
				var str = '[]';
				var dataAllYiBan = JSON.parse(str);
				//var dataAllYiBan = eval("("+str+")");
				var list = '[]';
				//var dataListYiBan = eval("("+list+")");
				var dataListYiBan = JSON.parse(list);
				dataAllYiBan.totalCount = json.total;
				var newDataYiBan=[];
				var newActivityIdYiBan=[];
				var p = 0;
				for(var i=0;i<dataYiBan.length;i++){
					var items=dataYiBan[i].fetchVars.activityId;
					if($.inArray(items,newActivityIdYiBan)==-1){
						newActivityIdYiBan.push(items);
						newDataYiBan.push(dataYiBan[i]);
					}
				}
				
				for(var i in newDataYiBan){
					processInstanceId = newDataYiBan[i].PROC_INST_ID;
					taskId = newDataYiBan[i].ID;
					newDataYiBan[i].fetchVars.processInstanceId = processInstanceId;
					newDataYiBan[i].fetchVars.taskId = taskId;
					dataListYiBan.push(newDataYiBan[i].fetchVars);
					p++;
				}
				dataAllYiBan.firstPage = true;
				dataAllYiBan.firstResult = 0;
				dataAllYiBan.lastPage = false;
				dataAllYiBan.list = dataListYiBan;
				dataAllYiBan.nextPage = 2;
				dataAllYiBan.pageCount = 1;
				dataAllYiBan.pageNo = 1;
				dataAllYiBan.pageSize = 5;
				dataAllYiBan.prePage = 1;
				dataAllYiBan.totalCount=p;
				dataAllYiBan.totalPage = p/5;
				//console.log(dataAllYiBan);
				var height = $(window).height();
				manageryiban = $("#examineidyiban").ligerGrid(
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
										width : '20%',
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
										width : '5%',
										render:function(rowdata,index,value){										
											return "<a href='#' onclick=yibangenzong('"+rowdata.processInstanceId+"')>跟踪</a>";
											//return "<a href='http://clyxys.bonc.yz/bpm/ModelMonitor!xulie.action?params.pId="+rowdata.taskId+"'>跟踪</a>";
										}
									}],
							isScroll : false,
						   /* url : '../activityExamine/bpmYiBan',
						    parms:{
								"loginId" : loginId,
								"bpmFlowCodes" : bpmFlowCodes
							},*/
							data:dataAllYiBan,
							method : 'post',
							pageSize : 5,
							fixedCellHeight : false,
							rownumbers : false,
							usePager : true,
							onSelectRow : selectRow,
							height: height,
							width : tableWidth
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
function yibangenzong(abc){
	if(top.openTab==undefined){
		window.open("http://clyxys.bonc.yz/bpm/bpm/ModelMonitor!xulie.action?params.pId="+abc);
	}else{
		top.openTab("流程跟踪","/" + services.bpm + "/bpm/ModelMonitor!xulie.action?params.pId="+abc);
	}
}
// 刷新页面
function reload() {
	var activityName = $.trim($("#activityName").val());
	activityName = activityName != null ? activityName : "";
	if(activityName != ""){
		$(".l-tab-loading").removeClass("hide");
		bpmServer.getYibanTasks(loginId,
				tenantId,
				bpmFlowCodes,
				"",
				{"size":"100000","order":"desc",fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"],
				 queryVars:[{name:"activityName",type:"string",value:activityName,compare:"like"}]},
				function(json){
					var dataYiBan = json.data;
					//console.log(json);
					var str = '[]';
					//var dataAllYiBan = eval("("+str+")");
					var dataAllYiBan = JSON.parse(str);
					var list = '[]';
					//var dataListYiBan = eval("("+list+")");
					var dataListYiBan = JSON.parse(list);
					dataAllYiBan.totalCount = json.total;
					var newDataYiBan=[];
					var newActivityIdYiBan=[];
					var p=0;
					for(var i=0;i<dataYiBan.length;i++){
						var items=dataYiBan[i].fetchVars.activityId;
						if($.inArray(items,newActivityIdYiBan)==-1){
							newActivityIdYiBan.push(items);
							newDataYiBan.push(dataYiBan[i]);
						}
					}
					
					for(var i in newDataYiBan){
						processInstanceId = newDataYiBan[i].PROC_INST_ID;
						taskId = newDataYiBan[i].ID;
						newDataYiBan[i].fetchVars.processInstanceId = processInstanceId;
						newDataYiBan[i].fetchVars.taskId = taskId;
						dataListYiBan.push(newDataYiBan[i].fetchVars);
						p++;
					}
					dataAllYiBan.firstPage = true;
					dataAllYiBan.firstResult = 0;
					dataAllYiBan.lastPage = false;
					dataAllYiBan.list = dataListYiBan;
					dataAllYiBan.nextPage = 2;
					dataAllYiBan.pageCount = 1;
					dataAllYiBan.pageNo = 1;
					dataAllYiBan.pageSize = 5;
					dataAllYiBan.prePage = 1;
					dataAllYiBan.totalCount=p;
					dataAllYiBan.totalPage = p/5;
					//console.log(dataAllYiBan);
					manageryiban.set({
						data:dataAllYiBan
					});
				});
		$(".l-tab-loading").addClass("hide");
	}else{
		$(".l-tab-loading").removeClass("hide");
		bpmServer.getYibanTasks(loginId,
				tenantId,
				bpmFlowCodes,
				"",
				{"size":"100000","order":"desc",fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"]},
				function(json){
					var dataYiBan = json.data;
					//console.log(json);
					var str = '[]';
					var dataAllYiBan = JSON.parse(str);
					//var dataAllYiBan = eval("("+str+")");
					var list = '[]';
					var dataListYiBan = JSON.parse(list);
					//var dataListYiBan = eval("("+list+")");
					dataAllYiBan.totalCount = json.total;
					var newDataYiBan=[];
					var newActivityIdYiBan=[];
					var p=0;
					for(var i=0;i<dataYiBan.length;i++){
						var items=dataYiBan[i].fetchVars.activityId;
						if($.inArray(items,newActivityIdYiBan)==-1){
							newActivityIdYiBan.push(items);
							newDataYiBan.push(dataYiBan[i]);
						}
					}
					
					for(var i in newDataYiBan){
						processInstanceId = newDataYiBan[i].PROC_INST_ID;
						taskId = newDataYiBan[i].ID;
						newDataYiBan[i].fetchVars.processInstanceId = processInstanceId;
						newDataYiBan[i].fetchVars.taskId = taskId;
						dataListYiBan.push(newDataYiBan[i].fetchVars);
						p++;
					}
					dataAllYiBan.list = dataListYiBan;
					dataAllYiBan.firstPage = true;
					dataAllYiBan.firstResult = 0;
					dataAllYiBan.lastPage = false;
					dataAllYiBan.list = dataListYiBan;
					dataAllYiBan.nextPage = 2;
					dataAllYiBan.pageCount = 1;
					dataAllYiBan.pageNo = 1;
					dataAllYiBan.pageSize = 5;
					dataAllYiBan.prePage = 1;
					dataAllYiBan.totalCount=p;
					dataAllYiBan.totalPage = p/5;
					//console.log(dataAllYiBan);
					manageryiban.set({
						data:dataAllYiBan
					});
				});
		$(".l-tab-loading").addClass("hide");
	}
	
}

function refreshList(){
	manageryiban.reload(1);
}
