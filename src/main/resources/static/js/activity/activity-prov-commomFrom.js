/**
 * z-tree
 * author by chengweichang 2016/11/17
 */

$(function(){
	var setting = {
			check:{
				enable:true,
				chkboxType: {"Y" : "ps", "N" : "ps"}
				//checkboxType:{"Y":"","N":""},
				//chkStyle:"radio"
			},
			view:{
				//不显示连线
				showLine: false,
				dbClickExpand:true,
				showIcon:false,
				//不允许多选
				selectedMulti: false
			},
					/*edit: {
						enable: true,
						showRemoveBtn: false,
						showRenameBtn: false,
						drag: {
							prev: false,
							next: false,
							inner: false
						}
					},*/
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
						//onClick:showviewclick
						//beforeClick: beforeClick,
						onCheck: onCheck,
						onAsyncSuccess: onAsyncSuccess,
						onAsyncError: onAsyncError
					}
	};

	$.fn.zTree.init($("#orgtree"), setting);
	messageSendReview();
	messageSendZBReview();
	expandAll();
	isNoOrgRange();
	isMonth();
	productOnchang();  //加载短信产品
	chooseOrderProduct();  //产品默认选中
	proChoose();
});
$(document).ready(function(){
	$("#orgSelect").bind("click", expandAll);
});

/**
 * 短信选择产品默认选中
 */
function chooseOrderProduct(){
	$("#orderProduct option").removeAttr("selected");
	$("#orderProduct option").each(function(){
		var prodVal = $(this).val();
		var proChoose = $("input[name='msmChannelPo.orderProductId']").val();
		if(prodVal == proChoose){
			$(this).attr("selected","selected");
		}
	})
}
/**
 * 本地短信天发送时间时间段(messageSendTime)的回显逻辑
 */
/*function messageSendReview(){
	var messageSendTime =$("input[name='msmChannelPo.messageSendTime']").val();
	if(messageSendTime != undefined){
		var messageSendTimeArray = messageSendTime.split( ",");
		var m = 0;
		for(m=0;m<messageSendTimeArray.length;m++){
			$('input[name="messageSendTime"][value="'+messageSendTimeArray[m]+'"]').iCheck("check");
		}
	}
}*/
function messageSendReview(){
	var messageSendTime =$("input[name='msmChannelPo.messageSendTime']").val();
	if(messageSendTime != undefined&&messageSendTime != ""){
		var messageSendTimeArray = messageSendTime.split( ",");
		var m = 0;
		var j=0;
		for(m=0;m<messageSendTimeArray.length;m++){
			var temp=$('input[name="messageSendTime"][value="'+messageSendTimeArray[m]+'"]');
			if(temp.val()!=undefined){
			//alert("本地"+temp.val());
				temp.iCheck("check");
				j++;
			}			
		}
		if(j!=messageSendTimeArray.length){
			for(m=0;m<messageSendTimeArray.length;m++){
				var abcd=messageSendTimeArray[m].split("-");
				$("#frontFirst"+m).find("option[value='"+abcd[0]+"']").attr("selected","selected");
				//$("#ftime"+m).val($("#frontFirst"+m).find("option[value='"+abcd[0]+"']").attr("id"));
				$("#behindLast"+m).find("option[value='"+abcd[1]+"']").attr("selected","selected");
				//$("#ltime"+m).val($("#behindLast"+m).find("option[value='"+abcd[0]+"']").attr("id"));
			}
			$("select[id^='frontFirst']").each(function(){
				hideOption($(this).attr("id"),"1");
				hideOption($(this).next().attr("id"),"2");
			})
			$("td[id^='radioBox']").each(function(){
				$(this).addClass("hide");
			});
			$("td[id^='chooseBox']").each(function(){
				$(this).removeClass("hide");
			});
			$("#custom12138").addClass("hide");
			$("#return12138").removeClass("hide");
			
		}
	}
}

/**
 * 集团短信天发送时间时间段(messageSendTime)的回显逻辑
 */

function messageSendZBReview(){
	var messageSendTime =$("input[name='zongBuMsmChannelPo.messageSendTime']").val();
	if(messageSendTime != undefined&&messageSendTime != ""){
		var messageSendTimeArray = messageSendTime.split( ",");
		var m = 0;
		var j=0;
		for(m=0;m<messageSendTimeArray.length;m++){
			var temp=$('input[name="messageSendTimeJiTuan"][value="'+messageSendTimeArray[m]+'"]');
			//alert("集团"+temp.val());
			if(temp.val()!=undefined){
				temp.iCheck("check");
				j++;
			}			
		}
		if(j!=messageSendTimeArray.length){
			for(m=0;m<messageSendTimeArray.length;m++){
				var abcd=messageSendTimeArray[m].split("-");
				$("#frontFirZB"+m).find("option[value='"+abcd[0]+"']").attr("selected","selected");
				$("#behindLaZB"+m).find("option[value='"+abcd[1]+"']").attr("selected","selected");
			}
			$("select[id^='frontFirZB']").each(function(){
				hideOption($(this).attr("id"),"3");
				hideOption($(this).next().attr("id"),"4");
			})
			$("td[id^='radioBoxZB']").each(function(){
				$(this).addClass("hide");
			});
			$("td[id^='chooseBoxZB']").each(function(){
				$(this).removeClass("hide");
			});
			$("#custom12138ZB").addClass("hide");
			$("#return12138ZB").removeClass("hide");
			
		}
	}
}

/**
 * 时间控件js
 */

function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("orgtree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}


function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("orgtree"),
	nodes = zTree.getCheckedNodes(true),
	v = "",
	pa= ""
	c = 0,
	p = "";

	//treeObj.expandAll(true);
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
	}
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	var orgObj = $("#orgSelect");
	orgObj.attr("value", v);
	if(p.length>0) p = p.substring(0, p.length-1);
	var orgId=$("#orgId");
	orgId.attr("value",p);
	var orgPath=$("#orgPath");
	orgPath.attr("value",pa);
	
}


function showMenu() {
	var cityObj = $("#orgSelect");
	var cityOffset = $("#orgSelect").offset();
	
	$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}

function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
	//组织机构切换进行用户群数刷新
	if($("#userGroupId").val()){
		refreshUserGroupNum();
	}	
	$("input[name='po.frontlineChannelPo.sellingArea']").val("");
	maglist.options.page = 1;
    maglist.options.parms = {
	"chooseChannel"   : "",
	"isChooseChannel" : "1"
    };
    document.getElementById("cDiv").contentWindow.changeOrgCity();
    var ids2=$("input[name='po.orgIds']").val();
    if(ids2!=""&&ids2!=null){
	$("#cDiv").removeClass("hide");}
    else{
    	$("#cDiv").addClass("hide");
    }
	maglist.reload(1);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "orgSelect"||event.target.id == "orgtree" || $(event.target).parents("#orgtree").length>0)&&(event.target.id == "mainForm" || $(event.target).parents("#mainForm").length>0)) {
		hideMenu();
	}
}



function expandNodes(nodes) {
	if (!nodes) return;
	curStatus = "expand";
	var zTree = $.fn.zTree.getZTreeObj("orgtree");
	for (var i=0, l=nodes.length; i<l; i++) {
		zTree.expandNode(nodes[i], true, false, false);
		if (nodes[i].isParent && nodes[i].zAsync) {
			expandNodes(nodes[i].children);
		} else {
			goAsync = true;
		}
	}
}
var curStatus = "init", curAsyncCount = 0, asyncForAll = false,
goAsync = false;
function expandAll() {
	if (!check()) {
		return;
	}
	var zTree = $.fn.zTree.getZTreeObj("orgtree");
	if (asyncForAll) {
		zTree.expandAll(true);
	} else {
		expandNodes(zTree.getNodes());
		if (!goAsync) {
			curStatus = "";
		}
	}
	
}
function check() {
	if (curAsyncCount > 0) {
		return false;
	}
	return true;
}

function onAsyncSuccess(event, treeId, treeNode, msg) {
	curAsyncCount--;
	if (curStatus == "expand") {
		expandNodes(treeNode.children);
	} else if (curStatus == "async") {
		asyncNodes(treeNode.children);
	}
	if (curAsyncCount <= 0) {
		if (curStatus != "init" && curStatus != "") {
			asyncForAll = true;
		}
		curStatus = "";
	}
	checkedBack();
}

function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
	curAsyncCount--;
	if (curAsyncCount <= 0) {
		curStatus = "";
		if (treeNode!=null) asyncForAll = true;
	}
}

function checkedBack(){
	var ids=$("#orgId").val();
	var treeObj = $.fn.zTree.getZTreeObj("orgtree");
	var nodes = treeObj.transformToArray(treeObj.getNodes());
	if(nodes.length>0){
		for (var i=0;i<nodes.length;i++){
			if(ids!=undefined){
				if(ids.indexOf(nodes[i].id) >= 0){
					treeObj.checkNode(nodes[i],true,true);
					//nodes[i].checked = true; 
					treeObj.updateNode(nodes[i]); 
			}
			}	
	}
	}
}

/**
 * 验证名称是否为空，长度 <input type="text" check_name="活动名称" check_empty
 * check_size="2,10">
 * 
 */

function checkNameEmpty() {
	// 判断input输入框空值
	var flag = true;
	$("[check_empty]").each(function() {
		var check_name = $(this).attr("check_name");
		var objVal = $.trim($(this).val());
		flag = false;
		if (objVal == "" || objVal == null) {
			//alert(check_name + "不能为空");
			$.ligerDialog.warn(check_name + "不能为空!");
			return false;
		}
		flag=true;
	});

	return flag;
}
function checkLength(){
	var flag = true;
	$("[check_size]").each(function(){
		var check_name = $(this).attr("check_name");
		var check_size=$(this).attr("check_size");
		var minLength="";
		var maxLength="";
		var objVal = $(this).val();
		flag = false;
		minLength= check_size.split(",")[0];// 文本允许的最短长度
	    maxLength = check_size.split(",")[1];// 文本允许的最长长度
		if (objVal.length < minLength) {
			//alert(check_name + "的长度不能小于" + minLength);
			$.ligerDialog.warn(check_name + "的长度不能小于" + minLength);
			return false;
		} else if (objVal.length > maxLength) {
			if(check_name == "策略描述"){
				$(this).val(objVal.substring(0,maxLength));				
			}else{
				$.ligerDialog.warn(check_name + "的长度不能大于" + maxLength);	
				return false;	
			}
			//alert(check_name + "的长度不能大于" + maxLength);
			
		}
		flag = true;
	});
	return flag;
}

function checkMax(){
	var flag=true;
	
	$("[check_max]").each(function(){
		var checkName = $(this).attr("check_name");
		var checkMax=$(this).attr("check_max");
		var min="";
		var max="";
		var objVal=$(this).val().trim();
		flag=false;
		min=checkMax.split(",")[0];
		max=checkMax.split(",")[1];
		if(parseInt(max)<parseInt(objVal)){
			$.ligerDialog.warn(checkName + "的大小不能超过" + max);
			return false;
		}
		if(parseInt(min)>parseInt(objVal)){
			$.ligerDialog.warn(checkName + "的大小不能小于" + min);
			return false;
		}
		flag = true;
	});
	return flag;
}

/**
 * 验证选择框必须选择
 * 
 */

function checkSelect(){
	$("select[check_select]").each(function(){
		var obj=$(this).val();
		var check_name = $(this).attr("check_name");
		if(obj==-1){
			$.ligerDialog.warn("请选择"+check_name);
			//alert("请选择"+check_name);
			return 
		}
	});
}

/**
 * 短信发送时间逻辑处理
 */
function setMsgSendTime(){
	var messageSendTime ='';
	$("input[name='messageSendTime']:checked").each(function(){
		messageSendTime+=$(this).val()+','
	});
	messageSendTime = messageSendTime.substr(0,messageSendTime.length-1);
	$("input[name='msmChannelPo.messageSendTime']").val(messageSendTime);
}

function setMsgSendTime1(){
	if($("input[name='msmChannelPo.isUniSet']:checked").val()=="0"){
		if($("#return12138").attr("class")=="hide"){
			setMsgSendTime();
		}else if($("#custom12138").attr("class")=="hide"){
			var mst="";
		    $("select[id^='frontFirst']").each(function(){
		    	if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
		    		if(mst==""){
			    		mst = $(this).val()+"-"+$(this).next().val();
			    	}else{
			    		mst = mst + ","+$(this).val()+"-"+$(this).next().val();
			    	}
		    	}    	
		    });
		    $("input[name='msmChannelPo.messageSendTime']").val(mst);
		}
	}else{
		$("input[name='msmChannelPo.messageSendTime']").val($("#defaultMst").val());
		$("input[name='msmChannelPo.sendStartTime']").val($("#defaultSd").val());
		$("input[name='msmChannelPo.sendEndTime']").val($("#defaultEd").val());
		$("input[name='msmChannelPo.cycleTimes']").val($("#defaultCst").val());
		$("input[name='msmChannelPo.intervalHours']").val($("#defaultId").val());
		$("input[name='msmChannelPo.touchLimitDay']").val($("#defaultSf").val());		
	}
	
}
/**
 * 集团短信发送时间逻辑处理
 */
function setMsgSendTimeZB(){
	var messageSendTime ='';
	$("input[name='messageSendTimeJiTuan']:checked").each(function(){
		messageSendTime+=$(this).val()+','
	});
	messageSendTime = messageSendTime.substr(0,messageSendTime.length-1);
	$("input[name='zongBuMsmChannelPo.messageSendTime']").val(messageSendTime);
}

function setMsgSendTimeZB1(){
	if($("input[name='zongBuMsmChannelPo.isUniSet']:checked").val()=="0"){
		if($("#return12138ZB").attr("class")=="hide"){
			setMsgSendTimeZB();
		}else if($("#custom12138ZB").attr("class")=="hide"){
			var mst="";
		    $("select[id^='frontFirZB']").each(function(){
		    	if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
		    		if(mst==""){
			    		mst = $(this).val()+"-"+$(this).next().val();
			    	}else{
			    		mst = mst + ","+$(this).val()+"-"+$(this).next().val();
			    	}
		    	}    	
		    });
		    $("input[name='zongBuMsmChannelPo.messageSendTime']").val(mst);
		}
	}else{
		$("input[name='zongBuMsmChannelPo.isUniSet.messageSendTime']").val($("#defaultMstZB").val());
		$("input[name='zongBuMsmChannelPo.isUniSet.sendStartTime']").val($("#defaultSdZB").val());
		$("input[name='zongBuMsmChannelPo.isUniSet.sendEndTime']").val($("#defaultEdZB").val());
		$("input[name='zongBuMsmChannelPo.isUniSet.cycleTimes']").val($("#defaultCstZB").val());
		$("input[name='zongBuMsmChannelPo.isUniSet.intervalHours']").val($("#defaultIdZB").val());
		$("input[name='zongBuMsmChannelPo.isUniSet.touchLimitDay']").val($("#defaultSfZB").val());		
	}
	
}

/**
 * 暂存总校验
 * @returns {Boolean}
 */
function callPauseCheck(){
	if($("input[name='po.activityName']").val().trim()==""){
		$.ligerDialog.warn("请填写活动名称！");
		//alert("请填写活动名称！");
		return false;
	}
	if(!checkActivityName()){
		return false;		
	}
	if($("input[name='isLastStage']").val()!="1"){
		if($("input[name='po.orgRange']").val().trim()==""){
			$.ligerDialog.warn("适用范围不能为空！");
			//alert("适用范围不能为空！");
			return false;
		}
	}
	
	if(!checkLength()){
		return false;
	}
	
	if(!checkMax()){
		return false;
	}
	return true;
}

function checkIsSubmit(){
	if($("input[name='saveType']").val()=="2"){
		var lastState=$("input[name='po.state']").val();
		var activityId = $("input[name='po.activityId']").val();
		var nowState="";
		$.ajax({
				url : "../activity/querystate",
				type : "POST",
				async : false,
				data : {
					"po.activityId" : activityId
				},
				success : function(data){
					if(data.success){
						nowState=data.state;
					}
				}
		});
		if(nowState==lastState){
			return true;
		}else{
			//$.ligerDialog.warn("保存失败，您在其他地点已经对此活动进行了操作");
			alert("保存失败，您在其他地点已经对此活动进行了操作！系统自动跳到活动列表页面");
			return false;
		}
	}else{
		return true;
	}
}

function pauseSubmit(){
	$(":button").attr("disabled",true);
	setMsgSendTime1();
	setMsgSendTimeZB1();
	getSelectRule();
	getSelectChannelId();
	if(callPauseCheck()){
		if(checkIsSubmit()){
			emptyExtral4FroPop();
			emptyExtral4Fro();	//客户经理扩展列表逻辑清除
			emptyExtral4FroTele();  //电话渠道扩展列表逻辑清除
			$("input[name='isSubmit']").val("0");
			if($("#orderEndTime").prop("checked")==true){
				$("input[name='po.orderCycle']").val("-1");
			}
			if($("input[name='po.isSubActivity']").val()=="1"){
				$("input[name='po.startDate']").attr("disabled",false);
				$("input[name='po.endDate']").attr("disabled",false);
				$("select[name='successStandardPo.successTypeId']").attr("disabled",false);
				$("select[name='po.parentActivity']").attr("disabled",false);
			}
			if($(".inputUl").find(".checked").find("input[name='po.activityCycle']").val()=="3"){
				$("input[name='po.orderUpdateRule']").each(function(){
					$(this).val("");
				});
			}
			$.ligerui.loadingshow("正在暂存...");
			$("#mainForm").submit();
			/*if($(".inputUl").find(".checked").find("input[name='po.activityCycle']").val()=="3"&&($("#userGroupId").val()!=null&&$("#userGroupId").val()!="")){
				window.setInterval(countSubmit,2000);
			}else{
				$("#mainForm").submit();
			}*/
		}else{
			if(top.openTab==undefined){
				location.href="../activity/main";
			}else{
				top.closeTab("活动修改","活动列表",true);
			}
		}
	}else{
		$(":button").attr("disabled",false);
	}
	
}
/**
 * 高级模式本地短信时间段选择控制
 */
function msmSendTime(){
	var uniset = $("input[name='msmChannelPo.isUniSet']:checked").val();
	if(uniset==1){
		return true;
	}else{
		if($("#custom12138").attr("class")=="hide"){
			var cc=0;
			var tmp=0;
			var tmp1=0;
			var temp="";
			$("select[id^='frontFirst']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					return true;
				}else{
					cc++;
				}
			});
			if(cc==$("select[id^='frontFirst']").length){
				$.ligerDialog.warn("请至少选择一个短信时段！");
				return false;
			}
			$("select[id^='frontFirst']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					if(temp==""){
						temp = $("option[value='"+$(this).val()+"']").attr("id")+","+$("option[value='"+$(this).next().val()+"']").attr("id");
					}else{
						temp = temp + ","+$("option[value='"+$(this).val()+"']").attr("id")+","+$("option[value='"+$(this).next().val()+"']").attr("id");
					}
				}
			});
			temp = temp.split(",");
			temp = temp.sort(function(a,b){
				return a-b;
			});
			//console.log(temp);
			$("select[id^='frontFirst']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					tmp1++;
					for(var i=0;i<temp.length;i++){
						if(temp[i]==$("option[value='"+$(this).val()+"']").attr("id")&&
								temp[i+1]==$("option[value='"+$(this).next().val()+"']").attr("id")){
							tmp++;
						}
					}
					
				}
			});
			if(tmp1!=tmp){
				$.ligerDialog.warn("选择的时间段中有重复时间段，请重新选择！");
				return false;
			}
			return true;
		}else{
			if($("input[name='messageSendTime']:checked").val() == undefined){
				$.ligerDialog.warn("请至少选择一个短信时段！");
				return false;
			}else{
				return true;
			}
		}
		/*if($("input[name='messageSendTime']:checked").val() == undefined){
			var cc=0;
			var temp="";
			$("select[id^='frontFirst']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					return true;
				}else{
					cc++;
				}
			});
			if(cc==$("select[id^='frontFirst']").length){
				$.ligerDialog.warn("请至少选择一个短信时段！");
				return false;
			}
			
			return false;
		}else{
			return true;
		}*/
	}
}

/**
 * 高级模式集团短信时间段选择控制
 */
function msmSendTimeZB(){
	var uniset = $("input[name='zongBuMsmChannelPo.isUniSet']:checked").val();
	if(uniset==1){
		return true;
	}else{
		if($("#custom12138ZB").attr("class")=="hide"){
			var cc=0;
			var tmp=0;
			var tmp1=0;
			var temp="";
			$("select[id^='frontFirZB']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					return true;
				}else{
					cc++;
				}
			});
			if(cc==$("select[id^='frontFirZB']").length){
				$.ligerDialog.warn("集团短信请至少选择一个短信时段！");
				return false;
			}
			$("select[id^='frontFirZB']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					if(temp==""){
						temp = $("option[value='"+$(this).val()+"']").attr("id")+","+$("option[value='"+$(this).next().val()+"']").attr("id");
					}else{
						temp = temp + ","+$("option[value='"+$(this).val()+"']").attr("id")+","+$("option[value='"+$(this).next().val()+"']").attr("id");
					}
				}
			});
			temp = temp.split(",");
			temp = temp.sort(function(a,b){
				return a-b;
			});
			//console.log(temp);
			$("select[id^='frontFirZB']").each(function(){
				if($(this).val()!=""&&$(this).val()!=null&&$(this).next().val()!=""&&$(this).next().val()!=null){
					tmp1++;
					for(var i=0;i<temp.length;i++){
						if(temp[i]==$("option[value='"+$(this).val()+"']").attr("id")&&
								temp[i+1]==$("option[value='"+$(this).next().val()+"']").attr("id")){
							tmp++;
						}
					}
					
				}
			});
			if(tmp1!=tmp){
				$.ligerDialog.warn("集团短信选择的时间段中有重复时间段，请重新选择！");
				return false;
			}
			return true;
		}else{
			if($("input[name='messageSendTimeJiTuan']:checked").val() == undefined){
				$.ligerDialog.warn("集团短信请至少选择一个短信时段！");
				return false;
			}else{
				return true;
			}
		}
	
	}
}
/**
 * 提交前总校验
 * @returns {Boolean}
 */
function callSubmitCheck(){
	//文本框空值校验
	if(!checkNameEmpty()){
		return false;
	}
	
	if(!checkNum()){
		return false;
	}
	
	if(!checkLength()){
		return false;
	}
	
	if(!checkMax()){
		return false;
	}
	
	
	/**
	 * 活动名称重复校验
	 */
	if(!checkActivityName()){
		return false;		
	}
	/*if($("#checkNameValid").val() == "1"){
		alert("活动名称重复,请修改后提交");
		$(":input[name='po.activityName']").focus();
		return false;
	}*/
	/**
	 * 渠道选择校验
	 */
	if(!getSelectChannelId()){
		$.ligerDialog.warn("请至少勾选一个渠道");
	    //alert("请至少勾选一个渠道");
	    return false;
	}
	/**
	 * 产品选择校验
	 */
	if(!saveProduct()){
		return false;
	};
	/**
	 * 成功标准为必选
	 */
	if(!saveSuccessStandard()){
		return false;
	}
	
	if(!saveSpecialChannel()){
		return false;
	}
	/**
	 * 渠道选择必选内容校验
	 */
	if(!controllSelect()){
		return false;
	}
	/**
	 * 短信发送时段设置
	 */
	/*if(!msmSendTime()){
		return false;
	}*/
	return true;
}

 function sendForProduct(){
	if($(".ssfp").find(".checked").val()!=undefined){
		var chooseProduct=$("input[name='successStandardPo.orderProductIds']").val();
		var sendProduct = $("select[name='msmChannelPo.orderProduct']");
	   	if(chooseProduct==""||chooseProduct==null){
	   		$.ligerDialog.warn("若支持短信订购功能，请选择可订购的产品");
	   		return false;
	   	}else if(sendProduct.val()==null||sendProduct.val()==""){
	   		sendProduct.focus();
	   		$.ligerDialog.warn("请选择短信渠道订购产品");   		
	   		return false;
	   	}else{
	   		return true;
	   	}
	}else{
		return true;
	}
 }

 function checkNum() {
	// 判断input输入框空值
	var flag = true;
	$("[numcheck]").each(function() {
		var check_name = $(this).attr("numcheck");
		var objVal = $(this).val();
		var check_num = $(this).attr("numsize").split(",");
		var first=check_num[0];
		var last=check_num[1];
		flag = false;
		if (parseInt(objVal)=="NaN") {
			//alert(check_name + "不能为空");
			$.ligerDialog.warn(check_name + "格式不正确，请重新填写!");
			return false;
		}else if(parseInt(objVal)<parseInt(first)||parseInt(objVal)>parseInt(last)){
			$.ligerDialog.warn(check_name + "的值必须在"+first+"-"+last+"之间，请重新填写");
			return false;
		}
		flag=true;
	});

	return flag;
}

function saveSubmit(){
	$(":button").attr("disabled",true);
	getSelectRule();
	setMsgSendTime1();	//短信发送时段设置保存
	setMsgSendTimeZB1();
	if(callSubmitCheck()){
		if(checkIsSubmit()){
			emptyExtral4FroPop();
			emptyExtral4FroTele();  //电话渠道扩展列表逻辑清除
			emptyExtral4Fro();	//客户经理扩展列表逻辑清除	
			removeDisabled();
			if($(".inputUl").find(".checked").find("input[name='po.activityCycle']").val()=="3"){
				$("input[name='po.orderUpdateRule']").each(function(){
					$(this).val("");
				});
			}			
			$.ligerui.loadingshow("正在保存...");
			$("#mainForm").submit();
			/*if($(".inputUl").find(".checked").find("input[name='po.activityCycle']").val()=="3"){
				window.setInterval(countSubmit,2000);
			}else{
				$("#mainForm").submit();
			}*/

		}else{
			if(top.openTab==undefined){
				location.href="../activity/main";
			}else{
				top.closeTab("活动修改","活动列表",true);
			}
		}

	}else{
		$(":button").attr("disabled",false);
	}
	
}

function countSubmit(){
	if(yonghuqunzhuanyong==0){
		emptyExtral4Fro();	//客户经理扩展列表逻辑清除	
		$("#mainForm").submit();
	}
}

function cancelActivity(){
	if(top.closeTab==undefined){
	   location.href = "../activity/main"; 
	}else{
		/*$.ajax({
			url : "/portal/rest/menus/menuinfo/clyx_hn_activity",
			type : "GET",
			async : false,
            success : function(data) {
            	   top.openTab(data.menuName,"clyxactivity/activity/main");
          		   top.closeTab(undefined,data.menuName,true);
			}
        });*/
		if($("input[name='saveType']").val()=="1"){
			 top.openTab("活动列表","/"+services.clyxactivity+"/activity/main");
			 top.closeTab("活动策划","活动列表",true);
		}else{
			 top.openTab("活动列表","/"+services.clyxactivity+"/activity/main");
			 top.closeTab("活动修改","活动列表",true);
		}

	}
}
/**
 * 活动名称不能重复校验
 * dsp
*/
function checkActivityName() {
	  var name =  $("input[name='po.activityName']").val().trim();
	  if (name == "") return;
	  $.ajax({
			type: "POST",
			async: false,
			url: '../activity/checkActivityName',
			dataType: "json",
			data: {"po.activityId": $("input[name='po.activityId']").val(), 
				   "po.activityName": name},
			success:function(data){
				$("#checkNameValid").val(data.conflict);
			}		   
	  });
	  if($("#checkNameValid").val() == "1"){
			$.ligerDialog.warn("活动名称重复,请修改后提交!");
	       //alert("活动名称重复,请修改后提交");
		  $(":input[name='po.activityName'] + span").html("<font color='red'>活动名称重复，请重新输入</font>");
			return false;
	  }else{
		  $(":input[name='po.activityName'] + span").html("<font color='green'></font>");
		  return true;
		}
}

/**
 * 产品提交的校验
 * @returns {Boolean}
 */
function saveProduct(){
if($("#successProductIds").val()=="" || $("#successProductIds").val()==null){
	if($("#xuanZe").is(':checked')==true){
		$.ligerDialog.warn("当选择优先选择产品时已选产品不能为空");
		//alert("当选择优先选择产品时已选产品不能为空");
		return false;
	}
	if($($("#match :radio")[1]).is(':checked')==true){
		$.ligerDialog.warn("成功标准已选产品不能为空");
		//alert("当选择精确匹配时已选产品不能为空");
		return false;
	}
	return true;
}
return true;
}

/**
 * 结束时间选择后不能小于开始时间
 */
/*function checkEndTime(){
	var startTime = $('input[name="po.startDate"]').val();
	var endTime = $('input[name="po.endDate"]').val();
	if(endTime != null && endTime != ""){
		var stime = new Date(startTime.replace(/\-/g, "\/")); 
		var etime = new Date(endTime.replace(/\-/g, "\/"));
		if(stime >= etime){
			alert("结束时间不能小于开始时间!");
			return false;
		}else{
			return true;
		}
	}
	return true;
}*/

/**
 * 成功标准为必选
 */
function saveSuccessStandard(){
	if($('#successType option:selected').html() == null || $('#successType option:selected').html() == "请选择.."){
		$.ligerDialog.warn("请选择成功标准类型");
		//alert("请选择成功标准类型");
		return false;
	}
	return true;
}

function saveSpecialChannel(){
	var specialVal = $("#orderIssuedRule0").find("option[lev='1']").val();
	var sellingAreaVal = $("input[name='po.frontlineChannelPo.sellingArea']").val();
	if(specialVal == undefined){
		return true;
	}else if(specialVal == $("#orderIssuedRule0").val()&&sellingAreaVal == ""){
		$.ligerDialog.warn("请添加指定的渠道");
		return false;
	}else {
		return true;
	}
}


$(function(){
	var l=$.ligerui;
	l.loadingshow=function(fonts){
		 var oDiv = document.createElement('div');
		 document.body.appendChild(oDiv);
		 var cssStr="position: fixed;z-index: 91000;top: 40%;left: 50%; overflow: hidden;background: url('../image/loading.gif') no-repeat 0px 0px;width: 600px;height: 600px;display:block";
		 oDiv.style.cssText = cssStr;
		 oDiv.id = 'logingId';
		 oDiv.style.display = 'block';
		 var oDiv2 = document.createElement('div');
		 oDiv2.innerHTML = fonts;
		 document.body.appendChild(oDiv2);
		 var cssStr2="position: fixed;z-index: 91000;top: 40%;left: 53%; overflow: hidden;width: 600px;height: 600px;display:block";
		 oDiv2.style.cssText = cssStr2;
		 oDiv2.id = 'logingId2';
		 oDiv2.style.display = 'block';
	};
	l.loadinghide=function(){
		$("#logingId").hide();
        $("#logingId2").hide();
	};
	
});

function isMonth(){
	
    if($("input[name='po.activityCycle'][checked]").val()=="1"){
		$("#isMonth").html("月");
		$("#orderIsValid").removeClass("hide");
	}else if($("input[name='po.activityCycle'][checked]").val()=="2"){
		$("#isMonth").html("日");
		$("#orderIsValid").removeClass("hide");
	}else if($("input[name='po.activityCycle'][checked]").val()=="3"){
		$("#isMonth").html("日");
		$("#orderIsValid").addClass("hide");
		$("#orderRuleUpdate").addClass("hidden");
	}
    
}

function isNoOrgRange(){
	if($("input[name='isLastStage']").val()=="1"){
		$("#applicableRange").html("");
	}
}
