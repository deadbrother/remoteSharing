<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="head-js-css.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--声明以IE最高版本浏览器内核或谷歌浏览器内核进行渲染 -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <!--声明以360极速模式进行渲染 -->
 <meta name=”renderer” content=”webkit” />
  <!-- 系统ICON图标（注:路径为TomCat根目录） -->
  <link rel ="Shortcut Icon" href="" />
<title>渠道统一规则设置</title>
</head>
<body>
	<h2 class="activity">规则设置</h2>
	<div class="activitySetArea">
    <!-- 第一部分-->
    <h3 class="headList unbordered">客户经理</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="80%" />
        </colgroup>
        <tr>
            <th>接触频次设置</th>
            <td>
                近<input class="form-control inputWidth" type="number"   min="1" max="100" check_empty check_name="客户经理接触频次设置" check_max="1,100" name="touchLimitDay" value="${rule.touchLimitDay}" id="touchLimitDay">天一次
               <span data-toggle="tooltip" data-placement="right" title="接触频次：出工单时会判断接触记录表中近多少天是否与用户接触过。"> <i class="fa fa-question-circle-o" aria-hidden="true"></i>
            </span>
            </td>
        </tr>
    </table>
    <!-- //第一部分结束 -->

    <!-- //第二部分-->
    <h3 class="headList">本地短信</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
        </colgroup>
        <%-- <tr>
            <th>短信时段设置</th>
            <td colspan="2"><input  type="checkbox"  name="messageSendTime" value="1" ${rule.messageSendTime=='1'?'checked':'' }>上午（9：00-12：00）</td>
            <td style="padding-left: 60px" colspan="2"><input type="checkbox"  name="messageSendTime" value="2" ${rule.messageSendTime=='2'?'checked':'' }>下午（14：00-18：00）</td>
        </tr> --%>
        <tr>
        <th>本地短信时段设置:</th>
        </tr>       
        <c:forEach items="${timePoint}" var="timePoint" varStatus="status">
        <tr>
        <th></th>                     
            <td colspan="2">
            <input type="checkbox"  name="messageSendTime" value="${timePoint.expand2}" ${rule.messageSendTime==timePoint.expand2?'checked':''}/>
            ${timePoint.expand}(${timePoint.time})</td>                      
        </tr>
        </c:forEach>
        <tr>
            <th>按月刷新发送设置</th>
            <td>开始日期</td>
            <td>  <input  class="form-control inputrefResh" type="number" min="1" max="31" check_empty check_name="本地短信按月刷新发送设置开始时间" check_max="1,31" value="${rule.startDate }" name="startDate"> 
          日</td>
            <td class="tdRight">结束日期</td>
            <td>  <input  class="form-control inputrefResh" type="number" min="1" max="31" check_empty check_name="本地短信按月刷新发送设置结束日期" check_max="1,31" value="${rule.endDate }" name="endDate"> 
     	日</td>
        </tr>
        <tr class="hide">
            <th></th>
            <td>本周期内发送次数</td>
            <%-- <td>  <input  class="form-control inputrefResh" type="number"  min="1" max="31" value="${rule.cycleSendTimes }" name="cycleSendTimes">
          	次</td> --%>
          	<td>  <input  class="form-control inputrefResh" type="number"  min="1" max="31" value="1" name="cycleSendTimes">
          	次</td>
            <td class="tdRight">间隔</td>
            <%-- <td> <input  class="form-control inputrefResh"  type="number"  min="1" max="31" value="${rule.intervalDay}" name="intervalDay">
           日</td> --%>
           <td> <input  class="form-control inputrefResh"  type="number"  min="1" max="31" value="32" name="intervalDay">
           日</td>
        </tr>
        <tr>
            <th>按日刷新发送设置</th>
            <td colspan="4">发送说明：出工单当天发</td>
        </tr>
        <tr>
            <th>发送频次设置</th>
            <td colspan="4">
                近<input class="form-control inputWidth" type="number"  min="1"  max="100" check_empty check_name="发送频次设置" check_max="1,100" name="sendFrequency" value="${rule.sendFrequency}">天一次
               <span data-toggle="tooltip" data-placement="right" title="发送频次:出工单时会判断发送短信记录。">
               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
               </span>
            </td>
        </tr>
        <tr>
            <th>本地短信订购编码</th>
            <td colspan="1"><input type="" class="form-control inputrefResh" name="messOrderCode" value="${rule.messOrderCode }"></td>
        </tr>
        <tr>
            <th>本地短信免打扰编码</th>
            <td colspan="1"><input type="" class="form-control inputrefResh" name="messNoDisturbCode" value="${rule.messNoDisturbCode }"></td>
        </tr>
          <tr>
            <th>本地短信有效时间</th>
            <td colspan="1"><input type="number" min="1" check_empty check_name="短信有效时间" check_max="1," class="form-control inputrefResh" name="messEffectiveTime" value="${rule.messEffectiveTime }"></td>
            <td>分钟</td>
        </tr>
        
        <tr>
            <th>最后一次修改人</th>
            <td colspan="4">${rule.reviser }</td>
        </tr>
    </table>
    <h3 class="headList unbordered">本地弹窗</h3>
	   <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="80%" />
        </colgroup>
        <tr>
            <th>日弹出次数设置</th>
            <td>
                <input class="form-control inputWidth" type="number"   min="1" max="100" check_empty check_name="本地弹窗日弹出次数" check_max="1,100" name="popNumberLimit" value="${rule.popNumberLimit}" id="popNumberLimit">次
               <span data-toggle="tooltip" data-placement="right" title="限定本地弹窗自有/社会营业厅日弹出次数"> <i class="fa fa-question-circle-o" aria-hidden="true"></i>
            </span>
            </td>
        </tr>
            </table>
        <!--  集团短信开始   -->
         <%-- <h3 class="headList">集团短信</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
        </colgroup>
        <tr>
            <th>短信时段设置</th>
            <td colspan="2"><input  type="checkbox"  name="messageSendTime" value="1" ${rule.messageSendTime=='1'?'checked':'' }>上午（9：00-12：00）</td>
            <td style="padding-left: 60px" colspan="2"><input type="checkbox"  name="messageSendTime" value="2" ${rule.messageSendTime=='2'?'checked':'' }>下午（14：00-18：00）</td>
        </tr>
        <tr>
        <th>集团短信时段设置:</th>
        </tr>       
        <c:forEach items="${timePoint}" var="timePoint" varStatus="status">
        <tr>
        <th></th>                     
            <td colspan="2">
            <input type="checkbox"  name="messageSendTimeJiTuan" value="${timePoint.expand2}" ${rule.messageSendTimeJiTuan==timePoint.expand2?'checked':''}/>
            ${timePoint.expand}(${timePoint.time})</td>                      
        </tr>
        </c:forEach>
        <tr>
            <th>按月刷新发送设置</th>
            <td>开始日期</td>
            <td>  <input  class="form-control inputrefResh" type="number" min="1" max="31" check_empty check_name="集团短信按月刷新发送设置开始时间" check_max="1,31" value="${rule.startDateJiTuan }" name="startDateJiTuan"> 
          日</td>
            <td class="tdRight">结束日期</td>
            <td>  <input  class="form-control inputrefResh" type="number" min="1" max="31" check_empty check_name="集团短信按月刷新发送设置结束日期" check_max="1,31" value="${rule.endDateJiTuan }" name="endDateJiTuan"> 
     	日</td>
        </tr>
        <tr class="hide">
            <th></th>
            <td>本周期内发送次数</td>
            <td>  <input  class="form-control inputrefResh" type="number"  min="1" max="31" value="${rule.cycleSendTimes }" name="cycleSendTimes">
          	次</td>
          	<td>  <input  class="form-control inputrefResh" type="number"  min="1" max="31" value="1" name="cycleSendTimes">
          	次</td>
            <td class="tdRight">间隔</td>
            <td> <input  class="form-control inputrefResh"  type="number"  min="1" max="31" value="${rule.intervalDay}" name="intervalDay">
           日</td>
           <td> <input  class="form-control inputrefResh"  type="number"  min="1" max="31" value="32" name="intervalDay">
           日</td>
        </tr>
        <tr>
            <th>按日刷新发送设置</th>
            <td colspan="4">发送说明：出工单当天发</td>
        </tr>
        <tr>
            <th>发送频次设置</th>
            <td colspan="4">
                近<input class="form-control inputWidth" type="number"  min="1"  max="100" check_empty check_name="发送频次设置" check_max="1,100" name="sendFrequencyJiTuan" value="${rule.sendFrequencyJiTuan}">天一次
               <span data-toggle="tooltip" data-placement="right" title="发送频次:出工单时会判断发送短信记录。">
               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
               </span>
            </td>
        </tr>
        <tr>
            <th>短信订购编码</th>
            <td colspan="1"><input type="" class="form-control inputrefResh" name="messOrderCode" value="${rule.messOrderCode }"></td>
        </tr>
        <tr>
            <th>短信免打扰编码</th>
            <td colspan="1"><input type="" class="form-control inputrefResh" name="messNoDisturbCode" value="${rule.messNoDisturbCode }"></td>
        </tr>
          <tr>
            <th>短信有效时间</th>
            <td colspan="1"><input type="number" min="1" check_empty check_name="短信有效时间" check_max="1," class="form-control inputrefResh" name="messEffectiveTime" value="${rule.messEffectiveTime }"></td>
            <td>分钟</td>
        </tr>
        
        <tr>
            <th>最后一次修改人</th>
            <td colspan="4">${rule.reviser }</td>
        </tr>
    </table> --%>
        <!--  集团短信结束    -->
        
    <!-- //第二部分结束 -->
    <%-- <h3 class="headList unbordered">活动策略</h3>
     <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="80%" />
        </colgroup>
        <tr>
            <th>策略标题</th>
            <td >
                <input class="form-control inputWidth" type="text" check_empty check_name="策略标题" name="strategyTitle" value="${rule.strategyTitle}" id="strategyTitle">
               <span data-toggle="tooltip" data-placement="right" title="小沃与多触点营销的默认策略"> <i class="fa fa-question-circle-o" aria-hidden="true"></i>
            </span>
            </td>
            </tr>
            <tr>
            <th>策略内容</th>
            <td >
                <input class="form-control inputWidth" type="text" check_empty check_name="策略内容" name="strategyContent" value="${rule.strategyContent}" id="strategyContent">
               <span data-toggle="tooltip" data-placement="right" title="小沃与多触点营销的策略描述"> <i class="fa fa-question-circle-o" aria-hidden="true"></i>
            </span>
            </td>
        </tr>
    </table> --%>
    <h3 class="headList unbordered">工单控制</h3>
	   <table class="activeLayout">
	     <colgroup>
	           <col width="22%" />
	         <col width="80%" />
	      </colgroup>
	      <tr>
	       <th>工单生成账期控制参数</th>
	        <td>当天前
	             <input class="form-control inputWidth" type="number"   min="0" max="365" check_empty check_name="工单生成账期控制天数" check_max="0,365" name="accountOffset" value="${rule.accountOffset}" id="accountOffset">天账期值可生成工单
	             <span data-toggle="tooltip" data-placement="right" title="工单生成账期控制：日周期活动工单可生成的账期最大偏移量。"> <i class="fa fa-question-circle-o" aria-hidden="true"></i>
	          </span>
	           </td>
	       </tr>
	        <tr>
            <th>预留工单百分比</th>
            <td>
                <input type="number" min="0" max="100" name="obligateOrder" numcheck="预留工单百分比" numsize="0,100" onkeyup="this.value=this.value.replace(/[e]/g,'')" value="${rule.obligateOrder}"/>
                （%）
            </td>
        </tr>
	   </table>
    
</div>
	<div style="left: 80%;top: 900px; position: absolute;">
		<!-- <input type="button" value="保存" id="saveRule" type="button" class="btn btn-primary fr" style="margin-top:10px;" data-toggle="modal"> --> 
		<button type="button" class="btn btn-primary fr" style="margin-top:10px;" data-toggle="modal" data-target="" id="saveRule" >保存</button>
		<input type="text" value="${isSave}" id="isSave" style="display:none;">
	</div>
</body>
<script type="text/javascript">
jQuery(function(){
	//本地短信进入页面控制短信时段选中
	var messageSendTime ='${rule.messageSendTime}';
	var messageSendTimeArray = messageSendTime.split(",");
	for(var m in messageSendTimeArray){
		$("input[name='messageSendTime'][value='"+messageSendTimeArray[m]+"']").attr("checked",true);
	}
	//集团短信进入页面控制短信时段选中
	var messageSendTimeJiTuan ='${rule.messageSendTimeJiTuan}';
	var messageSendTimeJiTuanArray = messageSendTimeJiTuan.split(",");
	for(var m in messageSendTimeJiTuanArray){
		$("input[name='messageSendTimeJiTuan'][value='"+messageSendTimeJiTuanArray[m]+"']").attr("checked",true);
	}
})
 function checkNum() {
	// 判断input输入框空值
	var flag = true;
	$("[numcheck]").each(function() {
		var check_name = $(this).attr("numcheck");
		var objVal = $(this).val();
		var check_num = $(this).attr("numsize").split(",");
		var first=check_num[0];
		var last=check_num[1];
		flag = false;
		if(objVal==""||objVal==null){
		   $.ligerDialog.warn("请填写"+check_name);
		   return false;
		}
		if (parseInt(objVal)=="NaN") {
			//alert(check_name + "不能为空");
			$.ligerDialog.warn(check_name + "格式不正确，请重新填写");
			return false;
		}else if(parseInt(objVal)<parseInt(first)||parseInt(objVal)>parseInt(last)){
			$.ligerDialog.warn(check_name + "的值必须在"+first+"-"+last+"之间，请重新填写");
			return false;
		}
		flag=true;
	});

	return flag;
}
function checkNameEmpty() {
	// 判断input输入框空值
	var flag = true;
	$("[check_empty]").each(function() {
		var check_name = $(this).attr("check_name");
		var objVal = $.trim($(this).val());
		flag = false;
		if (objVal == "" || objVal == null) {
			//alert(check_name + "不能为空");
			$.ligerDialog.warn(check_name + "不能为空!");
			return false;
		}
		flag=true;
	});

	return flag;
}
function checkMax(){
	var flag=true;
	
	$("[check_max]").each(function(){
		var checkName = $(this).attr("check_name");
		var checkMax=$(this).attr("check_max");
		var min="";
		var max="";
		var objVal=$(this).val().trim();
		flag=false;
		min=checkMax.split(",")[0];
		max=checkMax.split(",")[1];
		if(parseInt(max)<parseInt(objVal)){
			$.ligerDialog.warn(checkName + "的大小不能超过" + max);
			return false;
		}
		if(parseInt(min)>parseInt(objVal)){
			$.ligerDialog.warn(checkName + "的大小不能小于" + min);
			return false;
		}
		flag=true;
	});
	return flag;
} 
	$("#saveRule").click(function(){
		var touchLimitDay = $("#touchLimitDay").val();
		var action;
		var messageSendTime ='';
		$("input[name='messageSendTime']:checked").each(function(){
			messageSendTime+=$(this).val()+",";
		});
		messageSendTime = messageSendTime.substr(0,messageSendTime.length-1);		
		var startDate = $("input[name='startDate']").val();
		var endDate = $("input[name='endDate']").val();
		var cycleSendTimes = $("input[name='cycleSendTimes']").val();
		var intervalDay = $("input[name='intervalDay']").val();
		var sendFrequency = $("input[name='sendFrequency']").val();
		var messOrderCode = $("input[name='messOrderCode']").val();
		var messNoDisturbCode = $("input[name='messNoDisturbCode']").val();
		var messEffectiveTime = $("input[name='messEffectiveTime']").val();
		var accountOffset = $("#accountOffset").val();
		var obligateOrder = $("input[name='obligateOrder']").val();
		var popNumberLimit = $("input[name='popNumberLimit']").val();
		var strategyTitle=$("input[name='strategyTitle']").val();
		var strategyContent=$("input[name='strategyContent']").val();
		var messageSendTimeJiTuan ='';
		$("input[name='messageSendTimeJiTuan']:checked").each(function(){
			messageSendTimeJiTuan+=$(this).val()+",";
		});
		messageSendTimeJiTuan = messageSendTimeJiTuan.substr(0,messageSendTimeJiTuan.length-1);
		var startDateJiTuan = $("input[name='startDateJiTuan']").val();
		var endDateJiTuan = $("input[name='endDateJiTuan']").val();
		var sendFrequencyJiTuan = $("input[name='sendFrequencyJiTuan']").val();
		var isSave = $("#isSave").val();
		if(isSave=="1") {
			action = "../channelrule/saveRule";
		}else{
			action = "../channelrule/updateRule";
		}
		if(touchLimitDay.replace(/(^\s*)|(\s*$)/g, "")==null || touchLimitDay.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请填写接触频次设置");
			return;
		}else if(parseInt(touchLimitDay.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("接触频次设置值不能小于1");
			return;
		}
		checkBenDiDuanXin();
		//checkJiTuanDuanXin();
		if(accountOffset.replace(/(^\s*)|(\s*$)/g, "")==null || accountOffset.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请设置工单生成账期控制参数");
			return;
		}else if(parseInt(accountOffset.replace(/(^\s*)|(\s*$)/g, "")) <= 0){
			$.ligerDialog.warn("工单生成账期控制不能小于或者等于0");
			return;
		}
		if(!checkNameEmpty()){
			return;
		}
	    if(!checkNum()){
		    return;
	    }
	    if(!checkMax()){
	    	return;
	    }
		$.ajax({
			url: action,
			type: "POST",
			async: false,
			data:
				{
				"touchLimitDay": touchLimitDay,
				"messageSendTimeJiTuan" : messageSendTimeJiTuan,
				"startDateJiTuan" : startDateJiTuan,
				"endDateJiTuan" : endDateJiTuan,
				"messageSendTime" : messageSendTime,
				"startDate" : startDate,
				"endDate" : endDate,
				"cycleSendTimes" : cycleSendTimes,
				"intervalDay" : intervalDay,
				"sendFrequency" : sendFrequency,
				"sendFrequencyJiTuan" : sendFrequencyJiTuan,
				"messOrderCode" : messOrderCode,
				"messNoDisturbCode" : messNoDisturbCode,
				"messEffectiveTime" : messEffectiveTime,
				"accountOffset" : accountOffset,
				"obligateOrder" : obligateOrder,
				"popNumberLimit" : popNumberLimit,
				"strategyTitle" : strategyTitle,
				"strategyContent" :strategyContent
				},
			success: function(data){
				if(data=="success") {
					$.ligerDialog.warn("保存成功");
				}else{
					$.ligerDialog.warn("保存失败");
				}
			}
		});
		
	});
	//本地短信校验
	function checkBenDiDuanXin(){
		var messageSendTime ='';
		$("input[name='messageSendTime']:checked").each(function(){
			messageSendTime+=$(this).val()+",";
		});
		messageSendTime = messageSendTime.substr(0,messageSendTime.length-1);
		var startDate = $("input[name='startDate']").val();
		var endDate = $("input[name='endDate']").val();
		var sendFrequency = $("input[name='sendFrequency']").val();
		if(messageSendTime.replace(/(^\s*)|(\s*$)/g, "")==null || messageSendTime.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请选择本地短信时段设置 ");
			return;
		}
		
		if(startDate.replace(/(^\s*)|(\s*$)/g, "")==null || startDate.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请选择本地短信开始日期 ");
			return;
		}else if(parseInt(startDate.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("本地短信开始日期不能小于1");
			return;
		}else if(parseInt(startDate.replace(/(^\s*)|(\s*$)/g, "")) > 31){
			$.ligerDialog.warn("本地短信开始日期不能大于31");
			return;
		}
		
		if(endDate.replace(/(^\s*)|(\s*$)/g, "")==null || endDate.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请选择本地短信结束日期 ");
			return;
		}else if(parseInt(endDate.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("本地短信结束日期不能小于1");
			return;
		}else if(parseInt(endDate.replace(/(^\s*)|(\s*$)/g, "")) > 31){
			$.ligerDialog.warn("本地短信结束日期不能大于31");
			return;
		}
		
		if(sendFrequency.replace(/(^\s*)|(\s*$)/g, "")==null || sendFrequency.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			//$.ligerDialog.warn("请填写发送频次设置 ");
			return;
		}else if(parseInt(sendFrequency.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("本地短信发送频次设置不能小于1");
			return;
		}
	}
	//集团短信校验
	function checkJiTuanDuanXin(){
		var messageSendTimeJiTuan ='';
		$("input[name='messageSendTimeJiTuan']:checked").each(function(){
			messageSendTimeJiTuan+=$(this).val()+",";
		});
		messageSendTimeJiTuan = messageSendTimeJiTuan.substr(0,messageSendTimeJiTuan.length-1);
		var startDateJiTuan = $("input[name='startDateJiTuan']").val();
		var endDateJiTuan = $("input[name='endDateJiTuan']").val();
		var sendFrequencyJiTuan = $("input[name='sendFrequencyJiTuan']").val();
		if(messageSendTimeJiTuan.replace(/(^\s*)|(\s*$)/g, "")==null || messageSendTimeJiTuan.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请选择集团短信时段设置 ");
			return;
		}
		
		if(startDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")==null || startDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请选择集团短信开始日期 ");
			return;
		}else if(parseInt(startDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("集团短信开始日期不能小于1");
			return;
		}else if(parseInt(startDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")) > 31){
			$.ligerDialog.warn("集团短信开始日期不能大于31");
			return;
		}
		
		if(endDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")==null || endDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			$.ligerDialog.warn("请选择集团短信结束日期 ");
			return;
		}else if(parseInt(endDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("集团短信结束日期不能小于1");
			return;
		}else if(parseInt(endDateJiTuan.replace(/(^\s*)|(\s*$)/g, "")) > 31){
			$.ligerDialog.warn("集团短信结束日期不能大于31");
			return;
		}
		
		if(sendFrequencyJiTuan.replace(/(^\s*)|(\s*$)/g, "")==null || sendFrequencyJiTuan.replace(/(^\s*)|(\s*$)/g, "")=="" ) {
			//$.ligerDialog.warn("请填写发送频次设置 ");
			return;
		}else if(parseInt(sendFrequencyJiTuan.replace(/(^\s*)|(\s*$)/g, "")) < 1){
			$.ligerDialog.warn("集团短信发送频次设置不能小于1");
			return;
		}
	}
</script>
</html>