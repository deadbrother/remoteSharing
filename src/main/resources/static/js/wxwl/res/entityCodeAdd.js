var typeTreeSetting = "";
$(function() {

	$("#confirm").click(function() {
		var code_type_id = $("#code_type_id").val();
		if (code_type_id == "NULL") {
			code_type_id = '';
		}
		var code_name = $("#code_name").val();
		var code_desc = $("#code_desc").val();
		var parent_id = $("#parentTree").val();
		$.ajax({
			url : action,
			type : "POST",
			async : true,
			data : {
				"code_type_id" : code_type_id,
				"code_name" : code_name,
				"code_desc" : code_desc,
				"parent_id" : parent_id,
				"tenant_id" : tenant_id,
				"sort_num" : sort_num,
				"code_id" : code_id
			},
			success : function(data) {
				if (data == "success") {
					parent.hideMenu();
					parent.closeTypelayer();
				} else {
					alert("操作失败");
				}
			}
		});
	});

	$("#cancel").click(function() {
		parent.hideMenu();
		parent.cancelTypelayer();
	});
	var g = $("#parentTree").ligerComboBox();
	$("#parentTree").click(function(){
		$(".ztree").show();
	})
	

	typeTreeSetting = {
		data : {
			simpleData : {
				enable : true,
				idKey : 'code_id',
				pIdKey : 'parent_id'
			},
			key : {
				name : 'code_name',
				title : "code_name"
			},
			keep : {
				parent : true,
				leaf : true
			}
		},
		edit : {
			enable : false,
		},
		view : {
			showLine : false,

		},

		async : {
			enable : true,
			type : 'post',
			autoParam : [ "code_id" ],
			url : contextPath + '/entityCodeMessage/findCodeTree',
			dataFilter : null
		},
		callback: {
			onDblClick:  function(event, treeId, treeNode) {
				$("#parentTree").val(treeNode.code_name);
			}
		
		}
	};

	$.fn.zTree.init($("#typeTree"), typeTreeSetting);
	zTree = $.fn.zTree.getZTreeObj("typeTree");
	rMenu = $("#rMenu");

});

