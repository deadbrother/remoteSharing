
function change(str) {
	document.getElementById("sort").value = str.replace(/\D/gi, "");
}

var sta="${res.stutas}";
$(function ()
{
	$("#confirm").click(function() {
		res_type_id = $("#id").val();
		res_type_name = $("#res_type_name").val();
		str=$("#sort").val();
		stutas=$("#stutas").val();
		$.ajax({
			url:  action,
			type: "POST",
			async: true,
			data: 
			{
				"res_type_id":res_type_id,
				"res_type_name":res_type_name,
				"sort_num":str,
				"stutas":stutas,
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
