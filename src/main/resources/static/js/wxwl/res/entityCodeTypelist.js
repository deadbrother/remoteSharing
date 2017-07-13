$(function() {
	$("#form1").ligerForm({
		inputWidth : 200
	});
		manager = $("#maingrid").ligerGrid(
						{
							columns : [
									{ display : '编号',name : 'sort_num',align : 'center'},
									{ display : '码表类型名称',name : 'code_type_name',align : 'center'},
									{ display : '类型说明',name : 'code_type_desc',align : 'center'},
									{ display : '排序设置',align : 'center',render : function(rowdata, rowindex,value)
												{
											var h = "<div id="+rowdata.code_type_id+"><image  src='../image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"up('"
													+ rowdata.code_type_id
													+ "')\" /><image  style='cursor:pointer' src='../image/down.png' onclick=\"down('"
													+ rowdata.code_type_id
													+ "')\" /> </div>";
											return h;
										}
									},
									{
										display : '操作',
										align : 'center',
										render : function(rowdata, rowindex,
												value) {
											 id = rowdata.code_type_id;
											var h = "<div id=\"divexecute_"+id+"\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"
													+ id
													+ "',event)\" src=\"../image/menu-arrow.png\"></div>";

											return h;
										}
									} ],
							isScroll : false,
							url : '../entityCode/findAllAjax',
							checkbox : false,
							rownumbers : false,
							usePager : true
						});
		// 新增
		$("#addbutton").click(function() {
			typeLayer = $.ligerDialog.open({
				title : '类型',
				url : '../entityCode/addJsp',
				width : 300,
				height : 300,
				isResize : true,
			});
		});
		//查询
		$("#search-tool-btn").click(function(){
			reload();
		});

	});
	//操作
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
		var scrollX = document.documentElement.scrollLeft
				|| document.body.scrollLeft;
		var scrollY = document.documentElement.scrollTop
				|| document.body.scrollTop;
		var x = e.pageX || e.clientX + scrollX;
		var y = e.pageY || e.clientY + scrollY;
		console.log(y);
		return {
			'x' : x,
			'y' : y
		};
	}
	//修改类型
	function updateType(code_type_id) {
		typeLayer = $.ligerDialog.open({
			title : '码表类型',
			url : '../entityCode/updateJsp/'
					+ code_type_id,
			width : 300,
			height : 300,
			isResize : true,
		});
	}
	//删除选中的类型
	function deleteType(code_type_id) {
		$.ajax({
			url : '../entityCode/delete/'
					+ code_type_id,
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
	//刷新页面
	function reload() {
		var code_type_name=$("#code_type_name").val();
		code_type_name = code_type_name!=null?code_type_name:"";
		manager.options.page = 1 ;
		manager.options.parms = {"code_type_name":code_type_name};
		manager.reload(1);
	}
	//升序
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
	//降序
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
	//关闭layer 取消按钮
	function cancelTypelayer() {
		typeLayer.close();
	}
	//关闭 刷新页面  因为要重新排序
	function closeTypelayer() {
		reload();
		cancelTypelayer();
	}
