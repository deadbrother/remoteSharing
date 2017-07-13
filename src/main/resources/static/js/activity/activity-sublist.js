$(function() {
	var tableWidth=screen.width;      
	if(screen.width<= 1930&&screen.width>1380 )
	{   tableWidth=tableWidth-screen.width*0.05;    }  
	if(screen.width<= 1380&&screen.width>1028 ){   tableWidth=tableWidth+screen.width*0.25;    }  
	if(screen.width<= 1028){   tableWidth=tableWidth-screen.width*0.05;  }
	var managerSub = $("#managerSub").ligerGrid({
		columns : [
        {
 			display : '地域',
 			name : 'orgLevel',
 			align : 'center',
 			width : '4%'
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
				if(rowdata.activityFunction!="1"){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='执行活动'>执行活动</div>";
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
			display:"操作",
			align : 'center',
			width : '5%',
			render:function(rowdata,index,value){										
				return "<a href='#' onclick=genzong('"+rowdata.activityDailyId+"','"+rowdata.activityDailyName+"','"+rowdata.createOrgId+"','"+rowdata.channelCheck+"')>跟踪</a>";
			}
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
		parms:{
			"po.activityId" : $("#activityId").val()
		},
		method : 'post',
		rownumbers : false,
		usePager : true,
		onSelectRow :cwc,
		width : tableWidth,
		allowHideColumn:false,
		enabledSort:false

	});

	$(".l-grid-header1").html("");
	function cwc(rowdata, rowid, rowobj){
		// $("#cwc"+rowdata.__id).attr("checked",true);
		//console.log(rowdata.activityDailyId);
		$("#radio"+rowdata.__id).prop("checked",true);
	}
	// 查询
	$("#search-tool-btn").click(function() {
		reload();
	});
});
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
	managerSub.options.page = 1;
	managerSub.options.parms = {
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
	managerSub.reload(1);
}

function activityDetail(activityId,userGroupId){
	if(top.openTab==undefined){
		location.href="../activity/detail?po.activityId="+activityId+"&po.usergroupId="+userGroupId;
	}else{
			top.openTab("活动详情","/"+services.clyxactivity+"/activity/detail?po.activityId="+activityId+"&po.usergroupId="+userGroupId);
		 }
}

function genzong(activity_id,activity_name,createOrgId,channelCheck){
 	var flag="false";
 	if(channelCheck!=null&&channelCheck!=""){
 		var ccsplit = channelCheck.split(",");
 		for(var i=0;i<ccsplit.length;i++){
 			if(ccsplit[i]=="5"){
 				flag="true";
 				break;
 			}
 		}
 	}
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
}