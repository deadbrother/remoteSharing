$(function ()
{
	$("#confirm").click(function() {
		var code_type_id = $("#code_type_id").val();
		var code_sql = $("#code_sql").val();
		$.ajax({
			url:  "/epmwxwl/entityField/update2",
			type: "POST",
			async: true,
			data: 
			{
				"field_id":field_id,
				"code_type_id":code_type_id,
				"code_sql":code_sql
			},
			success: function(data) 
			{
				if(data=="success")
				{
					parent.hideMenu();
					parent.cancelTypelayer();
				}else{
					alert("操作失败");
				}
			}
		}); 
	});
	
	$("#cancel").click(function() {
		parent.hideMenu();
		parent.cancelTypelayer();
	});
	
})