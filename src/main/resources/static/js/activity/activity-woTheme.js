$(function(){
	var activityName = $("#activityName").val();
	if(activityName==null){
		activityName = "";
	}
	manager = $("#maingrid").ligerGrid({
		columns : [           
		{
			display : '<td style="text-align:left">活动名称</td>',
			name : 'activityName',
			align : 'left',
			width : '40%',
			render:function(rowdata,index,value){
				/*return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityDailyName+"'><a href='detail?po.activityId=" +rowdata.activityDailyId+ "&po.userGroupId="+rowdata.userGroupId+"'>"+rowdata.activityDailyName+"</a></div>";*/
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityName+"'>"+rowdata.activityName+"</div>";
			}

		}, {
			display : '<td style="text-align:left">活动来源</td>',
			name : 'activityLevel',
			align : 'center',
			width : '20%',
			render:function(rowdata,index,value){
				if(rowdata.activityLevel=="1"){
					return "本省";
				}else{
					return "本地市";
				}
			}

		},{
			display : '<td style="text-align:left">创建时间</td>',
			name : 'createDate',
			align : 'center',
			width : '20%',
			render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='"+rowdata.createDate+"'>" +rowdata.createDate+ "</div>";				
			}
		},{
			display : '<td style="text-align:left">优先级</td>',
			align : 'center',
			width : '20%',
			render:function(rowdata,index,value){
				var webContent = "<div><img src='../image/up.png' style='cursor:pointer;width:12px;height:18px;margin-right:10px;' href='javascript:;' onclick=moveUp("+rowdata.__index+");>" +
       			"<img src='../image/down.png' style='cursor:pointer;width:12px;height:18px;margin-right:10px;' href='javascript:;' onclick=moveDown("+rowdata.__index+");>";
   						return  webContent +
   	        			"<button onclick=upAll("+rowdata.__index+")>置顶</button>"+
   	        			"</div>";
			}
		},{
			name : "activityId",
			hide : 'hide'
		}],
		checkbox : false,
		isSingleCheck :true,
		isScroll : false,
		pageSize:10,
		fixedCellHeight:false,
		pageSizeOptions:[3,4,5,6,7],
		url : '../activity/woThemelist',
		parms:{
			"po.activityName" : activityName
		},
		method : 'post',
		rownumbers : false,
		usePager : true,
		onSelectRow :cwc,
		width : '100%',
		allowHideColumn:false,
		enabledSort:false

	});
	
	function cwc(rowdata, rowid, rowobj){
		//console.log(rowdata.activityId);
	}
	
	$("#search-tool-btn").click(function(){
		var activityName = $("#activityName").val();
		activityName = activityName != null ? activityName : "";
		manager.options.page = 1;
		manager.options.parms = {
			"po.activityName" : activityName
		};
		manager.reload(1);
	});
});

/**
 * 上移
 * @param rowdata
 */
function moveUp(index){
	//var index = rowdata.__index;
	if(index == 0 && manager.options.page ==1){
		alert("已经处于首位！");
	}else if(index == 0 && manager.options.page != 1){
		movePageAsyn(index,null);
	}else{	
		moveAsyn(index,index-1);
	}
}
/**
 * 下移
 * @param rowdata
 */
function moveDown(index){
	if(index == manager.options.total%manager.options.pageSize -1 && parseInt(manager.options.total/manager.options.pageSize) == manager.options.page - 1){
		alert("已经处于最末位！");
	}else if(index == manager.options.pageSize - 1 && parseInt(manager.options.total/manager.options.pageSize) != manager.options.page - 1){
		movePageAsyn(null,index);
	}else{	
		moveAsyn(index+1,index);
	}
}
/**
 * 置顶
 * @param rowdata
 */
function upAll(index){
	moveAllAsyn(index);	
}

/**
 * 跨页上移下移调用
 * @param pre
 * @param after
 */
function movePageAsyn(pre,after){
	var activityId = after == null?manager.getRow(pre).activityId:manager.getRow(after).activityId;
	var ord = after ==null?manager.getRow(pre).ord:manager.getRow(after).ord;
	var orgLevel = after ==null?manager.getRow(pre).activityLevel:manager.getRow(after).activityLevel;
	var order = after==null?"0":"1";
	$.ajax({
		url: '../activity/SubpriorityOrdPageChange',
		type: "POST",
		async: true,
		data: {	
			"priorityOrdList":[{"activityId":activityId,"ord":ord,"orgLevel":orgLevel},
			                   {"activityId":"","ord":order,"orgLevel":orgLevel}]
		},
		success: function(data) {	
			manager.reload(1);			
		}
	});
}

/**
 * 置顶调用请求
 * @param pre
 */
function moveAllAsyn(pre){
	$.ajax({
		url: '../activity/SubpriorityOrdUpAllChange',
		type: "POST",
		async: true,
		data: 
		{	
			"priorityOrdList":[{"activityId":manager.getRow(pre).activityId,"ord":"1","orgLevel":manager.getRow(pre).activityLevel},
			                {"activityId":"","ord":manager.getRow(pre).ord,"orgLevel":manager.getRow(pre).activityLevel}]
		},
		success: function(data) {	
			manager.reload(1);
		}
	});
}

/**
 * 上移下移调用请求
 */
function moveAsyn(pre,after){
	//console.log(pre);
	$.ajax({
		url: '../activity/SubpriorityOrdChange',
		type: "POST",
		async: true,
		data: {	
			"priorityOrdList":[{"activityId":manager.getRow(pre).activityId,"ord":manager.getRow(after).ord},
			                {"activityId":manager.getRow(after).activityId,"ord":manager.getRow(pre).ord}]
		},
		success: function(data) {	
			manager.reload(1);
		}
	});
}