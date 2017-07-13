$(function ()
{
	$("#confirm").click(function() {
		entity_id = $("#id").val();
		entity_name = $("#entity_name").val();
		entity_table=$("#entity_table").val();
		data_res_id=$("#data_res_id").val();
		entity_resume=$("#entity_resume").val();
		entity_table = $.trim(entity_table);
		 
		if(data_res_id=='Null'||entity_table.length==0){
			alert("表名和数据源不能为空");
		}else{	
			$.ajax({
				url:  action,
				type: "POST",
				async: true,
				data: 
				{
					"entity_id":entity_id,
					"entity_name":entity_name,
					"entity_table":entity_table,
					"data_res_id":data_res_id,
					"entity_resume":entity_resume
				},
				success: function(data) 
				{
					if(data=="success")
					{
						parent.hideMenu();
						parent.closeTypelayer();
					}else{
						alert("操作失败,请您核对表名和数据源");
					}
				}
			}); 
		}
		
	});
	$("#cancel").click(function() {
		parent.hideMenu();
		parent.cancelTypelayer();
	});
});
