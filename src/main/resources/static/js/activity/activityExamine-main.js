$(function() {
	//loginId  = "prov_ma";

	//loginId="uni076";
	//loginId = "hn_user1";
	getData();
	bpmServer.getDaibanTasks(loginId,
			tenantId,
			"",
			"",
			"",
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
				/*for(var i in data){
					processInstanceId = data[i].PROC_INST_ID;
					taskId = data[i].ID;
					var procStartTime = data[i].PROC_START_TIME;
					//console.log(data[i]);
					bpmServer.getVariables(loginId,
									tenantId,
									taskId,
									"",
									processInstanceId,
									function(json){
										//console.log(json);
										if(json.variables.activityInfo){
											var activityInfo = json.variables.activityInfo;
											activityInfo.endDate = procStartTime;
											dataList.push(activityInfo);
										}
										//console.log(dataList);
										
					});
				}*/
				dataAll.list = dataList;
				//console.log(dataAll);
				managermain = $("#examineidmain")
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
											return "<a href='#' onclick=banli('"+rowdata.processInstanceId + "','" + rowdata.taskId +"','" + rowdata.activityId +"')>办理</a>";
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
							width : '98%'
						});
			});
	
	/*managermain = $("#examineid")
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
									display : '地域',
									name : 'orgLevel',
									align : 'center',
									width : '5%'
								},
								{
									display : '活动名称',
									name : 'activityDailyName',
									align : 'left',
									width : '25%',
									render:function(rowdata,index,value){										
											return "<div class='l-grid-row-cell-inner' style=' text-align:left;' title='"+rowdata.activityDailyName+"'>" +rowdata.activityDailyName+"</div>";
										}
								},
								{
									display : '活动主题',
									name : 'activityTheme',
									align : 'left',
									width : '10%'
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
								} ],
						isScroll : false,
						url : '../activityExamine/main',
						method : 'post',
						pageSize : 5,
						fixedCellHeight : false,
						rownumbers : false,
						usePager : true,
						onSelectRow : cwc,
						width : '98%'

					});*/
	function selectRow(rowdata, rowid, rowobj) {
		$("#radio"+rowdata.__id).prop("checked",true);
	}
	// 审批
	$("#examinebutton")
			.click(
					function() {
						/*
						 * var
						 * userGroupId=$('.active').find("td:eq(12)").html().trim();
						 */
						var userGroupId = $('.l-selected')
								.find("td:eq(13)>div").html();
						var examineDetail = $("#examineDetail").val();
						var id = "";
						var seletedNum = 0;
						var parentId = $(".l-selected").find("td:eq(12)>div")
								.html();
						$(".l-selected").find("td:eq(11)>div").each(function() {
							if (id != "") {
								id = id + "," + $(this).html().trim();
							} else {
								id = $(this).html().trim();
							}
							seletedNum++;
						});
						if (seletedNum != 1) {
							$.ligerDialog.warn("请选择一项进行审批！");
							return;
						}
						location.href = "../activityExamine/examine?po.activityId="
								+ id
								+ "&po.userGroupId="
								+ userGroupId
								+ "&po.examineDetailCheck=" + examineDetail;
					});

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
				/*var id = "";
				var seletedNum = 0;
				var parentId = $(".l-selected").find("td:eq(12)>div")
						.html();
				$(".l-selected").find("td:eq(11)>div").each(function() {
					if (id != "") {
						id = id + "," + $(this).html().trim();
					} else {
						id = $(this).html().trim();
					}
					seletedNum++;
				});
				if (seletedNum != 1) {
					$.ligerDialog.warn("请选择一项进行审批！");
					return;
				}*/
				location.href = url + "&po.activityId="
						+ activityId
						+ "&po.userGroupId="
						+ userGroupId
						+ "&po.examineDetailCheck=" + examineDetail;
				
	});
	
}

// 操作
function viewMenuStr(id, event) {
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"
			+ id
			+ "')\" style=\"line-height:0;\"><image src=\"../image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"
			+ id
			+ "')\" style=\"line-height:0;\"><image src=\"../image/delete.png\">&nbsp;删除</a></div>";
	var xyObj = getMousePos(event);
	$("#modifyMenu").html(str).css({
		left : (xyObj.x - 50) + "px",
		top : (xyObj.y + 10) + "px"
	}).show();
	$(document).bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "modifyMenu"
			|| $(event.target).parents("#modifyMenu").length > 0 || event.target.id == "runGz")) {
		hideMenu();
	}
}
function getMousePos(event) {
	var e = event || window.event;
	var scrollX = document.documentElement.scrollLeft
			|| document.body.scrollLeft;
	var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
	var x = e.pageX || e.clientX + scrollX;
	var y = e.pageY || e.clientY + scrollY;
	return {
		'x' : x,
		'y' : y
	};
}
// 修改类型
function updateType(code_type_id) {
	typeLayer = $.ligerDialog.open({
		title : '码表类型',
		url : '../entityCode/updateJsp/' + code_type_id,
		width : 300,
		height : 300,
		isResize : true,
	});
}
// 删除选中的类型
function deleteType(code_type_id) {
	$.ajax({
		url : '../entityCode/delete/' + code_type_id,
		type : "GET",
		async : true,
		success : function(data) {
			if (data == "success") {
				managermain.deleteSelectedRow();
				hideMenu();

			} else {
				$.ligerDialog.warn("删除失败");
			}
		}
	});
}
// 刷新页面
function reload() {
	var activityName = $("#activityName").val();
	activityName = activityName != null ? activityName : "";
	managermain.options.page = 1;
	managermain.options.parms = {
		"activityName" : activityName
	};
	managermain.reload(1);
}
// 升序
function up(code_type_id) {
	$.ajax({
		url : '../entityCode/exchangeWithUp',
		type : "POST",
		async : true,
		data : {
			"code_type_id" : code_type_id
		},
		success : function(data) {
			if (data == "success") {
				reload();
			} else if (data == "first") {
				$.ligerDialog.warn("当前类型已经位于首位");
			} else {
				$.ligerDialog.warn("升序失败");
			}
		}
	});
}
// 降序
function down(code_type_id) {
	$.ajax({
		url : '../entityCode/exchangeWithDown',
		type : "POST",
		async : true,
		data : {
			"code_type_id" : code_type_id
		},
		success : function(data) {
			if (data == "success") {
				reload();
			} else if (data == "last") {
				$.ligerDialog.warn("当前类型已经位于末尾");
			} else {
				$.ligerDialog.warn("降序失败");
			}
		}
	});
}
// 关闭layer 取消按钮
function cancelTypelayer() {
	typeLayer.close();
}
// 关闭 刷新页面 因为要重新排序
function closeTypelayer() {
	reload();
	cancelTypelayer();
}

function getData(){
	
}
