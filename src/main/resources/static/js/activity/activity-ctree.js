$(function(){    	
	changeOrgCity();
});


function beforeClick2(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("cityOrgtree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function showMenu2() {
	var cityObj = $("#cityOrgId");
	var cityOffset = $("#cityOrgId").offset();
	
	$("#cityContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	//$("body").bind("mousedown", onBodyDown2);
}

function onCheck2(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("cityOrgtree"),
	nodes = zTree.getCheckedNodes(true),
	v = "",
	pa= ""
	na= ""
	c = 0,
	p = "";

	// treeObj.expandAll(true);
	for (var i=0, l=nodes.length; i<l; i++) {
		zTree.expandNode(nodes[i], true, false, false);
			p += nodes[i].id +",";
			if(nodes[i].path!=undefined){
				pa+= nodes[i].path+",";
			}
			if(nodes[i].name!=undefined){
				
				//nodes[i].checked = true;
			  if(nodes[i].channelName == ""){
				  na+="!" + nodes[i].name;
			  }else{
				  na+= "/" + nodes[i].channelName;
			  }
			}

			/*if(treeNode.isParent==true){
				c=1;
			}*/
	}
	/*if(c=1){
		p=p.substring(p.indexOf(","),p.length);
		p=p.substring(1,p.length);
	}*/
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	if(p.length>0) p = p.substring(0, p.length-1);
	if(pa.length>0) pa = pa.substring(0, pa.length-1);
	
	if(na.length>0) na = na.substring(1, na.length);
	var orgId=$("#cityOrgId");
	orgId.attr("value",p);
	var orgPath=$("#cityOrgPath");
	orgPath.attr("value",pa);

	parent.$("#orgCityIds").attr("value",p);
	parent.$("#companyId").attr("value",pa);
	parent.$("#orgCityNames").attr("value",na);

	}
	


function expandNodes2(nodes) {
	if (!nodes) return;
	curStatus2 = "expand";
	var zTree = $.fn.zTree.getZTreeObj("cityOrgtree");
	for (var i=0, l=nodes.length; i<l; i++) {
		zTree.expandNode(nodes[i], true, false, false);
		if (nodes[i].isParent && nodes[i].zAsync) {
			expandNodes2(nodes[i].children);
		} else {
			goAsync2 = true;
		}
	}
}
var curStatus2 = "init", curAsyncCount2 = 0, asyncForAll2 = false,
goAsync2 = false;
function expandAll2() {
	if(parent.$('input[name="saveType"]').val() == "2"){
		if (!check2()) {
			return;
		}
		var zTree = $.fn.zTree.getZTreeObj("cityOrgtree");
		if (asyncForAll2) {
			zTree.expandAll(true);
		} else {
			expandNodes2(zTree.getNodes());
			if (!goAsync2) {
				curStatus2 = "";
			}
		}
		checkedBack2();	
	}
}
function check2() {
	if (curAsyncCount2 > 0) {
		return false;
	}
	return true;
}

function onAsyncSuccess2(event, treeId, treeNode, msg) {
	curAsyncCount2--;
	if (curStatus2 == "expand") {
		expandNodes2(treeNode.children);
	} else if (curStatus2 == "async") {
		asyncNodes2(treeNode.children);
	}
	if (curAsyncCount2 <= 0) {
		if (curStatus2 != "init" && curStatus2 != "") {
			asyncForAll2 = true;
		}
		curStatus2 = "";
	}
	checkedBack2();
}

function onAsyncError2(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
	curAsyncCount2--;
	if (curAsyncCount2 <= 0) {
		curStatus2 = "";
		if (treeNode!=null) asyncForAll2 = true;
	}
}

function checkedBack2(){
	if($("#cityOrgId").val()==""){
	$("#cityOrgId").attr("value",parent.$("#companyId").val());}
	var ids=$("#cityOrgId").val();
	var treeObj = $.fn.zTree.getZTreeObj("cityOrgtree");
	var nodes = treeObj.transformToArray(treeObj.getNodes());
	var checked = treeObj.getCheckedNodes(true);
	if(checked.length>0){
		for(var i=0;i<checked.length;i++){
			treeObj.checkNode(checked[i],false,true);
		}	
	}
	if(ids!=undefined){
		if(nodes.length>0){
			for (var i=0;i<nodes.length;i++){
				if(ids.indexOf(nodes[i].path) >= 0){
					treeObj.checkNode(nodes[i],true,true);
					// nodes[i].checked = true;
					treeObj.updateNode(nodes[i]); 
			}
		}
		}
	}	
}
function changeOrgCity(){
	var level=parent.$("#classLevel").val();
	if(level=="1"){
	  var ids=$("input[name='po.orgIds']", window.parent.document).val();
	}
	else if(level=="2"){
	  var ids=parent.$("#CreateOrgId").val();
	}
    var names=$("input[name='po.orgRange']", window.parent.document).val();
    if(ids!=""&&ids!=null){
    	var setting2 = {
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
    				selectedMulti: true
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
    						otherParam:["orgIds",ids,"orgNames",names],
    						url: '../activity/cityRange'
    					},
    					callback: {
    						// onClick:showviewclick
    						// beforeClick: beforeClick,
    						onCheck: onCheck2,
    						onAsyncSuccess: expandAll2,
    						onAsyncError: onAsyncError2
    					}
    	};
    	$.fn.zTree.init($("#cityOrgtree"), setting2);
    	showMenu2();
    	//expandAll2(); 
    }
  
}