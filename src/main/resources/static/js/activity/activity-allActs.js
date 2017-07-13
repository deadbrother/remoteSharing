function showDetails(activityId){
	if(top.openTab==undefined){
		location.href="../activity/detail?po.activityId="+activityId;
	}else{
			top.openTab("活动详情","/"+services.clyxactivity+"/activity/detail?po.activityId="+activityId);
		 }
	
}
$(function(){
	//页面加载完毕空置0处理
	$(".actTotal").each(function(){
		if($(this).text().trim()==""){
			$(this).text("0");
		}else{
			$(this).text($(this).text().trim());
		}
	});
	
	$("#search-tool-btn").click(function(){		

		reLoad();
	});
	
	
});

function reLoad(){
	var createDateStart = $("#createDateStart").val();
	var createDateEnd = $("#createDateEnd").val();
	var createName = $("#createName").val().trim();
	var state = $("#state").val();
	manager.options.parms = {
		"orderOrdRefresh":"1",
		"po.createName":createName,
		"po.createDateStart" : createDateStart,
		"po.createDateEnd" : createDateEnd,
		"po.state":state
	};
	manager.reload(manager.options.page);
}
