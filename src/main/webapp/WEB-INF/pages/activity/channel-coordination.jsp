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
<title>渠道协同设置</title>
</head>
<script type="text/javascript">
	window.onload =function()
	{
	    if($("#resultMess").val()!="" && $("#resultMess").val()!=	null){
	    	$.ligerDialog.warn($("#resultMess").val());
	    }
	}
</script>
<body>
	<input type="hidden" name="channelCoordination.ruleId" value="${bo.channelCoordination.ruleId}"/>
	<input type="hidden" id="resultMess" value="${bo.channelCoordination.resultMessage}"/>
	<input type="hidden" id="channelIdlist" value="${bo.channelIdLength}"/>
	<h2 class="activity">渠道协同设置
	<button type="button" class="btn btn-primary fr" style="margin-top:10px;margin-right:400px;" data-toggle="modal" data-target="" id="saveRule" >保存</button>
	<%-- <input type="text" value="${bo.channelCoordination.isSave}" id="isSave" style="display:none;"> --%>
	</h2>
	
	<c:forEach items="${bo.channelCoordInfoList}" var="info" varStatus="status">
			<input type="hidden" id="isSave${status.index}" value="${info.isSave}"/>
			<input type="hidden" id="channelId${status.index}" value="${info.channelId}"/>
			<input type="hidden" id="channelName${status.index}" value="${info.channelName==null||info.channelName==''?'全局配置':info.channelName}"/>
			<input type="hidden" name="channelCoordination.ruleId${status.index}" value="${info.ruleId}"/>
			<div class="activitySetArea">
		    <!-- 第一部分-->
		    <h3 class="headList unbordered">${info.channelName==null||info.channelName==''?'全局配置':info.channelName}</h3>
		    
		    <table class="activeLayout">
		        <colgroup>
		            <col width="8%" />
		            <col width="18%" />
		            <col width="37%" />
		            <col width="37%" />
		        </colgroup>
		        <tr>
		            <td>
		                <input type="checkbox" name="activ" class="icheckS" value="" <c:if test="${info.maxState == '1'}">checked</c:if>  id="limitIsValid${status.index}"/>
		            	<span data-toggle="tooltip" data-placement="right" title="勾选该复选框设置生效">
		               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
		               </span>
		            </td>
		            <%-- <td>  
		            	<input  class="form-control inputrefResh" style="width:100%" type="number" min="1" max="999" check_empty check_name="接触次数天数限制" check_max="1,999" value="${bo.channelCoordination.maxDay}" name="dateLimit">
		            </td> --%>
		            <td>每月最大接触次数</td>
		            <td>  
		            	<input  class="form-control inputrefResh" type="number" min="1" max="999" check_empty check_name="最大接触次数" check_max="1,999" value="${info.maxTimes}" name="timesLimit${status.index}">次
		            </td>
		            <td></td>
		        </tr>
		        
		    </table>
		    <table class="activeLayout">
		    	<colgroup>
		            <col width="8%" />
		            <col width="20%" />
		            <col width="35%" /> 
		            <col width="37%" /> 
		        </colgroup>
		        <c:if test="${info.channelId==7}">
		        <tr>
		        	<td colspan="4" style="padding-left:35px">
		        		<font size="8px" color="#199ED8">说明：针对单一用户在指定时间范围内，通过短信渠道触点接触的最大次数</font>
		        	</td>
		        </tr>
		        </c:if>
		        <c:if test="${info.ruleType==0||info.channelId==0}">
		        <tr>
		        	<td colspan="4" style="padding-left:35px">
		        		<font size="8px" color="#199ED8">说明：针对单一用户在指定时间范围内，所有渠道触点接触的最大次数</font>
		        	</td>
		        </tr>
		        </c:if>
		        <c:if test="${info.ruleType!=0&&info.channelId!=0&&info.channelId!=7}">
		        <tr>
		        	<td colspan="4" style="padding-left:35px">
		        		<font size="8px" color="#199ED8">说明：针对单一用户在指定时间范围内，该渠道触点接触的最大次数</font>
		        	</td>
		        </tr>
		        </c:if>
		    	<tr>
		            <td>
		                <input type="checkbox" name="activ" class="icheckS" value="" <c:if test="${info.stepState == '1'}">checked</c:if>  id="intervalIsValid${status.index}"/>
		            	<span data-toggle="tooltip" data-placement="right" title="勾选该复选框设置生效">
		               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
		               </span>
		            </td>
		            <th>两次接触间隔不少于</th>
		            <td>
		            	<input  class="form-control inputrefResh" style="width:100%" type="number" min="1" max="999" check_empty check_name="两次接触间隔" check_max="1,999" value="${info.stepNum}" name="interval${status.index}">
		            </td>
		            <td>  
		            	<select class="form-control" name="timeUnit${status.index}" id="timeUnit${status.index}" style="width:30%" value="${info.stepUnit}">
			                <c:forEach items="${bo.channelCoordList}" var="atl">
			                     <option  value="${atl.stepUnit}" ${atl.stepUnit==info.stepUnit?'selected' :''}>${atl.timeUnit}</option>
			                </c:forEach>
			            </select>
		            </td>
		        </tr>
		    </table>
			</div>
	</c:forEach>
	
	<%-- <div class="activitySetArea">
    <!-- 第一部分-->
    <h3 class="headList unbordered">本地短信</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="8%" />
            <col width="18%" />
            <col width="37%" />
            <col width="37%" />
        </colgroup>
        <tr>
            <td>
                <input type="checkbox" name="activ" class="icheckS" value="" <c:if test="${bo.channelCoordination.maxState == '1'}">checked</c:if>  id="limitIsValid"/>
            	<span data-toggle="tooltip" data-placement="right" title="勾选该复选框设置生效">
               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
               </span>
            </td>
            <td>  
            	<input  class="form-control inputrefResh" style="width:100%" type="number" min="1" max="999" check_empty check_name="接触次数天数限制" check_max="1,999" value="${bo.channelCoordination.maxDay}" name="dateLimit">
            </td>
            <td>每月最大接触次数</td>
            <td>  
            	<input  class="form-control inputrefResh" type="number" min="1" max="999" check_empty check_name="最大接触次数" check_max="1,999" value="${bo.channelCoordination.maxTimes}" name="timesLimit">次
            </td>
            <td></td>
        </tr>
        
    </table>
    <table class="activeLayout">
    	<colgroup>
            <col width="8%" />
            <col width="20%" />
            <col width="35%" /> 
            <col width="37%" /> 
        </colgroup>
        <tr>
        	<td colspan="4" style="padding-left:35px">
        		<font size="8px" color="#199ED8">说明：针对单一用户在指定时间范围内，通过短信渠道触点接触的最大次数</font>
        	</td>
        </tr>
    	<tr>
            <td>
                <input type="checkbox" name="activ" class="icheckS" value="" <c:if test="${bo.channelCoordination.stepState == '1'}">checked</c:if>  id="intervalIsValid"/>
            	<span data-toggle="tooltip" data-placement="right" title="勾选该复选框设置生效">
               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
               </span>
            </td>
            <th>两次接触间隔不少于</th>
            <td>
            	<input  class="form-control inputrefResh" style="width:100%" type="number" min="1" max="999" check_empty check_name="两次接触间隔" check_max="1,999" value="${bo.channelCoordination.stepNum}" name="interval">
            </td>
            <td>  
            	<select class="form-control" name="timeUnit" id="timeUnit" style="width:30%" value="${bo.channelCoordination.stepUnit}">
	                <c:forEach items="${bo.channelCoordList}" var="atl">
	                     <option  value="${atl.stepUnit}" ${atl.stepUnit==bo.channelCoordination.stepUnit?'selected' :''}>${atl.timeUnit}</option>
	                </c:forEach>
	            </select>
            </td>
        </tr>
    </table>
	</div> --%>
</body>
<script type="text/javascript">
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
		var channelidlist = $("#channelIdlist").val();
		for(var i=0;i<channelidlist;i++){
			var action;
			var ruleId = $("input[name='channelCoordination.ruleId"+i+"']").val();
			var channelId = $("#channelId"+i).val();
			var channelName = $("#channelName"+i).val();
			var channelType = "1";
			if(channelId == "" || channelId == null || channelId == "0"){
				channelType = "0";
			}
			//var maxDay = $("input[name='dateLimit']").val();
			var maxDay = "";
			var maxTimes = $("input[name='timesLimit"+i+"']").val();
			var stepNum = $("input[name='interval"+i+"']").val();
			var stepUnit = $('#timeUnit'+i+' option:selected').val();
			if($("#limitIsValid"+i).is(':checked')){
				var maxState = "1";
				/* if(maxDay==null||maxDay==""){
					$.ligerDialog.warn("接触次数天数限制不能为空!");				
					return;
				} */
				if(maxTimes==null||maxTimes==""){
					$.ligerDialog.warn("最大接触次数不能为空!");				
					return;
				}
			}else{
				var maxState = "0";
			}
			if($("#intervalIsValid"+i).is(':checked')){
				var stepState = "1";
				if(stepNum==null||stepNum==""){
					$.ligerDialog.warn("两次接触间隔不能为空!");				
					return;
				}
			}else{
				var stepState = "0";
			}
			var isSave = $("#isSave"+i).val();
			if(isSave=="1") {
				action = "../channelcoor/saveConfig";
			}else{
				action = "../channelcoor/updateConfig";
			}
		    /* if(!checkNameEmpty()){
			    return;
		    } */
		    if(!checkMax()){
		    	return;
		    }
			$.ajax({
				url: action,
				type: "POST",
				async: false,
				data:
					{
					"channelCoordination.ruleType":channelType,
					"channelCoordination.channelId":channelId,
					"channelCoordination.ruleId":ruleId,
					"channelCoordination.maxState":maxState,
					"channelCoordination.maxDay": maxDay,
					"channelCoordination.maxTimes" : maxTimes,
					"channelCoordination.stepState" : stepState,
					"channelCoordination.stepNum" : stepNum,
					"channelCoordination.stepUnit" : stepUnit
					},
				success: function(data){
						$.ligerDialog.warn(channelName+data);
					
				}
			});
			
		}
	});
</script>
</html>