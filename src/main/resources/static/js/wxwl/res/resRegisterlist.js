$(function() {
		$("#form1").ligerForm({
			inputWidth : 200
		});
		manager = $("#maingrid").ligerGrid({
			columns : [
					{
						display : '编号',
						name : 'sort_num',
						align : 'center'
					},
					{
						display : '资源名称',
						name : 'res_name',
						align : 'center'
					},
					{
						display : '资源说明',
						name : 'res_resume',
						align : 'center'
					},
					{
						display : '状态',
						name : 'stutas',
						align : 'center'
					},
					{
						display : '排序设置',
						align : 'center',
						render : function(rowdata, rowindex,
								value) {
							var h = "<div id="+rowdata.res_id+"><image  src='../image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"up('"
									+ rowdata.res_id
									+ "')\" /><image  style='cursor:pointer' src='../image/down.png' onclick=\"down('"
									+ rowdata.res_id
									+ "')\" /> </div>";
							return h;
						}
					},
					{
						display : '操作',
						align : 'center',
						render : function(rowdata, rowindex,
								value) {
							id = rowdata.data_res_id;
							var h = "<div id=\"divexecute_"+rowdata.res_id+"\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"
									+ rowdata.res_id
									+ "',event)\" src=\"../image/menu-arrow.png\"></div>";

							return h;
						}
					} ],
			isScroll : false,
			url : '../resRegister/findAllAjax',
			checkbox : false,
			rownumbers : false,
			usePager : true
		});
		// 注册
		$("#registerbut").click(function() {
			typeLayer = $.ligerDialog.open({
				title : '类型',
				url : '../resRegister/registerJsp',
				width : 800,
				height : 500,
				isResize : true,
			});
		});
		//查询
		$("#search-btn").click(function() {
			reload();
		}) 
		//下拉列表  单选
		stutas = $("#stutas").ligerComboBox({
			data : [ {
				text : '启用',
				id : '0'
			}, {
				text : '停用',
				id : '1'
			}],
			resize : true,
			width : 200,
			valueFieldID : 'test3',
			onSelected : function(value, text) {
				//alert(text);//默认选中值
			}
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
		str += "<div style='height:25px;'><a href=\"../resEntityField/list/"+id+"\" style=\"line-height:0;\"><image src=\"../image/setting.png\">&nbsp;字段设置</a></div>";
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
		var scrollY = document.documentElement.scrollTop
				|| document.body.scrollTop;
		var x = e.pageX || e.clientX + scrollX;
		var y = e.pageY || e.clientY + scrollY;
		return {
			'x' : x,
			'y' : y
		};
	}
	//升序
	function up(res_id) {
		$.ajax({
			url : '../resRegister/exchangeWithUp',
			type : "POST",
			async : true,
			data : {
				"res_id" : res_id
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
	function down(res_id) {
		$.ajax({
			url : '../resRegister/exchangeWithDown',
			type : "POST",
			async : true,
			data : {
				"res_id" : res_id
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

	function reload() {
		var res_name = $("#res_name").val();
		res_name = res_name!=null?res_name:"";
		var res_resume = $("#res_resume").val();
		res_resume = res_resume!=null?res_resume:"";
		var stutas = $("#test3").val();
		stutas = stutas!=null?stutas:"";
		manager.options.parms = {
				"res_name" : res_name,
				"res_resume" : res_resume,
				"stutas" : stutas,
			};
		
		manager.reload(1);
		
	}
	//修改类型
	function updateType(res_id) {
		typeLayer = $.ligerDialog.open({
			title : '类型',
			url : '../resRegister/updateJsp/'+ res_id,
			width : 800,
			height : 500,
			isResize : true,
		});
	}
	//删除选中的类型
	function deleteType(res_id) {
		$.ajax({
			url : '../resRegister/delete/'
					+ res_id,
			type : "GET",
			async : true,
			success : function(data) {
				if (data == "success") {
					hideMenu();
					manager.deleteSelectedRow();
				} else {
					alert("删除失败");
				}
			}
		});
	}

	//关闭 取消按钮
	function cancelTypelayer() {
		typeLayer.close();
	}

	//关闭 刷新页面  因为要重新排序
	function closeTypelayer() {
		reload();
		cancelTypelayer();
	}