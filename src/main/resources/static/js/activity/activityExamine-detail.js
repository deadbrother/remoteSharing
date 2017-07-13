$(function() {
	/*$("#form2").ligerForm({
		inputWidth : 200
	});
		manager = $("#examineid").ligerGrid(
						{
							columns : [
									{ display : '活动名称',name : 'activityDailyName',align : 'center'},
									{ display : '活动分类',name : 'activityTypeName',align : 'center'},
									{ display : '活动行政级别',name : 'orgLevel',align : 'center'},
									{ display : '活动周期222',name : 'activityCycle',align : 'center',render: function (rowdata, rowindex, value){
										if(value="1"){
											return "月";
										}else if(value="2"){
											return "日";
										}else if(value="3"){
											return "常规";
										}else{
											return "其他";
										}
									}},
									{ display : '活动状态',name : 'state',align : 'center',render: function (rowdata, rowindex, value){
										if (value == "9"||value=="1") {
											return "启用";
										} else if(value == "10"){
											return "驳回";
										} else if(value == "11"){
											return "暂停";
										} else if(value == "12"){
											return "暂存";
										} else if(value == "13"){
											return "审批中";
										} else{
											return "停用";
										} 
						        	  }},
									{ display : '组织机构',name : 'orgRange',align : 'center'},
									{ display : '创建人',name : 'createUserName',align : 'center'},
									{ display : '排序设置',align : 'center',render : function(rowdata, rowindex,value)
												{
											var h = "<div id="+rowdata.code_type_id+"><image  src='../image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"up('"
													+ rowdata.code_type_id
													+ "')\" /><image  style='cursor:pointer' src='../image/down.png' onclick=\"down('"
													+ rowdata.code_type_id
													+ "')\" /> </div>";
											return h;
										}
									}
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
							url : '../activityExamine/main',
							checkbox : true,
							rownumbers : false,
							usePager : true
						});
		// 通过
*/		$("#pass-tool-btn").click(function() {
		var idAgree=$("#idAgree").val();
		var remark=$("#remark").val();
		if(remark.length < 900){
			jQuery.ligerDialog.confirm('请确认是否要审批通过？', function (confirm) {
            if (confirm){
			$.ajax({
				url : "../activityExamine/pass",
				type : "POST",
				data : {"po.activityId":idAgree,
				        "activityExecuteInfo.remark":remark},
				async : false,
				success : function(data) {
					location.href="../activityExamine/list";
					/*if(top.openTab==undefined){
						location.href="../activityExamine/list";
					}else{
						top.openTab("活动审批","/clyxactivity/activityExamine/list");
						top.closeTab("活动审批","活动列表",true);
						$.ajax({
							url : "/portal/rest/menus/menuinfo/clyx_examine",
							type : "GET",
							async : false,
				            success : function(data) {
									top.openTab(data.menuName,"clyxactivity/activity/main");
									top.closeTab(undefined,data.menuName,true);
							}
				        });
					}*/
				}
			});
          }else{
        	return;  
          }
          });
		}else{
			$.ligerDialog.warn("您输入的审批意见过长(大于900),请减少内容重新输入!");
		}
		
		//location.href = "../activityExamine/pass?po.activityId="+idAgree+"&activityExecuteInfo.remark="+remark;

		});
		//不通过
		$("#nopass-tool-btn").click(function(){
			var idAgree=$("#idAgree").val();
			var remark=$("#remark").val();
			if(remark.length < 900){
				jQuery.ligerDialog.confirm('请确认是否要驳回此活动？', function (confirm) {
		        if (confirm){
				$.ajax({
					url : "../activityExamine/nopass",
					type : "POST",
					data : {"po.activityId":idAgree,
					        "activityExecuteInfo.remark":remark},
					async : false,
					success : function(data) {
						location.href="../activityExamine/list";
						/*if(top.openTab==undefined){
							location.href="../activityExamine/list";
						}else{
							top.openTab("活动列表","/clyxactivity/activity/main");
							top.closeTab("活动审批","活动列表",true);
							$.ajax({
								url : "/portal/rest/menus/menuinfo/clyx_examine",
								type : "GET",
								async : false,
					            success : function(data) {
										top.openTab(data.menuName,"clyxactivity/activity/main");
										top.closeTab(undefined,data.menuName,true);
								}
					        });
						}*/
						
					}
				});
		        }else{
		        	return;
		        	}
		        });
			}else{
				$.ligerDialog.warn("您输入的审批意见过长(大于900),请减少内容重新输入!");
			}
			
			//location.href = "../activityExamine/pass?po.activityId="+idAgree+"&activityExecuteInfo.remark="+remark;

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
					$.ligerDialog.warn("删除失败");
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
							$.ligerDialog.warn("当前类型已经位于首位");
						} else {
							$.ligerDialog.warn("升序失败");
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
							$.ligerDialog.warn("当前类型已经位于末尾");
						} else {
							$.ligerDialog.warn("降序失败");
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
