$(function() {	
	var tableWidth=screen.width;    
	if(screen.width<= 1930&&screen.width>1380 ){
		tableWidth=tableWidth-screen.width*0.2;		
	}
	if(screen.width<= 1380&&screen.width>1028 ){
		tableWidth=tableWidth-screen.width*0.09;		
	}
	if(screen.width<= 1028){
		tableWidth=tableWidth-screen.width*0.2;
	}


	manager = $("#maingrid").ligerGrid({
		columns : [
		{
			display : '<td style="text-align:left">活动id</td>',
			name : 'activityId',
			align : 'left',
			width : '20%'
		},            
		{
			display : '<td style="text-align:left">活动名称</td>',
			name : 'activityName',
			align : 'left',
			width : '31%',
			render: function(rowdata,index,value){
	        	return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityName+"'><a onclick=showDetails("+rowdata.activityId+")>"+rowdata.activityName+"</a></div>";
	        }
		},
		{
			display : '<td style="text-align:left">活动目标数</td>',
			name : 'userNum',
			align : 'center',
			width : '10%',
		},
		{
			display : '<td style="text-align:left">创建人</td>',
			name :'creator',
			align : 'left',
			width : '20%' ,
			render: function(rowdata,index,value){
   	        	return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.creator+"'>"+rowdata.creator+"</div>";
   			}
		},{
			display : '<td style="text-align:left">创建时间</td>',
			name :'createDate',
			align : 'left',
			width : '12%' 
		},{
			display : '<td style="text-align:left">行政级别</td>',
			name :'orgLevel',
			align : 'left',
			width : '7%' 
		}],
		checkbox : false,
		isSingleCheck :true,
		url : '../activity/allActivitysList',
		parms : [{name:"po.state",value:$("#state").val()}],
		method : 'post',		
		dataAction:'server',
		width:tableWidth,
		pageSize:5,
		usePager : true,
		onRClickToSelect:true,
        alternatingRow: false,
	});	
});


