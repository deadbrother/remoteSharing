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
<link href="../js/activity/css/boncXpersonality.css" rel="stylesheet" type="text/css" />
<link href="../js/activity/css/allActs.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
		function changeTab_1(index) {
			$("font[id^='totalNum']").attr("class","normalBlock")
			$("#totalNum" + index).attr("class","selectBlock");
			$("a[href='#actDiv"+index+"']").tab('show');
			/* $("#navtab1").ligerGetTabManager().selectTabItem("actDiv"+index); */
	/* 		$("#li" + index).attr("class","active"); */
			//$("div[id^='b_content']").each(function(){$(this).css("display","none")});
			//$("#b_content" + index).css("display","block");
			
		}
		function changeTab_2(index) {
			for ( var i = 1; i <= 2; i++) {
				
				document.getElementById("Btab_" + i).className = "normalTemp";
				document.getElementById("Bcontent_" + i).style.display = "none";
			}
			document.getElementById("Btab_" + index).className = "selectNum";
			document.getElementById("Bcontent_" + index).style.display = "block";	
		}
	</script>
</head>
<body id="allActs" style="margin:auto;">
<input type="hidden" id="listMap" value="${listMap}">
<div class="container col-lg-12">
<div class="row col-lg-12">
<div class="col-md-12 col-lg-12">


<div class="tabBlockDiv" id="tabBlockDiv" style="width:1024px">
			<p class="tit">执行活动总数：<strong>
				<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">
							<c:if test="${temp.state == -1}">
								${temp.total}
							</c:if>
					</c:forEach>
				</font>
			</strong>个</p>
			<ul class="chooseTab" style="float:left;">
				<li class="bg01" onclick="changeTab_1('12')" ><i class="fa fa-clipboard"></i><font class="normalBlock"  id="totalNum12">暂存</font><em>
					<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">
							<c:if test="${temp.state == 12}">
								${temp.total}
							</c:if>	
					</c:forEach>
				</font>
				</em></li>
				<li class="bg02" onclick="changeTab_1('13')"><i class="fa fa-spinner"></i><font class="normalBlock"  id="totalNum13">待审核</font><em>
					<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">
							<c:if test="${temp.state == 13}">
								${temp.total}
							</c:if>
					</c:forEach>
				</font>
				</em></li>				
				<li class="bg03" onclick="changeTab_1('9')"><i class="fa fa-play-circle"></i><font class="selectBlock"  id="totalNum9">启用</font><em>
					<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">	
							<c:if test="${temp.state == 9}">
								${temp.total}
							</c:if>	
					</c:forEach>
				</font>
	
				</em></li>
				<li class="bg04" onclick="changeTab_1('11')"><i class="fa fa-pause-circle-o"></i><font class="normalBlock"  id="totalNum11">暂停</font><em>
					<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">
							<c:if test="${temp.state == 11}">
								${temp.total}
							</c:if>
					</c:forEach>
				</font>
				</em></li>
				<li class="bg05"  onclick="changeTab_1('8')"><i class="fa fa-stop-circle-o"></i><font class="normalBlock" id="totalNum8">终止</font><em>
					<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">				
							<c:if test="${temp.state == 8}">
								${temp.total}
							</c:if>
					</c:forEach>
				</font>
				</em></li>
				<li class="bg06" onclick="changeTab_1('10')"><i class="fa fa-stop-circle-o"></i><font class="normalBlock"  id="totalNum10">驳回</font><em>
					<font class="actTotal">
					<c:forEach var="temp" items="${listMap}">
							<c:if test="${temp.state == 10}">
								${temp.total}
							</c:if>
					</c:forEach>
				</font>
				</em></li>
			</ul>
		</div>
</div>
</div>		
<div class="row col-lg-12">
<div class="col-md-12 col-lg-12" style="height:auto;">	
<ul class="nav nav-tabs">
	<li class="bg01" id="li12"><a contenteditable="false" data-toggle="tab" href="#actDiv12">暂存的活动</a></li>
	<li class="bg02" id="li13"><a contenteditable="false" data-toggle="tab" href="#actDiv13">待审批的活动</a></li>
	<li class="bg03 active" id="li9"><a contenteditable="false" data-toggle="tab" href="#actDiv9">启用的活动</a></li>
	<li class="bg04" id="li11"><a contenteditable="false" data-toggle="tab" href="#actDiv11">暂停的活动</a></li>
	<li class="bg05" id="li8"><a contenteditable="false" data-toggle="tab" href="#actDiv8">停用的活动</a></li>
	<li class="bg06" id="li10"><a contenteditable="false" data-toggle="tab" href="#actDiv10">驳回的活动</a></li>
</ul>
<div class="tab-content col-md-12 col-lg-12" style=" border-top-color: transparent;overflow:hidden;">
<div class="tab-pane " contenteditable="false" id="actDiv12" style="width:100%;height:auto;border:0px solid transparent">
<iframe  src="../activity/allActivitys?po.state=12" style="width:100%;height:430px;border:0px solid transparent"></iframe>
</div>
<div class="tab-pane" contenteditable="false" id="actDiv13">
<iframe  src="../activity/allActivitys?po.state=13" style="width:100%;height:430px;border:0px solid transparent"></iframe>
</div>
<div class="tab-pane active" contenteditable="false" id="actDiv9">
 <iframe src="../activity/allActiveActs" style="width:100%;height:430px;border:0px solid transparent"></iframe>
</div>
<div class="tab-pane" contenteditable="false" id="actDiv11">
<iframe  src="../activity/allActivitys?po.state=11" style="width:100%;height:430px;border:0px solid transparent"></iframe>
</div>
<div class="tab-pane" contenteditable="false" id="actDiv8">
<iframe  src="../activity/allActivitys?po.state=8" style="width:100%;height:430px;border:0px solid transparent"></iframe>
</div>
<div class="tab-pane" contenteditable="false" id="actDiv10">
<iframe  src="../activity/allActivitys?po.state=10" style="width:100%;height:430px;border:0px solid transparent"></iframe>
</div>
</div>	

<!-- <div id="navtab1"  class="liger-tab" style="width:100%">
         <div tabid="actDiv12" title="暂存的活动" >
          	<iframe  src="../activity/allActivitys?po.state=12"></iframe>
           
        </div>
        <div tabid="actDiv13" title="待审批的活动" >          		
           	<iframe  src="../activity/allActivitys?po.state=13"></iframe>
        </div>
        <div title="启用的活动" tabid="actDiv9" lselected="true" >      
             <iframe src="../activity/allActiveActs"></iframe>
           <span>
         </div>
         <div title="暂停的活动" tabid="actDiv11" >
           <iframe  src="../activity/allActivitys?po.state=11"></iframe>
            
           <span>
         </div>
         <div title="停用的活动" tabid="actDiv8"  >
             <iframe  src="../activity/allActivitys?po.state=8"></iframe>
           <span>
         </div>
         <div title="驳回的活动" tabid="actDiv10"  >
             <iframe  src="../activity/allActivitys?po.state=10"></iframe>
           <span>
         </div>
     </div> -->


<!-- <div id="total_content" >
         <div id = "b_content12" style="display:none;">
          	<iframe class="b_content" src="../activity/allActivitys?po.state=12"></iframe>
           
        </div>
        <div id="b_content13" style="display:none;">          		
           	<iframe class="b_content" src="../activity/allActivitys?po.state=13"></iframe>
        </div>
        <div id="b_content9" style="display:block;">      
             <iframe class="b_content"  src="../activity/allActiveActs"></iframe>
           <span>
         </div>
         <div id="b_content11" style="display:none;">
           <iframe class="b_content" src="../activity/allActivitys?po.state=11"></iframe>
            
           <span>
         </div>
         <div id="b_content8"  style="display:none;">
             <iframe class="b_content" src="../activity/allActivitys?po.state=8"></iframe>
           <span>
         </div>
         <div id="b_content10"  style="display:none;">
             <iframe class="b_content" src="../activity/allActivitys?po.state=10"></iframe>
           <span>
         </div>
     </div> -->
     
     </div>
</div>	
</div>
</body>
</html>
