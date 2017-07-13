$(function() {
	//loginId  = "prov_ma";
	//loginId="uni076";
	//loginId = "hn_user1";
	//bpmServer.getStartedProcess(loginId,
	bpmServer.getDaibanTasks(loginId,
			tenantId,
			bpmFlowCode,
			"",
			loginId,
			{fetchVars:["activityName","activityId","activityCycle","activityTheme","orgLevel","startDate","endDate","createDate","stateDesc","orgRange","createUserName","userGroupId","createOrgPath","orgPath","channelCheck"]},
			function(json){
				var data = json.data;
				//console.log(json);
				var str = '[]';
				var dataAll = JSON.parse(str);
				var list = '[]';
				var dataList = JSON.parse(list);
				dataAll.totalCount = json.total;				
				
				for(var i in data){
					processInstanceId = data[i].PROC_INST_ID;
					taskId = data[i].ID;
					data[i].fetchVars.processInstanceId = processInstanceId;
					data[i].fetchVars.taskId = taskId;
					dataList.push(data[i].fetchVars);
				}
				dataAll.list = dataList;
				//console.log(dataAll);
				var height = $(window).height();
				managermytaskmytask = $("#examineidmytask")
				.ligerGrid(
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
										width : '10%',
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
											var operate = "<a href='#' onclick=banli('"+rowdata.processInstanceId + "','" + rowdata.taskId +"','" + rowdata.activityId +"')>办理</a>";
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
							usePager : true,
							onSelectRow : selectRow,
							height: height,
							width : '98%'
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
				var taskDealInfo = json.data[0].taskDealInfo;
				formUrl = taskDealInfo.formUrl;
				formParams = taskDealInfo.formParams;
				url = formUrl + formParams;
				url = url.replace("processInstanceId=","processInstanceId=" + processInstanceId);
				url = url.replace("taskId=","taskId=" + taskId);
				//console.log("请求地址为 :" + url);
				/*
				 * var
				 * userGroupId=$('.active').find("td:eq(12)").html().trim();
				 */
				var userGroupId = $('.l-selected')
						.find("td:eq(13)>div").html();
				var examineDetail = $("#examineDetail").val();
				location.href = url + "&po.activityId="
						+ activityId
						+ "&po.userGroupId="
						+ userGroupId
						+ "&po.examineDetailCheck=" + examineDetail;
				
	});
	
}
// 刷新页面
function reload() {
	var activityName = $("#activityName").val();
	activityName = activityName != null ? activityName : "";
	managermytask.options.page = 1;
	managermytask.options.parms = {
		"activityName" : activityName
	};
	managermytask.reload(1);
}