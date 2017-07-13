$(function(){ 
	isShowOrg();
	isHQActivity();
	managerList();
	//iCheckorderEndTime();
	if($("input[name='saveType']").val()=="2"||$("input[name='po.isSubActivity']").val()=="1"){
		showRuleList();
	}
	var setting1 = {
			check:{
				enable:true,
				chkboxType: {"Y" : "ps", "N" : "ps"}
				// checkboxType:{"Y":"","N":""},
				// chkStyle:"radio"
			},
			view:{
				// 不显示连线
				showLine: false,
				dbClickExpand:true,
				showIcon:false,
				// 不允许多选
				selectedMulti: false
			},	 
					data: {
						keep: {
							parent: false,
							leaf: true
						},
						simpleData: {
							enable: true
						}
					},
					async: {
						enable: true,
						type:"post",
						autoParam:["id"],
						url: '../activity/range'
					},
					callback: {
						// onClick:showviewclick
						// beforeClick: beforeClick,
						onCheck: onCheck1,
						onAsyncSuccess: onAsyncSuccess1,
						onAsyncError: onAsyncError1
					}
	};

	$.fn.zTree.init($("#orgtree1"), setting1);
	expandAll1();
	
	$("#guizeModal").on('shown.bs.modal', function () {
		if(parseInt($("#fDiv").height())<=200&&parseInt($("#fDiv").height())!=0){
		   	bryant.reload(1);	
		}
	});
	$("#guizeModal").on('hide.bs.modal', function () {
		   	maglist.reload(1);
	});
	$("#myModal").on('shown.bs.modal', function () {
		if(parseInt($("#fDiv").height())<=200&&parseInt($("#fDiv").height())!=0){
			manager.reload(1)	
		}
	});
	$("#myModal").on('hide.bs.modal', function () {
		   	maglist.reload(1);
	});
	if($("#selectDataChannel").is(':checked')){
		$("#contentC4").attr("style","");
	    $("#contentC4").attr("code","1");
	};
	if($("#selectDataChannel2").is(':checked')){
		$("#contentC5").attr("style","");
	    $("#contentC5").attr("code","1");
	}
	if($(".ssfp").find(".checked").val()!=undefined){
		$("#sendForProduct").attr("class","");
	}
});

var inputId="";
function showId(id){
	inputId=id;
	checkedBack1();
}

$(document).ready(function(){
	$("#classOrgRange").bind("click", expandAll1);
});


function beforeClick1(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("orgtree1");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}


function onCheck1(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("orgtree1"),
	nodes = zTree.getCheckedNodes(true),
	v = "",
	pa= ""
	c = 0,
	p = "";

	// treeObj.expandAll(true);
	for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			p += nodes[i].id +",";
			if(nodes[i].path!=undefined){
				pa+= nodes[i].path+",";
			}

			if(treeNode.isParent==true){
				c=1;
			}
	}
	if(c=1){
		v=v.substring(v.indexOf(","), v.length);
		v=v.substring(1,v.length);
		p=p.substring(p.indexOf(","),p.length);
		p=p.substring(1,p.length);
		pa=pa.substring(0, pa.length-1);
	}
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	var orgObj = $("#"+inputId);
	orgObj.attr("value", v);
	orgObj.val(v);
	if(p.length>0) p = p.substring(0, p.length-1);
	var orgId=$("#"+inputId).next().next();
	orgId.attr("value",p);
	var orgPath=$("#"+inputId).next();
	orgPath.attr("value",pa);
	
}


function showMenu1(id) {
	var cityObj = $("#"+id);
	var cityOffset = $("#"+id).offset();
	$("#zTreeDemoBack1").css({left:(cityOffset.left-46) + "px", top:(cityOffset.top-66) + "px"}).slideDown("fast");
	$("#menuContent1").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown1);
}
function hideMenu1() {
	$("#menuContent1").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown1);
}
function onBodyDown1(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == inputId ||event.target.id == "orgtree1" || $(event.target).parents("#orgtree1").length>0)&&(event.target.id == "mainForm" || $(event.target).parents("#mainForm").length>0)) {
		hideMenu1();
	}
}



function expandNodes1(nodes) {
	if (!nodes) return;
	curStatus1 = "expand";
	var zTree = $.fn.zTree.getZTreeObj("orgtree1");
	for (var i=0, l=nodes.length; i<l; i++) {
		zTree.expandNode(nodes[i], true, false, false);
		if (nodes[i].isParent && nodes[i].zAsync) {
			expandNodes1(nodes[i].children);
		} else {
			goAsync1 = true;
		}
	}
}
var curStatus1 = "init", curAsyncCount1 = 0, asyncForAll1 = false,
goAsync1 = false;
function expandAll1() {
	if (!check1()) {
		return;
	}
	var zTree = $.fn.zTree.getZTreeObj("orgtree1");
	if (asyncForAll1) {
		zTree.expandAll(true);
	} else {
		expandNodes1(zTree.getNodes());
		if (!goAsync1) {
			curStatus1 = "";
		}
	}
	
}
function check1() {
	if (curAsyncCount1 > 0) {
		return false;
	}
	return true;
}

function onAsyncSuccess1(event, treeId, treeNode, msg) {
	curAsyncCount1--;
	if (curStatus1 == "expand") {
		expandNodes1(treeNode.children);
	} else if (curStatus1 == "async") {
		asyncNodes1(treeNode.children);
	}
	if (curAsyncCount1 <= 0) {
		if (curStatus1 != "init" && curStatus1 != "") {
			asyncForAll1 = true;
		}
		curStatus1 = "";
	}
	checkedBack1();
}

function onAsyncError1(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
	curAsyncCount1--;
	if (curAsyncCount1 <= 0) {
		curStatus1 = "";
		if (treeNode!=null) asyncForAll1 = true;
	}
}

function checkedBack1(){
	var ids=$("#"+inputId).next().next().val();
	var treeObj = $.fn.zTree.getZTreeObj("orgtree1");
	var nodes = treeObj.transformToArray(treeObj.getNodes());
	var checked = treeObj.getCheckedNodes(true);
	if(checked.length>0){
		for(var i=0;i<checked.length;i++){
			treeObj.checkNode(checked[i],false,true);
		}	
	}
	if(ids!=undefined){
		if(nodes.length>0){
			for (var i=1;i<nodes.length;i++){
				if(ids.indexOf(nodes[i].id) >= 0){
					treeObj.checkNode(nodes[i],true,true);
					// nodes[i].checked = true;
					treeObj.updateNode(nodes[i]); 
			}
		}
		}
	}
	
}


var channelnum=0;
var channelflag=false;
var isEnd=0;
//var reg = /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?/;
var reg = /(http|ftp|https):\/\/(.){0,400}/;
var regImgUrl=/^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/;
$(document).ready(function() {
	$("#trans").click(function() {
		transLongtoShort();
	});
	$("#longUrltest").click(function() {
		longUrlTryTest();
	});
	
	$("#smsMsgTest").click(function() {
		var contents = $("#sendContent").val();
		var targetPhoneNumber = $("#phoneNum").val();
		if (contents == null || contents == "") {
			$.ligerDialog.warn("发送的内容不能为空");
			return;
		} else if (targetPhoneNumber == null || targetPhoneNumber == "") {
			$.ligerDialog.warn("手机号不能为空");
			return;
		}else{
			var myreg = /^1[0-9]{10}$/; 
			if(!myreg.test(targetPhoneNumber)) 
			{ 
				$.ligerDialog.warn('请输入有效的手机号码！'); 
			    return; 
			} 
		}
		//调用话术变量解析接口
		$.ajax({
				async : true,
				type : "POST",
				url : "ordercenter", 
				data : {
						"shortMessage.telPhone":$("#phoneNum").val(),
						"shortMessage.sendContent":$("#sendContent").val()
				},
				success : function(data) {
					var resultCodeOrder = data.resultCodeOrder;
					if(resultCodeOrder == "000000"){
						var contentnew = data.contentnew;
						$.ajax({
							url : "../activity/msmMsgSendTest",
							data : {
								"contents" : contentnew,
								"targetPhoneNumber" : targetPhoneNumber
							},
							type : "POST",
							async : true,
							success : function(data) {
								if (data == "0") {
									$.ligerDialog.warn("短信发送成功");
								}else if((data == "1")){
									$.ligerDialog.warn("短信发送时，服务端无响应");
								}else if(data == "-1"){
									$.ligerDialog.warn("和服务器连接成功，但未知原因致短信发送失败");
								}else if(data == "-2"){
									$.ligerDialog.warn("租户获取失败(为空)致短信发送失败");
								}else if(data == "-3"){
									$.ligerDialog.warn("网关获取失败");
								}else if(data == "3"){
									$.ligerDialog.warn("短信接口服务器连接过程中失败");
								}
							}
						});	
					}else if(resultCodeOrder == "888888"){
						$.ligerDialog.warn("您输入的测试号码不属于当前租户!");	
					}else{
						$.ligerDialog.warn("话术变量替换失败!");	
					}
				},
				error: function(){
					$.ligerDialog.warn("话术变量替换失败!");	
				}
		 })
		
		
	});
	
		//集团短信校验开始-405 
	$("#transZB").click(function() {
		transLongtoShortZB();
	});
	$("#longUrltestZB").click(function() {
		longUrlTryTestZB();
	});
	
	$("#smsMsgTestZB").click(function() {
		var contents = $("#sendContentZB").val();
		var targetPhoneNumber = $("#phoneNumZB").val();
		if (contents == null || contents == "") {
			$.ligerDialog.warn("发送的内容不能为空");
			return;
		} else if (targetPhoneNumber == null || targetPhoneNumber == "") {
			$.ligerDialog.warn("手机号不能为空");
			return;
		}else{
			var myreg = /^1[0-9]{10}$/; 
			if(!myreg.test(targetPhoneNumber)) 
			{ 
				$.ligerDialog.warn('请输入有效的手机号码！'); 
			    return; 
			} 
		}
		//调用话术变量解析接口
		$.ajax({
				async : true,
				type : "POST",
				url : "ordercenter", 
				data : {
						"shortMessage.telPhone":$("#phoneNumZB").val(),
						"shortMessage.sendContent":$("#sendContentZB").val()
				},
				success : function(data) {
					var resultCodeOrder = data.resultCodeOrder;
					if(resultCodeOrder == "000000"){
						var contentnew = data.contentnew;
						$.ajax({
							url : "../activity/msmMsgSendTest",
							data : {
								"contents" : contentnew,
								"targetPhoneNumber" : targetPhoneNumber
							},
							type : "POST",
							async : true,
							success : function(data) {
								if (data == "0") {
									$.ligerDialog.warn("短信发送成功");
								}else if((data == "1")){
									$.ligerDialog.warn("短信发送时，服务端无响应");
								}else if(data == "-1"){
									$.ligerDialog.warn("和服务器连接成功，但未知原因致短信发送失败");
								}else if(data == "-2"){
									$.ligerDialog.warn("租户获取失败(为空)致短信发送失败");
								}else if(data == "-3"){
									$.ligerDialog.warn("网关获取失败");
								}else if(data == "3"){
									$.ligerDialog.warn("短信接口服务器连接过程中失败");
								}
							}
						});	
					}else if(resultCodeOrder == "888888"){
						$.ligerDialog.warn("您输入的测试号码不属于当前租户!");	
					}else{
						$.ligerDialog.warn("话术变量替换失败!");	
					}
				},
				error: function(){
					$.ligerDialog.warn("话术变量替换失败!");	
				}
		 })
		
		
	});
	//集团短信校验结束 
	
	$("#channelcheck").click(function(){
		
		
	});
	


});
/*长地址测试*/
function longUrlTryTest(){
	var longUrl = $("#longUrl").val();
	if(longUrl==null || longUrl==""){
		$.ligerDialog.warn("请输入网址");
		return false;
	}
	if(longUrl.match(reg)==null){
		$.ligerDialog.warn("请输入正确的网址");
		return false;
	}
	
	/*alert(longUrl);*/
	/*window.open(longUrl, "测试页面");*/
	importuser=	$.ligerDialog.open({
		url:longUrl,
		title:"测试原地址是否有效",
		height: 400,
		width: 500,
		isDrag:false,
		buttons : [ {
			text : '关闭',
			onclick: function (item, dialog) { $.ligerDialog.close();
			$(".l-dialog,.l-window-mask").css("display","none"); } 
		}]
	}); 
	
}

/*集团短信长地址测试*/
function longUrlTryTestZB(){
	var longUrl = $("#longUrlZB").val();
	if(longUrl==null || longUrl==""){
		$.ligerDialog.warn("请输入网址");
		return false;
	}
	if(longUrl.match(reg)==null){
		$.ligerDialog.warn("请输入正确的网址");
		return false;
	}
	
	/*alert(longUrl);*/
	/*window.open(longUrl, "测试页面");*/
	importuser=	$.ligerDialog.open({
		url:longUrl,
		title:"测试原地址是否有效",
		height: 400,
		width: 500,
		isDrag:false,
		buttons : [ {
			text : '关闭',
			onclick: function (item, dialog) { $.ligerDialog.close();
			$(".l-dialog,.l-window-mask").css("display","none"); } 
		}]
	}); 
	
}

//客户经理扩展规则列表逻辑清除操作
function emptyExtral4Fro(){
	$("#defaultStrategyRule").empty();//客户经理扩展规则页面相同内容删除
	$("[numtd]").each(function(i){
		$("#usernumDiv").append("<input type='hidden' name=usernumList["+ i+"].mappedId value='"+$(this).attr("id")+"'>");
		$("#usernumDiv").append("<input type='hidden' name=usernumList["+ i+"].usernum value='"+$(this).text()+"'>");
	});
	if(!$('.li1.toggole input.icheckS').prop("checked")){
		$("#strategyRuleTable").empty();
	}
}
// 长地址合成短地址
function transLongtoShort() {
	var longUrl = $("#longUrl").val();
	if (longUrl == null || longUrl == "") {
		$.ligerDialog.warn("请输入长地址");
		return;
	}
	if(longUrl.match(reg)==null){
		$.ligerDialog.warn("请输入正确网址(比如:http://baiduaabb.com.cn)");
		return;
	}
	
	
		$.ajax({
		url : "../activity/longtoshort",
		data : {
			"longUrl" : longUrl
		},
		success : function(data) {
			if (data.status == "200") {
				$("#shortUrl").val(data.urlShort);
			} else {
				$("#shortUrl").val("");
				$.ligerDialog.warn("您输入的地址无效(比如:http://baiduaabb.com.cn)");
			}
		}
	});


}

// 集团短信长地址合成短地址
function transLongtoShortZB() {
	var longUrl = $("#longUrlZB").val();
	if (longUrl == null || longUrl == "") {
		$.ligerDialog.warn("请输入长地址");
		return;
	}
	if(longUrl.match(reg)==null){
		$.ligerDialog.warn("请输入正确网址(比如:http://baiduaabb.com.cn)");
		return;
	}
	
	
		$.ajax({
		url : "../activity/longtoshort",
		data : {
			"longUrl" : longUrl
		},
		success : function(data) {
			if (data.status == "200") {
				$("#shortUrlZB").val(data.urlShort);
			} else {
				$("#shortUrlZB").val("");
				$.ligerDialog.warn("您输入的地址无效(比如:http://baiduaabb.com.cn)");
			}
		}
	});


}

//选中的渠道
function getSelectChannelId(){
	 var channelId; 
	 var flag=1;
	 var name=document.getElementsByName("channel");
	 for(var i=0;i<name.length;i++){
		  if(name[i].checked){
			   if(flag==1){
				   channelId=name[i].value;
				   flag=2;
			   }else{
				   channelId+=','+name[i].value;
			   }
		  }
	 }
	 if(channelId==null){
		
		 return false;
	 }else{
		 $("#channelcheck").val(channelId);
		 return true;
	 }
   
}

/**
 * 增加一行规则
 */
function addStrategyRule(){
	if(jQuery("#strategyRuleTable tbody tr[id!=defaultStrategyRule]:last").find("input[condition]").val()==""){
		$.ligerDialog.warn("请先把规则填写完整再增加新的规则")
		return;
	}
	
	var obj = jQuery("tr[id=defaultStrategyRule]").clone();
	obj.attr("id","");
	jQuery("#strategyRuleTable").append(obj);
	strategyRuleNum();
	obj.show();
}
/**
 * 筛选条件选择
 * @param obj
 */
function chooseRuleCondition(obj,channelType) {
	/*var condition = jQuery(obj).parent().find(":text").val();
	if(typeof(condition) == undefined) condition = "";*/
	var condition = jQuery(obj).parent().find(":hidden[sqlCondition]").val();
	if(typeof(condition) == undefined) condition = "";
	conditionObj.taskCond(condition, "2","", function(sql, resume,conditions) {
		jQuery(obj).parent().find(":hidden[sql]").val(sql);
		jQuery(obj).parent().find(":text").val(resume);
		jQuery(obj).parent().find(":hidden[sqlCondition]").val(conditions);
		if($("#userGroupId").val() != ""){
			var frontFilterConditionSql="";
			if(channelType=="5"){
				frontFilterConditionSql = $(":input[name='po.frontlineChannelPo.filterConditionSql']").val();
			}else if(channelType=="8"){
				frontFilterConditionSql = $(":input[name='channelBusiness.filterConditionSql']").val();
			}			
			if(frontFilterConditionSql == undefined){
				frontFilterConditionSql = "";
			}
			ruleNumberChange(obj,frontFilterConditionSql);
		}
		
	});
	//ruleNumberChange(obj);	
}

/*function ruleNumberChange(obj){
	//刷新用户数
	var frontFilterConditionSql = $(":input[name='po.frontlineChannelPo.filterConditionSql']").val();
	if(typeof(frontFilterConditionSql) == undefined){
		frontFilterConditionSql = "";
	}
	var choices="";
	jQuery(obj).parent().parent().parent().find("tr").each(function(){
		var target = jQuery(this).children()[3];
		var targetVal = jQuery(target).find("[sql]").val();
		if(targetVal != null && typeof(targetVal) != undefined){
			choices = choices + targetVal + ",";
		}
	});
	if(choices != ''){
		choices = choices.substring(0,choices.length-1);
	}
	var resultList = getUserGroupNumberByRuleChoices($("#userGroupId").val(),
			choices,frontFilterConditionSql);
	jQuery(obj).parent().parent().parent().children().each(function(){
		var obb = jQuery(this);
		var ord = obb.find("[ord]");
		if(resultList != null){
			$.each(resultList,function(i,result){
				if(result.flag == ord.val()){
					obb.find("[numtd]").html(result.CN);
					return false;
				}
				obb.find("[numtd]").html("0");
			});
		}else{
			obb.find("[numtd]").html("系统请求错误，请联系管理员进行解决");
		}
	});
	
}*/

function ruleNumberChange(obj,frontFilterConditionSql){
	//刷新用户数
	
	var choices="";
	jQuery(obj).parent().parent().parent().find("tr").each(function(){
		var target = jQuery(this).children()[3];
		var targetVal = jQuery(target).find("[sql]").val();
		if(targetVal != null && typeof(targetVal) != undefined){
			choices = choices + targetVal + ";";
		}
	});
	if(choices != ''){
		choices = choices.substring(0,choices.length-1);
	}
	var allTr = jQuery(obj).parent().parent().parent().children();
	getUserGroupNumberByRuleChoices($("#orgPath").val(),$("#userGroupId").val(),
			choices,frontFilterConditionSql,function(){
		$(allTr).each(function(){
			jQuery(this).find("[numtd]").html("规则数加载中...");
		});
	},function(val){
		$(allTr).each(function(){
			var obb = jQuery(this);
			var ord = obb.find("[ord]");
			if(val != null){
				if(val == ""){
					obb.find("[numtd]").html("0");
					return;
				}
				$.each(val,function(i,result){
					if(result.flag == ord.val()){
						obb.find("[numtd]").html(result.CN);
						return false;
					}
					obb.find("[numtd]").html("0");
				});
			}else{
				obb.find("[numtd]").html("系统请求错误，请联系管理员进行解决");
			}
		});
	});
	
}
/**
 * 删除一行规则
 * @param obj
 */
function deleteStrategyRule(obj){
	jQuery(obj).parent().parent().remove();
	strategyRuleNum();
	if($("#userGroupId").val() != "")
		outerUseRefresh();//规则列表刷新
}
/**
 * 在dom节点之外调用规则列表刷新
 */
function outerUseRefresh(){
	obj = $(":input[name='po.frontlineChannelPo.channelSpecialFilterList[0].filterName'][rulename]");
	var frontFilterConditionSql = $(":input[name='po.frontlineChannelPo.filterConditionSql']").val();
	if(frontFilterConditionSql == undefined){
		frontFilterConditionSql = "";
	}
	ruleNumberChange(obj,frontFilterConditionSql);

}
/**
 * 规则列表序号刷新
 */
function strategyRuleNum(){
	jQuery("#strategyRuleTable tbody tr[id!=defaultStrategyRule]").each(function(i){
		jQuery(this).find("td")[0].innerHTML=i;
		jQuery(this).find(":hidden[ord]").val(i);
		/*jQuery(jQuery(this).find("td")[1]).find(":input").val("规则" + i);
		jQuery(jQuery(this).find("td")[4]).find(":input").val("请填写推荐信息");*/
		jQuery(this).find("[numtd]").each(function(){
			jQuery(this).attr("id",jQuery(this).attr("id").replace(new RegExp("userGroupStrategyNum.*","gm"),"userGroupStrategyNum"+i));
		});
		jQuery(this).find(":input[name]").each(function(){
			jQuery(this).attr("name",jQuery(this).attr("name").replace(new RegExp("channelSpecialFilterList\\[.*\\]","gm"),"channelSpecialFilterList["+i+"]"));
		});
//		jQuery(this).html(jQuery(this).html().replace(new RegExp("channelSpecialFilterList\\[.*\\]","gm"),"channelSpecialFilterList["+i+"]"));
	});
}

function refreshStrategyRuleNum(){
	var sqlObj = jQuery("#strategyRuleTable tbody td[filterConditionSql] ");
/*	for(var i=0;i<sqlObj.length-1;i++){
		console.log(sqlObj.find(":hidden").val());
	}*/
}

//检查客户经理
function checkFrontlineChannelPo(){
	var marketingWords=$("textarea[name='po.frontlineChannelPo.marketingWords']").val();
	var smsWords=$("textarea[name='po.frontlineChannelPo.smsWords']").val();
	if(!checkIsNull("po.frontlineChannelPo.marketingWords","客户经理","话术","textarea")){
	  	isEnd=0;
		 return false;
	}
	if(marketingWords.length>900){
	  	isEnd=0;
	  	$.ligerDialog.warn("客户经理营销话术最长为900");
		return false;		
	}
	if($("#content4").attr("code")==1){
		if(!checkIsNull("po.frontlineChannelPo.smsWords","客户经理","短信内容","textarea")){
			  isEnd=0;
			  return false;
		}
		if(smsWords.length>240){
		  	isEnd=0;
		  	$.ligerDialog.warn("客户经理短信内容最长为240");
			return false;				 
		}
		
	}
	if($("#newrule").val().length==0){
		$.ligerDialog.warn("请至少选择一条工单下发规则");
		isEnd=0;
		return false;
	}
	channelnum=channelnum+1;
	isEnd=1;
}
//本地短信
function checkMsmChannelPo(){
	var smsContent=$("textarea[name='msmChannelPo.smsContent']").val();
	if(checkIsNull("msmChannelPo.smsContent","本地短信","发送","textarea")){
		if(smsContent.length>900){
			$.ligerDialog.warn("短信内容最长为900,请输入符合长度的内容");
			isEnd=0;
			return false;
		}
		if(!msmSendTime()){
		 	isEnd = 0;
		 	return false;
		 }	
	 	if(!sendForProduct()){
	 		isEnd = 0;
	 		return false;
	 	}
		if(!checkMarket()){
		 	isEnd = 0;
		 	return false;
		}
		channelnum=channelnum+1;
		isEnd=1;
	}else{
		isEnd=0;
		return false;}
	
}

//集团短信
function checkZongBuMsmChannelPo(){
	var smsContent=$("textarea[name='zongBuMsmChannelPo.smsContent']").val();
	if(checkIsNull("zongBuMsmChannelPo.smsContent","集团短信","发送","textarea")){
		if(smsContent.length>900){
			$.ligerDialog.warn("集团短信内容最长为900,请输入符合长度的内容");
			isEnd=0;
			return false;
		}
		if(!msmSendTimeZB()){
		 	isEnd = 0;
		 	return false;
		 }	
		channelnum=channelnum+1;
		isEnd=1;
	}else{
		isEnd=0;
		return false;}
	
}

//电话渠道
function checkTeleChannelPo(){
	var teleContent=$("textarea[name='channelTelePhone.telephoneHuashuContent']").val();
	if(checkIsNull("channelTelePhone.telephoneHuashuContent","电话渠道","话术","textarea")){
		if(teleContent.length>900){
			$.ligerDialog.warn("电话渠道话术内容最长为900,请输入符合长度的内容");
			isEnd=0;
			return false;
		}
		if($("#companyId").val()==""||$("#companyId").val()==null){
			$.ligerDialog.warn("请至少选择一个电话渠道外呼渠道！");
			isEnd = 0;
		 	return false;
		};
		var cityarray = $("#orgCityNames").val().split("!");
		for(var i=0;i<cityarray.length;i++){
			if(cityarray[i].indexOf("\/") == -1){
				$.ligerDialog.warn("选择外呼渠道后必须选择该渠道下的外呼公司！");
				isEnd = 0;
			 	return false;
			}
		}
		channelnum=channelnum+1;
		isEnd=1;
	}else{
		isEnd=0;
		return false;}
	
}
//校验短信营销类型
function checkMarket(){
	var marketingType = $("#smsMarketingType option:selected").val();
   	if(marketingType==""||marketingType==null){
   		$.ligerDialog.warn("请选择短信渠道营销类型！");
   		return false; 
   	}else{
   		return true;
   	}
 }
 
 //校验集团短信营销类型
/*function checkMarketZB(){
	var marketingType = $("#smsMarketingTypeZB option:selected").val();
   	if(marketingType==""||marketingType==null){
   		$.ligerDialog.warn("请选择集团短信渠道营销类型！");
   		return false; 
   	}else{
   		return true;
   	}
 }*/
 
//微信
function checkWebChatinfo(){
	var channelWebchatTitle=$("input[name='channelWebchatInfo.channelWebchatTitle']").val();
	var channelWebchatUrl=$("input[name='channelWebchatInfo.channelWebchatUrl']").val();
	var channelWebchatContent=$("textarea[name='channelWebchatInfo.channelWebchatContent']").val();
	if(checkIsNull("channelWebchatInfo.channelWebchatContent","微信","话术","textarea")){
		if(channelWebchatTitle.length>90){
			$.ligerDialog.warn("微信的标题最长为90");
			isEnd=0;
			return false;			
		}
		//网址校验
		if(channelWebchatUrl!=null && channelWebchatUrl !=""){
			if(channelWebchatUrl.match(reg)==null){
				$.ligerDialog.warn("请填写有效的微信网址");
				isEnd=0;
				return false;				
			}
		}
		if(channelWebchatContent.length>900){
			$.ligerDialog.warn("微信的内容最长为900");
			isEnd=0;
			return false;			
		}
		channelnum=channelnum+1;
		isEnd=1;
	}else{
		isEnd=0;
		return false;}
	
}

//手厅
function checkHandOffice(){
	 var content=$("textarea[name='channelHandOfficePo.content']").val();
	 var title=$("input[name='channelHandOfficePo.title']").val();
	 var url=$("input[name='channelHandOfficePo.url']").val();
	 if(checkIsNull("channelHandOfficePo.content","手厅","话术","textarea")&&
	 checkIsNull("channelHandOfficePo.title","手厅","标题","input")&&
	 checkIsNull("channelHandOfficePo.url","手厅","网址","input")){
	     if(content.length>900){
	    	$.ligerDialog.warn("手厅话术内容最长为900"); 
			isEnd=0; 
			return false;
	     }
	     if(title.length>90){
		    $.ligerDialog.warn("手厅话术标题最长为90"); 
			isEnd=0; 
			return false;
		  }	 
	      if(url.match(reg)==null){
			    $.ligerDialog.warn("请填写有效的手厅网址"); 
				isEnd=0; 
				return false;	    	  
	      }
	     channelnum=channelnum+1;
		 isEnd=1;
	 }else{
		 isEnd=0; 
		 return false;}
}
//网厅
function checkWebOffice(){
	var content=$("textarea[name='wangting.content']").val();
	var title=$("input[name='wangting.title']").val();
	var url=$("input[name='wangting.url']").val();
	if(checkIsNull("wangting.content","网厅","话术","textarea")&&
	checkIsNull("wangting.title","网厅","标题","input")&&
	checkIsNull("wangting.url","网厅","网址","input")){
		if(content.length>900){
			$.ligerDialog.warn("网厅的内容最长为900");
			isEnd=0;
			return false;			
		}
		if(title.length>90){
			$.ligerDialog.warn("网厅的标题最长为90");
			isEnd=0;
			return false;			
		}
		if(url.match(reg)==null){
			$.ligerDialog.warn("请输入有效的网厅网址");
			isEnd=0;
			return false;				
		}
		channelnum=channelnum+1;
		isEnd=1;
	}else {
		isEnd=0;
		return false;}
}
//沃视窗
function checkWowindowinfo(){
	var huashu=$("textarea[name='channelWoWindowPo.huashu']").val();
	var title=$("input[name='channelWoWindowPo.title']").val();
	var url=$("input[name='channelWoWindowPo.url']").val();
	var imgUrl=$("input[name='channelWoWindowPo.imgUrl']").val();
	if(checkIsNull("channelWoWindowPo.huashu","沃视窗","话术","textarea")&&
	checkIsNull("channelWoWindowPo.title","沃视窗","标题","input")&&
	checkIsNull("channelWoWindowPo.url","沃视窗","网址","input")&&
	checkIsNull("channelWoWindowPo.imgUrl","沃视窗","图片网址","input")){
		if(huashu.length>900){
			$.ligerDialog.warn("沃视窗话术内容最长为900");
			isEnd=0;
			return false;	
		}
		if(title.length>90){
			$.ligerDialog.warn("沃视窗标题最长为90");
			isEnd=0;
			return false;	
		}
		if(url.match(reg)==null){
			$.ligerDialog.warn("请填写有效的沃视窗网址");
			isEnd=0;
			return false;			
		}
		if(imgUrl.match(regImgUrl)==null){
			$.ligerDialog.warn("请填写有效的沃视窗图片网址");
			isEnd=0;
			return false;			
		}
		
		channelnum=channelnum+1;
		isEnd=1;
	}else{
		isEnd=0;
		return false;}
	
}
//渠道校验方法
function controllSelect(){
	 channelnum=0;
	 isEnd=0;
	 var allChannelNum=0;//所选的渠道数量
	 var name=document.getElementsByName("channel");
	 for(var i=0;i<name.length;i++){
		 if(name[i].checked){
			 allChannelNum+=1; 
		 }
	}
	 outer:for(var i=0;i<name.length;i++){
		 if(name[i].checked){
			  switch(name[i].value)
			  {
			  case '5':
			   checkFrontlineChannelPo(); //校验客户经理渠道
			    if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    }
			  case '11':
				checkWebChatinfo();//校验微信渠道
			    if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    }
			  case '9':
				checkWowindowinfo();//校验沃视窗
			    if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    }
			  case '1':
			  checkHandOffice();//校验手厅
				 if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    }
			  case '2':
				checkWebOffice(); //校验网厅
			    if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    }
			  case '8':
			 checkGroupPopup();//检查弹窗
			    if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    }
			  case '7':
		      checkMsmChannelPo();
			    if(isEnd==0){
			    	 break outer;
			    }else{
			    	 break;
			    } 
			  case '12':
			      checkTeleChannelPo();
				    if(isEnd==0){
				    	 break outer;
				    }else{
				    	 break;
				    }
				    case '3':
			      checkZongBuMsmChannelPo();//检查集团短信
				    if(isEnd==0){
				    	 break outer;
				    }else{
				    	 break;
				    }
			  }
		  }
	 }
	 if(channelnum==allChannelNum){
		  return true;
	 }else{
		 if(isEnd==1){
			 $.ligerDialog.warn("你有已勾选但未填写的渠道,请填写或取消勾选");
			 return false;
		 }
		 return false;}
}


function checkIsNull(value,name,content,type){
	var needtocheck=type+"[name="+"'"+value+"'"+"]";
	if($(needtocheck).val()==null||$(needtocheck).val()==''){
		$.ligerDialog.warn("请填写"+name+"渠道"+content+"内容");
		return false;
	}else{
		return true;
	}
}

/**
 * 话术变量插入fun
 * p：插入内容
 * obj：this
 */
function addVarInit(p,obj) {
	//得到文本框对象
	var text = jQuery(obj).parent().parent().parent().parent().find("textarea").get(0)
	text.focus();
    var cursurPosition=-1;
    var content =text.value;
    if(text.selectionStart||text.selectionStart == '0'){//非IE浏览器
        cursurPosition= text.selectionStart;
        text.value=content.substr(0,cursurPosition) + p+content.substr(cursurPosition);
        text.setSelectionRange(cursurPosition+p.length,cursurPosition+p.length);
        text.focus();
    }else{//IE
    	var range=document.selection.createRange();
    	range.text = p; 
    	range.select();
    }
}
function isHQActivity(){
	var abc=$("input[name='classLevel']").val();
	if($("input[name='classLevel']").val()=="1"){
		$("#relatedActivity").html("");
		$("#relatedActivity").addClass("hide");
	}else{
		$("#underActivity").html("");
		$("#underrActivity").addClass("hide");
	}
}

/**
 * 切换select框时后面select框更改
 * @param id : 前面select框的id
 */
function initFunction(id){
	            var m=0;
	            var k=0;
				var ruleTypeId=$("#"+id).val();
				var firstVal = "firstVal"+id.substring(7,id.length);
				var lastVal = "lastVal"+id.substring(7,id.length);
				var ruleTypeVal=$("#"+id).parent().next().next().children().val();
				var ruleTypeName=$("#"+ruleTypeVal).html();
				var behindId = $("#"+id).parent().next().next().children().attr("id");
				var expand;
				if(ruleTypeVal!=""&&ruleTypeVal!=null){
					$("select[id^='classid']").each(function(){
						if($(this).val()==$("#"+firstVal).val()){
							$(this).parent().next().next().children().append("<option id='"+ruleTypeVal+"' value='"+ruleTypeVal+"'>"+ruleTypeName+"</option>");
						}
					});
				}	
				$.ajax({
					url : "../channelrule/queryRuleType",
					type: "POST",
					async : false,
					data:{ "classificationId":ruleTypeId },
					success : function(data){
						if(data.success){
							var ruleType=data.bo.getRuleType;
							$("#"+id).parent().next().next().children().html("");
							$("#"+id).parent().next().next().children().append("<option value=''>请选择..</option>");
							if(ruleType!=null&&ruleType!=""&&ruleTypeId!=""&&ruleTypeId!=null){
								for(var j=0;j<ruleType.length;j++){
									/*if(m>2&&ruleType[j].expand=="1"){
										if(ruleType[j].expand=="1"){
											if($("#saveSpecialOption").find("option[lev='1']").val()==undefined){
												$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
												$("#saveFrontId").val($("#"+id).val());
												//$("#saveSpecialOption").append("<input type='hidden' id='saveFrontId' value='"+$("#"+id).val()+"'/>")
											}
										}
									}else{
										$("#"+id).parent().next().next().children().append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
									}
									if(m=="2"&&ruleType[j].expand=="1"&&$("#saveSpecialOption").find("option[lev='1']").val()==undefined){							
										$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
										$("#saveFrontId").val($("#"+id).val());
										//$("#saveSpecialOption").append("<input type='hidden' id='saveFrontId' value='"+$("#"+id).val()+"'/>")
									}*/
									$("#"+id).parent().next().next().children().append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");								   
									if(ruleType[j].expand=="1"&&$("#saveSpecialOption").find("option[lev='1']").val()==undefined){
						                    $("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
						                    $("#saveFrontId").val($("#"+id).val());
					                }
									if(ruleType[j].expand=="3"){		
										if($("#saveSpecialOption").find("option[lev='3']").val()==undefined){
											$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
											$("#saveFrontId").val($("#"+id).val());
										}else{
											var p=0;
											$("#saveSpecialOption").find("option[lev='3']").each(function(){
												if(ruleType[j].ruleTypeId!=$(this).val()){
													p++;
												}
											});
											if(p==$("#saveSpecialOption").find("option[lev='3']").length){
												$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
												$("#saveFrontId").val($("#"+id).val());
											}
										}
									}
								}
							}
							
						}
					}
				});
				handleRule("change",behindId);
				changeType(id);
				$("#"+firstVal).val(ruleTypeId);
				$("#"+lastVal).val("");
				showAndHideMagList(behindId,"front");
				isHideRuleButton(id,"change");			
	}



/**
 * 修改时工单下发规则回显
 */
function showRuleList(){
	var m=0;
	$("#savelastValue").html("");
	$("select[id^='classid']").each(function(){
		if($(this).val()!=""&&$(this).val()!=null){
			var lastVal= "lastVal"+m;
			var firstVal= "firstVal"+m;
			var classificationId= $(this).val();
			var ruleTypeId = $(this).parent().next().next().children();
			var ruleTypeVal = $(this).parent().next().next().children().val();
			$.ajax({
				url : "../channelrule/queryRuleType",
				type: "POST",
				async : false,
				data:{ "classificationId":classificationId },
				success : function(data){
					if(data.success){
						var ruleType=data.bo.getRuleType;
						ruleTypeId.html("");
						ruleTypeId.append("<option value=''>请选择..</option>");
						if(ruleType!=null&&ruleType!=""){
							for(var j=0;j<ruleType.length;j++){
								/*if(m>2&&ruleType[j].expand=="1"){
									if(ruleType[j].expand=="1"){
										if($("#saveSpecialOption").find("option[lev='1']").val()==undefined){
											$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
											$("#saveFrontId").val(classificationId);
										}
									}																		
								}else{
									ruleTypeId.append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"' "+(ruleType[j].ruleTypeId==ruleTypeVal?'selected':'')+">"+ruleType[j].ruleTypeName+"</option>");
								}
								if(m=="2"&&ruleType[j].expand=="1"&&$("#saveSpecialOption").find("option[lev='1']").val()==undefined){							
									$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
									$("#saveFrontId").val(classificationId);
								}*/
								ruleTypeId.append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"' "+(ruleType[j].ruleTypeId==ruleTypeVal?'selected':'')+">"+ruleType[j].ruleTypeName+"</option>");
								if(ruleType[j].expand=="1"&&$("#saveSpecialOption").find("option[lev='1']").val()==undefined){
					                    $("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
					                    $("#saveFrontId").val(classificationId);
				                }
								if(ruleType[j].expand=="3"){		
									if($("#saveSpecialOption").find("option[lev='3']").val()==undefined){
										$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
										$("#saveFrontId").val(classificationId);
									}else{
										var p=0;
										$("#saveSpecialOption").find("option[lev='3']").each(function(){
											if(ruleType[j].ruleTypeId!=$(this).val()){
												p++;
											}
										});
										if(p==$("#saveSpecialOption").find("option[lev='3']").length){
											$("#saveSpecialOption").append("<option id='"+ruleType[j].ruleTypeId+"' lev='"+ruleType[j].expand+"' value='"+ruleType[j].ruleTypeId+"'>"+ruleType[j].ruleTypeName+"</option>");
											$("#saveFrontId").val(classificationId);
										}
									}
								}
								
							}
							ruleTypeId.val(ruleTypeVal);
							$("#savelastValue").append("<input type='hidden' id='"+lastVal+"'  value='"+ruleTypeVal+"'/>");
							$("#savelastValue").append("<input type='hidden' id='"+firstVal+"' value='"+classificationId+"'/>");
							m++;
							if($("option[id='"+ruleTypeVal+"']").attr("lev")=="1"){
								if($("input[name='classLevel']").val()!="1"){﻿
									ruleTypeId.parent().next().addClass("hide");
								    ruleTypeId.parent().next().find("input").each(function(){
									   //$(this).attr("disabled",true);
								       $(this).val("");
									});
								}
								var sellingArea=$("input[name='po.frontlineChannelPo.sellingArea']").val();
								var op=document.getElementById("fSpecialChannel");
								var op1=document.getElementById("sSpecialChannel");
								ruleTypeId.parent().parent().parent().parent().after(op1);
								ruleTypeId.parent().parent().parent().parent().after(op);
								$("#fSpecialChannel").removeClass("hide");
								$("#sSpecialChannel").removeClass("hide");
								maglist.options.page = 1;
							    maglist.options.parms = {
								"chooseChannel"   : sellingArea,
								"isChooseChannel" : "1"
							    };
								maglist.reload(1);
							}
							handleRule("change",ruleTypeId.attr("id"));
						}
						
					}
				}
			});
		}

	});
	removeType();
	//isHideRuleButton("","change");
}

function isShowOrg(){
	if($("input[name='classLevel']").val()=="1"||$("input[name='isLastStage']").val()=="1"){
		$("li[id^='liorg']").each(function(){
			$(this).html("");
		})
	}
	
}
/**
 * 切换后面的select框时的操作
 * @param id : 后面select框的id
 */
function removeRepect(id,tmp){
	var hiddenId="lastVal"+id.substring(15,id.length);
	var hiddenLev = $("option[id='"+$("#"+hiddenId).val()+"']").attr("lev");
	var hiddenName="";
	if($("#"+hiddenId).val()!=""&&$("#"+hiddenId).val()!=null){
		hiddenName=$("#"+$("#"+hiddenId).val()).html();
	}
	var addId="";
	var replace=$("#"+id).parent().prev().prev().children();
	var p=0;
	var classId=replace.attr("id");
	var classificationId=replace.val();
	$("select[id^='classid']").each(function(){
		var replace1=$(this).parent().next().next().children();
		if($(this).val()==classificationId&&replace1.attr("id")!=id){			
			replace1.find("option[id='"+$("#"+id).val()+"']").remove();
			if($("#"+hiddenId).val()!=""&&$("#"+hiddenId).val()!=null&&$("option[id='"+$("#"+hiddenId).val()+"']").attr("lev")!="3"){
				replace1.append("<option id='"+$("#"+hiddenId).val()+"' lev='"+hiddenLev+"' value='"+$("#"+hiddenId).val()+"'>"+hiddenName+"</option");
			}
			p++;
		}
	});
	$("#"+hiddenId).val($("#"+id).val());
	showAndHideMagList(id,"behind");
	isHideRuleButton(classId,tmp);	
}

function changeType(id){
	var classId=$("#"+id).val();
    var replace=$("#"+id).parent().next().next().children();
    $("select[id^='classid']").each(function(){
    	var replace1=$(this).parent().next().next().children();
        if($(this).val()==classId&&$(this).val()!=""&&$(this).val()!=null&&replace1.val()!=""&&replace1.val()!=null){
            replace.find("option[id='"+replace1.val()+"']").remove();   	
        }
    });
}

/*function changeOption(id){
	var replace=$("#"+id).parent().parent().prev().prev().children();
	var p=0;
	var classificationId=replace.val();
	var replaceName=$("#"+classificationId).html();
	var replaceId=$("#"+classificationId).val();
	$("select[id^='classid']").each(function(){
		var replace1=$(this).parent().next().next().children();
		if($(this).val()==classificationId&&replace1.attr("id")!=$("#"+id).parent().val()){			
			//replace1.find("option[id='"+$("#"+id).val()+"']").remove();
			replace1.append("<option id='"+replaceId+"' value='"+replaceId+"'>"+replaceName+"</option");
			p++;
		}
	});
}*/

function removeType(){
	$("select[id^='orderIssuedRule']").each(function(){
		if($(this).val()!=""&&$(this).val()!=null){
			var selectId=$(this);
			var selectVal=$(this).val();
			var lev = $(this).find("option[id='"+selectVal+"']").attr("lev");
			var optionName=$("#"+$(this).val()).html();
			$("input[id^='lastVal']").each(function(){
				selectId.find("option[id='"+$(this).val()+"']").remove();		
			});
			selectId.append("<option id='"+selectVal+"' lev='"+lev+"' value='"+selectVal+"'selected>"+optionName+"</option");
			//selectId.val(selectVal);
		}	
	});
	
}

function isHideRuleButton(ids,tmp){
	var behindId=$("#"+ids).parent().next().next().children().attr("id");
	var m="";
    $("select[id^=classid]").each(function(){
		var id=$(this).attr("id");
		if(m==""){
		   m = id.substring(7,id.length);
		}else{
		   m = m+","+id.substring(7,id.length);
		}
	});
    m = m.substring(m.length-1,m.length);
    if(tmp=="change"){
    	 if($("option[id='"+$("#orderIssuedRule"+m).val()+"']").attr("lev")=="3"){
    	    	$("#addRule1").attr("disabled",true);
    	    	$("#addRule").attr("disabled",true);
    	    }else{
    	        $("#addRule1").attr("disabled",false);
    	    	$("#addRule").attr("disabled",false);	
    	    }
    }else if(tmp=="del"){
    	if($("option[id='"+$("#"+behindId).val()+"']").attr("lev")=="3"){
    		$("#addRule1").attr("disabled",false);
	    	$("#addRule").attr("disabled",false);
    	}
    }    
}

/*function showAndHideMagList(){
	var specialId = $("#saveSpecialOption").find("option[lev='1']").val();
	if(specialId!=null&&specialId!=""){
	if($("select[id='orderIssuedRule0']").val()==specialId){
		if($("input[name='classLevel']").val()!="1"){﻿
			$("#orderIssuedRule0").parent().next().addClass("hide");
		    $("#orderIssuedRule0").parent().next().find("input").each(function(){
			   //$(this).attr("disabled",true);
		       $(this).val("");
			});
		}		
		$("#addRule1").attr("disabled",true);
		$("#addRule").attr("disabled",true);
		$("#fSpecialChannel").removeClass("hide");
		$("#sSpecialChannel").removeClass("hide");
		maglist.reload(1);
		if($("#bryantListChecked").val()!=""&&$("#bryantListChecked").val()!=null){
			$("input[name='po.frontlineChannelPo.sellingArea']").val($("#bryantListChecked").val());
		}else{
			$("input[name='po.frontlineChannelPo.sellingArea']").val($("#sDiv").contents().find("input[id='orderOrgId']").val());
		}
		//$("input[name='po.frontlineChannelPo.sellingArea']").val("");
		//$("#isShowOrder").val("1");
	}else{
		if($("input[name='classLevel']").val()!="1"){﻿
			$("#orderIssuedRule0").parent().next().removeClass("hide");
		}
		$("#addRule1").attr("disabled",false);
		$("#addRule").attr("disabled",false);
		$("#fSpecialChannel").addClass("hide");
		$("#sSpecialChannel").addClass("hide");
		$("input[name='po.frontlineChannelPo.sellingArea']").val("");
		//$("#isShowOrder").val("0");
	}		
	}	
}*/

function showAndHideMagList(id,position){
  if($("#fSpecialChannel").attr("class")!="hide"&&$("#sfSpecialChannel").attr("class")!="hide"){
	 var behindId = $("#fSpecialChannel").prev().find("select[name='IssuedRule']").attr("id");
	 if(behindId==id){
		hideMaglist(id);
	 }
  }else{
	  if($("#saveSpecialOption").find("option").length>0){
		  var lev = $("option[id='"+$("#"+id).val()+"']").attr("lev");
	   		if (lev == "1"){
	   			showMagList(id);
	   		}
	  }
  }
  /* if(position=="front"){
	   hideMaglist(id); 
   }else if(position=="behind"){
	   if($("#saveSpecialOption").find("option").length>0){
	   		var lev = $("option[id='"+$("#"+id).val()+"']").attr("lev");
	   		if (lev == "1"){
	   			showMagList(id);
	   		}else{
	   			if($("#fSpecialChannel").attr("class")!="hide"&&$("#sfSpecialChannel").attr("class")!="hide"){
		   			hideMaglist(id);
	   			}
	   		}
	   } 	 
   }*/
	  
}

function showMagList(id){
	$("input[name='po.frontlineChannelPo.sellingArea']").val("");
	if($("input[name='classLevel']").val()!="1"){﻿
		$("#"+id).parent().next().addClass("hide");
	    $("#"+id).parent().next().find("input").each(function(){
		   //$(this).attr("disabled",true);
	       $(this).val("");
		});
	}		
	var op=document.getElementById("fSpecialChannel");
	var op1=document.getElementById("sSpecialChannel");
    $("#"+id).parent().parent().parent().parent().after(op1);
    $("#"+id).parent().parent().parent().parent().after(op);
	$("#fSpecialChannel").removeClass("hide");
	$("#sSpecialChannel").removeClass("hide");	
	    maglist.options.page = 1;
	    maglist.options.parms = {
		"chooseChannel"   : "",
		"isChooseChannel" : "1"
	    };
		maglist.reload(1);
		/*if($("#bryantListChecked").val()!=""&&$("#bryantListChecked").val()!=null){
			$("input[name='po.frontlineChannelPo.sellingArea']").val($("#bryantListChecked").val());
		}else{
			$("input[name='po.frontlineChannelPo.sellingArea']").val($("#sDiv").contents().find("input[id='orderOrgId']").val());
		}*/
}

function hideMaglist(id){
	if($("input[name='classLevel']").val()!="1"){﻿
		$("#"+id).parent().next().removeClass("hide");
	}
	$("#fSpecialChannel").addClass("hide");
	$("#sSpecialChannel").addClass("hide");
	$("input[name='po.frontlineChannelPo.sellingArea']").val("");
}

var maglist;
function managerList(){
	maglist = $("#maglist").ligerGrid(
		{
		
		columns : [
			{ display : '<td style="text-align:left;padding:0 0">地市</td>',name : 'city',align : 'left',width:'20%',
	        	render:function(rowdata,index,value){	        		
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='"+rowdata.city+"'>" +rowdata.city+ "</div>";
	        		}	
			},
			{ display : '<td style="text-align:left;padding:0 0">区县</td>',name : 'orgLevel',align : 'center',width:'20%'},
			{ display : '上级机构',name : 'highOrg',align : 'left',width:'30%',
				render:function(rowdata,index,value){					
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.highOrg+"'>" +rowdata.highOrg+ "</div>";						}
			},
			{ display : '<td style="text-align:left;padding:0 0">渠道名称</td>',name : 'channel',align : 'left',width:'30%',
				render:function(rowdata,index,value){
					return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.channel+"'>" +rowdata.channel+ "</div>";
				}
			},
			{name : 'id',hide : 'hide'}
],
			isScroll : true,
			url : '../activity/maglist',
			parms:{
				"isChooseChannel" : "1"
			},
			checkbox : true,
			//isSingleCheck :true,
			onSelectRow: function(rowdata, rowindex, rowDomElement){
				//console.log(rowdata.id);
			},
			pageSize:5,
			rownumbers : false,
			usePager : true,
			fixedCellHeight:false,
			enabledSort:false,
			width:600
		});
		/*if($("input[name='po.frontlineChannelPo.sellingArea']").val()!=""&&$("input[name='po.frontlineChannelPo.sellingArea']").val()!=null){
			
			if($("input[name='classLevel']").val()!="1"){﻿
				$("#orderIssuedRule0").parent().next().addClass("hide");
			}
			$("#fSpecialChannel").removeClass("hide");
			$("#sSpecialChannel").removeClass("hide");
			maglist.options.page = 1;
			maglist.options.parms = {
				"chooseChannel" : $("input[name='po.frontlineChannelPo.sellingArea']").val(),
				"isChooseChannel" : "1"
			};
			maglist.reload(1);
		}*/
}


var bryant;
function showOrgList(p){
	if($("input[name='po.orgPath']").val()!=null&&$("input[name='po.orgPath']").val()!=""){
		$(p).attr("data-toggle","modal");
		$(p).attr("data-target","#guizeModal");
		var removeSellingArea = $("input[name='po.frontlineChannelPo.sellingArea']").val();
		var reserve1 = $("#channelClassification").val().trim();
		var sellingPath = $("input[name='po.orgPath']").val();
		if(removeSellingArea==""||removeSellingArea==null){
			removeSellingArea = "";
		}
		bryant = $("#businessHall").ligerGrid(
				{
					columns : [
								{ display : '<td style="text-align:left">地市</td>',name : 'city',align : 'left',width:'20%',
						        	render:function(rowdata,index,value){	        		
										return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:center;' title='"+rowdata.city+"'>" +rowdata.city+ "</div>";
						        		}	
								},
								{ display : '<td style="text-align:left">区县</td>',name : 'orgLevel',align : 'center',width:'20%'},
								{ display : '上级机构',name : 'highOrg',align : 'left',width:'30%',
									render:function(rowdata,index,value){					
										return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.highOrg+"'>" +rowdata.highOrg+ "</div>";						}
								},
								{ display : '渠道名称',name : 'channel',align : 'left',width:'30%',
									render:function(rowdata,index,value){
										return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"+rowdata.channel+"'>" +rowdata.channel+ "</div>";
									}
								},
								{name : 'id',hide : 'hide'}
					],
								isScroll : true,
								url : '../activity/maglist',
								parms:{
						   			"chooseChannel"   : removeSellingArea,
						   			"sellingPath"     : sellingPath,
						   			"reserve1"        : reserve1,
									"isChooseChannel" : "0"
								},
								checkbox : true,
								//isSingleCheck :true,
								onSelectRow: function(rowdata, rowindex, rowDomElement){
									$(".l-selected").find("td:eq(0)>div input").prop("checked",true);
								},
								
								pageSize:5,
								rownumbers : false,
								usePager : true,
								fixedCellHeight:false,
								enabledSort:false,
								width:920,
							
				});
		//showData();
		//document.getElementById("sDiv").contentWindow.changeOrg;
	    document.getElementById("sDiv").contentWindow.changeOrg();
	
	}else{
		$(p).attr("data-toggle","");
		$(p).attr("data-target","");
		$.ligerDialog.warn("请选择适用范围");
		return;
	}
	

};

function showData(){
	var removeSellingArea = $("input[name='po.frontlineChannelPo.sellingArea']").val();
	var sellingPath = $("input[name='po.orgPath']").val();
	var isChooseChannel = "0";
	if(sellingPath == null||sellingPath ==""){
		sellingPath = "";
		var isChooseChannel = "1";
	}else{
		sellingPath = sellingPath.substring(0,sellingPath.length-1);
	}
    if(removeSellingArea!=""&&removeSellingArea!=null){
   	 bryant.options.page = 1;
   	 bryant.options.parms = {
   			"chooseChannel" : removeSellingArea,
   			"sellingPath"   : sellingPath,
   			"isChooseChannel"   : isChooseChannel
   		};
   	 bryant.reload(1);
    }else{
    	bryant.options.page = 1;
      	bryant.options.parms = {
      			"sellingPath"   : sellingPath,
      			"isChooseChannel"   : isChooseChannel
      		};
      	 bryant.reload(1);
    }
}

/*function loadData(){
	maglist.reload(1);
}*/

function refreshMainList(){
	$('#guizeModal').modal({backdrop: 'static', keyboard: false});
	var inputIds = $("input[name='po.frontlineChannelPo.sellingArea']").val();
	if($("#schange").attr("class")=="hide"){
		if (inputIds != ""&&inputIds!=null) {
			inputIds = inputIds + "," + $("#sDiv").contents().find("input[id='orderOrgId']").val();
			var idsSplit = inputIds.split(",");
			 for(var i=0,o={},tmp=[],count=0;i<idsSplit.length;i++){
	                if(o[idsSplit[i]]){
	                        count++;
	                }else{
	                        o[idsSplit[i]]=1;
	                        tmp.push(idsSplit[i]);
	                }
	        }
			inputIds = "";
			for(var i=0;i<tmp.length;i++){
				if(inputIds ==""){
					inputIds = tmp[i];
				}else{
					inputIds = inputIds + ","+tmp[i];
				}
			}
		} else {
			inputIds = $("#sDiv").contents().find("input[id='orderOrgId']").val();
		}
		maglist.options.page = 1;
		maglist.options.parms = {
			"chooseChannel" : inputIds,
			"isChooseChannel" : "1"
		};
		maglist.reload(1);
	}else if($("#fchange").attr("class")=="hide"){
		var selectdNum = 0;
		for(var i=0;i<bryant.getSelectedRows().length;i++){
			if (inputIds != ""&&inputIds!=null) {
				inputIds = inputIds + "," + bryant.getSelectedRows()[i].id;
			} else {
				inputIds = bryant.getSelectedRows()[i].id;
			}
			selectdNum++;
		}
		if(selectdNum==0){
			$.ligerDialog.warn("请选择一条记录进行增加!");
			// alert("您没有操作此活动的权限!");
			return;
		}
		maglist.options.page = 1;
		maglist.options.parms = {
			"chooseChannel" : inputIds,
			"isChooseChannel" : "1"
		};
		maglist.reload(1);
	}
	$("#close2").trigger("click");	
	$("#bryantListChecked").val(inputIds);
	$("input[name='po.frontlineChannelPo.sellingArea']").val(inputIds);
}

function changeList(){
	$("#sDiv").addClass("hide");
	$("#fDiv").removeClass("hide");
	$("#fchange").addClass("hide");
	$("#schange").removeClass("hide");
	 bryant.reload(1);
}

function changeTree(){
	$("#fDiv").addClass("hide");
	$("#sDiv").removeClass("hide");
	
	$("#schange").addClass("hide");
	$("#fchange").removeClass("hide");
}

function deleteChannel(){
    var sumChannel;
	// 获取活动选中的活动id
	var inputIds = "";
	var selectdNum = 0;
	if($("#bryantListChecked").val()!=""&&$("#bryantListChecked").val()!=null){
		sumChannel = $("#bryantListChecked").val()+",";
	}else{
		sumChannel = $("#sDiv").contents().find("input[id='orderOrgId']").val()+",";
	}
	for(var i=0;i<maglist.getSelectedRows().length;i++){
	    var str=maglist.getSelectedRows()[i].id+",";
	    sumChannel = sumChannel.replace(str,"");
		selectdNum++;
	}
	sumChannel = sumChannel.substring(0,sumChannel.length-1); 
	if($("#bryantListChecked").val()!=""&&$("#bryantListChecked").val()!=null){
		$("#bryantListChecked").val(sumChannel);
	}else{
		$("#sDiv").contents().find("input[id='orderOrgId']").val(sumChannel);
	}
	if(selectdNum==0){
		$.ligerDialog.warn("请选择一条记录进行删除!");
		return;
	}
	maglist.options.page = 1;
	maglist.options.parms = {
		"chooseChannel" : sumChannel,
		"isChooseChannel" : "1"
	};
	maglist.reload(1);
	$("input[name='po.frontlineChannelPo.sellingArea']").val(sumChannel);
}

function querySellingArea1(){
	var sellingAreaName = $("#querySellingArea").val().trim();
	var reserve1 = $("#channelClassification").val().trim();
	var sellingPath = $("input[name='po.orgPath']").val();
	var removeSellingArea = $("input[name='po.frontlineChannelPo.sellingArea']").val();
	bryant.options.page = 1;
	bryant.options.parms = {
		"sellingAreaName"   : sellingAreaName,
		"chooseChannel"     : removeSellingArea,
		"sellingPath"       : sellingPath,
		"reserve1"          : reserve1,
		"isChooseChannel"   : "0"
	};
	bryant.reload(1);
}

function customTime(e){
    /*$("#radioBox"+e).addClass("hide");
    $("#custom"+e).addClass("hide");
    $("#chooseBox"+e).removeClass("hide");
    $("#return"+e).removeClass("hide");*/
	$("td[id^='radioBox']").each(function(){
		$(this).addClass("hide");
	});
	$("td[id^='chooseBox']").each(function(){
		$(this).removeClass("hide");
	});
	$("#custom12138").addClass("hide");
	$("#return12138").removeClass("hide");
    
}


function returnTime(e){
	/*$("#radioBox"+e).removeClass("hide");
    $("#custom"+e).removeClass("hide");
    $("#chooseBox"+e).addClass("hide");
    $("#return"+e).addClass("hide");*/
	$("td[id^='radioBox']").each(function(){
		$(this).removeClass("hide");
	});
	$("td[id^='chooseBox']").each(function(){
		$(this).addClass("hide");
	});
	$("#custom12138").removeClass("hide");
	$("#return12138").addClass("hide");
}

//高级模式集团短信短信发送时段设置
function customTimeZB(e){
	$("td[id^='radioBoxZB']").each(function(){
		$(this).addClass("hide");
	});
	$("td[id^='chooseBoxZB']").each(function(){
		$(this).removeClass("hide");
	});
	$("#custom12138ZB").addClass("hide");
	$("#return12138ZB").removeClass("hide");
    
}


function returnTimeZB(e){
	$("td[id^='radioBoxZB']").each(function(){
		$(this).removeClass("hide");
	});
	$("td[id^='chooseBoxZB']").each(function(){
		$(this).addClass("hide");
	});
	$("#custom12138ZB").removeClass("hide");
	$("#return12138ZB").addClass("hide");
}


function hideOption(id,e){
	var lastNumber=id.substring(10,id.length);
	var paixu=$("option[value='"+$("#"+id).val()+"']").attr("id");
	if(e=="1"){
		var jd=$("#ftime"+lastNumber).val();
		var intJd=parseInt(jd);
		if($("#"+id).val()!=""&&$("#"+id).val()!=null){
			var f=parseInt(paixu);
			if(jd==""||intJd<f){
				for(var i=f;i>0;i--){
					$("#"+id).next().find("option[id='"+i+"']").addClass("hide");
				}
			}else{
				for(var i=intJd;i>f;i--){
					$("#"+id).next().find("option[id='"+i+"']").removeClass("hide");
				}
			}						
		}else{
			$("#"+id).next().find("option").each(function(){
				$(this).removeClass("hide");
			});
		}
		/*if($("#"+id).val()!=""&&$("#"+id).val()!=null&&
				$("#"+id).next().val()!=""&&$("#"+id).next().val()!=null){
			hideAndShowTime(id,e);
		}*/
		$("#ftime"+lastNumber).val(paixu);
	}else if(e=="2"){
		var jd=$("#ltime"+lastNumber).val();
		var intJd=parseInt(jd);
		if($("#"+id).val()!=""&&$("#"+id).val()!=null){
			var f=parseInt(paixu);
			if(jd==""||intJd>f){
				for(var i=f;i<50;i++){
					$("#"+id).prev().find("option[id='"+i+"']").addClass("hide");
				}
			}else{
				for(var i=intJd;i<f;i++){
					$("#"+id).prev().find("option[id='"+i+"']").removeClass("hide");
				}
			}
			
		}else{
			$("#"+id).prev().find("option").each(function(){
				$(this).removeClass("hide");
			});
		}		
		/*if($("#"+id).val()!=""&&$("#"+id).val()!=null&&
				$("#"+id).prev().val()!=""&&$("#"+id).prev().val()!=null){
			hideAndShowTime(id,e);
		}*/
		$("#ltime"+lastNumber).val(paixu);
	}else if(e=="3"){
		var jd=$("#ftimeZB"+lastNumber).val();
		var intJd=parseInt(jd);
		if($("#"+id).val()!=""&&$("#"+id).val()!=null){
			var f=parseInt(paixu);
			if(jd==""||intJd<f){
				for(var i=f;i>0;i--){
					$("#"+id).next().find("option[id='"+i+"']").addClass("hide");
				}
			}else{
				for(var i=intJd;i>f;i--){
					$("#"+id).next().find("option[id='"+i+"']").removeClass("hide");
				}
			}						
		}else{
			$("#"+id).next().find("option").each(function(){
				$(this).removeClass("hide");
			});
		}
		$("#ftimeZB"+lastNumber).val(paixu);
	}else if(e=="4"){
		var jd=$("#ltimeZB"+lastNumber).val();
		var intJd=parseInt(jd);
		if($("#"+id).val()!=""&&$("#"+id).val()!=null){
			var f=parseInt(paixu);
			if(jd==""||intJd>f){
				for(var i=f;i<50;i++){
					$("#"+id).prev().find("option[id='"+i+"']").addClass("hide");
				}
			}else{
				for(var i=intJd;i<f;i++){
					$("#"+id).prev().find("option[id='"+i+"']").removeClass("hide");
				}
			}
			
		}else{
			$("#"+id).prev().find("option").each(function(){
				$(this).removeClass("hide");
			});
		}		
		$("#ltimeZB"+lastNumber).val(paixu);
	}
	
}

function hideAndShowTime(id,e){
	    var lastNumber=id.substring(10,id.length);		
		if(e=="1"){
			var lev1=parseInt($("option[value='"+$("#"+id).val()+"']").attr("id"));
			var lev2=parseInt($("option[value='"+$("#"+id).next().val()+"']").attr("id"));
			for(var i=lev1;i<=lev2;i++){
					$("select[id^='frontFirst']").each(function(){
						if($(this).attr("id")!=id){
							$(this).find("option[id='"+i+"'").addClass("hide");
							$(this).next().find("option[id='"+i+"'").addClass("hide");
						}			
					});
			}
			/*for(var i=lev1;i<lev2;i++){
				$("select[id^='frontFirst']").each(function(){
					if($(this).attr("id")!=id){
						$(this).find("option[id='"+i+"'").addClass("hide");
						$(this).next().find("option[id='"+i+"'").addClass("hide");
					}			
				});
		    }*/
			var jd=$("#ftime"+lastNumber).val();
			var intJd=parseInt(jd);
			if(jd!=""&&intJd>lev1){
				 for(var i=lev1;i<intJd;i++){
					 $("select[id^='frontFirst']").each(function(){
							if($(this).attr("id")!=id){
								$(this).find("option[id='"+i+"'").removeClass("hide");
								$(this).next().find("option[id='"+i+"'").removeClass("hide");
							}			
						});
				 }
			 }
		}else if(e=="2"){
			var lev1=parseInt($("option[value='"+$("#"+id).prev().val()+"']").attr("id"));
			var lev2=parseInt($("option[value='"+$("#"+id).val()+"']").attr("id"));
			for(var i=lev1;i<lev2;i++){
					$("select[id^='frontFirst']").each(function(){
						if($(this).attr("id")!=id){
							$(this).find("option[id='"+i+"']").addClass("hide");
							$(this).next().find("option[id='"+i+"']").addClass("hide");
						}			
					});
				}
			var jd=$("#ltime"+lastNumber).val();
			var intJd=parseInt(jd);
			if(jd!=""&&intJd<lev2){
				 for(var i=lev1;i<intJd;i++){
					 $("select[id^='frontFirst']").each(function(){
							if($(this).next().attr("id")!=id){
								$(this).next().find("option[id='"+i+"']").removeClass("hide");
								$(this).next().find("option[id='"+i+"']").removeClass("hide");
							}			
						});
				 }
			 }
		}
		
		
}

function addPopRule(){
	if(jQuery("#popRuleTable tbody tr[id!=defaultPopRule]:last").find("input[condition]").val()==""){
		$.ligerDialog.warn("请先把规则填写完整再增加新的规则!");
		return;
	}	
	var obj = jQuery("tr[id=defaultPopRule]").clone();
	obj.attr("id","");
	jQuery("#popRuleTable").append(obj);
	popRuleNum();
	obj.show();
}

/**
 * 删除一行规则
 * @param obj
 */
function deletePopRule(obj){
	jQuery(obj).parent().parent().remove();
	popRuleNum();
	if($("#userGroupId").val() != "")
		outerUseRefreshPop();//规则列表刷新
}

function popRuleNum(){
	jQuery("#popRuleTable tbody tr[id!=defaultPopRule]").each(function(i){
		jQuery(this).find("td")[0].innerHTML=i;
		jQuery(this).find(":hidden[ord]").val(i);
		jQuery(this).find("[numtd]").each(function(){
			jQuery(this).attr("id",jQuery(this).attr("id").replace(new RegExp("userGroupPopNum.*","gm"),"userGroupPopNum"+i));
		});
		jQuery(this).find(":input[name]").each(function(){
			jQuery(this).attr("name",jQuery(this).attr("name").replace(new RegExp("popSpecialFilterList\\[.*\\]","gm"),"popSpecialFilterList["+i+"]"));
		});
	});
}
/**
 * 在dom节点之外调用规则列表刷新
 */
function outerUseRefreshPop(){	
	obj = $(":input[name='popSpecialFilterList[0].filterName'][rulename]");
	var frontFilterConditionSql = $(":input[name='channelBusiness.filterConditionSql']").val();
	if(frontFilterConditionSql == undefined){
		frontFilterConditionSql = "";
	}
	ruleNumberChange(obj,frontFilterConditionSql);
}
/**
 * 电话渠道扩展规则相关方法
 */
function addTeleRule(){
	if(jQuery("#teleRuleTable tbody tr[id!=defaultTeleRule]:last").find("input[condition]").val()==""){
		$.ligerDialog.warn("请先把规则填写完整再增加新的规则!");
		return;
	}	
	var obj = jQuery("tr[id=defaultTeleRule]").clone();
	obj.attr("id","");
	jQuery("#teleRuleTable").append(obj);
	teleRuleNum();
	obj.show();
}
function teleRuleNum(){
	jQuery("#teleRuleTable tbody tr[id!=defaultTeleRule]").each(function(i){
		jQuery(this).find("td")[0].innerHTML=i;
		jQuery(this).find(":hidden[ord]").val(i);
		jQuery(this).find("[numtd]").each(function(){
			jQuery(this).attr("id",jQuery(this).attr("id").replace(new RegExp("userGroupTeleNum.*","gm"),"userGroupTeleNum"+i));
		});
		jQuery(this).find(":input[name]").each(function(){
			jQuery(this).attr("name",jQuery(this).attr("name").replace(new RegExp("telchannelSpecialFilterList\\[.*\\]","gm"),"telchannelSpecialFilterList["+i+"]"));
		});
	});
}
/**
 * 删除一行规则
 * @param obj
 */
function deleteTeleRule(obj){
	jQuery(obj).parent().parent().remove();
	teleRuleNum();
	if($("#userGroupId").val() != "")
		outerUseRefreshTele();//规则列表刷新
}

//电话渠道扩展规则列表逻辑清除操作
function emptyExtral4FroTele(){
	$("#defaultTeleRule").empty();//客户经理扩展规则页面相同内容删除
	/*$("[numtd]").each(function(i){
		$("#usernumDiv").append("<input type='hidden' name=usernumList["+ i+"].mappedId value='"+$(this).attr("id")+"'>");
		$("#usernumDiv").append("<input type='hidden' name=usernumList["+ i+"].usernum value='"+$(this).text()+"'>");
	});*/
	if(!$('.li1.tel input.icheckS').prop("checked")){
		$("#teleRuleTable").empty();
	}
}

/**
 * 在dom节点之外调用规则列表刷新
 */
function outerUseRefreshTele(){	
	obj = $(":input[name='channelTelePhone.telchannelSpecialFilterList[0].filterName'][rulename]");
	var frontFilterConditionSql = $(":input[name='channelTelePhone.filterConditionSql']").val();
	if(frontFilterConditionSql == undefined){
		frontFilterConditionSql = "";
	}
	ruleNumberChange(obj,frontFilterConditionSql);
}

//弹窗扩展规则列表逻辑清除操作
function emptyExtral4FroPop(){
	$("#defaultPopRule").empty();//客户经理扩展规则页面相同内容删除
	/*$("[numtd]").each(function(i){
		$("#usernumDiv").append("<input type='hidden' name=usernumList["+ i+"].mappedId value='"+$(this).attr("id")+"'>");
		$("#usernumDiv").append("<input type='hidden' name=usernumList["+ i+"].usernum value='"+$(this).text()+"'>");
	});*/
	if(!$('.li1.pop input.icheckS').prop("checked")){
		$("#popRuleTable").empty();
	}
}


