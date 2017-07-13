var manager;
$(function() {
	manager = $("#Policy").ligerGrid({
		columns : [ {
			display : '政策名称',
			name : 'policyName',
			align : 'left',
			width : '20%'
		}, {
			display : '政策类型',
			name : 'policyClassName',
			align : 'center',
			width : '20%'
		}, {
			display : '开始时间',
			name : 'startTime',
			align : 'center',
			width : '20%'
		}, {
			display : '创建人',
			name : 'createUserName',
			align : 'left',
			width : '20%'
		}, {
			id : 'policyId',
			name : 'policyId',
			hide : 'hide'
		}, {
			display : '创建时间',
			name : 'createTime',
			align : 'center',
			width : '20%',
			render : function(rowdata, rowindex, value) {
				return format(value, "yyyy-MM-dd HH:mm:ss");		
			}
		} ,{
			display : '创建组织机构',
			name : 'createUserOrgPath',
			hide : 'hide'
		},],
		isScroll : false,
		url : '../activityPolicy/list',
		method : 'post',
		pageSize : 5,
		checkbox : true,
		fixedCellHeight : false,
		pageSizeOptions : [ 3, 4, 5, 6, 7 ],
		rownumbers : false,
		usePager : true,
		onSelectRow : cwc,
		enabledSort:false,
		width : '95%'
	});
	function cwc(rowdata, rowid, rowobj) {
	}
	/**
	 * 添加
	 */

	$("#add-tool-btn").click(function() {
		location.href = "../activityPolicy/add";
	});
    /**
     * 删除
     */
	$("#delete-tool-btn").click(function() {
		var ids = "";
		var seletedNum = 0;
			$(".l-selected").find("td:eq(4)>div").each(function() {
				if (ids != "") {
					ids = ids + "," + $(this).html();
				} else {
					ids = $(this).html();
				}
				seletedNum++;
			});
		if (seletedNum == 0) {
			$.ligerDialog.warn("至少选择一条再进行删除！");
			return;
		}
		jQuery.ligerDialog.confirm('请确认是否真要删除所选择的政策？', function(confirm) {
			if (confirm) {
				var isOk = 0;
				$(".l-selected").find("td:eq(6)>div").each(function() {
					var loginUserOrgpath = $('input[name="loginUserOrgPath"]').val();
					//var thisVal = $(this).html();	
					if($(this).html() != loginUserOrgpath){
						isOk++;
					}
				})
				if(isOk != 0){
					$.ligerDialog.warn("您选择的政策没有删除权限");
					return;
				}else{
					var deleteUrl = "../activityPolicy/delete";
					$.ajax({
						url : deleteUrl,
						type : "POST",
						async : false,
						data : {
							"ids" : ids
						},
						success : function(data) {
							if (data=="1") {
								$.ligerDialog.warn("删除成功");
								manager.reload(1);
							}else if(data=="2") {
								$.ligerDialog.warn("删除失败，选择的某项政策与活动关联");
							}else if(data=="3"){
								$.ligerDialog.warn("删除过程中出现异常，请联系管理员");
							}
							
						}
					});	
				}
			} else {
				return;
			}
		});
	});
	/**
	 * 修改
	 */
	$("#modify-tool-btn").click(function() {
		var id = "";
		var seletedNum = 0;
		$(".l-selected").find("td:eq(4)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html();
			} else {
				id = $(this).html();
			}
			seletedNum++;
		});
		if (seletedNum != 1) {
			$.ligerDialog.warn("请选择一项进行修改！");
			return;
		}
		var isOk = 0;
		$(".l-selected").find("td:eq(6)>div").each(function() {
			var loginUserOrgpath = $('input[name="loginUserOrgPath"]').val();
			//var thisVal = $(this).html();	
			if($(this).html() != loginUserOrgpath){
				isOk++;
			}
		})
		if(isOk != 0){
			$.ligerDialog.warn("您选择的政策没有修改权限");
			return;
		}else{
		location.href = "../activityPolicy/modify?po.policyId=" + id;
		}
	})
	/**
	 * 查看详情
	 */
	$("#details-tool-btn").click(function() {
		// 获取政策选中的政策id
		var id = "";
		var seletedNum = 0;
		$(".l-selected").find("td:eq(4)>div").each(function() {
			if (id != "") {
				id = id + "," + $(this).html();
			} else {
				id = $(this).html();
			}
			seletedNum++;
		});
		if (seletedNum != 1) {
			$.ligerDialog.warn("请选择一项进行查看！");
			return;
		}
		location.href = "../activityPolicy/detail?po.policyId=" + id;
	});
	// 查询
	$("#search-tool-btn").click(function() {
		reload();
	});

});

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
				$.ligerDialog.warn("当前类型已经位于首位");
			} else {
				$.ligerDialog.warn("升序失败");
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
				$.ligerDialog.warn("当前类型已经位于末尾");
			} else {
				$.ligerDialog.warn("降序失败");
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
	})
}