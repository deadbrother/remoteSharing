var sta="${res.data_res_type_id}";
$(function ()
{
	$("#confirm").click(function() {
		
		var data_res_type_id = $("#id").val();
		var res_type = $("#res_type").val();
		var data_res_type_name=$("#data_res_type_name").val();
		var data_stutas=$("#data_stutas").val();
		var data_driver=$("#data_driver").val();
		
		$.ajax({
			url:  action,
			type: "POST",
			async: true,
			data: 
			{
				"data_res_type_id":data_res_type_id,
				"res_type":res_type,
				"data_res_type_name":data_res_type_name,
				"data_stutas":data_stutas,
				"sort_num":sort_num,
				"tenant_id":tenant_id,
				"resume":resume,
				"data_driver":data_driver
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
	$("#cancel").click(function() {
		parent.hideMenu();
		parent.cancelTypelayer();
	});
});