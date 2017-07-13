<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<link href="http://clyxys.bonc.yz/epmwxwl/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet" type="text/css" />
<script src="http://clyxys.bonc.yz/epmwxwl/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="http://clyxys.bonc.yz/epmwxwl/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="http://clyxys.bonc.yz/epmwxwl/js/wxwl/utils/common.js"></script>

<script type="text/javascript">
//layer弹窗
$(function(){
	$("#btn1").bind("click",function() {
		conditionObj.personCond("", function(sql, resume) {
			alert(sql);
			alert(resume);
		});
	});

});

</script>
</head>
<body>
<button class="l-button l-button-brand " id="btn1">layer弹窗</button>
</body>
</html>

