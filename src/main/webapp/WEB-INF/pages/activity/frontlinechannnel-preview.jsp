<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1234556</title>
<script src="../js/lib/jquery/jquery.min.js" type="text/javascript"></script>
</head>
<body>
	
	<form name="previewFrontline" id="previewFrontline" action= method="POST" onsubmit="evalue()">
		<input type="hidden" name="ACTIVITY_NAME" value=""/>
		<input type="hidden" name="TYPE_NAME" value=""/>
		<input type="hidden" name="SUCCESS_NAME" value=""/>
		<input type="hidden" name="AWARD_DESC" value=""/>
		<input type="hidden" name="PRODUCT_NAME" value=""/>
		<input type="hidden" name="REFERRALS_INFO" value=""/>
		<input type="hidden" name="POLICY_DES" value=""/>
		<input type="hidden" name="MARKET_WORDS" value=""/>
		<input type="hidden" name="SMS_WORDS" value=""/>
		<input type="hidden" name="USERGROUP_FILTERCON" value=""/>
	</form>

</body>
</html>
<script type="text/javascript">
$(function(){
	$('input[name="ACTIVITY_NAME"]').val(parent.$("#inputEmail3").val());
	$('input[name="TYPE_NAME"]').val(parent.$("#successType option:selected").text());
	$('input[name="SUCCESS_NAME"]').val(parent.$("#successCondition").val());
	$('input[name="AWARD_DESC"]').val(parent.$("#desRules").val());
	$('input[name="PRODUCT_NAME"]').val(parent.$("#product_nameChoo").val());
	$('input[name="REFERRALS_INFO"]').val(parent.$("#REFERRALS_INFO").val());
	$('input[name="POLICY_DES"]').val(parent.$("#strategyDesc").val());
	$('input[name="MARKET_WORDS"]').val(parent.$("#marketingWords").val());
	$('input[name="SMS_WORDS"]').val(parent.$("#smsWords").val());
	$('input[name="USERGROUP_FILTERCON"]').val(parent.$("#USERGROUP_FILTERCON").val());
	$("#previewFrontline").attr("action","/"+parent.services.xbuilderoracle+"/pages/workbench/GuideRecommend/channelPreview.jsp");		
	$("#previewFrontline").submit();	
});
function evalue(){
	$('input[name="ACTIVITY_NAME"]').val(parent.$("#inputEmail3").val());
	$('input[name="TYPE_NAME"]').val(parent.$("#successType option:selected").text());
	$('input[name="SUCCESS_NAME"]').val(parent.$("#successCondition").val());
	$('input[name="AWARD_DESC"]').val(parent.$("#desRules").val());
	$('input[name="PRODUCT_NAME"]').val(parent.$("#product_nameChoo").val());
	$('input[name="REFERRALS_INFO"]').val(parent.$("#REFERRALS_INFO").val());
	$('input[name="POLICY_DES"]').val(parent.$("#strategyDesc").val());
	$('input[name="MARKET_WORDS"]').val(parent.$("#marketingWords").val());
	$('input[name="SMS_WORDS"]').val(parent.$("#smsWords").val());
	$('input[name="USERGROUP_FILTERCON"]').val(parent.$("#USERGROUP_FILTERCON").val());
}
</script>