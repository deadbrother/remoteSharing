<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <link href="../js/ztree/css/demo.css" rel="stylesheet" type="text/css" />
<link href="../js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="../js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" /> -->


<script src="../js/datepicker/WdatePicker.js" type="text/javascript"></script>

<table class="activeLayout">
        <colgroup>
            <col width="125px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr id="activityFunction1">
            <th></th>
            <td colspan="3">
               <ul>
                   <li>
                       <input type="radio" name="po.activityFunction" class="icheckS" value="1" ${bo.activityBasicInfo.activityFunction==1||bo.activityBasicInfo.activityFunction==null?'checked':'' }/>执行活动
                       <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="该类活动的工单在渠道执行"></i>
                   </li>
                   <li>
                       <input type="radio" name="po.activityFunction" class="icheckS" value="2"  ${bo.activityBasicInfo.activityFunction==2?'checked':''}/>仅下发活动
                       <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="该类活动仅下发活动定义，不产生工单"></i>
                   </li>
               </ul>
            </td>
        </tr>
        <tr id="activityty2">
            <th>活动类型</th>
            <td colspan="4" >
                <ul class="inputUl" >
                   <li id="activityCycleType" style="margin-right:58px;"><input type="radio" id="disposable" name="po.activityCycle" class="icheckS" value="3" ${bo.activityBasicInfo.activityCycle==3||bo.activityBasicInfo.activityCycle==null?'checked':''}  />一次性</li>
                   <li class="ChannelOut"><input type="radio" name="po.activityType123" class="icheckS" value=""  ${bo.activityBasicInfo.activityCycle==1||bo.activityBasicInfo.activityCycle==2?'checked':''}/ >周期</li>
                    <li class="showInput mon" id="month"><input type="radio"   name="po.activityCycle" class="icheckS"  value="1" ${bo.activityBasicInfo.activityCycle==1?'checked':''}/ >按月刷新</li>
                   <li id="activityDayCycle" class="showInput mon"><input type="radio"  name="po.activityCycle" class="icheckS "  value="2" ${bo.activityBasicInfo.activityCycle==2?'checked':''}/ >按日刷新</li>
                </ul>
            </td>
        </tr>
        <tr id="activityname233">
            <th>
                <span>*</span>活动名称
            </th>
            <td colspan="4">
                 <input name="po.activityName" type="text" class="form-control" id="inputEmail3" placeholder="" value="${bo.activityBasicInfo.activityName }" check_empty check_name="活动名称" check_size="-1,30">
                 <span></span>
                <input type="hidden" id="checkNameValid" value="">
            </td>
            <td></td>
        </tr>
        <tr id="activitytheme344">
            <th>
                活动主题
            </th>
            <td colspan="4">
                <select class="form-control" name="po.activityThemeCode" value="${bo.activityBasicInfo.activityThemeCode}">
                    <option value="">请选择</option>
                    <c:forEach items="${bo.activityThemeList}" var="atl">
                       <option  value="${atl.themeCode}" ${atl.themeCode==bo.activityBasicInfo.activityThemeCode?'selected' :''}>${atl.themeName}</option>
                    </c:forEach>
                </select>
            </td>
            <td></td>
        </tr>
        <tr id="applicableRange">
            <th>
                <span>*</span>适用范围
            </th>
            <td colspan="4">
                <div class="content_wrap slds-size--7-of-8 slds-text-align--left" style="height:20px">
	                    <div class="zTreeDemoBackground left" style="height:20px">
	                    <input type="hidden" id="orgPath" name="po.orgPath" value="${bo.activityBasicInfo.orgPath }"   />
	                    <input type="hidden" id="orgId" name="po.orgIds" value="${bo.activityBasicInfo.orgIds }"/>
		                <input type="text" style="width:600px;cursor:pointer" id="orgSelect" name="po.orgRange" readonly value="${bo.activityBasicInfo.orgRange }" onmouseover="this.title=this.value" onclick="showMenu()"
						             class="form-control select-obj" check_empty check_name="适用范围">                               		                
	                    </div>
	               
                    </div>  
            </td>
            <td class="iconleft">
            <ul>
            <li><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="使用范围提示"></i></li>
            </ul>
            </td>
        </tr>
          <tr> 
        <td colspan="1"></td>
        <div id="zTreeDemoBack">
        <th>       
         <table>
		 <div id="menuContent" class="menuContent" style="display:none;z-index:100;margin-left:-100px;margin-top:-5px">
	      <ul id="orgtree" class="ztree" style="margin-left:127px;"></ul>
          </div>         
         </table>
          </th>
           </div>
          </tr>
        
        <tr id="time234">
            <th><span>*</span>开始时间 </th>
            <td>
				<input type="text" id="startDate" class="Wdate" name="po.startDate" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',maxDate:'#F{$dp.$D(\'endDate\')}'})" value="${bo.activityBasicInfo.startDate==null?bo.nowDate:bo.activityBasicInfo.startDate}" readonly="readonly" check_empty check_name="开始时间"/> 
            </td>
            <td class="iconleft">
            		<ul>
            		<li><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="默认当天"></i></li>
            		</ul>
            </td>
            <th><span>*</span>结束时间</th>
            <td>
                <input type="text" name="po.endDate" class="Wdate" id="endDate"  placeholder="" value="${bo.activityBasicInfo.endDate}" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy/MM/dd',minDate:'#F{$dp.$D(\'startDate\')}'})" readonly="readonly" check_empty check_name="结束时间"/>
            </td>
            <td class="iconleft">
            <!-- <ul>
            <li><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="结束时间为空时，周期性活动会一直循环，一次性的活动执行完后就结束"></i></li>
            </ul> -->
            </td>
        </tr>
        <tr id="activitydesc23">
            <th style="vertical-align:middle;">
                活动说明
            </th>
            <td colspan="4">
                <textarea class="form-control" name="po.activityDesc" check_size="0,1500" check_name="活动说明" rows="3">${bo.activityBasicInfo.activityDesc}</textarea>
            </td>
            <td></td>
        </tr>
    </table>
   <div class="activediv"></div>
