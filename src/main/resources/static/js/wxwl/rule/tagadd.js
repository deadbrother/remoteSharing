$(function(){
	var DrId=$("#drid").val();
	var Type=$("#Type").val();
	var TagList;
	var treeSetting = {
		    data:{
				simpleData: {
					enable:true, 
					idKey:'id',
					pIdKey:'pid',
					rootPId: 0
				},
				key:{
					name:'res_filed_type_name',
					title: "name"
				},
				keep: {
					parent: true,
					leaf: true
				}
			},
			view:{
				dblClickExpand:false
			},
			async: {
				enable: true,
				type:"POST",
				autoParam: ["id=res_field_type_id","flag"],
				otherParam: { "drawTypeId":DrId},
				url:"/epmwxwl/condFunc/tagTreeData",
				dataFilter: null
			},
			callback:{
				//双击事件，将标签拖到文本框
				onDblClick: function(event,treeId,treeNode){
					if(treeNode.flag=="1"||treeNode.flag=="2"){
						$("#groupDesc").val("");
						$("#fileds").attr("value",treeNode.id);
						symbol("【"+treeNode.res_filed_type_name+"】","groupDesc");
					}
					if(treeNode.flag=="3"){
						symbol(treeNode.res_filed_type_name);
					}
				}
			},
			//节点拖拽操作结束的事件回调
			onDrop:function(event, treeId, treeNodes, targetNode, moveType){
				return false;
			}
		};

		function initTagTree(){
			var dayTagTree = $("#TagTree");
		    var dayTagTreeObj = $.fn.zTree.init(dayTagTree,treeSetting);
		}
		initTagTree();	
});
function initEditData(groupDesc){
	$("#groupDesc").val(groupDesc);
}

