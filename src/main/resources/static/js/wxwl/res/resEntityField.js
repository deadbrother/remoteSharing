var typeTreeSetting ,zTree, rMenu;
var typedilog;
var field_ids = new Array();
$(function ()
{
	manager=  $("#maingrid").ligerGrid({
		columns: [
		          { display: '字段',    name: 'field_name_en' ,align: 'center'},
		          { display: '字段名称', name: 'field_desc', align: 'center',
	                    editor: { type: 'text' }},
		          { display: '分类',    name: 'field_type_name', align: 'center'}
		         ],
		         enabledEdit: true, 
		          isScroll: true,
		          url : '../../resEntityField/listAjax',
		          checkbox:true,
		          rownumbers:true,
		          usePager:true,
		          width:1000,
		          height:400,
				  onSelectRow:function	(rowdata, rowid, rowobj){
					  field_ids.push(rowdata.field_id);
				  },
				  onUnSelectRow:function	(rowdata, rowid, rowobj){
					  field_ids.pop(rowdata.field_id);
				  },
				  onAfterEdit: f_onAfterEdit,
});
	
	
	
	
//查找
$("#search").click(function() {
	var entity_id = $("#entityId").val();
	var resId = $("#resId").val();
	var field_name = $("#field_name").val();
	var field_type = $("#field_type").val();
	if(field_type == "NULL"){
		field_type="";
	}
	manager.options.parms = {
			"resId":resId,
			"field_name":field_name,
			"entity_id":entity_id,
			"field_type_id":field_type
	};
	manager.reload(1);
});
//下拉框选中事件
$("#entityId").bind("change",function(){
	$("#search").click();
}); 
//移动
$("#movetd").click(function() {
	//获取选中的类别 （不包括字段）
	var nodes = getSelectNode();
	if(nodes.length==0||nodes[0]==undefined||nodes[0]==null||nodes[0].isEntityField==0||nodes[0].isEntityField==2){
		alert("情您选择一个分类")
	}else if(nodes[0].isEntityField==1){
		var resId = $("#resId").val();
		var entity_id = $("#entityId").val();
		var str="";
		var len=field_ids.length;
		 for(i=0;i<len;i++){
			 str=str+field_ids[i]+",";
		 }
		 str=str.substring(0,str.length-1);
		$.ajax({
			url: '../../resEntityField/updateAjax',
			type: "POST",
			async: true,
			data: 
			{	
				"ress_id":resId,
				"field_ids":str,
				"res_field_type_id":nodes[0].id,
				"entityId":entity_id
			},
			success: function(data) 
			{
				if("success"==data){
					//刷新ligerui数据
					$("#search").click();
					//清空field_ids
					field_ids = new Array();
					//数据ztree数据
					refreshNode();
					refreshParentNode();
				}
			}
		});
	}
	
});
//页面加载完成后调用search方法
$("#search").click();
});


//关闭layer 取消按钮
function cancelTypelayer(){
	typeLayer.close();
}

//关闭typedilog 取消按钮
function closeDilog(){
	typedilog.close();
}
//编辑后的事件
function f_onAfterEdit( e){
	var node = e.record;
	var field_id=node.field_id;
	var desc=e.value;
	console.log(field_id);
	console.log(resId);
	console.log(e.value);
	$.ajax({
		url: '../../resEntityField/updateDesc',
		type: "POST",
		async: true,
		data: 
		{	
			"ress_id":resId,
			"field_id":field_id,
			"field_desc":desc
		},
		success: function(data) 
		{
			if("success"!=data){
				alert("修改失败");
			}
		}
	});
}
//保存分类名称到数据库中
function saveEntityFieldTypeName(name){
	var resId = $("#resId").val();
	var nodes = getSelectNode();
	var pid=nodes[0].id;
	if("root"==pid){
		pid="";
	}
	$.ajax({
		url: '../../resEntityField/saveType',
		type: "POST",
		async: true,
		data: 
		{
			"res_field_type_name":name,
			"parent_id":pid,
			"res_id":resId
		},
		success: function(data) 
		{
			if(data=="success"){
				//数据ztree数据
				refreshNode();
				refreshParentNode();
			}
		}
	});
	
	closeDilog();
}
//更新分类名称到数据库中
function updateEntityFieldTypeName(id,name){
	var nodes = getSelectNode();
	var pid=nodes[0].id;
	if("root"==pid){
	    alert("此节点更改无效");
	}else{
		$.ajax({
			url: '../../resEntityField/updateType',
			type: "POST",
			async: true,
			data: 
			{
				"res_field_type_id":id,
				"res_field_type_name":name
			},
			success: function(data) 
			{
				if(data=="success"){
					//数据ztree数据
					refreshNode();
					refreshParentNode();
					$("#search").click();
				}
			}
		});
	}
	
	closeDilog();
}

//修改
function update(id){
	typeLayer = $.ligerDialog.open({
		title:'编辑',
		url : '../../resEntityField/updateJsp/'+id,
		height : 250,
		isResize : true,
	});
}

/*
 * 标签树
 * */
$(function(){
	typeTreeSetting = {
		    data:{
				simpleData: {
					enable:true, 
					idKey:'id',
					pIdKey:'pid'
				},
				key:{
					name:'name',
					title: "name"
				},
				keep: {
					parent: true,
					leaf: true
				}
			},
			edit: {
				enable: false,
				},
			view:{
				showLine: false,
				
			},
			
			async: {
				enable: true,
				type:"POST",
				autoParam: ["id"],
				otherParam: { "resId":resId},
				url:"../../resEntityField/resFiledType",
				dataFilter: null
			},
			callback: {
				onRightClick: OnRightClick
			
			}
		};
	$.fn.zTree.init($("#typeTree"), typeTreeSetting);
	zTree = $.fn.zTree.getZTreeObj("typeTree");
	rMenu = $("#rMenu");
});
function  getSelectNode(){
	var zTree = $.fn.zTree.getZTreeObj("typeTree");
	nodes = zTree.getSelectedNodes();
	return nodes;
}
/** 
 * 刷新当前节点 
 */  
function refreshNode() {  
    /*根据 treeId 获取 zTree 对象*/  
    var zTree = $.fn.zTree.getZTreeObj("typeTree"),  
    type = "refresh",  
    silent = false,  
    /*获取 zTree 当前被选中的节点数据集合*/  
    nodes = zTree.getSelectedNodes();  
    /*强行异步加载父节点的子节点。[setting.async.enable = true 时有效]*/  
    zTree.reAsyncChildNodes(nodes[0], type, silent);  
}  
/** 
 * 刷新当前选择节点的父节点 
 */  
function refreshParentNode() {  
    var zTree = $.fn.zTree.getZTreeObj("typeTree"),  
    type = "refresh",  
    silent = false,  
    nodes = zTree.getSelectedNodes();  
    /*根据 zTree 的唯一标识 tId 快速获取节点 JSON 数据对象*/  
    var parentNode = zTree.getNodeByTId(nodes[0].parentTId);  
    /*选中指定节点*/  
    zTree.selectNode(parentNode);  
    zTree.reAsyncChildNodes(parentNode, type, silent);  
}  
function OnRightClick(event, treeId, treeNode) {
	zTree.selectNode(treeNode);
	//字段不能新加类型
	if("0"!=treeNode.isEntityField){
		showRMenu("node", event.clientX, event.clientY);
	}
}

function showRMenu(type, x, y) {
	rMenu.show();
	if (type=="root") {
		$("#m_del").hide();
		$("#m_check").hide();
		$("#m_unCheck").hide();
	} else {
		$("#m_del").show();
		$("#m_check").show();
		$("#m_unCheck").show();
	}
	rMenu.css({"position":"absolute","z-index":"10","top":y+"px", "left":x+"px", "visibility":"visible"});
	$("body").bind("mousedown", onBodyMouseDown);
}
function hideRMenu() {
	if (rMenu) rMenu.css({"visibility": "hidden"});
	$("body").unbind("mousedown", onBodyMouseDown);
}
function onBodyMouseDown(event){
	if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
		rMenu.css({"visibility" : "hidden"});
	}
}
var addCount = 1;
function addTreeNode() {
	hideRMenu();
	var newNode = { name:"增加" + (addCount++)};
	if (zTree.getSelectedNodes()[0]) {
		typedilog = $.ligerDialog.open({
			title:'编辑',
			url : '../../resEntityField/updateTypeJsp',
			height : 200,
			isResize : true,
		});
		/*console.log(zTree.getSelectedNodes()[0]);
		newNode.checked = zTree.getSelectedNodes()[0].checked;
		zTree.addNodes(zTree.getSelectedNodes()[0], newNode);*/
	} else {
		zTree.addNodes(null, newNode);
	}
}
function updateTreeNode() {
	hideRMenu();
	var newNode = { name:"增加" + (addCount++)};
	if (zTree.getSelectedNodes()[0].id!="root") {
		/**
		 * 获取要修改的id
		 * */
		var nodes = zTree.getSelectedNodes();
		var typeid= nodes[0].id;
		typedilog = $.ligerDialog.open({
			title:'编辑',
			url : '../../resEntityField/updateTypeJsp2/'+typeid,
			height : 200,
			isResize : true,
		});
	} else {
		alert("此节点名称更改无效")
	}
}
function removeTreeNode() {
	hideRMenu();
	var nodes = zTree.getSelectedNodes();
	if (nodes && nodes.length>0) {
		if("root"==nodes[0].id){
			alert("根节点不允许删除");
		}  else {
			//删除节点
				var typeid= nodes[0].id;
				$.ajax({
					url: '../../resEntityField/deleteFieldType',
					type: "POST",
					async: true,
					data: 
					{
						"typeid":typeid
					},
					success: function(data) 
					{
						 if(data=="success")
						 {
							 zTree.removeNode(nodes[0]);
							 //重新加载字段数据
							 $("#search").click();
						 }else if(data=="haschild"){
							alert("该字段类型之下还有字段类型，不允许删除");
						 }
					}
				}); 
				
		}
	}
}
function checkTreeNode(checked) {
	var nodes = zTree.getSelectedNodes();
	if (nodes && nodes.length>0) {
		zTree.checkNode(nodes[0], checked, true);
	}
	hideRMenu();
}
function resetTree() {
	hideRMenu();
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
}