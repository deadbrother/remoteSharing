var manager;
var typeLayer;
var option;
$(function() {
	option = $("#resources_id").ligerComboBox({
		width : 200,
		initIsTriggerEvent : false,
		data : dtstr,
		resize : true,
		valueFieldID : 'typelist'
	});
	$("#form1").ligerForm();

	// 新增类型
	manager = $("#maingrid").ligerGrid({
		columns : [
				{
					display : '主键',
					type : 'String',
					name : 'draw_type_id'
				},
				{
					display : '划配类型名称',
					name : 'rowtypet_name',
					align : 'center',
				},
				{
					display : '划配资源',
					name : 'res_name',
					align : 'center',
					type : 'String',
				},
				{
					display : '责任体',
					name : 'resp_name',
					align : 'center',
					type : 'String',
				},
				{
					display : '状态',
					name : 'stutas',
					align : 'center',
					type : 'String',
					render: function (rowdata, rowindex, value){
		        		  if(value!=null&&value=="1"){
		        			  return "停用";
		        		  }else{
		        			  return "启用";
		        		  }
		        	  }
				},
				{

					display : '操作',
					align : 'center',
					render : function(rowdata, rowindex, value) {
						id = rowdata.draw_type_id;
						var h = "<div id=\"divexecute_"
								+ id
								+ "\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"
								+ id
								+ "',event)\" src=\"/epmwxwl/image/menu-arrow.png\"></div>";
						if ("1" == rowdata.data_stutas
								|| "2" == rowdata.data_stutas) {
							// 正在执行中的规则
							h = "<div id='divexecute_"
									+ id
									+ "'><img src='/epmwxwl/image/loading-2.gif' width='25px' height='25px'/></div>";
							// 判断后台什么时候执行完成
							arr[i] = window
									.setInterval(
											"timer('"
													+ rowdata.rangeid
													+ "','"
													+ rowdata.id
													+ "','"
													+ i
													+ "','"
													+ rowindex
													+ "','"
													+ rowdata.clientsetid
													+ "')",
											6000);
							i++;

						}
						if (rowdata.isparent == "true"
								&& "root" != rowdata.id) {
							h = "";
						}
						return h;
					}
				} ],
		isScroll : false,
		url : '../drawDrawType/findAllAjax',
		checkbox : false,
		rownumbers : false,
		usePager : true
	});

	
	$("#addType").click(function() {
		typeLayer = $.ligerDialog.open({
			title : '数据源类型',
			url : '../drawDrawType/gohuapeiadd',
			width : 500,
			height : 500,
			isResize : true,
		});
	});
	$("#search-btn").click(function(){
		reload();
	});
	
});

// 修改类型
function updateType(draw_type_id) {
	typeLayer = $.ligerDialog.open({
		title : '数据源类型',
		url : '/epmwxwl/drawDrawType/update/' + draw_type_id,
		width : 500,
		height : 500,
		isResize : true,
	});
}
// 删除选中的类型
function deleteType(draw_type_id) {
	$.ajax({
		url : '../drawDrawType/dodel',
		type : "POST",
		async : true,
		data : {
			"draw_type_id" : draw_type_id
		},
		success : function(data) {
			if (data == "success") {
				manager.deleteSelectedRow();
				hideMenu();
			} else {
				alert("删除失败");
			}
		}
	});
}
function strToJson(str) {
	var json = eval('(' + str + ')');
	return json;
}
// 重新加载数据
function reload() {
	var draw_type_id=$("#draw_type_id").val();
	//draw_type_id = draw_type_id!=null?draw_type_id:"";
	var rowtypet_name=$("#rowtypet_name").val();
	//rowtypet_name = rowtypet_name!=null?rowtypet_name:"";
	var resources_id=$("#resources_id").val();
	//resources_id = resources_id!=null?resources_id:"";
	manager.options.parms = {"draw_type_id":draw_type_id,
			"rowtypet_name":rowtypet_name,
			"resources_id":resources_id};
	manager.reload(1);

	/*$.ajax({
		url : '../drawDrawType/findAllAjax',
		type : "POST",
		async : true,
		data : {

		},
		success : function(data) {
			cancelTypelayer();
			Data = {
				Rows : strToJson(data)
			};
			manager.loadData(Data);
		}
	});*/
}
function cancelTypelayer() {
	typeLayer.close();
}
// 关闭layer 刷新页面 因为要重新排序
function closeTypelayer() {
	reload();
	cancelTypelayer();
}

function viewMenuStr(id,event){
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/delete.png\">&nbsp;删除</a></div>";
	var xyObj = getMousePos(event);
	$("#modifyMenu").html(str).css({left:(xyObj.x-50) + "px", top:(xyObj.y+10)+"px"}).show();
	$(document).bind("mousedown",onBodyDown);
}
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).bind("mousedown",onBodyDown);
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


function getManage(){
	var draw_type_id= $("#draw_type_id").val();
	var rowtypet_name = $("#rowtypet_name").val();
	var resources_id=$("#resources_id").val();
	manager.options.parms = {
			"data_res_id":data_res_id,
			"data_res_name":data_res_id,
			"data_res_type_id":data_res_id
	};
	manager.reload(1);
}
