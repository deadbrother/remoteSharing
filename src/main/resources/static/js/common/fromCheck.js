
function commonFromCheck(){
	// 判断input输入框空值,长度大小限制。
	$("input[check_empty]").each(function() {
		var check_name = $(this).attr("check_name");
		var check_size = $(this).attr("check_size");
		var minLength = check_size.split(",")[0];// 文本允许的最短长度
		var maxLength = check_size.split(",")[1];// 文本允许的最长长度
		var objVal = $(this).val().trim();
		if (objVal == "" || objVal == null) {
			alert(check_name + "不能为空");
			return;
		}
		if (objVal.length < minLength) {
			alert(check_name + "的长度不能小于" + minLength);
			return;
		} else if (objVal.length > maxLength) {
			alert(check_name + "的长度不能大于" + maxLength);
			return;
		}
	});
	
	
	// 验证选择框必须选择
	$("select[check_select]").each(function(){
		var obj=$(this).val();
		var check_name = $(this).attr("check_name");
		if(obj==-1){
			alert("请选择"+check_name);
			return 
		}
	});
}



