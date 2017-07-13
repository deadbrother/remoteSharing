$(function ()
{
	manager=  $("#maingrid").ligerGrid({
		columns: [
		        /*  { display: '序号', name: 'sort_num', align: 'center'},*/
		          { display: '实体名称', name: 'entity_name' ,align: 'center'},
		          { display: '表名', name: 'entity_table', align: 'center'},
		          { display: '数据源', name: 'data_res_name', align: 'center'},
		          { display: '实体说明',  name: 'entity_resume' , align: 'center'  },
		          { display: '排序',  align: 'center',render: function (rowdata, rowindex, value)
	                    {
		        	  		var h = "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"move('"+rowdata.entity_id+"','"+rowindex+"','up')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"move('"+rowdata.entity_id+"','"+rowindex+"','down')\" /> </div>";
		        	  		return h;
			          }
	               },
		          { display: '操作', align: 'center' ,render: function (rowdata, rowindex, value)
		        	  {
		        	  id = rowdata.entity_id;
                	  var h="<div id=\"divexecute_"+id+"\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"+id+"',event)\" src=\"/epmwxwl/image/menu-arrow.png\"></div>";
		        	  return h;
		        	  }
		          }
		          ],   
		          isScroll: false,
		          url : '../entity/listAjax',
		          checkbox:false,
		          rownumbers:true,
		          usePager:true
});
//新增类型
$("#addType").click(function() {
		typeLayer = $.ligerDialog.open({
			title:'类型',
			url : '../entity/saveJsp',
			height : 350,
			isResize : true,
		});
});
//查询
$("#search-btn").click(function() {
	reload();
});
});

//操作
function viewMenuStr(id,event){
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/delete.png\">&nbsp;删除</a></div>";
	str += "<div style='height:25px;'><a href=\"/epmwxwl/entityField/list/"+id+"\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/setting.png\">&nbsp;实体设置</a></div>";
	var xyObj = getMousePos(event);
	$("#modifyMenu").html(str).css({left:(xyObj.x-50) + "px", top:(xyObj.y+10)+"px"}).show();
	$(document).bind("mousedown",onBodyDown);
}
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!( event.target.id == "modifyMenu" || $(event.target).parents("#modifyMenu").length>0||
			event.target.id == "runGz")) {
		hideMenu();
	}
}
function getMousePos(event) { 
	var e = event || window.event; 
	var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft; 
	var scrollY = document.documentElement.scrollTop || document.body.scrollTop; 
	var x = e.pageX || e.clientX + scrollX; 
	var y = e.pageY || e.clientY + scrollY; 
	return { 'x': x, 'y': y }; 
} 


//修改类型
function updateType(id){
	typeLayer = $.ligerDialog.open({
		title:'类型',
		url : '../entity/updateJsp/'+id,
		height : 350,
		isResize : true,
	});
}
//关闭layer 刷新页面  因为要重新排序
function closeTypelayer(){
	reload();
	cancelTypelayer();
}
//关闭layer 取消按钮
function cancelTypelayer(){
//	layer.close(typeLayer);
	typeLayer.close();
}
//删除选中的类型
function deleteType(id){
	$.ajax({
		url: '../entity/delete',
		type: "POST",
		async: true,
		data: 
		{
			"entity_id":id
		},
		success: function(data) 
		{
			if(data=="success")
			{
				manager.deleteSelectedRow();
				hideMenu();
			}
			else{
				alert("删除失败");	
			}
		}
	}); 
}
//重新加载数据
function reload(){
	var entity_name=$("#entity_name").val();
	var entity_table=$("#entity_table").val();
	var data_res_id=$("#data_res_id").val();
	var entity_resume=$("#entity_resume").val();
	if("NULL" == data_res_id){
		data_res_id="";
	}
	manager.options.parms = {
			"entity_name":entity_name,
			"entity_table":entity_table,
			"data_res_id":data_res_id,
			"entity_resume":entity_resume
	};
	manager.reload(1);
	
}

function move(entity_id,rowindex,oper){
	if(oper=='up'){
		if(parseInt(rowindex)-1<0){
			$.ligerDialog.success('不能再升了!');
		}else{
			getmove(entity_id,manager.getRow(rowindex-1).entity_id);
		}
	}else if(oper == "down"){
		if(manager.getRow(parseInt(rowindex)+1) == undefined){
			$.ligerDialog.success('不能再降了!');
		}else{
			getmove(entity_id,manager.getRow(parseInt(rowindex)+1).entity_id);
		}
	}
	
}

function getmove(entity_id,oth_entity_id){
	$.ajax({
		url: '../entity/exchange',
		type: "POST",
		async: true,
		data: 
		{	
			"entity_id":entity_id,
			"oth_entity_id":oth_entity_id
		},
		success: function(data) 
		{	
			if(data=="success"){
			  reload();
			}else{
				$.ligerDialog.success('请重试!');
			}
		}
	}); 
}
