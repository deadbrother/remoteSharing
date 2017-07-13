<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动详情</title>
<%@include file="head-js-css.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../js/activity/activity-detail.js" type="text/javascript"></script>

</head>
<body>
<!-- 隐藏域 -->
<input type="hidden" id="channelcheck" name="po.channelCheck" value="">
<input type="hidden" id="selectChannelId" value="${bo.activityBasicInfo.channelCheck}">
<input type="hidden" id="activityState" value="11">
<input type="hidden" id="activityId" value="${bo.po.activityId}" />
<input type="hidden" id="activityCycle" value="${bo.activityBasicInfo.activityCycle}" />
<input type="hidden" id="radioCheck4ChanneLSpecial" value="${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'0':'1'}" />
<input type="hidden" id="radioCheck4PopSpecial" value="${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'0':'1'}" />
<input type="hidden" id="radioCheck4TelSpecial" value="${bo.channelTelePhone.telchannelSpecialFilterList==null||bo.channelTelePhone.telchannelSpecialFilterList.size()==0?'0':'1'}" />
<input type="hidden" id="orgPath" value="${bo.activityBasicInfo.orgPath }" />
<input type="hidden" id="check" value="${bo.po.examineDetailCheck}" name="bo.po.examineDetailCheck"/>
<input type="hidden" id="hideFunctionId" name="hideFunctionId" value="${bo.hideFunctionId}"/>
<input type="hidden" id="hideChannelId" name="hideChannelId" value="${bo.hideChannelId}"/>
<!--  主体内容开始 -->
  <div class="container" style="margin-bottom:50px;">
 <!-- <h2 class="activity">营销活动详情<div class="pull-right" style="margin-right:120px;margin-top:15px"><button class="slds-button slds-button--brand " id="return-btn" onclick="historyBack()">返回</button></div></h2> -->
<!--   三个页面嵌入 开始-->
<div class="activitySetArea">
                      <div id="step-1-basicinfo" >
							<%--动态引用 <jsp:include page="activity-step1.jsp"></jsp:include> --%>
				          <table class="activeLayout">
        <colgroup>
            <col width="90px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
      <tr id="activityFunction1">
            <th>活动状态：</th>
            <td >
            ${bo.activityBasicInfo.activityFunction==1?'活动执行':'活动下发'}
            </td>
        </tr>
        <tr id="activityty2">
        	<th>活动类型：</th>
            <td >
            ${bo.activityBasicInfo.activityCycle==2?'按日刷新':bo.activityBasicInfo.activityCycle==1?'按月刷新':'一次性'}              
            </td>
        </tr>
    <!--  分割线开始  -->  
      <!--    <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 -->     
        <tr id="activityname233">         
            <th>活动名称：</th>
            <td colspan="4">
           ${bo.activityBasicInfo.activityName }
            </td>
            <td></td>
        </tr>        
        <tr id="activitytheme344">
            <th> 活动主题：</th>
            <td colspan="4">
              <c:forEach items="${bo.activityThemeList}" var="atl">
                   <c:if test="${atl.themeCode==bo.activityBasicInfo.activityThemeCode}">${atl.themeName}</c:if>
                    </c:forEach>
            </td>
            <td></td>
        </tr>
         <!--  分割线开始  -->  
      <!--    <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="applicableRange">
            <th>适用范围：</th>
            <td colspan="4">
                <div class="l-grid-row-cell-inner" style="max-height:20px; width:600px; text-align:left;
                     display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title=" ${bo.activityBasicInfo.orgRange }"> ${bo.activityBasicInfo.orgRange }
                </div>  
            </td>
           
        </tr> 
         <!--  分割线开始  -->  
       <!--   <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 -->            
        <tr id="time234">
            <th>开始时间： </th>
            <td>
               ${bo.activityBasicInfo.startDate}
            </td>
            
            <th>结束时间：</th>
            <td>
             ${bo.activityBasicInfo.endDate}
            </td>
           
        </tr>
         <!--  分割线开始  -->  
       <!--   <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="activitydesc23">
            <th>
                活动说明：
            </th>
            <td colspan="4"><div style="overflow:scroll">
                ${bo.activityBasicInfo.activityDesc}</div>
            </td>
            <td></td>
        </tr>
      <!--  分割线开始  -->  
       <!--   <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
						<!--2 选择用户群  -->
						

	<input type="hidden" id="userGroupId" name="po.userGroupId" value="${bo.activityBasicInfo.userGroupId}"/>
   
        <tr id="usergroup23">
            <th>
                目标客户：
            </th>
            <td>
                ${bo.activityBasicInfo.userGroupName}
            </td>
            <th>
                <span class="people">用户数：</span>
                
            </th>
            <td id="userGroupNum">
            
          
       
            </td>
        </tr>
         <!--  分割线开始  -->  
       <!--   <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="isdeleteblackUser">
            <th >剔除防打扰名单：</th>
            <td>
               
                     ${bo.activityBasicInfo.isDeleteBlackUser=='1'?'是':'否'}
                

           </td>
           
        </tr>
        
         <!--  分割线开始  -->  
     <!--     <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="successStandardType12">
            <th>成功标准类型：</th>
            <td> 
	           <c:forEach items="${bo.successStandardTypeList}"
							 var="sst">
				<c:if test="${bo.successStandardPo.successTypeId == sst.typeId}">
				${sst.typeName}
				</c:if>
               </c:forEach>

            </td>
            <%-- <th>匹配类型：</th>
            <td>
               <input type="hidden" id="successProductIds"  name="successStandardPo.successProductIds" value="${bo.successStandardPo.successProductIds}">
               ${bo.successStandardPo.matchingTypeId==1?(bo.successStandardPo.successProductIds==null?'全部匹配':'全部匹配（选择优先产品）'):bo.successStandardPo.matchingTypeId==2?'精准匹配':''} 
            </td> --%>
        </tr>
       <!--  分割线开始  -->  
      <!--    <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="successSqlCondition232">
            <th>
                附加条件：
            </th>
            <td colspan="2">
            ${bo.successStandardPo.successCondition}
            	
             </td>
            
           
        </tr>
         <!--  分割线开始  -->  
        <!--  <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="successReward234">
            <th>
                奖励描述：
            </th>
            <td colspan="3">
                ${bo.successStandardPo.successReward}
            </td>
            
        </tr>
         <!--  分割线开始  -->  
        <!--  <tr>
        <td colspan="4">
        <div style="border-top: 1px dashed #e0e0e0 ;width:100%;height:1px;margin-top: 5px"></div> 
        </td>
        </tr> -->
     <!--  分割线结束 --> 
        <tr id="strategyDesc232">
            <th>策略描述：</th>
            <td colspan="3">
                ${bo.activityBasicInfo.strategyDesc }
            </td>
          
        </tr>
          <tr>
            <th>活动创建时间：</th>
            <td colspan="3">
                ${bo.activityBasicInfo.createDate}
            </td>
          
        </tr>
 
          </table>
<!--    <div class="activediv"></div> 
				            
				            
				            
						</div> -->
    

	
	<!--   //第二个表格结束 -->
						
						
						<!--3 配置策略  -->
						
						<div id="step-3-channel" >
			<div class="manager">
          <table style="width:730px;">
              <colgroup>
                  <col width="125px" />
                  <col width="*" />
              </colgroup>
              <tr>
                  <!-- <th style="text-align: right; padding-right:10px; padding-top:20px; vertical-align: top;">渠道触点</th> -->
                  <td class="al" colspan="2">
                      <div class="IndexBlock_activity" style="width:100%">
<!--             <h4 style=" padding-right:px;text-align:right"><a href="javascript:void(0)">按照用户渠道偏好统计</a><a href="javascript:void(0)" class="linkrefsh"><i class="fa  fa-repeat" aria-hidden="true"></i></a></h4>                       -->
                          <ol>
                              <li>
                                  <a href="javascript:void(0)">
                                      <strong><span id="userGroupNumAll">--</span> <sub>户</sub></strong>
                                      <em>目标用户总数</em>
                                  </a>
                              </li>                                                       
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum11">--</span> <sub>户</sub></strong>
                                      <em>微信</em>
                                  </a>
                              </li>
                             
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum2">--</span> <sub>户</sub></strong>
                                      <em>网厅</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum1">--</span> <sub>户</sub></strong>
                                      <em>手厅</em>
                                  </a>
                              </li>                             
                              
                          </ol>
                      
                          <div class="ChannelOut_activity" id="channelShow5" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="5" id="5"/>
                                  <i class="fa fa-user-o" aria-hidden="true"></i>
                                  客户经理
                              </h5>
                              <div class="AreaIn" id="InNo1">
                          
                                  <table class="managerTable" id="selectedRule">
                                      <colgroup>
                                          <%-- <col width="25%"/>
                                          <col width="20%"/>
                                          <col width="55%"/> --%>
                                          <col width="10%"/>
                                          <col width="40%"/>
                                          <col width="50%"/>                                     
                                      </colgroup>
                                      <tr id="frontline4545">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum5">--</span></td>
                                      </tr>
                                     <tr id="FrontLineData123">
                                          <td class="ar">筛选数据：</td>
                                          <td>
                                             ${bo.po.frontlineChannelPo.filterConditionSql != null?'是':'否'}
                                          </td>
                                          <td  id="FrontLineContent" <c:if test="${bo.po.frontlineChannelPo.filterConditionSql == null}">class="ar hidden"</c:if>>
                                              筛选数据条件 
                                          ${bo.po.frontlineChannelPo.filterCondition }
                                              <input type="hidden" id="FrontLineContent1Sql" name="filterConditionSql1" value="${bo.po.frontlineChannelPo.filterConditionSql}">
                                         
                                              
                                          </td>
                                      </tr>
                                      
                                      
                                      <tr id="frontlinewords12">
                                          <td class="ar" style="vertical-align:middle;">营销话术：</td>
                                          <td colspan="3">
                                              ${bo.po.frontlineChannelPo.marketingWords}
                                          </td>
                                      </tr>
                                      <tr id="frontlinesms123">
                                          <td class="ar">发送短信：</td>
                                          <%-- <td colspan="2">
                                              ${ bo.po.frontlineChannelPo.isSendSMS==1?'是':'否'}
                                          </td> --%>
                                         <td colspan="4"  id="content4" <c:if test="${ bo.po.frontlineChannelPo.isSendSMS!=1}">style="display:none;"</c:if>>
                                              ${bo.po.frontlineChannelPo.smsWords}
                                          </td>

                                      </tr>
                                       <input type="hidden" id="newrule" name='po.frontlineChannelPo.orderIssuedRule' value="">
                                   
                                      <c:forEach items="${bo.po.frontLineWorkOrderRulePoList }" var="frontLineWorkOrderRule" varStatus="status">
                                           <c:if test="${status.index == 0}">
                                      <tr>
                                          <td class="ar">工单下发规则：</td>
                                          <td colspan="2">
                                          <c:forEach var ="classification"  items="${bo.classification}">
					                        	<c:set var="isDoing1" value="0"/> 
                                               <c:if test="${classification.classificationId ==frontLineWorkOrderRule.ruleTypeClassId}">
					                             <c:set var="isDoing1" value="1"/> 
					                              ${classification.classificationName}
                		                          	</c:if>
                		                          	</c:forEach>
                		                  -

                                            <c:forEach var ="activityWorkOrderRuleInfo"  items="${bo.getRuleType}">
					   	                     <c:set var="isDoing1" value="0"/> 
                                               <c:if test="${activityWorkOrderRuleInfo.ruleTypeId ==frontLineWorkOrderRule.ruleTypeId}">
					                             <c:set var="isDoing1" value="1"/> 
					                              ${activityWorkOrderRuleInfo.ruleTypeName}
                		                          	</c:if>
						                              	
       				                                       	</c:forEach>
					                               
                                                </td>
                                           <td colspan="2">
                                              <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${frontLineWorkOrderRule.ruleOrgName}">${frontLineWorkOrderRule.ruleOrgName}
                                              </div>
                                           </td>
                                       
                                      </tr>
                                           </c:if>
			                               <c:if test="${status.index!=0}">
					                       <tr>
					                       <td class="ar">工单下发规则：</td>
					                       <td colspan="2">
                                          <c:forEach var ="classification"  items="${bo.classification}">
					                        	<c:set var="isDoing1" value="0"/> 
                                               <c:if test="${classification.classificationId ==frontLineWorkOrderRule.ruleTypeClassId}">
					                             <c:set var="isDoing1" value="1"/> 
					                              ${classification.classificationName}
                		                          	</c:if>
                		                          	</c:forEach>-
                                            <c:forEach var ="getRuleType"  items="${bo.getRuleType}">
					   	                     <c:set var="isDoing" value="0"/> 
                                               <c:if test="${getRuleType.ruleTypeId ==frontLineWorkOrderRule.ruleTypeId}">
					                             <c:set var="isDoing" value="1"/> 
					                             
                		                          	${getRuleType.ruleTypeName}</c:if>
						                              
       				                                       	</c:forEach>
					                               
                                                </td>
                                           <td colspan="2">
                                           <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${frontLineWorkOrderRule.ruleOrgName}">${frontLineWorkOrderRule.ruleOrgName}
                                           </div>
                                              
                                           </td>
				                                 	</tr>
				                                 	</c:if>
			                                       	</c:forEach> 

                                  </table>
                                 
                              </div>
                          </div>
                          <div class="ChannelOut_activity"  id="channelShow7" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="7" id="7"/>
                                  <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                                  本地短信
                              </h5>
                              <div class="AreaIn" id="InNo2">
                         
                                  <table class="managerTable">
                                    <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="60%"/>
                                                                                
                                      </colgroup>
                                      <tr id="duanxinnum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum7">--</span></td>
                                      </tr>
                                     <tr id="smsfilter12">
                                          <td class="ar">筛选数据 ：</td>
                                          <td >
                                            ${bo.msmChannelPo.filterConditionSql != null?'是':'否'}
                                          </td>
                                    <c:if test="${bo.msmChannelPo.filterConditionSql == null}"><td ></td></c:if>     
                                           <td id="LocalMessageContent" <c:if test="${bo.msmChannelPo.filterConditionSql ==null}">class="ar hidden"</c:if>>
                                             筛选数据条件：  ${bo.msmChannelPo.filterCondition }
                                              <input type="hidden" name="filterConditionSql2" value="${bo.msmChannelPo.filterConditionSql}">
                                          </td>                                                                              
                                      </tr>
                                    	<tr id="smsorder">
                                          <td class="ar">订购产品选择 ：</td>
                                          <td colspan="4">
                                              ${bo.msmChannelPo.orderProductName}
                                          </td>
                               
                                      </tr>
                                      <tr id="smsmarkingtype">
                                          <td class="ar">营销类型 ：</td>
                                          <td colspan="4">
                                              ${bo.msmChannelPo.marketingName} 
                                          </td>
                               
                                      </tr>
										<tr id="smscontent232">
                                          	<td class="ar" style="vertical-align:middle;">发送内容：</td>
                                          	<td colspan="3" >
                                            ${bo.msmChannelPo.smsContent }
                                          	</td>                                                      			
                                      </tr>                                                                       
                                 </table>                                
                              </div>
                          </div>
                          <div class="ChannelOut_activity"  id="channelShow11" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="11" id="11"/>
                                  <i class="fa fa-commenting-o" aria-hidden="true"></i>
                                  微信
                              </h5>
                              <div class="AreaIn" id="InNo3">
                                 
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="60%"/>
                                      </colgroup>
                                       <tr id="weixinyonghushu">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum11">--</span></td>
                                      </tr>
                                       <tr id="weixinshaixuan">
                                          <td class="ar">筛选数据：</td>
                                          <td>
                                             ${bo.channelWebchatInfo.filterConditionSql != null?'是':'否'}
                                          </td>
                                            <td  id="WebChatContent" <c:if test="${bo.channelWebchatInfo.filterConditionSql == null}">class="ar hidden"</c:if>>

                                                                                                                                               筛选数据条件：                                     
                                              <input type="hidden" id="WebChatContent1Sql" name="filterConditionSql3" value="${bo.channelWebchatInfo.filterConditionSql}">
                                        
                                            ${bo.channelWebchatInfo.filterCondition }
                                           
                                           
                                       
                                          </td>
                                      </tr>
                                      
                                       <tr id="weixinpublicmess">
                                          <td class="ar">公众号信息：</td>
                                          <td colspan="4">
                                                   <c:forEach var ="channelPublicWebChatPo"  items="${bo.webChatPublic}">
                                                  <c:if test="${channelPublicWebChatPo.publicId==bo.webChatMidActivityPo.publicId }">
					                          
                			                         ${channelPublicWebChatPo.publicName}</c:if>
                			                      
       					                        </c:forEach>
                                             
                                          </td>
                               
                                      </tr>
                                      
                                      <tr id="weixintitel">
                                          <td class="ar">
                                             标题：
                                          </td>
                                          <td   colspan="2">${bo.channelWebchatInfo.channelWebchatTitle }</td>
                                      </tr>
                                      <tr id="weixinaddress">
                                          <td class="ar">
                                              网址：
                                          </td>
                                          <td  colspan="2">${bo.channelWebchatInfo.channelWebchatUrl }</td>
                                      </tr>
                                      <tr id="weixinhuashu">
                                          <td class="ar" style="vertical-align:middle;">
                                              话术：
                                          </td>
                                          <td  colspan="2">${bo.channelWebchatInfo.channelWebchatContent}</td>
                                      </tr>
                                  </table>
                          
                              </div>
                          </div>
                          <div class="ChannelOut_activity"  id="channelShow8" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="8" id="8"/>
                                  <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                                  集团弹窗
                              </h5>
                      <div class="AreaIn" >    
                         <table class="managerTable">
                          <colgroup>
                          <colgroup>
                          <col width="20%"/>
              				 <col width="20%"/>
                            <col width="35%"/>
                              <col width="15%"/>
                              <col width="10%"/>
                           </colgroup>
                         <tr id="tanchuanusernum">
                                          <td class="al" colspan="5">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum8">--</span></td>
                                      </tr>
                     				<tr id="tcshaixuannum">
                     				<c:if test="${bo.channelBusiness.filterConditionSql == null}">
                     				<td >筛选数据：${bo.channelBusiness.filterConditionSql != null?'是':'否'}</td>
                     				</c:if>
                     				<c:if test="${bo.channelBusiness.filterConditionSql != null}">
                     				<td class="ar">筛选数据：</td>
                                          <td >
                                             ${bo.channelBusiness.filterConditionSql != null?'是':'否'}
                                          </td>
                                          <td colspan="3" id="PrivateContent" >
                                              筛选数据条件 ：
                                             <!--  <input type="text" id="PrivateContent1Id" class="form-control manInput" placeholder="" > -->
                                               <input type="hidden" id="PrivateContent1Sql" name="filterConditionSql4" value="${bo.channelBusiness.filterConditionSql}">
                                             &nbsp;&nbsp;${bo.channelBusiness.filterCondition }
                                          </td>
                     				</c:if>
                                          
                                        
                                      </tr>
               					</table>  
               					</div>  
             
                              <div class="AreaIn" id="InNo4" style="margin-top:-16px;display: block;left:0;top:0;margin: 0px 100px 0 0px; ">
               
                                  <div class="windowDiv">
                                      <ul class="nav nav-tabs " role="tablist" id="myTab">
                                          <c:forEach  items="${bo.po.channelGroupPopupPo.channelCode}" var="tcChannelCode">
                                                <li role="presentation" class=${tcChannelCode.channelCode==1?"active":""}><a href="#home${tcChannelCode.channelCode}" role="tab" data-toggle="tab">${tcChannelCode.channelName}</a></li>
							    		  </c:forEach>
                                      </ul>
                                      <div class="tab-content">
                                      <c:forEach  items="${bo.channelGroupPopupPoQueryList}" var="tcChannelCode" varStatus="status">
                                          <div role="tabpanel" class="tab-pane ${tcChannelCode.channelIdentify==1?'active':''}" id="home${tcChannelCode.channelIdentify}">
                                           <input type="hidden" name="mvclist[${status.index}].channelIdentify" value="${tcChannelCode.channelIdentify}">
                                              <table class="managerTable">
                                                  <colgroup>
                                                      <col width="23%"/>
                                                      <col width="25%"/>
                                                      <col width="37%"/>
                                                      <col width="15%"/>
                                                  </colgroup>
                                       
                                                  <tr>
                                                  <tr>
                                                      <td class="ar">
                                                          渠道生效：
                                                      </td>
                                                      <td>
                                                     ${tcChannelCode.validate==1?'是':'否'}
                                                       </td>
                                                    
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar">
                                                         日弹出限制：
                                                      </td>
                                                      <td colspan="3">${tcChannelCode.numberLimit}&nbsp;&nbsp;&nbsp;次</td>
                                                     
                                                      
                                                  </tr>
                                                  <tr>
                                                      <td class="ar">
                                                          营销目标：
                                                      </td>
                                                      <td colspan="2">${tcChannelCode.target}</td>
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar" style="vertical-align:middle;">
                                                          话术：
                                                      </td>
                                                      <td id="escapeXml" colspan="2">${tcChannelCode.content}</td>
                                                      <td>
                                                       
                                                      </td>
                                                  </tr>
                                                  <tr>
			                                          <td class="ar">发送短信：</td>
			                                          <td colspan="4"  id="contentC4" <c:if test="${tcChannelCode.isSendSms!=1}">style="display:none;"</c:if>>
			                                              ${tcChannelCode.smsSendWords}
			                                          </td>			
			                                      </tr>
                                              </table>
                                          </div>
                                        </c:forEach>                                                                          
                                      </div>
                                  </div>
                                 </div>
                              </div>
                          <div class="ChannelOut_activity"  id="channelShow2" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="2" id="2"/>
                                  <i class="fa fa-television" aria-hidden="true"></i>
                                  网厅
                              </h5>
                              <div class="AreaIn" id="InNo5">
        
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="60%"/>
                                      </colgroup>
                                       <tr id="wtusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum2">--</span></td>
                                      </tr>
                                         <tr id="wtshaixuannum">
                                          <td class="ar">筛选数据：</td>
                                          <td>
                                              ${bo.wangting.filterConditionSql != null?'是':'否'}
                                          </td>
                                          <td id="WebOfficeContent" <c:if test="${bo.wangting.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 ：
                                             ${bo.wangting.filterCondition }   
                                              <input type="hidden" name="filterConditionSql5" value="${bo.wangting.filterConditionSql}">                                                                                                                                  
                                          </td>
                                      </tr>
                                      <tr id="wttuisongcontent">
                                          <td class="ar" style="vertical-align:middle;">
                                              话术：
                                          </td>
                                          <td colspan="2">${bo.wangting.content }</td>

                                      </tr>
                                      <tr id="wttitel">
                                          <td class="ar">
                                             标题：
                                          </td>
                                          <td colspan="2">${bo.wangting.title }</td>
                                      </tr>
                                      <tr id="wtaddresss">
                                          <td class="ar">
                                              网址：
                                          </td>
                                          <td colspan="2">${bo.wangting.url}</td>
                                      </tr>
                                  </table>
                     
                              </div>
                          </div>
                          <div class="ChannelOut_activity"  id="channelShow1" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="1"  id="1"/>
                                  <i class="fa fa-tablet" aria-hidden="true"></i>
                                  手厅
                              </h5>
                              <div class="AreaIn" id="InNo6">
                     
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="60%"/>
                                      </colgroup>
                                       <tr id="sTusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum1">--</span></td>
                                      </tr>
                                       <tr id="stshaixuan">
                                          <td class="ar">筛选数据：</td>
                                          <td>
                                              ${bo.channelHandOfficePo.filterConditionSql != null?'是':'否'}
                                          </td>
                                          <td id="HandOfficeContent" <c:if test="${bo.channelHandOfficePo.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 ：
                                              ${bo.channelHandOfficePo.filterCondition }
                                              <input type="hidden" id="HandOfficeContent1Sql" name="filterConditionSql6" value="${bo.channelHandOfficePo.filterConditionSql}">
                                         
                                          </td>
                                      </tr>
                                      <tr id="sttuisongcontent">
                                          <td class="ar" style="vertical-align:middle;">
                                             话术：
                                          </td>
                                          <td colspan="2">${bo.channelHandOfficePo.content }</td>
                                      </tr>
                                      <tr id="sttitle">
                                      	<td class="ar">标题：</td>
                                      	<td colspan="2">${bo.channelHandOfficePo.title }</td>
                                      </tr>
                                      <tr id="stwangzhi">
                                          <td class="ar">
                                              网址：
                                          </td>
                                          <td colspan="2">${bo.channelHandOfficePo.url }</td>
                                      </tr>

                                  </table>
                       
                              </div>
                          </div>
                          <div class="ChannelOut_activity"  id="channelShow9" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="9"  id="9"/>
                                  <i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                                  沃视窗
                              </h5>
                              <div class="AreaIn" id="InNo7">
                  
                                  <table class="managerTable">
                                      <colgroup>
                                          <col width="20%"/>
                                          <col width="25%"/>
                                          <col width="55%"/>
                                      </colgroup>
                                       <tr id="wscusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum9">--</span></td>
                                      </tr>
                                        <tr id="wscshaixuan">
                                          <td class="ar">筛选数据：</td>
                                          <td>
                                            ${bo.channelWoWindowPo.filterConditionSql != null?'是':'否'}
                                          </td>
                                          <td id="WoWindowContent" <c:if test="${bo.channelWoWindowPo.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 ：
                                             ${ bo.channelWoWindowPo.filterCondition}
                                            <input type="hidden" name="filterConditionSql7" value="${bo.channelWoWindowPo.filterConditionSql}">
                                          </td>
                                      </tr>
                                      <tr id="wschuashu">
                                          <td class="ar" style="vertical-align:middle;">
                                              话术：
                                          </td>
                                        <td>  ${bo.channelWoWindowPo.huashu }</td>
                                      </tr>
                                      <tr id="wsctitle">
                                          <td class="ar">
                                             标题：
                                          </td>
                                        <td> ${bo.channelWoWindowPo.title }</td>
                                      </tr>
                                      <tr id="wscwangzhi">
                                          <td class="ar">
                                              网址：
                                          </td>
                                        <td colspan="2"> ${bo.channelWoWindowPo.url }</td>
                                      </tr>
                                      <tr id="wscpictureaddress">
                                          <td class="ar">
                                              图片网址：
                                          </td>
                                          <td colspan="2">${bo.channelWoWindowPo.imgUrl }</td>
                                      </tr>
                                      <tr id="wscpicturesize">
                                          <td class="ar">
                                              <span>*</span>图片尺寸：
                                          </td>
                                          <td colspan="2">
                                              
                                              <c:choose>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='600*360' }">
                                                  600*360
                                              </c:when>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='640*90' }">
                                               
                                                  640*90" 
							                   
                                              </c:when>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='640*268' }">
                                                  640*268
							                     
                                              </c:when>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='620*420' }">                                                  
							                      620*420
                                              </c:when>
                                              <c:otherwise>
                                                  无                                            
                                              </c:otherwise>
                                            </c:choose>   
                                             
                                          </td>
                                      </tr>
                                  </table>
                           
                              </div>
                          </div>
                          <%-- <div class="ChannelOut_activity"  id="channelShow12" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="12"  id="12"/>
                                  <i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                                  电话渠道
                              </h5>
              
                              <div class="AreaIn" id="InNo7">
                  
                                  <table class="managerTable">
                                      <!--[if IE ]> 
           										 <colgroup>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                      <col width="450px"/>
                                                      
                                                  </colgroup>
           
            											<![endif]-->
            							<!--[if !IE]><!--> 
           						 <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="30%"/>
                                          <col width="30%"/>
                                      </colgroup>
              
            				 <!--<![endif]-->			
                                       <tr width="130" id="dhusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum12" numtd>--</span></td>
                                      </tr>
                                        <tr id="dhshaixuan">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="channelTelePhoneSelectData" name="channelTelePhoneRadio" class="icheckS" value="1" ischannel="12" <c:if test="${bo.channelTelePhone.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2 showFrontline"><input type="radio" name="channelTelePhoneRadio" class="icheckS" value="0" ischannel="12" <c:if test="${bo.channelTelePhone.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                              
                                            ${bo.channelTelePhone.filterConditionSql != null?'是':'否'}
                                          
                                          </td>
                                          <td id="channelTelePhoneContent" colspan="2"<c:if test="${bo.channelTelePhone.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 ：
                                             ${ bo.channelTelePhone.filterCondition}
                                            <input type="hidden" name="filterConditionSql12" value="${bo.channelTelePhone.filterConditionSql}">
                                           <c:if test="${bo.channelTelePhone.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 
                                              <input type="text" id="channelTelePhoneContent1Id" name="channelTelePhone.filterCondition" value="${bo.channelTelePhone.filterCondition}" class="form-control manInput" onmouseover="this.title=this.value" placeholder=""  readonly ischannel="12" onmouseover="this.title=this.value">
                                              <input type="hidden" id="channelTelePhoneContent1Sql" name="channelTelePhone.filterConditionSql" value="${bo.channelTelePhone.filterConditionSql}">
                                              <input type="hidden" id="channelTelePhoneContent1SqlCondition" name="channelTelePhone.filterSqlCondition" value="${bo.channelTelePhone.filterSqlCondition}">
                                              <button type="button" id="channelTelePhoneContent1" class="btn btn-primary term" onclick='chooseCondition("channelTelePhoneContent1","userGroupChannelNum12")' ischannel="12">条件</button>
                                          </td>
                                             <!--[if IE]> 
                                            
                                                <c:if test="${bo.channelBusiness.filterConditionSql == null}"><td></td></c:if> 
                                           <![endif]-->
                                      </tr>
                                      <tr id="dhhuashu">
                                          <td class="ar" style="vertical-align:middle;">
                                              <span>*</span>话术
                                          </td>
                                          <td colspan="2">${bo.channelTelePhone.telephoneHuashuContent }</td>
                                      
                                      </tr>
                                      
                                      <tr id="dhchannelchoose">
                                      	<td class="ar">选择渠道</td>
                                      	
                                      	<td colspan="3">
                                      		<c:forEach items="${bo.channelTelePhone.orgCityNameList}" var ="ual">
                   								&nbsp;&nbsp;${ual}</br>
                                           </c:forEach>
                                      	<td>
                                      </tr>
                                      
                                      <input type="hidden"  id="orgCityIds" name="channelTelePhone.orgCityIds"value="${bo.channelTelePhone.orgCityIds }"/>		
	                                  <input type="hidden"  id="companyId" name="channelTelePhone.companyId" value="${bo.channelTelePhone.companyId }"/>
	                                  </table>
                                     <table></table>
                                     
                                  
                           
                              </div>
                          </div>
                          
                          <!-- 集团短信开始 -->   
                <div class="ChannelOut_activity"  id="channelShow3" style="display:none">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="3" id="3"/>
                                  <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                                  集团短信
                              </h5>
                              <div class="AreaIn" id="InNo9">
                         
                                  <table class="managerTable">
                                    <colgroup>
                                          <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="60%"/>
                                                                                
                                      </colgroup>
                                      <tr>
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum3">--
</span></td>
                                      </tr>
                                     <tr>
                                          <td class="ar">筛选数据 ：</td>
                                          <td >
                                            ${bo.zongBuMsmChannelPo.filterConditionSql != null?'是':'否'}
                                          </td>
                                    <c:if test="${bo.zongBuMsmChannelPo.filterConditionSql == null}"><td ></td></c:if>     
                                           <td id="LocalMessageContent" <c:if test="${bo.zongBuMsmChannelPo.filterConditionSql ==null}">class="ar hidden"</c:if>>
                                             筛选数据条件：  ${bo.zongBuMsmChannelPo.filterCondition }                                          </td>                                                                              
                                      </tr>
                                    	 <tr>
                                          <td class="ar">订购产品选择 ：</td>
                                          <td colspan="4">
                                              ${bo.zongBuMsmChannelPo.orderProductName}
                                          </td>
                               
                                      </tr> 
                                      <tr>
                                          <td class="ar">营销类型 ：</td>
                                          <td colspan="4">
                                              ${bo.zongBuMsmChannelPo.marketingName} 
                                          </td>
                               
                                      </tr>
										<tr>
                                          	<td class="ar" style="vertical-align:middle;">发送内容：</td>
                                          	<td colspan="3" >
                                            ${bo.zongBuMsmChannelPo.smsContent }
                                          	</td>                                                      			
                                      </tr>                                                                       
                                 </table>                                
                              </div>
                          </div>
                         
           <!-- 集团短信结束 -->   --%>
                      </div>
</div>
                  </td>
              </tr>
          </table>
          </div>

          <button id="advancedActivityBtn" type="button" class="btn btn-primary fr" style="margin-top:10px;" data-toggle="modal" data-target="">高级模式</button>
     <div id="advancedActivity" style="display:none">
     <h2 class="activity">高级模式</h2>
<div class="activitySetArea">

    <h3 class="headList">活动信息扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="15%" />
            <col width="15%" />
        </colgroup>
        <tr id="activitylevel12">
            <th>活动优先级：</th>
            <td colspan="2">
                ${bo.activityBasicInfo.urgencyLevel==1?'高':bo.activityBasicInfo.urgencyLevel==2?'中':'低' }               
            </td>
        </tr>
        <tr id="parentactivity12">
            <th>关联活动：</th>
            <td colspan="2">
                
                
                    <c:forEach items="${bo.higherActivityList}" var ="ual">
                   
                    <c:if test="${ual.activityId==bo.activityBasicInfo.parentActivity}">
                     ${ual.activityName}
                    </c:if>
                 
                    </c:forEach>

            </td>
        </tr>
        <tr id="activitypolice">
            <th>所属政策：</th>
            <td colspan="2">              
                    <c:forEach items="${bo.policyList }" var="pol">
                     <c:if test="${pol.policyId==bo.activityBasicInfo.policyId}">${pol.policyName}</c:if>
                    </c:forEach>               
            </td>
        </tr>
    </table>
  	<h3 class="headList">工单规则扩展配置</h3>
  	<table class="activeLayout" >
    	<colgroup>
            <col width="125px" />
            <col width="30%" />
            <col width="*" />
            <col width="*" />
        </colgroup>
     <tr id="orderIsValid" class="hide">
            <th>工单有效期：</th>
            <c:if test="${bo.activityBasicInfo.activityCycle==1}">
            <td colspan="2">
                ${bo.activityBasicInfo.orderCycle }&nbsp;&nbsp;月
            </td>
           </c:if>
           <c:if test="${bo.activityBasicInfo.activityCycle!=1}">
            <td colspan="2">
                ${bo.activityBasicInfo.orderCycle }&nbsp;&nbsp;日
            </td>
           </c:if>
        </tr>
        <c:if test="${bo.activityBasicInfo.activityCycle!=3}">
        <tr id="orderRuleUpdate">
            <th>工单更新规则：</th>
            <td colspan="2">
               ${bo.activityBasicInfo.orderUpdateRule==1?'追加':'覆盖'}
            </td>
        </tr>
        </c:if>
        <tr id="obligateOrder233">
            <th >预留工单百分比：</th>
            <td colspan="2">
                     ${bo.activityBasicInfo.obligateOrder}%
            </td>
        </tr>
        <tr id="orderisconsulwewtdate">
        	<th>参照活动结束时间：</th>
        	<c:if test="${bo.activityBasicInfo.orderIsConsultEndDate==1}">
            	<td colspan="2">
                	是
            	</td>
           	</c:if>
           	<c:if test="${bo.activityBasicInfo.orderIsConsultEndDate==0||bo.activityBasicInfo.orderIsConsultEndDate==null}">
           	 	<td colspan="2">
                	否
            	</td>
           	</c:if>
        </tr>
    </table>
    
    <h3 class="headList" id="channelIdsgj5">客户经理扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="25%" />
            <col width="25%" />
            <col width="28%" />
        </colgroup>
        <tr id="kehujlchannelSpecialFilter">
            <!-- <th  class="whiteNormal">客户经理不同用户显示不同推荐信息说明：</th> -->
            <td class="whiteNormal">客户经理不同用户显示不同推荐信息说明：${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'否':'是'}</td>
            <%-- <td >
                ${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'否':'是'}
            </td> --%>
        </tr>
        <tr style="display: none" id="explainTable">
            <td colspan="4">
                <table class="explainTable" id="strategyRuleTable">
                    <colgroup>
                        <col width="36px" />
                        <col width="15%" />
                        <col width="25%" />
                        <col width="6%" />
                        <col width="*" />
                        <col width="20%" />
                        <col width="20%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>短信内容</th>
                        <!-- <th>操作</th> -->
                    </tr>
                    </thead>
                   <tbody>
                     <tr>
	                        <td>0</td>
	                        <td>
	                        <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName}">${bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName}
                            </div>
	                        
	                        <input type="hidden" rulename
								name="po.frontlineChannelPo.channelSpecialFilterList[0].filterName"
								class="form-control tableInput" placeholder="" value="规则名称">
	                        </td>
	                        <input type="hidden" id="" ord
								name="po.frontlineChannelPo.channelSpecialFilterList[0].ord" value="0">
	                        <td>以下筛选条件剩余用户数</td>
	                        <td id="userGroupStrategyNum0" numtd>--</td>
	                        <td >
	                        <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords}">${bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords}
                            </div>
		                        
							</td>
							<td >
							<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate}">${bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate}
                            </div>
		                        
							</td>
	                 </tr>
                    
                    <c:if test="${not empty bo.po.frontlineChannelPo.channelSpecialFilterList}">
                    	<c:forEach var ="csfPo"  items="${bo.po.frontlineChannelPo.channelSpecialFilterList}" varStatus="status">
                    		<c:if test="${csfPo.ord != '0'}">
	                    		<tr >
									<td>${csfPo.ord }</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.filterName}">${csfPo.filterName}
                                    </div>									
										</td>
									<input type="hidden" id="" ord
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].ord" value="${csfPo.ord }">
									<td>${csfPo.filterCondition }
										<input
										type="hidden" id="" sql
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].filterConditionSql"
										value="${csfPo.filterConditionSql }">
										</td>
									<td id="userGroupStrategyNum${status.index}" numtd>--</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.marketingWords }">${csfPo.marketingWords }
                                    </div>
									</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.msmTemplate }">${csfPo.msmTemplate }
                                    </div>
									</td>
								</tr>
							</c:if>       
                     	</c:forEach>
                    </c:if>
<!--                     <tr style="display: none;"> -->
					
<!--                     <tr>
                        <td>2</td>
                        <td><input type="text" class="form-control tableInput" placeholder="规则二"></td>
                        <td>终端类型：4g终端；卡类型：sim卡；</td>
                        <td>4300</td>
                        <td><input type="text" class="form-control tableInput" placeholder="引导用户打开网络"></td>
                        <td><i class="fa fa-trash" aria-hidden="true"></i></td>
                    </tr> -->
                    </tbody>
                </table>
            </td>
        </tr>
        
    </table>
    
        <h3 class="headList" id="channelIdsgj8">弹窗渠道扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="25%" />
            <col width="25%" />
            <col width="28%" />
        </colgroup>
        <tr>
            <!-- <th class="whiteNormal">弹窗不同用户显示不同推荐信息说明：</th> -->
            <td class="whiteNormal">弹窗不同用户显示不同推荐信息说明：${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'否':'是'}</td>
            <%-- <td>
                ${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'否':'是'}
            </td> --%>
        </tr>
        <tr style="display: none" id="popExplainTable">
            <td colspan="4">
                <table class="explainTable" id="popRuleTable">
                    <colgroup>
                        <col width="36px" />
                        <col width="15%" />
                        <col width="25%" />
                        <col width="6%" />
                        <col width="*" />
                        <col width="20%" />
                        <col width="20%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>短信内容</th>
                        <!-- <th>操作</th> -->
                    </tr>
                    </thead>
                   <tbody>
                     <tr>
	                        <td>0</td>
	                        <td>
	                        <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.popSpecialFilterList[0].filterName==null?'':bo.popSpecialFilterList[0].filterName}">${bo.popSpecialFilterList[0].filterName==null?'':bo.popSpecialFilterList[0].filterName}
                            </div>	                        
	                        <input type="hidden" rulename
								name="popSpecialFilterList[0].filterName"
								class="form-control tableInput" placeholder="" value="规则名称">
	                        </td>
	                        <input type="hidden" id="" ord
								name="popSpecialFilterList[0].ord" value="0">
	                        <td>以下筛选条件剩余用户数</td>
	                        <td id="userGroupPopNum0" numtd>--</td>
	                        <td >
	                        <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.popSpecialFilterList[0].marketingWords==null?'':bo.popSpecialFilterList[0].marketingWords}">${bo.popSpecialFilterList[0].marketingWords==null?'':bo.popSpecialFilterList[0].marketingWords}
                            </div>
		                        
							</td>
							<td >
							<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.popSpecialFilterList[0].msmTemplate==null?'':bo.popSpecialFilterList[0].msmTemplate}">${bo.popSpecialFilterList[0].msmTemplate==null?'':bo.popSpecialFilterList[0].msmTemplate}
                            </div>
		                        
							</td>
	                 </tr>
                    
                    <c:if test="${not empty bo.popSpecialFilterList}">
                    	<c:forEach var ="csfPo"  items="${bo.popSpecialFilterList}" varStatus="status">
                    		<c:if test="${csfPo.ord != '0'}">
	                    		<tr >
									<td>${csfPo.ord }</td>
									<td>
									   <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.filterName}">${csfPo.filterName}
                                       </div>									
									</td>
									<input type="hidden" id="" ord
										name="popSpecialFilterList[${status.index}].ord" value="${csfPo.ord }">
									<td>${csfPo.filterCondition }
										<input
										type="hidden" id="" sql
										name="popSpecialFilterList[${status.index}].filterConditionSql"
										value="${csfPo.filterConditionSql }">
										</td>
									<td id="userGroupPopNum${status.index}" numtd>--</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.marketingWords}">${csfPo.marketingWords}
                                    </div>
									</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.msmTemplate }">${csfPo.msmTemplate }
                                    </div>
									</td>
								</tr>
							</c:if>       
                     	</c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
   
    <%-- <h3 class="headList" id="channelIdsgj12">电话渠道扩展配置</h3>
    <table class="activeLayout">
        <colgroup>
            <col width="22%" />
            <col width="25%" />
            <col width="25%" />
            <col width="28%" />
        </colgroup>
        <tr>
            <!-- <th class="whiteNormal">弹窗不同用户显示不同推荐信息说明：</th> -->
            <td class="whiteNormal">电话渠道不同用户显示不同推荐信息说明：${bo.channelTelePhone.telchannelSpecialFilterList==null||bo.channelTelePhone.telchannelSpecialFilterList.size()==0?'否':'是'}</td>
            <td>
                ${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'否':'是'}
            </td>
        </tr>
        <tr style="display: none" id="telExplainTable">
            <td colspan="4">
                <table class="explainTable" id="teleRuleTable">
                    <colgroup>
                        <col width="36px" />
                        <col width="15%" />
                        <col width="25%" />
                        <col width="6%" />
                        <col width="*" />
                        <col width="20%" />
                        <col width="20%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>短信内容</th>
                        <!-- <th>操作</th> -->
                    </tr>
                    </thead>
                   <tbody>
                     <tr>
	                        <td>0</td>
	                        <td>
	                        <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.channelTelePhone.telchannelSpecialFilterList[0].filterName==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].filterName}">${bo.channelTelePhone.telchannelSpecialFilterList[0].filterName==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].filterName}
                            </div>	                        
	                        <input type="hidden" rulename
								name="channelTelePhone.telchannelSpecialFilterList[0].filterName"
								class="form-control tableInput" placeholder="" value="规则名称">
	                        </td>
	                        <input type="hidden" id="" ord
								name="channelTelePhone.telchannelSpecialFilterList[0].ord" value="0">
	                        <td>以下筛选条件剩余用户数</td>
	                        <td id="userGroupTeleNum0" numtd>--</td>
	                        <td >
	                        <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords}">${bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords}
                            </div>
		                        
							</td>
							<td >
							<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate}">${bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate}
                            </div>
		                        
							</td>
	                 </tr>
                    
                    <c:if test="${not empty bo.channelTelePhone.telchannelSpecialFilterList}">
                    	<c:forEach var ="csfPo"  items="${bo.channelTelePhone.telchannelSpecialFilterList}" varStatus="status">
                    		<c:if test="${csfPo.ord != '0'}">
	                    		<tr >
									<td>${csfPo.ord }</td>
									<td>
									   <div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.filterName}">${csfPo.filterName}
                                       </div>									
									</td>
									<input type="hidden" id="" ord
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].ord" value="${csfPo.ord }">
									<td>${csfPo.filterCondition }
										<input
										type="hidden" id="" sql
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].filterConditionSql"
										value="${csfPo.filterConditionSql }">
										</td>
									<td id="userGroupTeleNum${status.index}" numtd>--</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.marketingWords}">${csfPo.marketingWords}
                                    </div>
									</td>
									<td>
									<div class="l-grid-row-cell-inner" style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;" title="${csfPo.msmTemplate }">${csfPo.msmTemplate }
                                    </div>
									</td>
								</tr>
							</c:if>       
                     	</c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </td>
        </tr>
    </table> --%>
   
    <h3 class="headList" id="qudaopeizhi12">渠道扩展配置</h3>
    <table class="activeLayout" id="qudapkz23">
        <colgroup>
            <col width="125px" />
            <col width="30%" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr id="advanceFrontLine">
            <th>接触频次定义：</th>
            <td>客户经理：</td>
            <td colspan="2">
              ${bo.po.frontlineChannelPo.isUniSet==0?'自定义':'使用统一设置' }
            </td>
         
        </tr>
        <c:if test="${bo.po.frontlineChannelPo.isUniSet==0}">
          <tr id="advanceActivity_frontlineChannel" >
        <th>接触频次设置：</th>
            <td>
                              近&nbsp;&nbsp;&nbsp;${bo.po.frontlineChannelPo.touchLimitDay==null?bo.activityChannelRule.touchLimitDay:bo.po.frontlineChannelPo.touchLimitDay }&nbsp;&nbsp;天一次
               <span data-toggle="tooltip" data-placement="right" title="接触频次：出工单时会判断接触记录表中近多少天是否与用户接触过。">
            </span>
            </td>
        
        
        </tr>
        </c:if>
       
        
        <tr id="localMessageInfo">
            <td></td>
            <td>本地短信：</td>
            <td colspan="2">
              ${bo.msmChannelPo.isUniSet==0?'自定义':'使用统一设置'}
            </td>
        </tr>
        
        <tr <c:if test="${bo.msmChannelPo.isUniSet!=0}">style="display:none"</c:if> id="advanceActivity_message">
                    <th></th>
            <td colspan="5">
         <table class="activeLayout" style="margin-left:20px" id="dxshiduan">
        <colgroup>
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
        </colgroup>
         <tr <c:if test="${bo.msmChannelPo.messageSendTime==''}"> style="display:none;"</c:if>>
            <th>短信时段设置：</th>
            <input type="hidden" id="messageSendTimeDetail" value="${bo.msmChannelPo.messageSendTime }"/>
            <td colspan="4" id="mstDetail" align="left"></td>
            <%-- <td   <c:if test="${bo.msmChannelPo.messageSendTime!='1'&& bo.msmChannelPo.messageSendTime!='1,2'}"> style="display:none;"</c:if>  colspan="2" >
            <input type="hidden" name = "msmChannelPo.messageSendTime" value="${bo.msmChannelPo.messageSendTime==null?bo.activityChannelRule.messageSendTime:bo.msmChannelPo.messageSendTime }"/>上午（9：00-12：00）</td>
            <td <c:if test="${bo.msmChannelPo.messageSendTime!='2'&& bo.msmChannelPo.messageSendTime!='1,2'}"> style="display:none;"</c:if>style="padding-left: 90px;" colspan="2">下午（14：30-18：00）</td> --%>
        </tr>
        <tr id="mouthsendshezhi">
            <th>按月刷新发送设置：</th>
            <td>开始日期：</td>
            <td> &nbsp;&nbsp;&nbsp;${bo.msmChannelPo.sendStartTime==null?bo.activityChannelRule.startDate:bo.msmChannelPo.sendStartTime }日</td>
            <td class="tdRight">结束日期：</td>
            <td> &nbsp;&nbsp;&nbsp;${bo.msmChannelPo.sendEndTime==null?bo.activityChannelRule.endDate:bo.msmChannelPo.sendEndTime }日</td>
        </tr>
        <tr id="ycleTimes34">
            <th></th>
            <td>本周期内发送次数：</td>
            <td> &nbsp;&nbsp;&nbsp;${bo.msmChannelPo.cycleTimes==null?bo.activityChannelRule.cycleSendTimes:bo.msmChannelPo.cycleTimes }次</td>
            <td class="tdRight">间隔：&nbsp;&nbsp;&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.intervalHours==null?bo.activityChannelRule.intervalDay:bo.msmChannelPo.intervalHours }日</td>
        </tr>
        <tr id="timessenf324">
            <th>按日刷新发送设置：</th>
            <td colspan="4">发送说明：出工单当天发</td>
        </tr>
        <tr id="touchLimitDay23">
            <th>发送频次设置：</th>
            <td colspan="4">
                近&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.touchLimitDay==null?bo.activityChannelRule.sendFrequency:bo.msmChannelPo.touchLimitDay}&nbsp;&nbsp;天一次
               </span>
            </td>
        </tr>
    </table>
        </td>
        
        
        </tr>
        <!-- 集团短信开始  -->
            <%-- <tr id="localMessageInfoZB">
            <td></td>
            <td>集团短信：</td>
            <td colspan="2">
              ${bo.zongBuMsmChannelPo.isUniSet==0?'自定义':'使用统一设置'}
            </td>
        </tr>
        
        <tr <c:if test="${bo.zongBuMsmChannelPo.isUniSet!=0}">style="display:none"</c:if> id="advanceActivity_messageZB">
                    <th></th>
            <td colspan="5">
         <table class="activeLayout" style="margin-left:20px" id="dxshiduan">
        <colgroup>
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
        </colgroup>
         <tr <c:if test="${bo.zongBuMsmChannelPo.messageSendTime==''}"> style="display:none;"</c:if>>
            <th>短信时段设置：</th>
            <input type="hidden" id="messageSendTimeZBDetail" value="${bo.zongBuMsmChannelPo.messageSendTime }"/>
            <td colspan="4" id="mstDetail" align="left"></td>   
        </tr>
        <tr id="mouthsendshezhiZB">
            <th>按月刷新发送设置：</th>
            <td>开始日期：</td>
            <td> &nbsp;&nbsp;&nbsp;${bo.zongBuMsmChannelPo.sendStartTime==null?bo.activityChannelRule.startDateJiTuan:bo.zongBuMsmChannelPo.sendStartTime }日</td>
            <td class="tdRight">结束日期：</td>
            <td> &nbsp;&nbsp;&nbsp;${bo.zongBuMsmChannelPo.sendEndTime==null?bo.activityChannelRule.endDateJiTuan:bo.zongBuMsmChannelPo.sendEndTime }日</td>
        </tr>
        <tr id="ycleTimes34ZB">
            <th></th>
            <td>本周期内发送次数：</td>
            <td> &nbsp;&nbsp;&nbsp;${bo.zongBuMsmChannelPo.cycleTimes==null?bo.activityChannelRule.cycleSendTimes:bo.zongBuMsmChannelPo.cycleTimes }次</td>
            <td class="tdRight">间隔：&nbsp;&nbsp;&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;${bo.zongBuMsmChannelPo.intervalHours==null?bo.activityChannelRule.intervalDay:bo.zongBuMsmChannelPo.intervalHours }日</td>
        </tr>
        <tr id="ycleTimes34ZB">
            <th>按日刷新发送设置：</th>
            <td colspan="4">发送说明：出工单当天发</td>
        </tr>
        <tr id="touchLimitDay23ZB">
            <th>发送频次设置：</th>
            <td colspan="4">
                近&nbsp;&nbsp;&nbsp;${bo.zongBuMsmChannelPo.touchLimitDay==null?bo.activityChannelRule.sendFrequencyJiTuan:bo.zongBuMsmChannelPo.touchLimitDay}&nbsp;&nbsp;天一次
               </span>
            </td>
        </tr>
    </table>
        </td>
        
        
        </tr> --%>
        <!-- 集团短信结束 -->
        
       <!--  <tr>
            <th class="whiteNormal">受限用户：</th>
            <td>查看限制用户数</td>
            <td colspan="3">
                客户经理：100个 占总数3%；短信：50个 占总数1%
            </td>
        </tr> -->
        <tr id="issSendorder323">
            <th></th>
            <td>处理方式</td>
            <td colspan="3">
             ${bo.activityBasicInfo.isSendOrder==0||bo.activityBasicInfo.isSendOrder==null?'不出工单':'不出工单' }
                
            </td>
        </tr>
        <tr id="selfsendcChannelrule34">
            <th rowspan="3">渠道协同配置：</th>
            <td>自动推送 </td>
            <td colspan="3">
            各自发送可以重复
               <%--  <form>
                    <ul>
                        <li class="li4"><input  type="radio"  name="po.selfSendChannelRule" class="icheckS" value="1" ${bo.activityBasicInfo.selfSendChannelRule==1||bo.activityBasicInfo.selfSendChannelRule==null?'checked':'' } />各自发送可以重复
                        </li>
                        <li class="li2 hidden"><input  type="radio"  name="po.selfSendChannelRule" class="icheckS" value="0"${bo.activityBasicInfo.selfSendChannelRule==0?'checked':'' } />短信微信互斥发送
                            <i data-toggle="tooltip" data-placement="right" title="先发送微信,其它用户发送短信" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form> --%>
            </td>
        </tr>
        <tr id="dianziqudao123">
            <td >电子渠道</td>
            <td colspan="2">
            不互斥
               <%--  <form>
                    <ul>
                        <li class="li1">
                            <input  type="radio"  name="po.eChannelShowRule" class="icheckS" value="1" ${bo.activityBasicInfo.eChannelShowRule==1||bo.activityBasicInfo.eChannelShowRule==null?'checked':'' }/>不互斥
                            <i data-toggle="tooltip" data-placement="right" title="不互斥：表示互不影响,每个渠道都可以展示一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form> --%>
            </td>
        </tr>
        <tr id="otherchannelexerule23">
            <td>客户经理与弹窗</td>
            <td colspan="2">
            不互斥
               <%--  <form>
                    <ul>
                        <li class="li1">
                            <input  type="radio"  name="po.otherChannelExerule" class="icheckS" value="1" ${bo.activityBasicInfo.otherChannelExerule==1||bo.activityBasicInfo.otherChannelExerule==null?'checked':'' }/>不互斥
                            <i data-toggle="tooltip" data-placement="right" title="不互斥表示都可以执行一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li> 
                        <li class="li2 hidden">
                            <input  type="radio"  name="po.otherChannelExerule" class="icheckS" value="0" ${bo.activityBasicInfo.otherChannelExerule==0?'checked':''} />互斥
                            <i data-toggle="tooltip" data-placement="right" title="互斥表示客户经理与弹窗只执行一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form> --%>
            </td>
        </tr>
    </table>
 
</div>
</div>
<script type="text/javascript">

  
</script>

          
			
			
			
			
			
						</div>
		</div>			
<!-- 	三个页面嵌入结束	 -->		
 
 
 </div>
<!--  主体内容  结束 -->
</div>
</body>
</html>
