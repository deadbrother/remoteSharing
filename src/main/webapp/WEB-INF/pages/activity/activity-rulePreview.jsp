<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@include file="head-js-css.jsp" %>

</head>
<body>
	
	<form name="previewRule" id="previewRule"  method="POST">
		<input type="hidden" name="usergid" value=""/>
		<input type="hidden" name="ruleid" value=""/>
		<input type="hidden" name="rulesql" value=""/>
		<input type="hidden" name="tenantId" value=""/>
		<input type="hidden" name="path" value=""/>
		<input type="hidden" name="rulerange" value=""/>
		<input type="hidden" name="orgrange" value=""/>
	</form>

</body>
</html>
<script type="text/javascript">
$(function(){
	
	$('input[name="usergid"]').val($(window.opener.document).find("#userGroupId").val());
	$('input[name="ruleid"]').val($(window.opener.document).find("#newrule").val());
	$('input[name="rulesql"]').val($(window.opener.document).find("#FrontLineContent1Sql").val());
	$('input[name="tenantId"]').val($(window.opener.document).find('input[name="tenantid"]').val());
	$('input[name="path"]').val($(window.opener.document).find('input[name="orgPath"]').val());
	$('input[name="rulerange"]').val($(window.opener.document).find("#rulerange12").val());
	$('input[name="orgrange"]').val($(window.opener.document).find('input[name="orgrange12"]').val());
	$("#previewRule").attr("action","/"+services.epmwxwl+"/regionTree/list");	
	$("#previewRule").submit();	
});
</script>