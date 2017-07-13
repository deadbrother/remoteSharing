$(function() {
	manager = $("#Policy").ligerGrid({
		columns : [ {
			display : '政策名称',
			name : 'policyName',
			align : 'left',
			width : '33%'
		}, {
			display : '政策类型',
			name : 'policyClassName',
			align : 'left',
			width : '17%'
		}, {
			display : '开始时间',
			name : 'startTime',
			align : 'center',
			width : '15%'
		}, {
			display : '创建人',
			name : 'createUserName',
			align : 'center',
			width : '20%'
		},  {
			id : 'policyId',
			name : 'policyId',
			hide : 'hide'
		},{
			display : '创建时间',
			name : 'createTime',
			align : 'center',
			width : '20%',
			render : function(rowdata, rowindex, value) {
				return format(value, "yyyy-MM-dd HH:mm:ss");
			}
		} ],
		isScroll : false,
		url : '../activityPolicy/list',
		method : 'post',
	    dataAction: 'local', 
		pageSize :10,
		checkbox : true,
		fixedCellHeight : false,
		rownumbers : false,
		usePager : true,
		onSelectRow : cwc,
		width : '95%'
	});
	function cwc(rowdata, rowid, rowobj) {
	}

	$("#details-tool-btn").click(function() {
		// 获取政策选中的政策id
		var inputIds = document.getElementsByName("policyId");
		var id = "";
		var seletedNum = 0;
		alert($(".l-selected").find("td:eq(4)>div").html() + "-----");
		$(".l-selected").find("td:eq(4)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html();
			} else {
				id = $(this).html().trim();
			}
			seletedNum++;
		});
		if (seletedNum != 1) {
			alert("请选择一项进行查看！");
			return;
		}location.href="../activityPolicy/detail?po.policyId="+id;
	});
	/*
	 * // 审批 $("#examinebutton").click(function() { var
	 * userGroupId=$('.active').find("td:eq(12)").html().trim(); var userGroupId =
	 * $('.l-selected') .find("td:eq(12)>div").html(); var
	 * examineDetail=$("#examineDetail").val(); var id= ""; var seletedNum = 0;
	 * var parentId = $(".l-selected").find("td:eq(11)>div") .html();
	 * $(".l-selected").find("td:eq(10)>div").each(function() { if (id != "") {
	 * id = id + "," + $(this).html().trim(); } else { id =
	 * $(this).html().trim(); } seletedNum++; }); if (seletedNum != 1) {
	 * alert("请选择一项进行审批！"); return; } location.href=
	 * "../activityExamine/examine?po.activityId="+id + "&po.userGroupId=" +
	 * userGroupId + "&po.examineDetailCheck=" +examineDetail; });
	 */

	// 查询
	$("#search-tool-btn").click(function() {
		reload();
	});

});
// 操作
function viewMenuStr(id, event) {
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"
			+ id
			+ "')\" style=\"line-height:0;\"><image src=\"../image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"
			+ id
			+ "')\" style=\"line-height:0;\"><image src=\"../image/delete.png\">&nbsp;删除</a></div>";
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
	if (!(event.target.id == "modifyMenu"
			|| $(event.target).parents("#modifyMenu").length > 0 || event.target.id == "runGz")) {
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
// 修改类型
function updateType(code_type_id) {
	typeLayer = $.ligerDialog.open({
		title : '码表类型',
		url : '../entityCode/updateJsp/' + code_type_id,
		width : 300,
		height : 300,
		isResize : true,
	});
}
// 删除选中的类型
function deleteType(code_type_id) {
	$.ajax({
		url : '../entityCode/delete/' + code_type_id,
		type : "GET",
		async : true,
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
// 刷新页面
function reload() {
	var policyName = $("#policyName").val();
	policyName = policyName != null ? policyName : "";
	manager.options.page = 1;
	manager.options.parms = {
		"policyName" : policyName
	};
	manager.reload(1);
}
// 升序
function up(code_type_id) {
	$.ajax({
		url : '../entityCode/exchangeWithUp',
		type : "POST",
		async : true,
		data : {
			"code_type_id" : code_type_id
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
function down(code_type_id) {
	$.ajax({
		url : '../entityCode/exchangeWithDown',
		type : "POST",
		async : true,
		data : {
			"code_type_id" : code_type_id
		},
		success : function(data) {
			if (data == "success") {
				reload();
			} else if (data == "last") {
				alert("当前类型已经位于末尾");
			} else {
				alert("降序失败");
			}
		}
	});
}
// 关闭layer 取消按钮
function cancelTypelayer() {
	typeLayer.close();
}
// 关闭 刷新页面 因为要重新排序
function closeTypelayer() {
	reload();
	cancelTypelayer();
}
function dd(){
	alert("sb");
}

var format = function(time, format) {
	var t = new Date(time);
	var tf = function(i) {
		return (i < 10 ? '0' : '') + i
	};
	return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a) {
		switch (a) {
		case 'yyyy':
			return tf(t.getFullYear());
			break;
		case 'MM':
			return tf(t.getMonth() + 1);
			break;
		case 'mm':
			return tf(t.getMinutes());
			break;
		case 'dd':
			return tf(t.getDate());
			break;
		case 'HH':
			return tf(t.getHours());
			break;
		case 'ss':
			return tf(t.getSeconds());
			break;
		}
	});
};
