$(function(){
	$("#cancel").click(function() {
		parent.hideMenu();
		parent.cancelTypelayer();
	});
	$("#confirm").click(function() {
		code_type_name=$("#code_type_name").val();
		code_type_desc=$("#code_type_desc").val(); 
		$.ajax({
			url:  action,
			type: "POST",
			async: true,
			data: 
			{
				"code_type_id":code_type_id,
				"sort_num":sort_num,
				"code_type_name":code_type_name,
				"code_type_desc":code_type_desc,
				"tenant_id":tenant_id,
			},
			success: function(data) 
			{
				if(data=="success")
				{
					parent.hideMenu();
					parent.closeTypelayer();
				}else{
					alert("该编号已经存在,请您换个编号");
				}
			}
		}); 
	});
});