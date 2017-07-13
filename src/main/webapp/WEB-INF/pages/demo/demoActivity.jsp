<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css"rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/utils/common.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/demos/grid/CustomersData.js" type="text/javascript"></script>
<body>
<script type="text/javascript">
/* $(function(){
	$.ajax({
		url : "formReturnTest",
		type : "GET",
		async : true,
		success : function(data) {
			alert(data.res_id);
		}
	});
}); */
$(function(){
	$("#delete").click(function(){
		$.ajax({
			url : "demoDelete",
			type : "GET",
			async : true,
			data:{
				activityId:1000000,
			},
			success : function(data) {
				alert(data);
			}
		});
	});
})

</script>
form成功

</body>
</html>
