<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%@ include file="head-js-css.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<script type="text/javascript" src="../js/activity/activity-loginmain.js"></script>
<link href="../js/activity/css/login.css" rel="stylesheet" type="text/css" />

<!--[if IE 8]>
<script type="text/javascript" src="../js/css/css3-mediaqueries.js"></script>
<style>
.login-content {	
	background-position: -50px -30px;
	}
.login-top{
  height:200px;
  background-position: center;
}
</style>
<![endif]-->


  </head>
  
  <body >
  <div class="hide">
  <input id="left1" type="hidden" value="${bo.loginButton}" >

<%--   <input type="hidden" id="loginButtonLeft1Info" value="${bo.loginButtonLeft1Info}" /> --%>
  </div>
<!--   背景图片部分 -->

  <div class="bg" >
  	<!-- 旋转动画内容 -->
  	<div class=" login-circle" id="div1">
  	<img src="../image/activity/three-circle.png" >
	<img src="../image/activity/two-circle.png" >
	<img src="../image/activity/two-circle.png" >
	</div>
	<div class="bg2"></div>
  </div>
 
  <!--   背景图片部分结束 -->
<!--    页面布局分三部分 头部 内容 底部 -->
   <div class=" login-wrap ">
   <div id="lefttooltip" class="lefttooltip hide">
	
	</div>
	<div id="righttooltip" class="righttooltip hide">
	
	</div>
 <center> 
   <div class=" login-content">
<!-- 头部开始 -->

<div class="col-lg-12 col-md-12 col-xs-12 login-top" style="background:;height:85px">
   <div class="col-lg-6 col-md-6 col-xs-6" >

<h1 >河南联通大数据精准化营销</h1>
	</div>
    <div class="col-lg-6 col-md-6 col-xs-6" >
		<h1 id="currentdate"></h1>
	</div>
</div>
<!-- 头部结束 -->
<!-- 内容开始  内容分为左右两部分 -->


<div class="col-lg-12 col-md-12 col-xs-12"  style="z-index:5;position:relative;">
<!-- 内容的左侧部分看开始 -->
   <div class="col-lg-6 col-md-6 col-xs-6" style="background:">
    	<!-- 模块一部分 -->
    	<div class="col-lg-12 col-md-12 col-xs-12 yxzx">
    	<div>
    	<div class="col-lg-2 col-md-1 col-xs-1"></div>
    	<div class="btn-group-vertical btncontent1 col-lg-3 col-md-4 col-xs-4">  
       <!--  <button  type="button" id="task-btn-drawwith" class="btn" data-toggle="tooltip" data-placement="bottom" data-original-title="营销任务按照给定规则分配给执行人员"> 任务划配</button>
         <button type="button" id="task-btn-coordination" class="btn" data-toggle="tooltip" data-placement="bottom" data-original-title="营销任务按照给定规则分配给最合适的执行渠道，同时兼顾渠道间避免多次打扰用户"> 渠道协同</button>
         <button type="button" id="task-btn-implement" class="btn" data-toggle="tooltip" data-placement="bottom" data-original-title="一线执行人员工作台，一套系统应对创建、执行、评估全业务流程"> 任务执行</button> -->
         <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==12}" >
                      <button type="button" id="test1" class="btn" value="${btnleft.buttonUrl}"   onmouseover='over("${btnleft.buttonDec}","${btnleft.buttonType}")' onmouseout='out()' >${btnleft.buttonName}</button>
                      </c:if>
          </c:forEach>
		</div>
	
		  <div class="col-lg-2 col-md-2 col-xs-2" style="padding:50px 0px">
         <img id="yscc" alt="" src="../image/activity/left-line.png">     
         </div>
        <!--  <img  src="../image/activity/yxzx.png" alt=""> -->
        <div   class="menu-yxpg  col-lg-3 col-md-3 col-xs-3" style="padding:70px 0px">
         <img  src="../image/activity/menu-circle.png">
         <p>
              <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==121}" >
                     ${btnleft.buttonName}
                      </c:if>
          </c:forEach>
         </p>  	
        </div>
         </div>
        </div>
        
       <!-- 模块二部分 -->
        <div class="col-lg-12 col-md-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-xs-offset-1 yxpg" >
       <div class="col-lg-2 col-md-1 col-xs-1"></div>
    	<div class="btn-group-vertical btncontent1 col-lg-3 col-md-4 col-xs-4" style="margin-top:-40px">  
          <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==11}" >
                      <button type="button" id="test1" class="btn" value="${btnleft.buttonUrl}" onmouseover='over("${btnleft.buttonDec}","${btnleft.buttonType}")' onmouseout='out("${btnleft.buttonType}")'>${btnleft.buttonName}</button>
                      </c:if>
          </c:forEach>
         <!-- <button type="button" id="btn-assessment" class="btn" data-toggle="tooltip" data-placement="bottom" data-original-title="对创建的活动执行情况，用户办理情况进行实时跟踪"> 活动跟踪</button>
         <button type="button" id="btn-ReportAnalysis" class="btn" data-toggle="tooltip" data-placement="bottom" data-original-title="系统提供多种不同维度报表，对活动情况、收入贡献进行全方位分析评估"> 报表分析</button>
         <button type="button" id="btn-evaluate" class="btn" data-toggle="tooltip" data-placement="bottom" data-original-title="对已经结束的活动进行评估，发掘成功营销用户特征，为未来的活动提供更有价值的数据支撑"> 成功后评价</button> -->
		</div>    
		
		<div class="col-lg-2 col-md-2 col-xs-2" style="padding:10px 0px">
		 <img alt="" src="../image/activity/left-line.png" >  
		</div>	
		
           
        <!--  <img alt="" src="../image/activity/yxpg2.png"> -->
         <div class="menu-yxzx col-lg-3 col-md-3 col-xs-3" style="padding:20px 0px">
         <img  src="../image/activity/menu-circle.png" alt="">  	
          <p>
              <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==111}" >
                     ${btnleft.buttonName}
                      </c:if>
          </c:forEach>
         </p>  
        </div>
         
        </div>
	</div>
	<!-- 内容的左侧部分看结束 -->
	<!-- 内容的右侧部分看开始 -->
    <div class="col-lg-6 col-md-6 col-xs-6" style="">
			<!-- 模块三部分 -->
		<div class="col-lg-12 col-md-12 col-xs-12 jzhk"> 
	 <div class="col-lg-1 col-md-1 col-xs-1"></div>
		           
          <div class="menu-jzhk col-lg-3 col-md-3 col-xs-3" style="padding:50px 0px">
         <img  src="../image/activity/menu-circle.png" alt=""> 
          <p>
              <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==211}" >
                     ${btnleft.buttonName}
                      </c:if>
          </c:forEach>
         </p>    	
        </div>
         <div class="col-lg-2 col-md-2 col-xs-2"  style="padding:50px 0px">
         <img alt="" src="../image/activity/right-line.png"> 
         </div>
          <div class="col-lg-4 col-md-4 col-xs-4" >
         <div class="btn-group-vertical btncontent2 col-lg-12 col-md-12 col-xs-12">  
        <!--  <button type="button" id="usertool-btn-extract" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="基于用户标签、模型计算，精准提取出营销客户群"> 客户群提取</button>
         <button type="button" id="usertool-btn-explore" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="“流量经营”、“机网卡匹配”、“套餐适配”，基于常用业务场景实现自动分析客户群"> 客户群探索分析</button>
         <button type="button" id="usertool-btn-insight" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="客户洞察提供对任意客户群进行更高效、更自由的特征分析功能"> 客户洞察</button> -->
          <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==21}" >
                      <button type="button" id="test1" class="btn" value="${btnleft.buttonUrl}" onmouseover='over("${btnleft.buttonDec}","${btnleft.buttonType}")' onmouseout='out("${btnleft.buttonType}")'>${btnleft.buttonName}</button>
                      </c:if>
          </c:forEach>
		</div> 
		</div>
	   	  
        </div>
     <!-- 模块四部分 -->
        <div class="col-lg-12 col-md-12 col-xs-12 col-lg-offset-1 col-md-offset-1  yxch">
       
         <div class="col-lg-2 col-md-2 col-xs-2"></div>
          <div class="menu-yxch col-lg-3 col-md-3 col-xs-3" style="padding:20px 0px">
         <img  src="../image/activity/menu-circle.png" alt="">
         <p>
              <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==221}" >
                     ${btnleft.buttonName}
                      </c:if>
          </c:forEach>
         </p>   	
        </div>
        <div class="col-lg-2 col-md-2 col-xs-2" style="padding:10px 0px">
        <img alt="" src="../image/activity/right-line.png">     
        </div>
        <div class="col-lg-4 col-md-4 col-xs-4" >
    	<div class="btn-group-vertical btncontent2 col-lg-12 col-md-12 col-xs-12" style="margin-top:-40px">  
         <!-- <button type="button" id="add-activity-btn" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="获取客户群”、“匹配产品”、“匹配渠道”一体化活动策划功能"> 普通营销活动策划</button>
         <button type="button" id="add-activitysc-btn" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="由“实时位置、互联网行为、实时信令”作为营销的触发条件，实现灵活、高可用行的营销策划"> 场景营销活动策划</button>
         <button type="button" id="add-activityyw-btn" class="btn" data-toggle="tooltip" data-placement="top" data-original-title="异网营销活动策划”提供对非中国联通用户进行营销策划功能"> 异网营销活动策划</button> -->
          <c:forEach items="${bo.loginButton}" var="btnleft">
                    <c:if test="${btnleft.buttonType==22}" >
                      <button type="button" id="test1" class="btn" value="${btnleft.buttonUrl}" onmouseover='over("${btnleft.buttonDec}","${btnleft.buttonType}")' onmouseout='out("${btnleft.buttonType}")'>${btnleft.buttonName}</button>
                      </c:if>
          </c:forEach>
		</div>    	
        </div>
        
        
        
        </div>
	</div>
	<!-- 内容的右侧部分结束 -->
</div>
<!-- 内容结束-->
<!-- 底部开始 -->
<div class="col-lg-12 col-md-12 col-xs-12 login-bottom" style="height:90px;margin-top:-60px;padding:0 10px;">
</div>
<!-- 底部结束 -->  
   </div>
   </center> 
   </div>
   

  </body>
</html>
