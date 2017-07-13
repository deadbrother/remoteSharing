var Data;
var typeLayer;
var manager;
$(function() {
	$("#form1").ligerForm();
	manager = $("#maingrid").ligerGrid(
		{
			columns : [
					/*
					 * { display: '序号', name: 'sort_num', align:
					 * 'center'},
					 */
					{
						display : '编号',
						name : 'res_type_id',
						align : 'center'
					},
					{
						display : '名称',
						name : 'res_type_name',
						align : 'center'
					},
					{
						display : '状态',
						name : 'stutas',
						align : 'center'
					},
					{
						display : '排序',
						align : 'center',
						render : function(rowdata, rowindex, value) {
							var h = "<div id="
									+ rowdata.res_type_id
									+ "><image  src='/epmwxwl/image/up.png'  style='cursor:pointer;width:12px;height:18px;' href=\"javascript:;\" onclick=\"up('"
									+ rowdata.res_type_id
									+ "')\" /><image  style='cursor:pointer;width:12px;height:18px;' src='/epmwxwl/image/down.png' onclick=\"down('"
									+ rowdata.res_type_id
									+ "')\" /> </div>";
							return h;
						}
					},
					{
						display : '操作',
						align : 'center',
						render : function(rowdata, rowindex, value) {
							id = rowdata.res_type_id;
							var h = "<div id=\"divexecute_"
									+ id
									+ "\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"
									+ id
									+ "',event)\" src=\"/epmwxwl/image/menu-arrow.png\"></div>";
							return h;
						}
					} ],
			isScroll : false,
			 url : '../resRuleType/listAjax',
			checkbox : false,
			rownumbers : false,
			usePager : true,
			width:'97%'
		});

	
	// 新增类型
	$("#addType").click(function() {
		typeLayer = $.ligerDialog.open({
			title : '类型',
			url : '../resRuleType/saveJsp',
			height : 300,
			isResize : true,
		});
	});
	//查询
	$("#search-btn").click(function() {
		reload();
	});
});
// 操作
function viewMenuStr(id, event) {
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"
			+ id
			+ "')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"
			+ id
			+ "')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/delete.png\">&nbsp;删除</a></div>";
	var xyObj = getMousePos(event);
	$("#modifyMenu").html(str).css({
		left : (xyObj.x - 50) + "px",
		top : (xyObj.y + 10) + "px"
	}).show();
	$(document).bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "modifyMenu"|| $(event.target).parents("#modifyMenu").length > 0 || event.target.id == "runGz")) {
		hideMenu();
	}
}
function getMousePos(event) {
	var e = event || window.event;
	var scrollX = document.documentElement.scrollLeft
			|| document.body.scrollLeft;
	var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
	var x = e.pageX || e.clientX + scrollX;
	var y = e.pageY || e.clientY + scrollY;
	return {
		'x' : x,
		'y' : y
	};
}
// 升序
function up(res_type_id) {
	var res_type_name=$("#res_type_name").val();
	var stutas=$("#stutas").val();
	if("NULL"==stutas){
		stutas="";
	}
	$.ajax({
		url : '../resRuleType/exchangeWithUp',
		type : "POST",
		async : true,
		data : {
			"res_type_id":res_type_id,
			"res_type_name":res_type_name,
			"stutas":stutas
		},
		success : function(data) {
			if (data == "success") {
				reload();
			} else if (data == "first") {
				alert("当前类型已经位于首位");
			} else {
				alert("升序失败");
			}
		}
	});
}
// 降序
function down(res_type_id) {
	var res_type_name=$("#res_type_name").val();
	var stutas=$("#stutas").val();
	if("NULL"==stutas){
		stutas="";
	}
	$.ajax({
		url : '../resRuleType/exchangeWithDown',
		type : "POST",
		async : true,
		data : {
			"res_type_id":res_type_id,
			"res_type_name":res_type_name,
			"stutas":stutas
		},
		success : function(data) {
			if (data == "success") {
				reload();
			} else if (data == "last") {
				alert("当前类型已经位于末尾");
			} else {
				alert("升序失败");
			}
		}
	});
}
// 修改类型
function updateType(res_type_id) {
	typeLayer = $.ligerDialog.open({
		title : '类型',
		url : '../resRuleType/updateJsp/' + res_type_id,
		height : 300,
		isResize : true,
	});
}
// 关闭layer 刷新页面 因为要重新排序
function closeTypelayer() {
	reload();
	// manager.addRow();
	cancelTypelayer();
}
// 关闭layer 取消按钮
function cancelTypelayer() {
	// layer.close(typeLayer);
	typeLayer.close();
}
// 删除选中的类型
function deleteType(res_type_id) {
	$.ajax({
		url : '../resRuleType/delete',
		type : "POST",
		async : true,
		data : {
			"res_type_id" : res_type_id
		},
		success : function(data) {
			if (data == "success") {
				manager.deleteSelectedRow();
			} else {
				alert("删除失败");
			}
		}
	});
}
// 重新加载数据
function reload() {
	var res_type_id=$("#res_type_id").val();
	var res_type_name=$("#res_type_name").val();
	var stutas=$("#stutas").val();
	if("NULL"==stutas){
		stutas="";
	}
	manager.options.parms = {
			"res_type_id":res_type_id,
			"res_type_name":res_type_name,
			"stutas":stutas
	};
	manager.reload(1);
}