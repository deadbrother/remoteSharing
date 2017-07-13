<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="../js/lib/jquery/jquery.min.js" type="text/javascript"></script>
</head>
<body>
	
	<form name="previewChannelBussiness" id="previewChannelBussiness"  method="POST" onsubmit="channelpre()">
		<input type="hidden" name="typeName" value=""/>
		<input type="hidden" name="CI_WEIGHT_DES" value=""/>
		<input type="hidden" name="TARGET" value=""/>
		<input type="hidden" name="path" value=""/>
		<input type="hidden" name="TALK" value=""/>
	</form>

</body>
</html>
<script type="text/javascript">
$(function(){
	$('input[name="typeName"]').val(parent.$("#inputEmail3").val());
	$('input[name="CI_WEIGHT_DES"]').val(parent.$("#inputEmail3").val());
	$('input[name="TARGET"]').val(parent.$("#TARGET").val());
	$('input[name="TALK"]').val(parent.$("#TALK").val());
	$("#previewChannelBussiness").attr("action","/"+parent.services.xbuilderoracle+"/pages/workbench/GuideRecommend/GuideRecommend.jsp");	
	$("#previewChannelBussiness").submit();	
});
function channelpre(){
	$('input[name="typeName"]').val(parent.$("#inputEmail3").val());
	$('input[name="CI_WEIGHT_DES"]').val(parent.$("#inputEmail3").val());
	$('input[name="TARGET"]').val(parent.$("#TARGET").val());
	$('input[name="TALK"]').val(parent.$("#TALK").val());
}
</script>