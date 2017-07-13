$(function() {
	$("#form1").ligerForm(); 
	var id = $("#draw_type_id").val();
	var action;
	if (id != null && id != "") {
		action = "/epmwxwl/drawDrawType/doupdate";
	} else {
		action = "/epmwxwl/drawDrawType/doadd";
	}

	$("#confirm").click(function() {
		draw_type_id = $("#draw_type_id").val();
		rowtypet_name = $("#rowtypet_name").val();
		resources_id = $("#resources_id").val();
		resp_id = $("#resp_id").val();
		resume = $("#resume").val();
		stutas = $("#stutas").val();
		sort_num = $("#sort_num").val();
		/*
		 * $.ajax1({ url :action, type:"POST", async:true, data:{ "draw_type_id"
		 * :draw_type_id }, success:function("success") { alert("类型ID已存在！！！")
		 * }else{ } })
		 */
		$.ajax({
			url : action,
			type : "POST",
			async : true,
			data : {
				"draw_type_id" : draw_type_id,
				"rowtypet_name" : rowtypet_name,
				"resources_id" : resources_id,
				"resp_id" : resp_id,
				"resume" : resume,
				"stutas" : stutas,
				"sort_num" : sort_num
			},
			success : function(data) {
				if (data == "success") {
					parent.hideMenu();
					parent.closeTypelayer();
				} else {
					if (data == "error") {
						alert("类型ID已存在！！！")
					} else {
						alert("修改失败！！！");
					}

				}
			}
		});
	});

	function close() {
		parent.$.ligerDialog.close();
		parent.$(".l-dialog,.l-window-mask").remove();
	}
	$("#cancel").click(function() {
		parent.hideMenu();
		parent.closeTypelayer();
	});
});
