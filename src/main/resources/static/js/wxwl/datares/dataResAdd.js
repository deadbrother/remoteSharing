$(function(){
	var data_res_id = $("#data_res_id").val();
	var action;
	var trs1 = document.getElementById("tenant_id"); 
	var trs2 = document.getElementById("data_res_id_tr");  
	if(data_res_id!=""&&data_res_id!=null){
		trs2.style.display="none";
		action = "/epmwxwl/dataRes/update";
	}else{
		trs1.style.display="none";
		action = "/epmwxwl/dataRes/save";
	}
	$("#addForm").ligerForm();
	$("#dataType").ligerComboBox();
	$("#data_status").ligerComboBox();
	
	$("#addBtn").click(function() {
		data_res_id = $("#data_res_id").val();
		data_res_name = $("#data_res_name").val();
		data_res_desc = $("#data_res_desc").val();
		data_res_type_id=$("#dataType").val();
		data_res_url = $("#data_res_url").val();
		resume = $("#resume").val();
		username = $("#username").val();
		password = $("#password").val();
		data_status = $("#data_status").val();
		sort_num = $("#sort_num").val();
		$.ajax({
			url:  action,
			type: "POST",
			async: false,
			data: 
			{
				"data_res_id":data_res_id,
				"data_res_name":data_res_name,
				"data_res_desc":data_res_desc,
				"data_res_type_id":data_res_type_id,
				"data_res_url":data_res_url,
				"resume":resume,
				"username":username,
				"password":password,
				"data_status":data_status,
				"sort_num":sort_num
			},
			success: function(data) 
			{   
				if(data=="success")
				{	
					parent.hideMenu();
					parent.closeTypelayer();
				}else if(data=="no"){
					alert("该编号已经存在,请您换个编号");
				}else{
					alert("添加失败");
				}
			},
			error:function(){
				alert("error");
			}
		}); 
	});
	function close(){
		parent.$.ligerDialog.close();
		parent.$(".l-dialog,.l-window-mask").remove();
	}
	$("#cancel").click(function() {
		parent.hideMenu();
		 close();
	});
	
	 
})