var totalCount = 0;
var dragPreActid = "";
var dragPreOrd = 0;
var dragPreIndex =0;
var dragAfterActid = "";
var dragAfterOrd = 0;
var dragAfterIndex = 0;
$(function() {
	var operations = {
		upMove:function(item,i){
			moveUp(rowdata.__index);
		},
		downMove:function(){
			moveDown(rowdata.__index);
		},
		upAll:function(){
			upAll(rowdata);
		}
	};
	//置顶权限控制
	if($("#logerOrgLevel").val() == 1){
		menu = $.ligerMenu({ width: 120, items:
	        [
	        { text: '上移', click:operations.upMove, icon: 'add' },
	        { text: '下移', click:operations.downMove, },
	        { line: true },
	        { text: '置顶', click:operations.upAll }
	        ]
	        }); 
	}else{
		menu = $.ligerMenu({ width: 120, items:
	        [
	        { text: '上移', click:operations.upMove, icon: 'add' },
	        { text: '下移', click:operations.downMove, }
	        ]
	        });
	}
	
/*	var tableWidth=screen.width;    
	if(screen.width<= 1930&&screen.width>1380 ){
		tableWidth=tableWidth-screen.width*0.50;		
	}
	if(screen.width<= 1380&&screen.width>1028 ){
		tableWidth=tableWidth-screen.width*0.22;		
	}
	if(screen.width<= 1028){
		tableWidth=tableWidth-screen.width*0.4;
	}*/
	manager = $("#maingrid").ligerGrid({
		columns:[
           		{
           			display : '<td style="text-align:left">活动id</td>',
           			name : 'activityId',
           			align : 'left',
           			width : '6%'
           		},
           		
           		{
					display : '<td style="text-align:left">序号</td>',
					name :'orderOrd',
					align : 'center',
					width : '5%' 
				},
           		{
           			display : '<td style="text-align:left">活动名称</td>',
           			name : 'activityName',
           			align : 'left',
           			width : '8%',
           			render: function(rowdata,index,value){
           				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityName+"'><a onclick=showDetails("+rowdata.activityId+")>"+rowdata.activityName+"</a></div>";
           			}
           		},
           		{
           			display : '<td style="text-align:left">创建时间</td>',
           			name :'createDate',
           			align : 'left',
           			width : '12%' 
           		},{
           			display : '<td style="text-align:left">行政级别</td>',
           			name :'orgLevel',
           			align : 'left',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">总数</td>',
           			name :'channelAll',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">客户经理</td>',
           			name :'channel5',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">本地短信</td>',
           			name :'channel7',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">微信</td>',
           			name :'channel11',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">手厅</td>',
           			name :'channel1',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">沃视窗</td>',
           			name :'channel9',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">网厅</td>',
           			name :'channel2',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">本地弹窗</td>',
           			name :'channel8',
           			align : 'right',
           			width : '5%' 
           		},
           		{
           			display : '<td style="text-align:left">电话渠道</td>',
           			name :'channel12',
           			align : 'right',
           			width : '4%' 
           		},
           		{
           			display : '<td style="text-align:left">创建人</td>',
           			name :'creator',
           			align : 'left',
           			width : '10%' ,
           			render: function(rowdata,index,value){
           	        	return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.creator+"'>"+rowdata.creator+"</div>";
           			}
           		},
           		{
           			display : '<td style="align:left">操作</td>',
           			name :'channel8',
           			align : 'left',
           			width : '10%',
           			render: function(rowdata,index,value){
           				var webContent = "<div><img src='../image/up.png' style='cursor:pointer;width:12px;height:18px;margin-right:10px;' href='javascript:;' onclick=moveUp("+rowdata.__index+");>" +
   	        			"<img src='../image/down.png' style='cursor:pointer;width:12px;height:18px;margin-right:10px;' href='javascript:;' onclick=moveDown("+rowdata.__index+");>";
           				if($("#logerOrgLevel").val() == 1){
           						return  webContent +
           	        			"<button onclick=upAll("+rowdata.__index+")>置顶</button>"+
           	        			"</div>";
           				}else{
           					return webContent;
           				}
           				
           			}
           		}],
		fixedCellHeight:false,
		width : '100%',
		checkbox : false,
		isSingleCheck :true,
		url : '../activity/AllActiveList',
		method : 'post',		
		dataAction:'server',
		pageSize:5,
		usePager : true,
		onRClickToSelect:true,
        alternatingRow: false,
        rowDraggable: $("#logerOrgLevel").val() == 1?true:false,
		onSuccess:function(data){
			totalCount = data.totalCount;
			//console.log(totalCount);
		},
		rowDraggingRender: function (rows)
		               {
		                   //console.log( rows[0].activityId);
		                   dragPreActid = rows[0].activityId;
		                   //console.log(rows[0].orderOrd);
		                   draPreOrd = rows[0].orderOrd;
		                   //console.log(rows[0].__index);
		                   dragPreIndex = rows[0].__index;
		                },
		onContextmenu : function (param,e)
		                 {	
							 rowdata = param.data;
		                     activityId = param.data.activityId;
		                     //console.log(activityId);
		                     menu.show({ top: e.pageY, left: e.pageX });
		                     return false;
		                 },
	    onRowDragDrop:function(parent){
	    	//console.log(JSON.stringify(parent));
	    	dragAfterActid = parent.rows[0].activityId;	    	
	    	dragAfterOrd = parent.rows[0].orderOrd;
	    	dragAfterIndex = parent.rows[0].__index;
	    	//console.log(parent.rows[0].activityId);
	    	//console.log(parent.rows[0].orderOrd);
	    	//console.log(parent.rows[0].__index);
	    	for(var i = dragAfterIndex;i<dragPreIndex;i++){
	    		manager.getRow(i).ROW_ID = i + 1;
	    		manager.getRow(i).orderOrd = i + 1;
	    	}
	    	moveDragAsyn(dragPreIndex + 1,dragAfterIndex + 1);
	    	manager.reload();
	    }

	});
});
	function length(data,len){
		if(data.length > len){
			return data.substring(0,len) + "...";
			
		}else{
			return data;
		}
	}
	/**
	 * 拟用控制，暂未调用
	 */
	function check(index){
		if(manager.getRow(0).orderOrd == 0){
			$.ligerDialog.warn('没有任何排序，请选择一项置顶后再进行操作!');
			return false;
		}if(manager.getRow(index-1).orderOrd == 0){
			$.ligerDialog.warn('下一项并没有进行排序!');
		}
	}
	/**
	 * 选择行默认上移操作
	 */
	function cwc(rowdata, rowid, rowobj,index){
		// $("#cwc"+rowdata.__id).attr("checked",true);
		//console.log(rowdata.activityDailyId);
		moveUp(rowdata);
		//moveDown(rowdata);
		//upAll(rowdata);
	}
	
	/**
	 * 上移下移在前台只进行显示修改，后台进行变更，未进行再次刷新列表
	 * 若要再次刷新，可以禁用这块
	 */
	function changeValue(pre,after){
		var tempOrd = manager.getRow(after).orderOrd;
		manager.getRow(after).orderOrd = manager.getRow(pre).orderOrd;
		manager.getRow(pre).orderOrd = tempOrd;
	}
	/*function getValue(pre,after){
		return "\"activityId\":\""+manager.getRow(pre).activityId + "\",\"orderOrd\":\""+manager.getRow(pre).orderOrd +"\"},{\"activityId\":\"" +manager.getRow(after).activityId +"\",\"orderOrd\":\""+ manager.getRow(after).orderOrd +"\"";
	}*/
	
	/**
	 * 上移下移调用请求
	 */
	function moveAsyn(pre,after){
		$.ajax({
			url: '../activity/orderOrdChange',
			type: "POST",
			async: true,
			data: 
			{	
				"orderOrdlist":[{"activityId":manager.getRow(pre).activityId,"orderOrd":manager.getRow(after).orderOrd},
				                {"activityId":manager.getRow(after).activityId,"orderOrd":manager.getRow(pre).orderOrd}]
			},
			success: function(data) 
			{	
				/*if(data=="1"){
					$.ligerDialog.warn('切换成功!');
				}*/
				//manager.reload();
				reLoad();
				//changeValue(pre,after);
				
			}
		});
	}
	/**
	 * 跨页上移下移调用
	 * @param pre
	 * @param after
	 */
	function movePageAsyn(pre,after){
		var activityId = after == null?manager.getRow(pre).activityId:manager.getRow(after).activityId;
		var order = after==null?"0":"1";
		$.ajax({
			url: '../activity/orderOrdPageChange',
			type: "POST",
			async: true,
			data: 
			{	
				"orderOrdlist":[{"activityId":activityId,"order":order}]
			},
			success: function(data) 
			{	
				/*if(data=="1"){
					$.ligerDialog.warn('切换成功!');
				}*/
				//manager.reload();
				reLoad();
				//changeValue(pre,after);
				
			}
		});
	}
	/**
	 * 拖拽调用请求
	 * @param pre
	 * @param after
	 */
	function moveDragAsyn(pre,after){
		$.ajax({
			url: '../activity/orderOrdUpAllChange',
			type: "POST",
			async: true,
			data: 
			{	
				"orderOrdlist":[{"activityId":dragPreActid,"orderOrd":after},
				                {"activityId":"","orderOrd":pre}]
			},
			success: function(data) 
			{	
				/*if(data=="1"){
					$.ligerDialog.warn('切换成功!');
				}*/
				//manager.reload();
				reLoad();
			}
		});
	}
	
	/**
	 * 置顶调用请求
	 * @param pre
	 */
	function moveAllAsyn(pre){
		$.ajax({
			url: '../activity/orderOrdUpAllChange',
			type: "POST",
			async: true,
			data: 
			{	
				"orderOrdlist":[{"activityId":manager.getRow(pre).activityId,"orderOrd":1},
				                {"activityId":"","orderOrd":manager.getRow(pre).orderOrd}]
			},
			success: function(data) 
			{	
				/*if(data=="1"){
					$.ligerDialog.warn('切换成功!');
				}*/
				//manager.reload();
				reLoad();
			}
		});
	}
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
			
			//manager.move(index,index-1,null);
			
			//var listMap = getValue(index,index-1);
			moveAsyn(index,index-1);
		}
	}
	/**
	 * 下移
	 * @param rowdata
	 */
	function moveDown(index){
		//var index = rowdata.__index;
		if(index == manager.options.total%manager.options.pageSize -1 && parseInt(manager.options.total/manager.options.pageSize) == manager.options.page - 1){
			alert("已经处于最末位！");
		}else if(index == manager.options.pageSize - 1 && parseInt(manager.options.total/manager.options.pageSize) != manager.options.page - 1){
			movePageAsyn(null,index);
		}else{	
			
			//manager.move(index+1,index,null);
			
			//var listMap = getValue(index,index-1);
			moveAsyn(index+1,index);
		}
	}
	/**
	 * 置顶
	 * @param rowdata
	 */
	function upAll(index){
		//var index = rowdata.__index;
		moveAllAsyn(index);
		/*rowdata.ROW_ID = 1;
		rowdata.orderOrd = rowdata.ROW_ID;
		
			for(var i = 0;i < index; i ++){
				var rowdata = manager.getRow(i);
				console.log(JSON.stringify(rowdata));
				rowdata.ROW_ID = i + 2;
				console.log(rowdata.ROW_ID);
				rowdata.orderOrd = rowdata.ROW_ID;
				console.log(rowdata.orderOrd);
			}
	    
		manager.move(index,0,null);*/
		//manager.reload();
		
	}
/*	function reLoad(){
			manager.options.parms = {
				"orderOrdRefresh":"1",
			};
			manager.reload(2);
	}*/
	/*$("#save-tool-btn").click(function(){
		 jQuery.ligerDialog.confirm('请确认是否保存已有修改？', function (confirm) {
             if (confirm){
           	  $.ajax({
         			url : "/activity/saveOrderOrd",
         			type : "POST",
         			async : true,
         			contentType : "application/json",
         			data : ,
         			success : function(data) {
         				console.log(data);
         				if(data.code=="0"){
         				   console.log("工单停用成功");
         				}else{
         				   console.log(data.message);
         				}
         			}
         		});
             }
	});*/
	

