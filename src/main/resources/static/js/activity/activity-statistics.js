var manager;
var startDate="";
var endDate="";
var firstData="";
var firstGrid="";
$(function() {
	height = $(window).height();
	manager = $("#maingrid").ligerGrid(
			{
				columns : [
						{
							display : '组织机构',
							type : 'String',
							align : 'center',
							name : 'name'
						},
						{
							display : '创建活动数',
							type : 'String',
							align : 'center',
							name : 'sum',
							render : function(rowdata,index,value){
								//return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"+rowdata.sum+"'><a onclick='details(\'"+rowdata.id+"\',\'"+rowdata.id+"\')'>"+rowdata.sum+"</a></div>";
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.sum+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'sum\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.sum+"</a></div>";
							}
						},
						{
							display : '待审批活动数',
							type : 'String',
							align : 'center',
							name : 'examine',
							render : function(rowdata,index,value){
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.examine+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'examine\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.examine+"</a></div>";
							}
						},
						{
							display : '启用活动数',
							type : 'String',
							align : 'center',
							name : 'start',
							render : function(rowdata,index,value){
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.start+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'start\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.start+"</a></div>";
							}
						},
						{
							display : '驳回活动数',
							type : 'String',
							align : 'center',
							name : 'reject',
							render : function(rowdata,index,value){
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.reject+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'reject\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.reject+"</a></div>";
							}
						},
						{
							display : '暂存活动数',
							type : 'String',
							align : 'center',
							name : 'pauseSave',
							render : function(rowdata,index,value){
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.pauseSave+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'pauseSave\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.pauseSave+"</a></div>";
							}
						},
						{
							display : '暂停活动数',
							type : 'String',
							align : 'center',
							name : 'pause',
							render : function(rowdata,index,value){
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.pause+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'pause\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.pause+"</a></div>";
							}
						},
						{
							display : '结束活动数',
							type : 'String',
							align : 'center',
							name : 'stop',
							render : function(rowdata,index,value){
								return "<div class=\'l-grid-row-cell-inner\' style=\' text-align:center;display:block;\' title=\'"+rowdata.stop+"\'><a data-toggle='modal' data-target='#myModal' onclick=details(\'"+rowdata.id+"\',\'stop\',\'"+rowdata.path+"\',\'"+rowdata.name+"\',\'"+startDate+"\',\'"+endDate+"\')>"+rowdata.stop+"</a></div>";
							}
						},
						/*, {
							display : '',
							type : 'String',
							align : 'center',
							name : 'allocationno',
							render : function(item) {
								var url="../distributeResult/findDetail?orgpath="+item.orgPath +"&&type=no";
								var a = "";
								a = "<a href="+url+">" + item.allocationno + "</a>"
								return a;
							}
						}*/ ],
				url : '../activity/statisticsList',
				dataAction : 'server',
				checkbox : false,
				usePager : false,
				alternatingRow : false,
				width : '97%',
				height:height,
				tree : {
					columnId : 'id',
					columnName : 'name',
					idField : 'id',
					parentIDField : 'pid',
					isParent : function(data) {
						if (data.isParent)return true;
						if(data.children) return true;
						return false;
					},
					isExtend : function(data) {
						if(data.children&&data.isextend){
							return true;
						}else{
							return false;
						}
					}
				},
				onBeforeShowData: function (){
				    var grid = this; 
				    grid.collapsedRows = []; 
				},
				onSuccess:function(data){
					firstGrid = this;
					data[0].isextend = true; 
					showFirstChild(data[0],0,firstGrid);
				},
				onSelectRow: function(rowdata, rowindex, rowDomElement){
					//console.log(rowdata);
				},
				onTreeCollapse : function(data,e){
					data.isextend=false;
					e.update();
				},
				onTreeExpand : function(data,e){
					data.isextend=true;
					var grid = this;
					var startDate = $("#startDate").val();
					var endDate = $("#endDate").val();
					startDate = startDate != null ? startDate : "";
					endDate = endDate != null ? endDate : "";
					var grid = this;
					var children_data="";
					if (!data.loaded){
						grid.toggleLoading(true);
                        //模拟加载ajax数据
                        setTimeout(function (){
                        	$.ajax({
        						url : "../activity/statisticsList",
        						type: "POST",
        						async : false,
        						data:{ "id":data.id,
        							 "name" : data.name,
        							 "path" : data.path,
        							 "startDate" : startDate,
        							 "endDate" : endDate},
        						success : function(data1){
        							children_data = data1;	
        						}	
        					});
                        	grid.toggleLoading(false);
                        	grid.append(children_data, data);
                        	e.update();
                        	data.loaded = true;
                        }, 200);
					}
				}

			});
	$("#search-tool-btn").click(function() {
		reload();
	});
    
});

var manager1;
function details(id,state,path,name,startDate,endDate){
	var detailName="";
	var status=state;
	if(status=="sum"){
		status = "";
		detailName = "创建的活动";
	}else if(status=="examine"){
		status = "13";
		detailName = "待审批的活动";
	}else if(status=="start"){
		status = "9";
		detailName = "启用的活动";
	}else if(status=="reject"){
		status = "10";
		detailName = "驳回的活动";
	}else if(status=="pauseSave"){
		status = "12";
		detailName = "暂存的活动";
	}else if(status=="pause"){
		status = "11";
		detailName = "暂停的活动";
	}else if(status=="stop"){
		status = "8";
		detailName = "结束的活动";
	}
	$("#hid").val(id);
	$("#hstate").val(status);
	$("#hpath").val(path);
	$("#hstartDate").val(startDate);
	$("#hendDate").val(endDate);
	$("#detailName").val(name+detailName+":");
	$("#detailName").html(name+detailName+":");
	manager1 = $("#detailList").ligerGrid(
		{
		
		columns : [
	        { display : '活动名称',
	          name : 'activityDailyName',
	          align : 'left',
	          width : '40%',
	          render : function(rowdata,index,value){
	        		return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityDailyName+"'><a onclick='activityDetail("+rowdata.activityDailyId+","+rowdata.userGroupId+")'>"+rowdata.activityDailyName+"</a></div>";
	        	}},
	        { display : '活动状态',name : 'stateDesc',align : 'center'},
			{ display : '创建人',name : 'createUserName',align : 'left'},
			{ display : '创建时间',name : 'createDate',align : 'center'}
				],
			isScroll : true,
			url : '../activity/statisticsDetail',
			parms:{
				"po.orgIds" : id,
				"po.createOrgPath" : path,
				"po.state"   : status,
				"po.startDate" : startDate,
				"po.endDate" : endDate
	          },
			checkbox : false,
			isSingleCheck :true,
			/*onSelectRow: function(rowdata, rowindex, rowDomElement){
				
			},*/
			pageSize:5,
			rownumbers : false,
			usePager : true,
			fixedCellHeight:false,
			allowHideColumn:false,
			enabledSort:false,
			width:890
		});
	manager1.reload(1);
}



function reload() {
	startDate = $("#startDate").val();
	endDate = $("#endDate").val();
	startDate = startDate != null ? startDate : "";
	endDate = endDate != null ? endDate : "";
	manager.options.parms = {
		"startDate" : startDate,
		"endDate" : endDate
	};
	manager.reload(1);
}

function showFirstChild(data,e,grid){
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	startDate = startDate != null ? startDate : "";
	endDate = endDate != null ? endDate : "";

	var children_data="";
	if (!data.loaded){
		grid.toggleLoading(true);
        	$.ajax({
				url : "../activity/statisticsList",
				type: "POST",
				async : false,
				data:{ "id":data.id,
					 "name" : data.name,
					 "path" : data.path,
					 "startDate" : startDate,
					 "endDate" : endDate},
				success : function(data1){
					children_data = data1;	
				}	
			});
        	grid.toggleLoading(false);
        	grid.append(children_data, data);
        	if(e!=0){
            	e.update();
        	}
        	data.loaded = true;
	}

}

function activityDetail(activityId,userGroupId){
	if(top.openTab==undefined){
		location.href="../activity/detail?po.activityId="+activityId+"&po.usergroupId="+userGroupId;
	}else{
			top.openTab("活动详情","/"+services.clyxactivity+"/activity/detail?po.activityId="+activityId+"&po.usergroupId="+userGroupId);
		 }
}

function download123(){
	location.href="../excel/downloadTemp?po.orgIds="+$("#hid").val()+"&po.createOrgPath="+$("#hpath").val()+"&po.state="+$("#hstate").val()+"&po.startDate="+$("#hstartDate").val()+"&po.endDate="+$("#hendDate").val()+"&excelName="+$("#detailName").val();
	/*$.ajax({
		url : "../excel/downloadTemp",
		type: "POST",
		async : false,
		data:{ "po.orgIds" : $("#hid").val(),
			"po.createOrgPath" :  $("#hpath").val(),
			"po.state"   :  $("#hstate").val(),
			"po.startDate" :  $("#hstartDate").val(),
			"po.endDate" :  $("#hendDate").val()},
		success : function(data){
			if(data.success){
				
			}	
		}	
	});*/
}



