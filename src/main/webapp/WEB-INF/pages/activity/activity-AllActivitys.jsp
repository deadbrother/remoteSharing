<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<%@include file="head-js-css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script src="../js/activity/activity-allActs.js" type="text/javascript"></script>
<script src="../js/activity/activity-allActivitys.js" type="text/javascript"></script>

<style>
input.l-bar-button{
  line-height: 35px!important;
  height: 35px!important;
}

.box { 
-moz-border-radius: 15px; /* Firefox */ 
-webkit-border-radius: 15px; /* Safari and Chrome */ 
border-radius: 15px; /* Opera 10.5+, future browsers, and now also Internet Explorer 6+ using IE-CSS3 */ 
-moz-box-shadow: 10px 10px 20px #000; /* Firefox */ 
-webkit-box-shadow: 10px 10px 20px #000; /* Safari and Chrome */ 
box-shadow: 10px 10px 20px #000; /* Opera 10.5+, future browsers and IE6+ using IE-CSS3 */ 
behavior: url(。。/js/base/css/ie-css3.htc); 
} 
.l-grid-body {
    overflow: hidden;
}
input#search-tool-btn{
	line-height:100%!important;
}
table input[type=radio], table input[type=checkbox]{
	width:13px;
}
</style>



</head>
<body id="activityActs">
<input type="hidden" id="logerOrgLevel" value="${bo.po.orgLevel}"/>
<input type="hidden" id="state" value="${bo.po.state}" />
<div class="col-md-12">
<div class="row">
			<div>
				<table style="margin-top:5px;">
					<tr>
						<td width="75" align="right">
							<label class=" slds-form-element__label">创建人：</label>
						</td>
						<td width="60">
							<input id="createName" type="text" width="60px" />
						</td>
						<td width="105" align="right">
							<label class=" slds-form-element__label">创建时间：</label>
						</td>
						<td width="130">
							<input id="createDateStart" class="Wdate"  type="text" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd'})"/>
						</td>
						<td width="10" align="center">~</td>
						<td width="130">
							<input id="createDateEnd" class="Wdate"  type="text" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd'})"/>
						</td>
						<td>
							<div class="pull-right">
								<button  id="search-tool-btn" class="slds-button slds-button--brand slds-size--2-of-16" type="primary">
									<span style="color:white" class="epm-icon glyphicon glyphicon-play"></span>&nbsp;查询
								</button>
							</div>
						</td>
						
					</tr>
				</table>
			</div>
			
<div class="" style="width:100%;height:300px;">
	<div id="maingrid" class="" style="width:100%;"></div>
</div>

</div>
</div>

<!--[if IE 8]> 
<style>
button.activityButton{
  line-height:32px!important;
  height: 32px!important;
    color: #fff;
  background-color: #0070d2;
  border-color: #0070d2;
  margin:15px 2px;
}
div.bbtt{
  float:right;
  width:890px;
  left:10%; 
  top:100%;
 }
</style>
<script>
function cc(){
jQuery(".slds-button.slds-button--brand").addClass("l-bar-button activityButton ") 

}
cc();
</script>
 <![endif]-->

</body>
</html>
