$(function(){});


function beforeClick2(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("ruleOrgtree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function showMenu2() {
	var cityObj = $("#orderOrgId");
	var cityOffset = $("#orderOrgId").offset();
	
	$("#menuContent2").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	//$("body").bind("mousedown", onBodyDown2);
}

function onCheck2(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("ruleOrgtree"),
	nodes = zTree.getCheckedNodes(true),
	v = "",
	pa= ""
	c = 0,
	p = "";

	// treeObj.expandAll(true);
	for (var i=0, l=nodes.length; i<l; i++) {
			p += nodes[i].id +",";
			if(nodes[i].path!=undefined){
				pa+= nodes[i].path+",";
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
	var orgId=$("#orderOrgId");
	orgId.attr("value",p);
}

function expandNodes2(nodes) {
	if (!nodes) return;
	curStatus2 = "expand";
	var zTree = $.fn.zTree.getZTreeObj("ruleOrgtree");
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
	if (!check2()) {
		return;
	}
	var zTree = $.fn.zTree.getZTreeObj("ruleOrgtree");
	if (asyncForAll2) {
		zTree.expandAll(true);
	} else {
		expandNodes2(zTree.getNodes());
		if (!goAsync2) {
			curStatus2 = "";
		}
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
	var ids=$("#orderOrgId").val();
	var treeObj = $.fn.zTree.getZTreeObj("ruleOrgtree");
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
				if(ids.indexOf(nodes[i].id) >= 0){
					treeObj.checkNode(nodes[i],true,true);
					// nodes[i].checked = true;
					treeObj.updateNode(nodes[i]); 
			}
		}
		}
	}	
}
function changeOrg(){
	var ids=$("input[name='po.orgIds']", window.parent.document).val();
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
    						url: '../activity/orderRange'
    					},
    					callback: {
    						// onClick:showviewclick
    						// beforeClick: beforeClick,
    						onCheck: onCheck2,
    						onAsyncSuccess: onAsyncSuccess2,
    						onAsyncError: onAsyncError2
    					}
    	};
    	$.fn.zTree.init($("#ruleOrgtree"), setting2);
    	showMenu2();
    	expandAll2();  
    }
  
}