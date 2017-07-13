<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 引入UEditor -->
<script type="text/javascript" charset="utf-8" src="../js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../js/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="../js/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 引入UEditor结束 -->
<input type="hidden" id="ueditorTools" value="${bo.ueditorTools }"/>
<input type="hidden" id="channelcheck" name="po.channelCheck" value="">
<input type="hidden" id="selectChannelId" value="${bo.activityBasicInfo.channelCheck}">
<input type="hidden" id="forEachList" value="${bo.po.frontLineWorkOrderRulePoList }"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <div id="zTreeDemoBack1" style="position:absolute;z-index:1000;margin-left:20px;margin-top:90px">
         
		 <div id="menuContent1" class="menuContent" style="display:none;z-index:1000;margin-left:-100px;margin-top:-5px">
	      <ul id="orgtree1" class="ztree" style="margin-left:127px;"></ul>
          </div>         
        
   </div>
   <div id="savelastValue">
   <input type="hidden" id="firstVal0" name="" value="" />
   <input type="hidden" id="lastVal0" name="" value="" />
   </div>
   
   <div id="saveSpecialOption" class="hide">
   <input type="hidden" id="saveFrontId" value=""/>
   </div> 
   <div class="hidden">
                                             <select  name="" onchange="initFunction(id)" class="form-control" id="classid" >
                                                 <option value="">请选择</option>
                                                <c:forEach var ="classification"  items="${bo.classification}">
					                              <option id="${classification.classificationId}"  value="${classification.classificationId}">
                			                         ${classification.classificationName}</option> 
       					                        </c:forEach>
                                              </select>
                                              <select  name="IssuedRule" class="form-control" id="orderIssuedRule" onchange="removeRepect(id,'change')">
                                                 <option value="">请选择</option>
                                                <c:forEach var ="ruleType"  items="${bo.getRuleType}">
					                              <%-- <option id="${ruleType.ruleTypeId}"  value="${ruleType.ruleTypeId}">
                			                         ${ruleType.ruleTypeName}</option>  --%>
       					                        </c:forEach>
                                              </select>
   </div>
  <div class="manager">
          <table style="width:730px;">
           <!--[if IE]> 
            <colgroup>
                  <col width="10px" />
                  <col width="*" />
              </colgroup>
           
            <![endif]-->
            <!--[if !IE]><!--> 
           <%--  <colgroup>
                  <col width="125px" />
                  <col width="*" />
              </colgroup> --%>
            
             <colgroup>
                  <col width="10px" />
                  <col width="*" />
              </colgroup>
             <!--<![endif]-->
              
              <tr>
                  <th style="text-align: left; padding-right:10px; padding-top:5px; vertical-align:middle;">渠道触点</th>
              </tr>
              <tr>
              <td>
                      <div class="IndexBlock_activity">
<!--             <h4 style=" padding-right:px;text-align:right"><a href="javascript:void(0)">按照用户渠道偏好统计</a><a href="javascript:void(0)" class="linkrefsh"><i class="fa  fa-repeat" aria-hidden="true"></i></a></h4>                       -->
                          <ol>
                              <li style="width: 35%;">
                                  <a href="javascript:void(0)">
                                      <strong><span id="userGroupNumAll" numtd>--</span> <sub>户</sub></strong>
                                      <em>目标用户总数</em>
                                  </a>
                              </li>
<!--                               <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span id="userGroupNum5">--</span> <sub>户</sub></strong>
                                      <em>客户经理</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span id="userGroupNum7">--</span> <sub>户</sub></strong>
                                      <em>本地短信</em>
                                  </a>
                              </li> -->
                              <li style="width: 20%;">
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum11" numtd>--</span> <sub>户</sub></strong>
                                      <em>微信</em>
                                  </a>
                              </li>
<!--                               <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum8">--</span> <sub>户</sub></strong>
                                      <em>本地弹窗</em>
                                  </a>
                              </li> -->
                              <li style="width: 20%;">
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum2" numtd>--</span> <sub>户</sub></strong>
                                      <em>网厅</em>
                                  </a>
                              </li>
                              <li style="width: 20%;">
                                  <a href="javascript:void(0)" >
                                      <strong><span  id="userGroupNum1" numtd>--</span> <sub>户</sub></strong>
                                      <em>手厅</em>
                                  </a>
                              </li>
<!--                               <li> 
                                  <a href="javascript:void(0)" >
                                      <strong><span id="userGroupNum9">--</span> <sub>户</sub></strong>
                                      <em>沃视窗</em>
                                  </a>
                              </li>
                              <li>
                                  <a href="javascript:void(0)" >
                                      <strong><span id="userGroupNumOther">--</span> <sub>户</sub></strong>
                                      <em>其他</em>
                                  </a>
                              </li>-->
                              
                          </ol>
                      
                          <div class="ChannelOut_activity" id="channelIds5">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="5" id="5" ischannel="5"/>
                                  <i class="fa fa-user-o" aria-hidden="true"></i>
                                  客户经理
                              </h5>
                              <div class="AreaIn" id="InNo1">
                          
                                  <table class="managerTable" id="selectedRule">
                                  <!--[if IE]> 
           					 <colgroup>
                  					<col style="width:170px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:122px" />
             					 </colgroup>
           
            				<![endif]-->
            				 <!--[if !IE]><!-->             
             						<colgroup>
                                          <col width="25%"/>
                                          <col width="20%"/>
                                          <col width="30%"/>
                                          <col width="15%"/>
                                          <col width="9%"/>                                        
                                      </colgroup> 
            					 <!--<![endif]-->
                                  
                                      <tr id="frontline4545">
                                          <td class="al " colspan="3">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum5" numtd>--</span></td>
                                     	  <td class="ar" colspan="2">
												<button type="button" class='slds-button slds-button--brand' onclick='frontlinePreviewview()'>客户经理预览</button>
										  </td>
                                      </tr>
                                     <tr id="FrontLineData123">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="FrontLineData" name="po.frontlineChannelPo.isSpecialFilter" class="icheckS" value="1" <c:if test="${bo.po.frontlineChannelPo.filterConditionSql != null}">checked</c:if> />是</li>
                                                  <li class="li2"><input type="radio" name="po.frontlineChannelPo.isSpecialFilter" class="icheckS" value="0" <c:if test="${bo.po.frontlineChannelPo.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td colspan="3" id="FrontLineContent" <c:if test="${bo.po.frontlineChannelPo.filterConditionSql == null}">class="ar hidden"</c:if>>
                                              筛选数据条件 
                                              <input type="text" id="FrontLineContent1Id" name="po.frontlineChannelPo.filterCondition" value="${bo.po.frontlineChannelPo.filterCondition }" class="form-control manInput" placeholder="" readonly onmouseover="this.title=this.value" ischannel="5" >
                                              <input type="hidden" id="FrontLineContent1Sql" name="po.frontlineChannelPo.filterConditionSql" value="${bo.po.frontlineChannelPo.filterConditionSql}">
                                         	  <input type="hidden" id="FrontLineContent1SqlCondition" name="po.frontlineChannelPo.filterSqlCondition" value="${bo.po.frontlineChannelPo.filterSqlCondition}">
                                              <button type="button" id="FrontLineContent1" class="slds-button slds-button--brand term" onclick='chooseCondition("FrontLineContent1","userGroupChannelNum5")' ischannel="5">条件</button>                             
                                          </td>
                                      </tr>
                                      
                                      
                                      <tr id="frontlinewords12">
                                          <td class="ar" style="vertical-align:middle;white-space:nowrap;"><span>*</span> 营销话术</td>
                                          <td colspan="3">
                                              <textarea class="form-control" rows="10" name="po.frontlineChannelPo.marketingWords" style="width:450px" id="marketingWords" ischannel="5">${bo.po.frontlineChannelPo.marketingWords}</textarea>
                                          </td>
                                         
                                         <td colspan="2" style="vertical-align:middle">
                                            话术变量：
                                            
     
                                             <div class="textDiv" style="height:170px;float: right;text-align:left">
                                				<c:forEach  items="${ bo.activityHuashuVarList}" var="huashu">
                               				        <div>
								                   	<a onclick="addVarInit('${huashu.content}',this)" value="aaa" id="hua_shu_content">${huashu.name}</a>
								            		</div>
							                        </c:forEach>                                                             
                               					    </div>                                                                                                                                                                                                                                                                                                    			
                               			 </td>
                                      </tr>
                                      <tr id="frontlinesms123">
                                          <td class="ar" style="vertical-align:middle;">发送短信</td>
                                          <td style="vertical-align:middle;">
                                              <ul>
                                                  <li class="li3">  <input type="radio" id="selectData2" name="po.frontlineChannelPo.isSendSMS" class="icheckS" value="1" ischannel="5" <c:if test="${ bo.po.frontlineChannelPo.isSendSMS==1}">checked</c:if>/>是</li>
                                                  <li class="li2"><input type="radio" name="po.frontlineChannelPo.isSendSMS" class="icheckS" value="0" ischannel="5" <c:if test="${ bo.po.frontlineChannelPo.isSendSMS==0||bo.po.frontlineChannelPo.isSendSMS==null}">checked</c:if>/>否</li>
                                              </ul>
                                          </td>
                                          <td colspan="2"  id="content4" <c:if test="${ bo.po.frontlineChannelPo.isSendSMS!=1}">style="display:none;"</c:if>>
                                              <textarea class="form-control"  rows="3" name="po.frontlineChannelPo.smsWords" code="0" id="smsWords" ischannel="5">${bo.po.frontlineChannelPo.smsWords}</textarea>
                                          </td>

                                      </tr>
                                       <input type="hidden" id="newrule" name='po.frontlineChannelPo.orderIssuedRule' value="">
                                       <input type="hidden" id="ruleOrgId" name='po.frontlineChannelPo.ruleOrgId' value="">
                                       <input type="hidden" id="ruleOrgName" name='po.frontlineChannelPo.ruleOrgName' value="">
                                       <input type="hidden" id="ruleOrgPath" name='po.frontlineChannelPo.ruleOrgPath' value="">
                                       <input type="hidden" id="ruleOrgPathSpecial" value="">
                                       <input type="hidden" id="orgRuleId" name="orgRuleId" value=""/>
                                      <c:if test="${bo.po.frontLineWorkOrderRulePoList ==null || bo.po.frontLineWorkOrderRulePoList ==''}">
                                      <tr id="frontlinesd23">
	                                      <td colspan="5">
	                                      	<table>
	                                      		<tr>
													<td class="al" style="width: 250px;">
														<span>*</span> 工单下发规则
														<button id="addRule1" type="button" class="slds-button slds-button--brand " onclick="addIssuedRule()" ischannel="5">增加规则</button>
													</td>
													<td class="al" style="width: 170px;">未下发数量：<span
														class="grayRed" style="font-weight: 700;" id="gdNum">--</span>
													</td>
													<td class="al">
														<button type="button" class='slds-button slds-button--brand' id="refrule" onclick='refreshRuleNum()' ischannel="5">刷新</button>
													</td>
													<td class="ar">
														<button type="button" class='slds-button slds-button--brand' onclick='previewView()' ischannel="5">下发情况预览</button>
													</td>
												</tr>
	                                      	</table>
	                                      </td>
                                      </tr>
                                       <tr>                                
                                          <td colspan="5">
                                          <ul id="orderUl">
                                         
                                          <!--[if !IE]><!-->  <li style="width: 17%"> <!--<![endif]-->
                                          <!--[if IE]> <li style="width: 15%;table-layout: fixed"> <![endif]-->
                                           <select  name="" onchange="initFunction(id)" class="form-control" id="classid0" >
                                                 <option value="">请选择</option>
                                                <c:forEach var ="classification"  items="${bo.classification}">
					                              <option id="${classification.classificationId}"  value="${classification.classificationId}">
                			                         ${classification.classificationName}</option> 
       					                        </c:forEach>
                                              </select>
                                          </li> 
                                          <li style="width:5%;"><span id="zi">按照</span></li>
                                          <!--[if !IE]><!-->  <li style="width: 17%"> <!--<![endif]-->
                                          <!--[if IE]> <li style="width: 16%;table-layout: fixed"> <![endif]-->
                                           <select  name="IssuedRule" class="form-control" id="orderIssuedRule0" onchange="removeRepect(id,'change')">
                                                 <option value="">请选择</option>
                                                <c:forEach var ="ruleType"  items="${bo.getRuleType}">
					                              <%-- <option id="${ruleType.ruleTypeId}"  value="${ruleType.ruleTypeId}">
                			                         ${ruleType.ruleTypeName}</option>  --%>
       					                        </c:forEach>
                                              </select>
                                          </li>
                                          <li id="liorg">
	                                             
		                                         <input type="text"  id="classOrgRange" name="classOrgRange" readonly value="" onmouseover="this.title=this.value" onclick="showId(id);showMenu1(id)"
						                          class="form-control select-obj"> 
						                          <input type="hidden" id="classOrgPath" name="classOrgPath" value=""/>       
						                          <input type="hidden" id="classOrgId" name="classOrgId" value=""/>                        		                

                                          </li>                                          
                                          <li>
                                          
                                          </li>                                      
                                          </ul>                                                                                             
                                          </td>
                                                                                
                                      </tr>
                                      </c:if>
                                      <c:forEach items="${bo.po.frontLineWorkOrderRulePoList }" var="frontLineWorkOrderRule" varStatus="status">
                                           <c:if test="${status.index == 0}">
                                          <tr>
											<td colspan="5">
												<table>
													<tr>
														<td class="al" style="width: 250px;">
															<span>*</span> 工单下发规则
															<button id="addRule" type="button" class="slds-button slds-button--brand" onclick="addIssuedRule()" ischannel="5" <c:if test="${bo.activityBasicInfo.state==11 }">disabled='true'</c:if>>增加规则</button>
														</td>
														<td class="al" style="width: 170px;">
															未下发数量：<span class="grayRed" style="font-weight: 700;" id="gdNum">--</span>
														</td>
														<td class="al">
															<button type="button" class='slds-button slds-button--brand' id="refrule" onclick='refreshRuleNum()' ischannel="5">刷新</button>
														</td>
														<td class="ar">
															<button type="button" class='slds-button slds-button--brand' onclick='previewView()' ischannel="5">下发情况预览</button>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
                                           <td colspan="3">
                                           <ul>
                                           <li style="width: 27%;">
                                            <select  name="" onchange="initFunction(id)" class="form-control" id="classid0" ischannel="5" value="${frontLineWorkOrderRule.ruleTypeClassId }" <c:if test="${bo.activityBasicInfo.state==11 }">disabled='true'</c:if>>
                                                 <option value="">请选择</option>
                                                <c:forEach var ="classification"  items="${bo.classification}">
					                              <option id="${classification.classificationId}"  value="${classification.classificationId}" ${classification.classificationId==frontLineWorkOrderRule.ruleTypeClassId?'selected':'' }>
                			                         ${classification.classificationName}</option> 
       					                        </c:forEach>
                                              </select>
                                           </li>
                                           <li style="width: 8%;">
                                           <span id="zi">按照</span>
                                           </li>
                                           <li style="width: 28%;">
					                        <select name="IssuedRule" class="form-control" ischannel="5" value="${frontLineWorkOrderRule.ruleTypeId}"  id="orderIssuedRule0" onchange="removeRepect(id,'change')" <c:if test="${bo.activityBasicInfo.state==11 }">disabled='true'</c:if>>
					                         <option value="">请选择</option>
                                            <c:forEach var ="activityWorkOrderRuleInfo"  items="${bo.getRuleType}">
					   	                     <c:set var="isDoing1" value="0"/> 
                                               <c:if test="${ activityWorkOrderRuleInfo.ruleTypeId ==frontLineWorkOrderRule.ruleTypeId}">
					                             <c:set var="isDoing1" value="1"/> 
					                              <option id="${activityWorkOrderRuleInfo.ruleTypeId}"  value="${activityWorkOrderRuleInfo.ruleTypeId}" selected>
                		                          	${activityWorkOrderRuleInfo.ruleTypeName}</option> </c:if>
						                              	<c:if test="${isDoing1=='0'}">
						                              	<option id="${activityWorkOrderRuleInfo.ruleTypeId}"  value="${activityWorkOrderRuleInfo.ruleTypeId}">
                		                         	${activityWorkOrderRuleInfo.ruleTypeName}</option> </c:if>
       				                                       	</c:forEach>
					                               
                                                </select>
                                                </li>
                                                <li id="liorg">
	                                             
		                                         <input type="text"  id="classOrgRange" name="classOrgRange" readonly ischannel="5" value="${frontLineWorkOrderRule.ruleOrgName} " onmouseover="this.title=this.value" onclick="showId(id);showMenu1(id)"
						                          class="form-control select-obj"> 
						                          <input type="hidden" id="classOrgPath" name="classOrgPath" value="${frontLineWorkOrderRule.ruleOrgPath}"/>       
						                          <input type="hidden" id="classOrgId" name="classOrgId" value="${frontLineWorkOrderRule.ruleOrgId}"/>                        		                
						                        </li>
                                                </ul>
                                                </td>
                                          
                                      </tr>
                                           </c:if>
			                               <c:if test="${status.index!=0}">
					                       <tr>
					                       <td colspan="3">
                                           <ul>
                                           <li style="width: 27%;">
                                            <select  name="" onchange="initFunction(id)" class="form-control" id="classid${status.index}" value="${frontLineWorkOrderRule.ruleTypeClassId }" <c:if test="${bo.activityBasicInfo.state==11 }">disabled='true'</c:if> >
                                                 <option value="">请选择</option>
                                                <c:forEach var ="classification"  items="${bo.classification}">
					                              <option id="${classification.classificationId}"  value="${classification.classificationId}" ${classification.classificationId==frontLineWorkOrderRule.ruleTypeClassId?'selected':'' }>
                			                         ${classification.classificationName}</option> 
       					                        </c:forEach>
                                              </select>
                                           </li>
                                           <li style="width: 8%;">
                                           <span id="zi">按照</span>
                                           </li>
                                           <li style="width: 28%;">
					                        <select name="IssuedRule" class="form-control" id="orderIssuedRule${status.index}" onchange="removeRepect(id,'change')" value="${frontLineWorkOrderRule.ruleTypeId}"  <c:if test="${bo.activityBasicInfo.state==11 }">disabled='true'</c:if>>
					                         <option value="">请选择</option>
                                            <c:forEach var ="activityWorkOrderRuleInfo"  items="${bo.getRuleType}">
					   	                     <c:set var="isDoing" value="0"/> 
                                               <c:if test="${ activityWorkOrderRuleInfo.ruleTypeId ==frontLineWorkOrderRule.ruleTypeId}">
					                             <c:set var="isDoing" value="1"/> 
					                              <option id="${activityWorkOrderRuleInfo.ruleTypeId}"  value="${activityWorkOrderRuleInfo.ruleTypeId}" selected>
                		                          	${activityWorkOrderRuleInfo.ruleTypeName}</option> </c:if>
						                              	<c:if test="${isDoing=='0'}">
						                              	<option id="${activityWorkOrderRuleInfo.ruleTypeId}"  value="${activityWorkOrderRuleInfo.ruleTypeId}">
                		                         	${activityWorkOrderRuleInfo.ruleTypeName}</option> </c:if>
       				                                       	</c:forEach>					                               
                                                </select></li>
                                                <li id="liorg${status.index}">	                                             
		                                         <input type="text"  id="classOrgRange${status.index}" name="classOrgRange" readonly value="${frontLineWorkOrderRule.ruleOrgName} " onmouseover="this.title=this.value" onclick="showId(id);showMenu1(id)"
						                          class="form-control select-obj" ischannel="5"> 
						                          <input type="hidden" id="classOrgPath${status.index}" name="classOrgPath" value="${frontLineWorkOrderRule.ruleOrgPath}"/>       
						                          <input type="hidden" id="classOrgId${status.index}" name="classOrgId" value="${frontLineWorkOrderRule.ruleOrgId}"/>                        		                
						                        </li>
                                                </ul></td>
                                                <td colspan="2" class="ar">  <button type="button" id="del${status.index}" class='slds-button slds-button--brand term' onclick='delIssuedRule(this)' name='asdasd' ischannel="5" <c:if test="${bo.activityBasicInfo.state==11 }">disabled='true'</c:if>>删除</button></td>
				                                 	</tr>
				                                 	</c:if>
			                                       	</c:forEach>          	
			                            <tr id="fSpecialChannel" class="hide">
			                                <td class="al" colspan="2">指定渠道列表</td>
			                                <td></td>			                                
			                                <td class="ar" colspan="2">
			                                <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#guizeModal" onclick="showOrgList(this)" ischannel="5">添加渠道</button>
			                                <button type="button" class="btn btn-primary " onclick="deleteChannel()" ischannel="5">删除</button>   
			                                </td>
			                            </tr> 
			                            <tr id="sSpecialChannel" class="hide">			                         
		                                    <td class="liglist" colspan="10" style="word-wrap:break-word;word-break:break-all;">			                              
				                                <!-- <iframe id="maglist" name="maglist" src="../activity/maglist" width="730px"  scrolling="auto" height="400"> </iframe> -->
				                               <div class="slds-container--left slds-p-horizontal--small"
					                               style="width:88%;margin-top:10px">	
					                              <input type="hidden" id="isShowOrder" value="0"/>
					                              <input type="hidden" name="po.frontlineChannelPo.sellingArea" value="${bo.po.frontlineChannelPo.sellingArea}">				
	                                              <div id="maglist" class="" ></div>
                                               </div> 
		                                    </td>
	                                    </tr>		                                      			                          
                                  </table>
                                 <div class="modal fade" id="guizeModal" tabindex="-1" role="dialog"
		                         aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y:scroll">
		                             <div class="modal-dialog"  >
			  <div class="modal-content" style="margin-left:-40px;width:950px;" >
				<table class="slds-table slds-table--bordered slds-table--fixed-layout"
					data-epm="selectable-table" style="margin-bottom: 0px;">
					<tr class="slds-is-sortable slds-is-resizable">
						<td class="slds-grid" >
							<span>选择渠道</span>
							<div id="fchange" class="hide"><a onclick="changeList()">切换到组织机构列表</a></div>	
							<div id="schange" class=""><a onclick="changeTree()">切换到组织机构树</a></div>	
							<button type="button" class="slds-button slds-button--brand col-md-1 pull-left"  onclick="refreshMainList()" style="margin-left: 400px">确定</button>
							<button type="button" class="slds-button slds-button--brand col-md-1 pull-left" data-dismiss="modal"  id="close2" style="">关闭</button>
						</td>
					</tr>
                </table>
				<div id="fDiv" class="slds-container--left slds-p-horizontal--lagrge" 
					style="width: 100%">
					<input id="bryantListChecked" type="hidden" value="${bo.po.frontlineChannelPo.sellingArea}"/>
					<input type="text" id="querySellingArea" class="slds-input slds-size--1-of-4" placeholder="请输入渠道名称"  value="">
					<span>渠道分类：</span>
					<select id="channelClassification" value="" >
					  <option value="" selected>请选择..</option>
					  <c:forEach items="${bo.orgChannelInfoList}" var="orginfo">
					     <option value="${orginfo.codeId}">${orginfo.codeName}</option>
					  </c:forEach>
					</select>
					<button type="button" class="slds-button slds-button--brand" onclick="querySellingArea1()" style="margin-left: 8px">查询</button>
					<div id="businessHall" class="" style="width:100%"></div>
					<div class="slds-container--left slds-p-horizontal--lagrge" style="margin-top: 10px;width:100%">
				</div>
				</div>
				 <iframe id="sDiv" class="hide" src="../activity/ztree" width="730px" scrolling="auto" height="400"></iframe>
<!-- 				<div id="sDiv">
				   <div id="zTreeDemoBack" style="margin-left:20px;margin-top:90px">      
		 <div id="menuContent2" class="menuContent" style="display:none;">
	      <ul id="ruleOrgtree" class="ztree" style="margin-left:127px;"></ul>
          </div>         
    </div>
				    <div class="content_wrap slds-size--7-of-8 slds-text-align--left" style="height:20px">
	                    <div class="zTreeDemoBackground left" style="height:20px">
	                    <input type="hidden" id="orderOrgId" value=""/>		                                      		                
	                    </div>
	               
                    </div>
				</div> -->
				  
				<div id="modifyMenu" class="boxMenu"></div>
			</div>
		</div>
	</div>
	<!--     弹出框结束 -->
                              </div>
                          </div>
                          <div class="ChannelOut_activity" id="channelIds7">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="7" id="7" ischannel="7"/>
                                  <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                                  本地短信
                              </h5>
                              <div class="AreaIn" id="InNo2">
                         
                                  <table class="managerTable">
                             <!--[if IE]> 
           					 <colgroup>
                  					<col style="width:170px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:122px" />
             					 </colgroup>
           
           
            				<![endif]-->
                                  <!--[if !IE]><!-->                                           
                                      <colgroup>
                                          <col width="25%"/>
                                          <col width="20%"/>
                                          <col width="30%"/>
                                          <col width="15%"/>
                                           <col width="10%"/>
                                      </colgroup>
            					 <!--<![endif]-->
                                     
                                      <tr id="duanxinnum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum7" numtd>--</span></td>
                                      </tr>
                                     <tr id="smsfilter12">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3 sendMessage"><input id="LocalMessageSelectData" type="radio" name="numed" class="icheckS" value="1" ischannel="7" <c:if test="${bo.msmChannelPo.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2"><input type="radio" name="numed" class="icheckS" value="0" ischannel="7" <c:if test="${bo.msmChannelPo.filterConditionSql ==null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td colspan="3" id="LocalMessageContent" <c:if test="${bo.msmChannelPo.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件
                                              <input type="text" id="LocalMessageContent1Id" name="msmChannelPo.filterCondition" value="${bo.msmChannelPo.filterCondition}" class="form-control manInput" placeholder="" readonly ischannel="7" onmouseover="this.title=this.value">
                                              <input type="hidden" id="LocalMessageContent1Sql" name="msmChannelPo.filterConditionSql" value="${bo.msmChannelPo.filterConditionSql}">
                                              <input type="hidden" id="LocalMessageContent1SqlCondition" name="msmChannelPo.filterSqlCondition" value="${bo.msmChannelPo.filterSqlCondition}">
                                              <button type="button" id="LocalMessageContent1" class="btn btn-primary term" onclick='chooseCondition("LocalMessageContent1","userGroupChannelNum7")' ischannel="7">条件</button>
                                          </td>
                                      </tr>
                                      <tr id="smsorder">
                                           <td class="ar" style="white-space:nowrap;">支持短信订购</td>
                                           <td>
	
                                               <ul>
                                                   <li class="li3 ssfp"><input id="supportSendForProduct" type="radio" name="sendProdcut" class="icheckS" value="1" ischannel="7" <c:if test="${bo.msmChannelPo.orderProductId != null}">checked</c:if>/>是</li>
                                                   <li class="li2"><input type="radio" name="sendProdcut" class="icheckS" value="0" ischannel="7" <c:if test="${bo.msmChannelPo.orderProductId ==null}">checked</c:if> />否</li>
                                               </ul>
                                           </td>
                                      </tr>
                                    
                                    <tr id="sendForProduct" class="hide">
                                          <td class="ar">产品订购</td>
                                          <td colspan="3">
                                               <select class="form-control" id="orderProduct" name="msmChannelPo.orderProduct" onfocus="productOnchang();" onchange="proChoose()" ischannel="7">
													<option value="">请选择</option>
												</select>
                                              <input type="hidden" id="orderProdChoose" name="msmChannelPo.orderProductId" value="${bo.msmChannelPo.orderProductId}">
                                          </td>
                                          <td colspan="1">
                               				<i data-toggle="tooltip" data-placement="bottom" title="该产品为成功标准选择的可订购产品" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                     	  </td>
                                      </tr>
                                      <tr id="smsmarkingtype">
                                          <td class="ar" style="vertical-align:middle;"><span>*</span> 营销类型</td>
                                          <td colspan="3">
                                          		<select id="smsMarketingType" class="slds-select" name="msmChannelPo.marketingType">
													<option value="">请选择..</option>
									 				<c:forEach items="${bo.marketingTypeList}" var="st">
							                     			<option value="${st.marketingTypeId}"${bo.msmChannelPo.marketingType == st.marketingTypeId? 'selected': ''}>${st.marketingTypeName}</option>
							               				</c:forEach> 
												</select>
                                          </td>
                                          <!-- <td colspan="1">
                               				<i data-toggle="tooltip" data-placement="bottom" title="短信" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                     	  </td> -->
                                      </tr>
                                      <!-- <tr>
                                          <td colspan="6">
                                           <span style="color:#0044BB">提示：如需支持短信回复订购，请选择产品！</span> 
                                            
                                          </td>
                                      </tr> -->
									<tr id="smscontent232">
                                          <td class="ar" style="vertical-align:middle;"><span>*</span> 发送内容</td>
                                          <td colspan="3" >
                                              <textarea class="form-control" rows="10"  name="msmChannelPo.smsContent"  id="sendContent"  ischannel="7" style="width:450px">${bo.msmChannelPo.smsContent }</textarea>
                                          </td>
                                           <td colspan="2" style="vertical-align:middle;">话术变量：
                                 <div class="textDiv" style="height:200px;">
                                <c:forEach  items="${ bo.activityHuashuVarList}" var="huashu">
                                <div>
								<a class="hide" onclick="addVarInit('${huashu.content}',this)" value="aaa" id="hua_shu_content">${huashu.name}</a>
								</div>
							    </c:forEach>                                                             
                                </div>
                                </td>
                                      </tr>

                                      <tr id="ceshidianhua">
                                          <td class="ar">测试号码</td>
                                          <td colspan="2">
                                              <input type="text" class="form-control" placeholder="测试号码" id="phoneNum" ischannel="7">
                                          </td>
                                          <td class="ar">
                                              <button type="button" class="btn btn-primary term "   id="smsMsgTest" >发送测试</button>
                                          </td>
                                      </tr>
                                     
                                      <tr id="duanxinaddress">
                                          <td class="ar">原地址</td>
                                          <td colspan="4">
                                             <ul>
                                            <li>  <input type="text" class="form-control manInput" placeholder="示例：http://www.10010.com"  id="longUrl" ischannel="7"> <i data-toggle="tooltip" data-placement="bottom" title="示例：http://www.10010.com" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                            </li>
                                             
                                          			<li>
                                          				<a id="longUrltest">测试URL地址正确性</a>
                                          			</li>
                                          			<li>
                                            		<i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"title="测试原地址是否可用"></i>
                                          			</li>
                                          		
                                            <!--   <span class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="通过访问新浪接口将长地址合成短地址"></span> -->
                                              <li>  <button type="button" class="btn btn-primary term " id="trans" ischannel="7">合成短链接</button>
                                              </li>
                                                </ul> 
                                          </td>
                                          	
                                      </tr>
                                      <tr id="duanxinshortdizhi">
                                          <td class="ar">短链接</td>
                                          <td colspan="2">
                                          <ul>
                                           			<li>  
                                           				<input type="text" class="form-control manInput" placeholder=" "  id="shortUrl" ischannel="7">
                                             		</li>
            										<li>
                                             		 <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right"title="通过短链接可跳转至原地址访问"></i>
                                                <!-- <iframe  id="smsiframe" src=""></iframe> -->
                                                	</li>
                                                </ul>
                                          </td>
                                      </tr>
                                  </table>
                                 
                              </div>
                          </div>
                          <div class="ChannelOut_activity" id="channelIds11">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="11" id="11" ischannel="11"/>
                                  <i class="fa fa-commenting-o" aria-hidden="true"></i>
                                  微信
                              </h5>
                              <div class="AreaIn" id="InNo3">
                                 
                                  <table class="managerTable">
                                  <!--[if IE]> 
           					 <colgroup>
                  					<col style="width:170px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:122px" />
             					 </colgroup>
           
            				<![endif]-->
            				<!--[if !IE]><!-->             
             						 <colgroup>
                                           <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="35%"/>
                                          <col width="15%"/>
                                           <col width="10%"/>
                                      </colgroup>
            					 <!--<![endif]-->
                                      
                                       <tr id="weixinyonghushu">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum11" numtd>--</span></td>
                                      </tr>
                                       <tr id="weixinshaixuan">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="WebChatSelectData" name="WebChatRadio" class="icheckS" value="1" ischannel="11" <c:if test="${bo.channelWebchatInfo.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2"><input type="radio" name="WebChatRadio" class="icheckS" value="0" ischannel="11" <c:if test="${bo.channelWebchatInfo.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                            <td colspan="3" id="WebChatContent" <c:if test="${bo.channelWebchatInfo.filterConditionSql == null}">class="ar hidden"</c:if>>                                     
                                                                                         筛选数据条件                                    
                                            <input type="hidden" id="WebChatContent1SqlCondition" value="${bo.channelWebchatInfo.filterSqlCondition}" name="channelWebchatInfo.filterSqlCondition">                                             
                                            <input type="hidden" id="WebChatContent1Sql" value="${bo.channelWebchatInfo.filterConditionSql}" name="channelWebchatInfo.filterConditionSql">
                                            <input type="text" id="WebChatContent1Id" name="channelWebchatInfo.filterCondition" value="${bo.channelWebchatInfo.filterCondition}" class="form-control manInput" placeholder="" readonly ischannel="11" onmouseover="this.title=this.value">  
                                            <button type="button" id="WebChatContent1" class="btn btn-primary term" onclick='chooseCondition("WebChatContent1","userGroupChannelNum11")' ischannel="11">条件</button>           
                                          </td>
                                      </tr>
                                      
                                      <tr id="weixinpublicmess">
                                          <td class="ar"style="display:block;white-space:nowrap;"><span>*</span> 公众号信息</td>
                                          <td colspan="4">
                                               <select name="po.webChatMidActivityPo.publicId" class="form-control" id="" ischannel="11">
                 
                                                 <c:forEach var ="channelPublicWebChatPo"  items="${bo.webChatPublic}">
                                                  <c:if test="${channelPublicWebChatPo.publicId==bo.webChatMidActivityPo.publicId }">
					                              <option id="${channelPublicWebChatPo.publicId}"  value="${channelPublicWebChatPo.publicId}" selected>
                			                         ${channelPublicWebChatPo.publicName}</option></c:if>
                			                       <c:if test="${channelPublicWebChatPo.publicId!=bo.webChatMidActivityPo.publicId }"> 
                			                           <option id="${channelPublicWebChatPo.publicId}"  value="${channelPublicWebChatPo.publicId}">
                			                         ${channelPublicWebChatPo.publicName}</option></c:if>
       					                        </c:forEach>
                                              </select>
                                          </td>
                               
                                      </tr>
                                      
                                      <tr id="weixintitel">
                                          <td class="ar">
                                              标题
                                          </td>
                                          <td   colspan="4"><input type="text" class="form-control" placeholder="" name="channelWebchatInfo.channelWebchatTitle"  value="${bo.channelWebchatInfo.channelWebchatTitle }" ischannel="11"></td>
                                      </tr>
                                      <tr id="weixinaddress">
                                          <td class="ar">
                                              <span></span> 网址
                                          </td>
                                          <td  colspan="4">
                                          <ul style="width:100%">
                                          <li style="width:70%">
                                          <input style="width:100%"  type="url" class="form-control" placeholder="示例：http://www.10010.com" name="channelWebchatInfo.channelWebchatUrl"  value="${bo.channelWebchatInfo.channelWebchatUrl }" ischannel="11">
                                          </li>
                                          <li style="width:20%">
                                           <i data-toggle="tooltip" data-placement="right" title="示例：http://www.10010.com" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                          </li>
                                          </ul>                                          
                                          </td>
                                      </tr>
                                      <tr id="weixinhuashu">
                                          <td class="ar" style="vertical-align:middle;">
                                              <span>*</span> 话术
                                          </td>
                                          <td colspan="2"><textarea style="width:450px" id="sendContentWet" class="form-control" rows="10" name="channelWebchatInfo.channelWebchatContent" ischannel="11">${bo.channelWebchatInfo.channelWebchatContent}</textarea></td>
                                          <td colspan="2" style="vertical-align:middle;">话术变量：
                                          			  <div class="textDiv" style="height:170px;">
                                						<c:forEach  items="${ bo.activityHuashuVarList}" var="huashu">
                                							<div>
																<a onclick="addVarInit('${huashu.content}',this)" value="aaa" id="hua_shu_content">${huashu.name}</a>
															</div>
							    						</c:forEach>                                                             
                               							</div>
                                          
                                          </td>
                                      </tr>
                                  </table>
                          
                              </div>
                          </div>
                          <div class="ChannelOut_activity" id="channelIds8">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="8" id="8" ischannel="8"/>
                                  <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                                  本地弹窗
                              </h5>
                      <div class="AreaIn" >    
                         <table class="managerTable">
                         <!--[if IE]> 
           					 <colgroup>
           					 
                  					 <col width="146px"/>
                                     <col width="146px"/>
                                     <col width="418px"/>
                                 
                 					
             					 </colgroup>
           
            				<![endif]-->
            				<!--[if !IE]><!--> 
                                            
                                         <colgroup>
                                           <col width="20%"/>
                                          <col width="20%"/>
                                          <col width="60%"/>
                                      </colgroup>
                                            <!--<![endif]-->
                         			
                         			  <tr id="tanchuanusernum">
                                          <td class="al" colspan="5">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum8" numtd>--</span></td>
                                      	  <td class="ar">
												<button type="button" class='btn btn-primary ysc' onclick='channelBusinessPreview()' ischannel="8">本地弹窗预览</button>
										  </td>
                                      </tr>
                         
                        
                     				<tr id="tcshaixuannum">
                                          <td class="ar">筛选数据</td>
                                          
                                          <td >
                                              <ul>
                                                  <li class="li3"><input type="radio" id="PrivateData" name="private" class="icheckS" value="1" ischannel="8" <c:if test="${bo.channelBusiness.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2"><input type="radio" name="private" class="icheckS" value="0" ischannel="8" <c:if test="${bo.channelBusiness.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td  id="PrivateContent"  <c:if test="${bo.channelBusiness.filterConditionSql == null}">class="ar hidden"</c:if> >
                                                                                               筛选数据条件 
                                              <input type="text" id="PrivateContent1Id" name="channelBusiness.filterCondition" class="form-control manInput" placeholder="" value="${bo.channelBusiness.filterCondition }" readonly ischannel="8" onmouseover="this.title=this.value">
                                              <input type="hidden" id="PrivateContent1Sql" name="channelBusiness.filterConditionSql" value="${bo.channelBusiness.filterConditionSql }">
                                              <input type="hidden" id="PrivateContent1SqlCondition" name="channelBusiness.filterSqlCondition" value="${bo.channelBusiness.filterSqlCondition }">
                                              <button type="button" id="PrivateContent1" class="btn btn-primary term" onclick='chooseCondition("PrivateContent1","userGroupChannelNum8")' ischannel="8">条件</button>
                                          </td>
                                           
                                            <!--[if !IE]><!--> 
                                            
                                                <c:if test="${bo.channelBusiness.filterConditionSql == null}"><td></td></c:if> 
                                            <!--<![endif]-->
                                      <!--[if IE 9]> 
                                            
                                                <c:if test="${bo.channelBusiness.filterConditionSql == null}"><td></td></c:if> 
                                           <![endif]-->
                                          
                                        
                                      </tr>
                                   
                                    
               					</table>  
               					</div>  
             
                              <div align="left" class="AreaIn" id="InNo4" style="margin-top:-16px;display: block;left:0;top:0;margin: 0px 100px 0px 0px;  ">
               
                                  <div class="windowDiv" >
                                      <ul class="nav nav-tabs " role="tablist" id="myTab">
                                          <c:forEach  items="${bo.po.channelGroupPopupPo.channelCode}" var="tcChannelCode">
                                                <li role="presentation" class=${tcChannelCode.channelCode==1?"active":""}><a href="#home${tcChannelCode.channelCode}" role="tab" data-toggle="tab">${tcChannelCode.channelName}</a></li>
							    		  </c:forEach> 
                                      </ul>
                                                                                  							         
                                      <div class="tab-content">
                                       <c:if test="${bo.channelGroupPopupPoQueryList==null||bo.channelGroupPopupPoQueryList==''}">
                                        <c:forEach  items="${bo.po.channelGroupPopupPo.channelCode}" var="tcChannelCode" varStatus="status">
                                          <div role="tabpanel" class="tab-pane ${tcChannelCode.channelCode==1?'active':''}" id="home${tcChannelCode.channelCode}">
                                           <input type="hidden" name="mvclist[${status.index}].channelIdentify" value="${tcChannelCode.channelCode}">
                                           <input type="hidden" name="mvclist[${status.index}].channelName" value="${tcChannelCode.channelName}">
                                              <table class="managerTable">
                                                      <!--[if IE ]> 
           										 <colgroup>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                  </colgroup>       
            											<![endif]-->
                                                  <colgroup>
                                                      <col width="37%"/>
                                                      <col width="25%"/>
                                                      <col width="23%"/>
                                                      <col width="15%"/>
                                                  </colgroup>                                                                                       
                                                  <tr>
                                                      <td class="ar">
                                                          渠道生效
                                                      </td>
                                                      <td>
                                                          <input type="checkbox" name="mvclist[${status.index}].validate" class="icheckS" value="0" id="isCheckedPop${tcChannelCode.channelCode}" ischannel="8"/>点选生效
                                                      </td>
                                                    
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar">
<span>*</span>日弹出限制
                                                      </td>
                                                      <td><input type="number" class="form-control" placeholder=""  name="mvclist[${status.index}].numberLimit"  value="${bo.activityChannelRule.popNumberLimit}" id="numberLimit1" check_name="${tcChannelCode.channelName}日弹出限制次数" check_epmty check_max="1,10000" ischannel="8"></td>
                                                      <td>次</td>
                                                      
                                                  </tr>
                                                <!--    <tr>
                                                      <td  class="ar">
                                                         
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>-->
                                                  <tr>
                                                      <td class="ar">
       <span>*</span>营销目标
                                                      </td>
                                                      <td colspan="3"><input type="text" class="form-control" placeholder=""  name="mvclist[${status.index}].target"   value=""  id="target1" check_name="${tcChannelCode.channelName}营销目标" check_epmty check_max="1,80" ischannel="8"></td>
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar" style="vertical-align:middle;">
        <span>*</span>话术
                                                      </td>
                                                      <td colspan="2">
                                                      <div>
    													<script id="editor${status.index}" type="text/plain" style="width:340px;height:170px;" name="mvclist[${status.index}].content"></script>
														</div>
      <textarea style="width:290px;display:none" class="form-control" rows="10" id="tcContent${status.index}" ue="${status.index}" check_name="${tcChannelCode.channelName}话术" check_epmty check_max="1,900" ischannel="8"></textarea>
														</td>
                                                      <td style="vertical-align:middle;">话术变量：
                                                          <div class="textDiv"  style="height:210px">
                                <c:forEach  items="${ bo.activityHuashuVarList}" var="huashu">
                                <div>
								<a onclick="addVarInit1('${huashu.content}',this,'${status.index}')" value="aaa" id="hua_shu_content">${huashu.name}</a>
								</div>
							    </c:forEach>                                                             
                                                            
                                                          </div>
                                                      </td>
                                                  </tr>
                                                  <tr>
		                                       			<td class="ar" style="vertical-align:middle;">发送短信</td>
		                                       			<td style="vertical-align:middle;">
		                                          			<ul>
		                                               			<li class="li3">  <input type="radio" id="selectDataChannel${status.index}" name="mvclist[${status.index}].isSendSms" class="icheckS" value="1" ischannel="8" />是</li>
		                                               			<li class="li2"><input type="radio" name="mvclist[${status.index}].isSendSms" class="icheckS" value="0" ischannel="8" checked/>否</li>
		                                           			</ul>
		                                       			</td>
		                                       			<td colspan="2"  id="contentC4" <c:if test="${bo.channelBusiness.isSendSms1!=1}">style="display:none;"</c:if>>
		                                           			<textarea class="form-control"  rows="3" name="mvclist[${status.index}].smsSendWords" ischannel="8"></textarea>
		                                       			</td>

                                      				</tr>
                                              </table>
                                          </div>
                                          </c:forEach>
                                          </c:if>
                                          <c:if test="${bo.channelGroupPopupPoQueryList!=null&&bo.channelGroupPopupPoQueryList!=''}">
                                             <c:forEach  items="${bo.channelGroupPopupPoQueryList}" var="tcChannelCode" varStatus="status">
                                          <div role="tabpanel" class="tab-pane ${tcChannelCode.channelIdentify==1?'active':''}" id="home${tcChannelCode.channelIdentify}">
                                           <input type="hidden" name="mvclist[${status.index}].channelIdentify" value="${tcChannelCode.channelIdentify}">
                                              <table class="managerTable">
                                                      <!--[if IE ]> 
           										 <colgroup>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                      <col width="146px"/>
                                                  </colgroup>       
            											<![endif]-->
                                                  <colgroup>
                                                      <col width="37%"/>
                                                      <col width="25%"/>
                                                      <col width="23%"/>
                                                      <col width="15%"/>
                                                  </colgroup>
                                       
                                                  <tr>
                                                  <tr>
                                                      <td class="ar">
                                                          渠道生效
                                                      </td>
                                                      <td>
                                                       <input type="checkbox" name="mvclist[${status.index}].validate" class="icheckS" value="0" id="isCheckedPop${tcChannelCode.channelIdentify}" ischannel="8" ${tcChannelCode.validate==1?'checked':''}/>点选生效
                                                       </td>
                                                    
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar">
<span>*</span>日弹出限制
                                                      </td>
                                                      <td><input type="number" class="form-control" placeholder=""  name="mvclist[${status.index}].numberLimit"  value="${tcChannelCode.numberLimit}" id="numberLimit1" check_name="${tcChannelCode.channelName}日弹出限制次数" check_epmty check_max="1,10000" ischannel="8"></td>
                                                      <td>次</td>
                                                      
                                                  </tr>
                                                <!--    <tr>
                                                      <td  class="ar">
                                                         
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>-->
                                                  <tr>
                                                      <td class="ar">
       <span>*</span>营销目标
                                                      </td>
                                                      <td colspan="3"><input type="text" class="form-control" placeholder=""  name="mvclist[${status.index}].target"   value="${tcChannelCode.target}"  id="target1" check_name="${tcChannelCode.channelName}营销目标" check_epmty check_max="1,80" ischannel="8"></td>
                                                  </tr>
                                                  <tr>
                                                      <td  class="ar" style="vertical-align:middle;">
        <span>*</span>话术
                                                      </td>
                                                      <td colspan="2">
                                                      <div>
    													<script id="editor${status.index}" type="text/plain" style="width:340px;height:170px;" name="mvclist[${status.index}].content"></script>
														</div>
      <textarea style="width:290px;display:none" class="form-control" rows="10" id="tcContent${status.index}" ue="${status.index}" check_name="${tcChannelCode.channelName}话术" check_epmty check_max="1,900" ischannel="8">${tcChannelCode.content}</textarea>
														</td>
                                                      <td style="vertical-align:middle;">话术变量：
                                                          <div class="textDiv"  style="height:210px">
                                <c:forEach  items="${ bo.activityHuashuVarList}" var="huashu">
                                <div>
								<a onclick="addVarInit1('${huashu.content}',this,'${status.index}')" value="aaa" id="hua_shu_content">${huashu.name}</a>
								</div>
							    </c:forEach>                                                             
                                                            
                                                          </div>
                                                      </td>
                                                  </tr>
                                                  <tr>
		                                       			<td class="ar" style="vertical-align:middle;">发送短信</td>
		                                       			<td style="vertical-align:middle;">
		                                          			<ul>
		                                               			<li class="li3">  <input type="radio" id="selectDataChannel${status.index}" name="mvclist[${status.index}].isSendSms" class="icheckS" value="1" ischannel="8" <c:if test="${tcChannelCode.isSendSms==1}">checked</c:if>/>是</li>
		                                               			<li class="li2"><input type="radio" name="mvclist[${status.index}].isSendSms" class="icheckS" value="0" ischannel="8" <c:if test="${tcChannelCode.isSendSms==0||tcChannelCode.isSendSms==null}">checked</c:if>/>否</li>
		                                           			</ul>
		                                       			</td>
		                                       			<td colspan="2"  id="contentC4" <c:if test="${tcChannelCode.isSendSms!=1}">style="display:none;"</c:if>>
		                                           			<textarea class="form-control"  rows="3" name="mvclist[${status.index}].smsSendWords" ischannel="8">${tcChannelCode.smsSendWords}</textarea>
		                                       			</td>

                                      				</tr>
                                              </table>
                                          </div>
                                          </c:forEach>
                                          
                                          </c:if>
                                      </div>
                                  </div>
                                 
                              </div>
                          <div class="ChannelOut_activity" id="channelIds2">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="2" id="2" ischannel="2"/>
                                  <i class="fa fa-television" aria-hidden="true"></i>
                                  网厅
                              </h5>
                              <div class="AreaIn" id="InNo5">
        
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
                                          <col width="60%"/>
                                      </colgroup>
              
            				 <!--<![endif]-->				
                                      
                                       <tr id="wtusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum2" numtd>--</span></td>
                                      </tr>
                                         <tr id="wtshaixuannum">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="WebOfficeSelectData" name="WebOfficeRadio" class="icheckS" value="1" ischannel="2" <c:if test="${bo.wangting.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2 showFrontline"><input type="radio" name="WebOfficeRadio" class="icheckS" value="0" ischannel="2" <c:if test="${bo.wangting.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td id="WebOfficeContent" <c:if test="${bo.wangting.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 
                                              <input type="text" id="WebOfficeContent1Id" name="wangting.filterCondition" value="${bo.wangting.filterCondition }" class="form-control manInput" placeholder="" readonly ischannel="2" onmouseover="this.title=this.value">
                                              <input type="hidden" id="WebOfficeContent1Sql" name="wangting.filterConditionSql" value="${bo.wangting.filterConditionSql}">
                                              <input type="hidden" id="WebOfficeContent1SqlCondition" name="wangting.filterSqlCondition" value="${bo.wangting.filterSqlCondition}">
                                              <button type="button" id="WebOfficeContent1" class="btn btn-primary term " onclick='chooseCondition("WebOfficeContent1","userGroupChannelNum2")' ischannel="2">条件</button>
                                          </td>
                                          <!--[if IE]> 
                                            
                                                <c:if test="${bo.channelBusiness.filterConditionSql == null}"><td></td></c:if> 
                                           <![endif]-->
                                          
                                      </tr>
                                      <tr id="wttuisongcontent">
                                          <td class="ar" style="vertical-align:middle;">
                                              <span>*</span>推送内容
                                          </td>
                                          <td colspan="2"><textarea class="form-control" rows="10" name="wangting.content" ischannel="2">${bo.wangting.content }</textarea></td>

                                      </tr>
                                      <tr id="wttitel">
                                          <td class="ar">
                                              <span>*</span>标题
                                          </td>
                                          <td colspan="2"><input type="text" class="form-control" placeholder="" name="wangting.title" ischannel="2" value="${bo.wangting.title }" ></td>
                                      </tr>
                                      <tr id="wtaddresss">
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td colspan="2">
                                          <ul>
                                          		<li style="width:88%"> <input type="text" class="form-control" placeholder="示例：http://www.10010.com" name="wangting.url"  value="${bo.wangting.url }" ischannel="2">
                                          		</li>
                                          		<li>  <i data-toggle="tooltip" data-placement="right" title="示例：http://www.10010.com" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                          		</li>
                                          </ul>
                                         
                                         
                                          </td>
                                      </tr>
                                  </table>
                     
                              </div>
                          </div>
                          <div class="ChannelOut_activity" id="channelIds1">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="1"  id="1" ischannel="1"/>
                                  <i class="fa fa-tablet" aria-hidden="true"></i>
                                  手厅
                              </h5>
                              <div class="AreaIn" id="InNo6">
                     
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
                                          <col width="60%"/>
                                      </colgroup>
              
            				 <!--<![endif]-->					
            											
                                     
                                       <tr id="sTusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum1" numtd>--</span></td>
                                      </tr>
                                       <tr id="stshaixuan">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="HandOfficeSelectData" name="HandOfficeRadio" class="icheckS" value="1" ischannel="1" <c:if test="${bo.channelHandOfficePo.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2 showFrontline"><input type="radio" name="HandOfficeRadio" class="icheckS" value="0" ischannel="1" <c:if test="${bo.channelHandOfficePo.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td id="HandOfficeContent" <c:if test="${bo.channelHandOfficePo.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 
                                              <input type="text" id="HandOfficeContent1Id" name="channelHandOfficePo.filterCondition" value="${bo.channelHandOfficePo.filterCondition }" title="${bo.channelHandOfficePo.filterCondition }" class="form-control manInput" placeholder="" readonly ischannel="1" onmouseover="this.title=this.value">
                                              <input type="hidden" id="HandOfficeContent1Sql" name="channelHandOfficePo.filterConditionSql" value="${bo.channelHandOfficePo.filterConditionSql }">
                                         	  <input type="hidden" id="HandOfficeContent1SqlCondition" name="channelHandOfficePo.filterSqlCondition" value="${bo.channelHandOfficePo.filterSqlCondition }">
                                              <button type="button" id="HandOfficeContent1" class="btn btn-primary term" onclick='chooseCondition("HandOfficeContent1","userGroupChannelNum1")' ischannel="1">条件</button>
                                          </td>
                                             <!--[if IE]> 
                                            
                                                <c:if test="${bo.channelBusiness.filterConditionSql == null}"><td></td></c:if> 
                                           <![endif]-->
                                      </tr>
                                      <tr id="sttuisongcontent">
                                          <td class="ar" style="vertical-align:middle;">
                                              <span>*</span>推送内容
                                          </td>
                                          <td colspan="2"><textarea class="form-control" rows="10" name="channelHandOfficePo.content" ischannel="1">${bo.channelHandOfficePo.content }</textarea></td>
                                      </tr>
                                      <tr id="sttitle">
                                      <td class="ar">
                                          <span>*</span>标题
                                      </td>
                                      <td colspan="2"><input type="text" class="form-control" placeholder="" name="channelHandOfficePo.title" ischannel="1" value="${bo.channelHandOfficePo.title }"></td>
                                      </tr>
                                      <tr id="stwangzhi">
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td colspan="2">
                                           <ul>
                                          		<li style="width:88%"> <input type="url" class="form-control" placeholder="示例：http://www.10010.com" name="channelHandOfficePo.url" ischannel="1" value="${bo.channelHandOfficePo.url }">
                                          		</li>
                                          		<li>  <i data-toggle="tooltip" data-placement="right" title="示例：http://www.10010.com" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                          		</li>
                                          </ul>                                    
                                          </td>
                                      </tr>

                                  </table>
                       
                              </div>
                          </div>
                          <div class="ChannelOut_activity" id="channelIds9">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="9"  id="9" ischannel="9"/>
                                  <i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                                  沃视窗
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
                                          <col width="60%"/>
                                      </colgroup>
              
            				 <!--<![endif]-->			
                                       <tr width="130" id="wscusernum">
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum9" numtd>--</span></td>
                                      </tr>
                                        <tr id="wscshaixuan">
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="WoWindowSelectData" name="WoWindowRadio" class="icheckS" value="1" ischannel="9" <c:if test="${bo.channelWoWindowPo.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2 showFrontline"><input type="radio" name="WoWindowRadio" class="icheckS" value="0" ischannel="9" <c:if test="${bo.channelWoWindowPo.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td id="WoWindowContent" <c:if test="${bo.channelWoWindowPo.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件 
                                              <input type="text" id="WoWindowContent1Id" name="channelWoWindowPo.filterCondition" value="${bo.channelWoWindowPo.filterCondition}" class="form-control manInput" onmouseover="this.title=this.value" placeholder=""  readonly ischannel="9" onmouseover="this.title=this.value">
                                              <input type="hidden" id="WoWindowContent1Sql" name="channelWoWindowPo.filterConditionSql" value="${bo.channelWoWindowPo.filterConditionSql}">
                                              <input type="hidden" id="WoWindowContent1SqlCondition" name="channelWoWindowPo.filterSqlCondition" value="${bo.channelWoWindowPo.filterSqlCondition}">
                                              <button type="button" id="WoWindowContent1" class="btn btn-primary term" onclick='chooseCondition("WoWindowContent1","userGroupChannelNum9")' ischannel="9">条件</button>
                                          </td>
                                             <!--[if IE]> 
                                            
                                                <c:if test="${bo.channelBusiness.filterConditionSql == null}"><td></td></c:if> 
                                           <![endif]-->
                                      </tr>
                                      <tr id="wschuashu">
                                          <td class="ar" style="vertical-align:middle;">
                                              <span>*</span>话术
                                          </td>
                                          <td colspan="2"><textarea class="form-control" rows="10" name="channelWoWindowPo.huashu" ischannel="9">${bo.channelWoWindowPo.huashu }</textarea></td>
                                      </tr>
                                      <tr id="wsctitle">
                                          <td class="ar">
                                              <span>*</span>标题
                                          </td>
                                          <td colspan="2"><input type="text" class="form-control" placeholder="" name="channelWoWindowPo.title" value="${bo.channelWoWindowPo.title }" ischannel="9"></td>
                                      </tr>
                                      <tr id="wscwangzhi">
                                          <td class="ar">
                                              <span>*</span>网址
                                          </td>
                                          <td colspan="2">
                                              <ul>
                                          		<li style="width:88%">   <input type="url" class="form-control" placeholder="示例：http://www.10010.com" name="channelWoWindowPo.url" ischannel="9"  value="${bo.channelWoWindowPo.url }">
                                          		</li>
                                          		<li>  <i data-toggle="tooltip" data-placement="right" title="示例：http://www.10010.com" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                          		</li>
                                          </ul>                                           
                                          </td>                                          
                                      </tr>
                                      <tr id="wscpictureaddress">
                                          <td class="ar">
                                              <span>*</span>图片网址
                                          </td>
                                          <td colspan="2">
                                          <ul>
                                          <li style="width:88%">
                                          <input  type="url" class="form-control" placeholder="示例：http://res.mall.10010.cn/mall/front/images/logo.png" name="channelWoWindowPo.imgUrl" ischannel="9" value="${bo.channelWoWindowPo.imgUrl }">
                                          </li>
                                          <li>
                                          <i data-toggle="tooltip" data-placement="right" title="示例：http://res.mall.10010.cn/mall/front/images/logo.png" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                          </li>                                          
                                          </ul>                                          
                                          </td>
                                      </tr>                                   
                                      <tr id="wscpicturesize">
                                          <td class="ar">
                                              <span>*</span>图片尺寸
                                          </td>
                                          <td colspan="2">
                                              <select class="form-control" name="channelWoWindowPo.imgSize" ischannel="9">
                                              <c:choose>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='600*360' }">
                                                  <option value="600*360"  selected>600*360</option>
                                                  <option value ="640*90">640*90</option>
							                      <option value ="640*268">640*268</option>
							                      <option value ="620*420">620*420</option>
                                              </c:when>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='640*90' }">
                                                  <option value="600*360" >600*360</option>
                                                  <option value ="640*90"  selected>640*90</option>
							                      <option value ="640*268">640*268</option>
							                      <option value ="620*420">620*420</option>
                                              </c:when>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='640*268' }">
                                                  <option value="600*360" >600*360</option>
                                                  <option value ="640*90">640*90</option>
							                      <option value ="640*268" selected>640*268</option>
							                      <option value ="620*420">620*420</option>
                                              </c:when>
                                              <c:when  test="${bo.channelWoWindowPo.imgSize=='620*420' }">
                                                  <option value="600*360">600*360</option>
                                                  <option value ="640*90">640*90</option>
							                      <option value ="640*268">640*268</option>
							                      <option value ="620*420"  selected>620*420</option>
                                              </c:when>
                                              <c:otherwise>
                                                  <option value="600*360">600*360</option>
                                                  <option value ="640*90">640*90</option>
							                      <option value ="640*268">640*268</option>
							                      <option value ="620*420">620*420</option>                                              
                                              </c:otherwise>
                                            </c:choose>   
                                              </select>
                                          </td>
                                      </tr>
                                  </table>
                           
                              </div>
                          </div>
                          <%-- <div class="ChannelOut_activity" id="channelIds12">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="12"  id="12" ischannel="12"/>
                                  <i class="fa fa-phone fa-1x nbs" aria-hidden="true"></i>
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
                                          </td>
                                          <td id="channelTelePhoneContent" colspan="2" <c:if test="${bo.channelTelePhone.filterConditionSql == null}">class="hidden"</c:if>>
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
                                          <td colspan="2"><textarea class="form-control" rows="10" name="channelTelePhone.telephoneHuashuContent" ischannel="12">${bo.channelTelePhone.telephoneHuashuContent }</textarea></td>
                                      
                                      </tr>
                                      
                                      <tr id="dhchannelchoose">
                                      	<td class="ar">选择渠道</td>
                                      	<td colspan="3"><iframe id="cDiv" class="hide" src="../activity/ctree" width="100%" scrolling="auto" height="200"></iframe>
                                      	<td>
                                      </tr>
                                      
                                      <input type="hidden"  id="orgCityIds" name="channelTelePhone.orgCityIds"value="${bo.channelTelePhone.orgCityIds }"/>		
	                                  <input type="hidden"  id="companyId" name="channelTelePhone.companyId" value="${bo.channelTelePhone.companyId }"/>
	                                  <input type="hidden"  id="orgCityNames" name="channelTelePhone.orgCityNames" value="${bo.channelTelePhone.orgCityNames }"/>
	                                  </table>
                                     <table></table>
                                     
                                  
                           
                              </div>
                          </div> --%>
                            <!-- 集团短信开始 -->   
                <%-- <div class="ChannelOut_activity">
                              <h5>
                                  <input type="checkbox" name="channel" class="icheckS" value="3" id="3" ischannel="3"/>
                                  <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                                  集团短信
                              </h5>
                              <div class="AreaIn" id="InNo9">
                         
                                  <table class="managerTable">
                             <!--[if IE]> 
           					 <colgroup>
                  					<col style="width:170px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:146px" />
                 					 <col style="width:122px" />
             					 </colgroup>
           
           
            				<![endif]-->
                                  <!--[if !IE]><!-->                                           
                                      <colgroup>
                                          <col width="25%"/>
                                          <col width="20%"/>
                                          <col width="30%"/>
                                          <col width="15%"/>
                                           <col width="10%"/>
                                      </colgroup>
            					 <!--<![endif]-->
                                     
                                      <tr>
                                          <td class="al" colspan="4">当前目标用户数：<span class="grayRed"  style="font-weight: 700" id="userGroupChannelNum3" numtd>--</span></td>
                                      </tr>
                                     <tr>
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3 sendMessage"><input id="ZongBuMsmSelectData" type="radio" name="numedZB" class="icheckS" value="1" ischannel="3" <c:if test="${bo.zongBuMsmChannelPo.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2"><input type="radio" name="numedZB" class="icheckS" value="0" ischannel="3" <c:if test="${bo.zongBuMsmChannelPo.filterConditionSql ==null}">checked</c:if> />否</li>
                                              </ul>
                                          </td>
                                          <td colspan="3" id="ZongBuMsmContent" <c:if test="${bo.zongBuMsmChannelPo.filterConditionSql == null}">class="hidden"</c:if>>
                                              筛选数据条件
                                              <input type="text" id="ZongBuMsmContent1Id" name="zongBuMsmChannelPo.filterCondition" value="${bo.zongBuMsmChannelPo.filterCondition}" class="form-control manInput" placeholder="" readonly ischannel="3" onmouseover="this.title=this.value">
                                              <input type="hidden" id="ZongBuMsmContent1Sql" name="zongBuMsmChannelPo.filterConditionSql" value="${bo.zongBuMsmChannelPo.filterConditionSql}">
                                              <input type="hidden" id="ZongBuMsmContent1SqlCondition" name="zongBuMsmChannelPo.filterSqlCondition" value="${bo.zongBuMsmChannelPo.filterSqlCondition}">
                                              <button type="button" id="ZongBuMsmContent1" class="btn btn-primary term" onclick='chooseCondition("ZongBuMsmContent1","userGroupChannelNum3")' ischannel="3">条件</button>
                                          </td>
                                      </tr>
                             集团短信暂不需要产品dinggou       <tr id="smsorderZB">
                                           <td class="ar" style="white-space:nowrap;">支持短信订购</td>
                                           <td>
	
                                               <ul>
                                                   <li class="li3 ssfp"><input id="supportSendForProductZB" type="radio" name="sendProdcutZB" class="icheckS" value="1" ischannel="3" <c:if test="${bo.zongBuMsmChannelPo.orderProductId != null}">checked</c:if>/>是</li>
                                                   <li class="li2"><input type="radio" name="sendProdcutZB" class="icheckS" value="0" ischannel="3" <c:if test="${bo.zongBuMsmChannelPo.orderProductId ==null}">checked</c:if> />否</li>
                                               </ul>
                                           </td>
                                      </tr>
                                    
                                    <tr id="sendForProductZB" class="hide">
                                          <td class="ar">产品订购</td>
                                          <td colspan="3">
                                               <select class="form-control" id="orderProductZB" name="zongBuMsmChannelPo.orderProduct" onfocus="productOnchangZB();" onchange="proChooseZB()" ischannel="3">
													<option value="">请选择</option>
												</select>
                                              <input type="hidden" id="orderProdChooseZB" name="zongBuMsmChannelPo.orderProductId" value="${bo.zongBuMsmChannelPo.orderProductId}">
                                          </td>
                                          <td colspan="1">
                               				<i data-toggle="tooltip" data-placement="bottom" title="该产品为成功标准选择的可订购产品" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                     	  </td>
                                      </tr>
                                  
                                      <tr>
                                          <td class="ar" style="vertical-align:middle;"><span>*</span> 营销类型</td>
                                          <td colspan="3">
                                          		<select id="smsMarketingTypeZB" class="slds-select" name="zongBuMsmChannelPo.marketingType">
													<option value="">请选择..</option>
									 				<c:forEach items="${bo.marketingTypeList}" var="st">
							                     			<option value="${st.marketingTypeId}"${bo.zongBuMsmChannelPo.marketingType == st.marketingTypeId? 'selected': ''}>${st.marketingTypeName}</option>
							               				</c:forEach> 
												</select>
                                          </td>
                                          <!-- <td colspan="1">
                               				<i data-toggle="tooltip" data-placement="bottom" title="短信" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                     	  </td> -->
                                      </tr>
                                      <!-- <tr>
                                          <td colspan="6">
                                           <span style="color:#0044BB">提示：如需支持短信回复订购，请选择产品！</span> 
                                            
                                          </td>
                                      </tr> --> 
									<tr>
                                          <td class="ar" style="vertical-align:middle;"><span>*</span> 发送内容</td>
                                          <td colspan="3" >
                                              <textarea class="form-control" rows="10"  name="zongBuMsmChannelPo.smsContent"  id="sendContentZB"  ischannel="3" style="width:450px">${bo.zongBuMsmChannelPo.smsContent }</textarea>
                                          </td>
                                           <td colspan="2" style="vertical-align:middle;">话术变量：
                                 <div class="textDiv" style="height:200px;">
                                <c:forEach  items="${ bo.activityHuashuVarList}" var="huashu">
                                <div>
								<a class="hide" onclick="addVarInit('${huashu.content}',this)" value="aaa" id="hua_shu_content">${huashu.name}</a>
								</div>
							    </c:forEach>                                                             
                                </div>
                                </td>
                                      </tr>

                                      <tr>
                                          <td class="ar">测试号码</td>
                                          <td colspan="2">
                                              <input type="text" class="form-control" placeholder="测试号码" id="phoneNumZB" ischannel="3">
                                          </td>
                                          <td class="ar">
                                              <button type="button" class="btn btn-primary term "   id="smsMsgTestZB" >发送测试</button>
                                          </td>
                                      </tr>
                                     
                                      <tr>
                                          <td class="ar">原地址</td>
                                  
                                          		                                        
                                          
                                          <td colspan="4">
                                             <ul>
                                            <li>  <input type="text" class="form-control manInput" placeholder="示例：http://www.10010.com"  id="longUrlZB" ischannel="3"> <i data-toggle="tooltip" data-placement="bottom" title="示例：http://www.10010.com" class="fa fa-question-circle-o" aria-hidden="true"></i>
                                            </li>
                                             
                                          			<li>
                                          				<a id="longUrltestZB">测试URL地址正确性</a>
                                          			</li>
                                          			<li>
                                            		<i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="bottom"title="测试原地址是否可用"></i>
                                          			</li>
                                          		
                                            <!--   <span class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="通过访问新浪接口将长地址合成短地址"></span> -->
                                              <li>  <button type="button" class="btn btn-primary term " id="transZB" ischannel="3">合成短链接</button>
                                              </li>
                                                </ul> 
                                          </td>
                                          	
                                      </tr>
                                      <tr>
                                          <td class="ar">短链接</td>
                                          <td colspan="2">
                                          <ul>
                                           			<li>  
                                           				<input type="text" class="form-control manInput" placeholder=" "  id="shortUrlZB" ischannel="3">
                                             		</li>
            										<li>
                                             		 <i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right"title="通过短链接可跳转至原地址访问"></i>
                                                <!-- <iframe  id="smsiframe" src=""></iframe> -->
                                                	</li>
                                                </ul>
                                          </td>
                                      </tr>
                                  </table>
                                 
                              </div>
                          </div> --%>
           <!-- 集团短信结束 -->  
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
        <tr id="activitylevel12">
            <th  width="130">活动优先级</th>
            <td colspan="2">
                <select name="po.urgencyLevel" class="form-control" value="${bo.activityBasicInfo.urgencyLevel }">
                    <option value="1" ${bo.activityBasicInfo.urgencyLevel==1?'selected':'' }>高</option>
                    <option value="2" ${bo.activityBasicInfo.urgencyLevel==2||bo.activityBasicInfo.urgencyLevel==null?'selected':'' }>中</option>
                    <option value="3" ${bo.activityBasicInfo.urgencyLevel==3?'selected':'' }>低</option>
                </select>
            </td>
        </tr>
        <tr id="parentactivity12">
            <th>关联活动</th>
            <td colspan="2" >
            <div id="underActivity">
                <select name="po.parentActivity" class="form-control" value="${bo.activityBasicInfo.parentActivity }">
                    <option value="" >请选择</option>
                    <c:forEach items="${bo.underActivityList }" var ="ual">
                    <option value="${ual.activityDailyId }" ${ual.activityDailyId==bo.activityBasicInfo.parentActivity?'selected':'' }>${ual.activityDailyName }</option>
                    </c:forEach>
                </select>
                </div>
                <div id="relatedActivity">
                <select name="po.parentActivity" class="form-control" value="${bo.activityBasicInfo.parentActivity }">
                    <option value="" >请选择</option>
                    <c:forEach items="${bo.higherActivityList }" var ="hal">
                    <option value="${hal.activityId }" ${hal.activityId==bo.activityBasicInfo.parentActivity?'selected':'' }>${hal.activityName }</option>
                    </c:forEach>

                </select>
                </div>
            </td>
             <%-- <td colspan="2" id="relatedActivity">
                <select name="po.parentActivity" class="form-control" value="${bo.activityBasicInfo.parentActivity }">
                    <option value="" >请选择</option>
                    <c:forEach items="${bo.higherActivityList }" var ="hal">
                    <option value="${hal.activityId }" ${hal.activityId==bo.activityBasicInfo.parentActivity?'selected':'' }>${hal.activityName }</option>
                    </c:forEach>

                </select>
            </td> --%>
        </tr>
        <tr id="activitypolice">
            <th>所属政策</th>
            <td colspan="2">
                <select name="po.policyId" class="form-control" value="${bo.activityBasicInfo.policyId }">
                    <option value="" >请选择</option>
                    <c:forEach items="${bo.policyList }" var="pol">
                    <option value="${pol.policyId}" ${pol.policyId==bo.activityBasicInfo.policyId?'selected':''}>${pol.policyName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
  	<h3 class="headList" id="gongdanpeizhi">工单规则扩展配置</h3>
  	<table class="activeLayout" >
    <colgroup>
                        <col width="20%" />
                        <col width="20%" />
                        <col width="60%" />
                        
                       
                    </colgroup>
     <tr id="orderIsValid" class="hide">
            <th>工单有效期</th>
            <td>
                <input name="po.orderCycle" class="form-control"  type="number"  min="1" max="100" check_empty check_name="工单有效期" check_max="1,100" value="${bo.activityBasicInfo.orderCycle==null?'1':bo.activityBasicInfo.orderCycle }">              
            </td>
            <td style="padding-left: 10px" id="isMonth">
            </td>  
            <td style="display:none">
           
            </td> 
        </tr>
        <tr id="obligateOrder233">
            <th>预留工单百分比</th>
            <td>
                <input type="number" min="0" max="100" name="po.obligateOrder" numcheck="预留工单百分比" numsize="0,100" check_empty check_name="预留工单百分比" check_max="0,100" value="${bo.activityBasicInfo.obligateOrder==null?bo.activityChannelRule.obligateOrder : bo.activityBasicInfo.obligateOrder}"/>
                （%）
            </td>
        </tr>
        <tr id="orderisconsulwewtdate">
        <th>  
               参照活动结束时间               
        </th>
        <td colspan="2">
                <ul>
                    <li class="li1"><input  name="po.orderIsConsultEndDate" type="radio" class="icheckS" value="1" ${bo.activityBasicInfo.orderIsConsultEndDate==1?'checked':''}/>是
                        <i data-toggle="tooltip" data-placement="right" title="工单有效期至活动的结束时间为止" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                    <li class="li2"><input  name="po.orderIsConsultEndDate" type="radio" class="icheckS" value="0" ${bo.activityBasicInfo.orderIsConsultEndDate==0||bo.activityBasicInfo.orderIsConsultEndDate==null?'checked':''}/>否
                        <i data-toggle="tooltip" data-placement="right" title="工单有效期不参照活动结束时间" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
            </td>
        </tr>
        <tr id="orderRuleUpdate">
            <th>工单更新规则</th>
            <td colspan="2" >
                <ul>
                    <li class="li1"><input  type="radio"  name="po.orderUpdateRule" class="icheckS" value="1" ${bo.activityBasicInfo.orderUpdateRule==1||bo.activityBasicInfo.orderUpdateRule==null?'checked':''}/>追加
                        <i data-toggle="tooltip" data-placement="right" title="符合口径的新工单追加进来,现有工单不符合口径的注销" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                    <li class="li2"><input  type="radio"  name="po.orderUpdateRule" class="icheckS" value="2" ${bo.activityBasicInfo.orderUpdateRule==2?'checked':'' }/>覆盖
                        <i data-toggle="tooltip" data-placement="right" title="将原有用户工单未执行未成功的注销,生成新工单" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
            </td>
        </tr>
    
    </table>
    <h3 class="headList" id="channelIdsgj5">客户经理扩展配置</h3>
    <h4 id="orderRuleInfo">勾选客户经理渠道进行工单扩展配置</h4>
    <table class="activeLayout" id="orderRuleTable" style="display:none;">
        <colgroup>
            <col width="22%" />
            <col width="26%" />
            
            <col width="52%" />
        </colgroup>
        <tr id="kehujlchannelSpecialFilter">
            <th colspan="2" class="whiteNormal">客户经理不同用户显示不同推荐信息说明</th>
            <td >
                <ul>
                	<input type="hidden" id="radioCheck4ChanneLSpecial" value="${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'0':'1'}" />
                    <li class="li1 toggole"><input  type="radio" onclick="getRadio()" name="userSelect" class="icheckS" value="是" ischannel="5"/>是</li>
                    <li class="li2"><input  type="radio" onclick="getRadio()"  name="userSelect" class="icheckS" value="否" ischannel="5" ${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'checked':''}/>否
                        <i data-toggle="tooltip" data-placement="right" title="同一个活动,在执行页面不同用户展现不同的推荐信息" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
            </td>
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
                        <col width="36px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                     <tr>
	                        <td>0</td>
	                        <td>
	                        <input type="text" rulename
								name="po.frontlineChannelPo.channelSpecialFilterList[0].filterName" ischannel="5"
								class="form-control tableInput" placeholder="请输入规则名称" value="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName}">
	                        </td>
	                        <input type="hidden" id="" ord
								name="po.frontlineChannelPo.channelSpecialFilterList[0].ord" value="0">
	                        <td>以下筛选条件剩余用户数</td>
	                        <td id="userGroupStrategyNum0" numtd>--</td>
	                        <td>
		                        <input type="text"
									name="po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords" ischannel="5"
									class="form-control tableInput" placeholder="请输入推荐信息"  value="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords}" />
								<input type="text"
									name="po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate" ischannel="5"
									class="form-control tableInput" placeholder="请输入短信内容"  value="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate}" />
							</td>
	                        <td><a  id="pauseToRemove"onclick="addStrategyRule()" ischannel="5">增加</a></td>
	                 </tr>
                    
                    <c:if test="${not empty bo.po.frontlineChannelPo.channelSpecialFilterList}">
                    	<c:forEach var ="csfPo"  items="${bo.po.frontlineChannelPo.channelSpecialFilterList}" varStatus="status">
                    		<c:if test="${csfPo.ord != '0'}">
	                    		<tr >
									<td>${csfPo.ord }</td>
									<td><input type="text"
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index }].filterName" value="${csfPo.filterName}"
										class="form-control tableInput" placeholder="请输入规则名称" ischannel="5"></td>
									<input type="hidden" id="" ord
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].ord" value="${csfPo.ord }">
									<td><input type="text" id="" condition
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].filterCondition"
										value="${csfPo.filterCondition }" class="tableInput" placeholder="" readOnly="readonly"> 
										<input
										type="hidden" sql id=""
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].filterConditionSql"
										value="${csfPo.filterConditionSql }">
										<input
										type="hidden" sqlCondition id=""
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].filterSqlCondition"
										value="${csfPo.filterSqlCondition }">
										<button type="button" id="" class="btn btn-primary"
											onclick="chooseRuleCondition(this,'5')" ischannel="5">条件</button></td>
									<td id="userGroupStrategyNum${status.index}" numtd>--</td>
									<td><input type="text"
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].marketingWords" ischannel="5"
										class="form-control tableInput" placeholder="请输入推荐信息" value="${csfPo.marketingWords }">
									    <input type="text"
										name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].msmTemplate" ischannel="5"
										class="form-control tableInput" placeholder="请输入短信模板" value="${csfPo.msmTemplate }">
									</td>
									<td><i class="fa fa-trash" aria-hidden="true"
										onclick="deleteStrategyRule(this)"></i></td>
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
    
    <h3 class="headList" id="channelIdsgj8">弹窗扩展配置</h3>
    <h4 id="popRuleInfo">勾选弹窗渠道进行弹窗扩展配置</h4>
    <table class="activeLayout" id="orderPopRuleTable" style="display:none;">
        <colgroup>
            <col width="22%" />
            <col width="26%" />
            
            <col width="52%" />
        </colgroup>
        <tr>
            <th colspan="2" class="whiteNormal">弹窗不同用户显示不同推荐信息说明</th>
            <td >
                <ul>
                	<input type="hidden" id="radioCheck4PopSpecial" value="${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'0':'1'}" />
                    <li class="li1 pop"><input  type="radio"  name="popSelect" class="icheckS" value="是" ischannel="8"/>是</li>
                    <li class="li2"><input  type="radio" name="popSelect" class="icheckS" value="否" ischannel="8" ${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'checked':''}/>否
                        <i data-toggle="tooltip" data-placement="right" title="同一个活动,在执行页面不同用户展现不同的推荐信息" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
            </td>
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
                        <col width="36px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                     <tr>
	                        <td>0</td>
	                        <td>
	                        <input type="text" rulename
								name="popSpecialFilterList[0].filterName" ischannel="8"
								class="form-control tableInput" placeholder="请输入规则名称" value="${bo.popSpecialFilterList[0].filterName==null?'':bo.popSpecialFilterList[0].filterName}">
	                        </td>
	                        <input type="hidden" id="" ord
								name="popSpecialFilterList[0].ord" value="0">
	                        <td>以下筛选条件剩余用户数</td>
	                        <td id="userGroupPopNum0" numtd>--</td>
	                        <td>
		                        <input type="text"
									name="popSpecialFilterList[0].marketingWords" ischannel="8"
									class="form-control tableInput" placeholder="请输入推荐信息"  value="${bo.popSpecialFilterList[0].marketingWords==null?'':bo.popSpecialFilterList[0].marketingWords}" />
									<input type="text"
									name="popSpecialFilterList[0].msmTemplate" ischannel="8"
									class="form-control tableInput" placeholder="请输入短信内容"  value="${bo.popSpecialFilterList[0].msmTemplate==null?'':bo.popSpecialFilterList[0].msmTemplate}" />
							</td>
	                        <td><a onclick="addPopRule()" ischannel="8">增加</a></td>
	                 </tr>
                    
                    <c:if test="${not empty bo.popSpecialFilterList}">
                    	<c:forEach var ="csfPo"  items="${bo.popSpecialFilterList}" varStatus="status">
                    		<c:if test="${csfPo.ord != '0'}">
	                    		<tr >
									<td>${csfPo.ord }</td>
									<td><input type="text" ischannel="8"
										name="popSpecialFilterList[${status.index }].filterName" value="${csfPo.filterName}"
										class="form-control tableInput" placeholder="请输入规则名称"></td>
									<input type="hidden" id="" ord
										name="popSpecialFilterList[${status.index}].ord" value="${csfPo.ord }">
									<td><input type="text" id="" condition ischannel="8"
										name="popSpecialFilterList[${status.index}].filterCondition"
										value="${csfPo.filterCondition }" class="tableInput" placeholder="" readOnly="readonly"> 
										<input
										type="hidden" sql id=""
										name="popSpecialFilterList[${status.index}].filterConditionSql"
										value="${csfPo.filterConditionSql }">
										<input
										type="hidden" sqlCondition id=""
										name="popSpecialFilterList[${status.index}].filterSqlCondition"
										value="${csfPo.filterSqlCondition }">
										<button type="button" id="" class="btn btn-primary"
											onclick="chooseRuleCondition(this,'8')" ischannel="8">条件</button></td>
									<td id="userGroupPopNum${status.index}" numtd>--</td>
									<td><input type="text" ischannel="8"
										name="popSpecialFilterList[${status.index}].marketingWords"
										class="form-control tableInput" placeholder="请输入推荐信息" value="${csfPo.marketingWords }">
									    <input type="text" ischannel="8"
										name="popSpecialFilterList[${status.index}].msmTemplate"
										class="form-control tableInput" placeholder="请输入短信模板" value="${csfPo.msmTemplate }">
									</td>
									<td><i class="fa fa-trash" aria-hidden="true"
										onclick="deletePopRule(this)"></i></td>
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
    <h4 id="telPhoneInfo">勾选电话渠道进行渠道扩展配置</h4>
    <table class="activeLayout" id="telPhoneTable" style="display:none;">
        <colgroup>
            <col width="22%" />
            <col width="26%" />
            
            <col width="52%" />
        </colgroup>
        <tr>
            <th colspan="2" class="whiteNormal">电话渠道不同用户显示不同推荐信息说明</th>
            <td >
                <ul>
                	<input type="hidden" id="radioCheck4TelSpecial" value="${bo.channelTelePhone.telchannelSpecialFilterList==null||bo.channelTelePhone.telchannelSpecialFilterList.size()==0?'0':'1'}" />
                    <li class="li1 tel"><input  type="radio"  name="telSelect" class="icheckS" value="是" ischannel="12"/>是</li>
                    <li class="li2"><input  type="radio" name="telSelect" class="icheckS" value="否" ischannel="12" ${bo.channelTelePhone.telchannelSpecialFilterList==null||bo.channelTelePhone.telchannelSpecialFilterList.size()==0?'checked':''}/>否
                        <i data-toggle="tooltip" data-placement="right" title="同一个活动,在执行页面不同用户展现不同的推荐信息" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
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
                        <col width="36px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>规则名称</th>
                        <th>数据条件</th>
                        <th>筛选后用户数</th>
                        <th>推荐信息</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                     <tr>
	                        <td>0</td>
	                        <td>
	                        <input type="text" rulename
								name="channelTelePhone.telchannelSpecialFilterList[0].filterName" ischannel="12"
								class="form-control tableInput" placeholder="请输入规则名称" value="${bo.channelTelePhone.telchannelSpecialFilterList[0].filterName==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].filterName}">
	                        </td>
	                        <input type="hidden" id="" ord
								name="channelTelePhone.telchannelSpecialFilterList[0].ord" value="0">
	                        <td>以下筛选条件剩余用户数</td>
	                        <td id="userGroupTeleNum0" numtd>--</td>
	                        <td>
		                        <input type="text"
									name="channelTelePhone.telchannelSpecialFilterList[0].marketingWords" ischannel="12"
									class="form-control tableInput" placeholder="请输入推荐信息"  value="${bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords}" />
									<input type="text"
									name="channelTelePhone.telchannelSpecialFilterList[0].msmTemplate" ischannel="12"
									class="form-control tableInput" placeholder="请输入短信内容"  value="${bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate}" />
							</td>
	                        <td><a onclick="addTeleRule()" ischannel="12">增加</a></td>
	                 </tr>
                    
                    <c:if test="${not empty bo.channelTelePhone.telchannelSpecialFilterList}">
                    	<c:forEach var ="csfPo"  items="${bo.channelTelePhone.telchannelSpecialFilterList}" varStatus="status">
                    		<c:if test="${csfPo.ord != '0'}">
	                    		<tr >
									<td>${csfPo.ord }</td>
									<td><input type="text" ischannel="12"
										name="channelTelePhone.telchannelSpecialFilterList[${status.index }].filterName" value="${csfPo.filterName}"
										class="form-control tableInput" placeholder="请输入规则名称"></td>
									<input type="hidden" id="" ord
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].ord" value="${csfPo.ord }">
									<td><input type="text" id="" condition ischannel="12"
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].filterCondition"
										value="${csfPo.filterCondition }" class="tableInput" placeholder="" readOnly="readonly"> 
										<input
										type="hidden" sql id=""
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].filterConditionSql"
										value="${csfPo.filterConditionSql }">
										<input
										type="hidden" sqlCondition id=""
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].filterSqlCondition"
										value="${csfPo.filterSqlCondition }">
										<button type="button" id="" class="btn btn-primary"
											onclick="chooseRuleCondition(this,'12')" ischannel="8">条件</button></td>
									<td id="userGroupTeleNum${status.index}" numtd>--</td>
									<td><input type="text" ischannel="12"
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].marketingWords"
										class="form-control tableInput" placeholder="请输入推荐信息" value="${csfPo.marketingWords }">
									    <input type="text" ischannel="12"
										name="channelTelePhone.telchannelSpecialFilterList[${status.index}].msmTemplate"
										class="form-control tableInput" placeholder="请输入短信模板" value="${csfPo.msmTemplate }">
									</td>
									<td><i class="fa fa-trash" aria-hidden="true"
										onclick="deleteTeleRule(this)"></i></td>
								</tr>
							</c:if>       
                     	</c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </td>
        </tr>

    </table>    --%>
    <h3 class="headList" id="qudaopeizhi12">渠道扩展配置</h3>
    <table class="activeLayout" id="qudapkz23">
        <colgroup>
            <col width="125px" />
            <col width="30%" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr id="advanceFrontLine" style="display:none;">
            <th>接触频次定义</th>
            <td>客户经理</td>
            <td colspan="2">
              
                    <ul>
                        <li class="li1"><input  type="radio"  name="po.frontlineChannelPo.isUniSet" class="icheckS" value="1" ischannel="5" ${bo.po.frontlineChannelPo.isUniSet==1||bo.po.frontlineChannelPo.isUniSet==null?'checked':'' } />使用统一设置
                            <i data-toggle="tooltip" data-placement="right" title="使用统一设置：使用渠道总控设置里的接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2 front"><input id="frontLineisUniSet" type="radio"  name="po.frontlineChannelPo.isUniSet" class="icheckS" value="0" ischannel="5" ${bo.po.frontlineChannelPo.isUniSet==0?'checked':'' } />自定义
                            <i data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置,重新定义接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
              
            </td>
        </tr>
        <tr id="advanceActivity_frontlineChannel" <c:if test="${bo.po.frontlineChannelPo.isUniSet!=0}">style="display:none"</c:if>>
        <th>接触频次设置</th>
            <td>
                              近<input class="form-control inputWidth" name="po.frontlineChannelPo.touchLimitDay" type="number" min="1" max="100" check_empty check_name="客户经理接触频次" check_max="1,100" ischannel="7" value="${bo.po.frontlineChannelPo.touchLimitDay==null?bo.activityChannelRule.touchLimitDay:bo.po.frontlineChannelPo.touchLimitDay}">天一次
               <span data-toggle="tooltip" data-placement="right" title="接触频次：出工单时会判断接触记录表中近多少天是否与用户接触过。"> <i class="fa fa-question-circle-o" aria-hidden="true"></i>
            </span>
            </td>
        
        
        </tr>
        
        <tr id="localMessageInfo" style="display:none;">
            <th>接触频次定义</th>
            <td>本地短信</td>
            <td colspan="2">
              
                    <ul>
                        <li class="li1"><input  type="radio"  name="msmChannelPo.isUniSet" class="icheckS" value="1" ischannel="7" ${bo.msmChannelPo.isUniSet==1||bo.msmChannelPo.isUniSet==null?'checked':'' } />使用统一设置
                            <i data-toggle="tooltip" data-placement="right" title="使用统一设置：使用渠道总控设置里的接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2 message"><input id="localMessageisUniSet" type="radio"  name="msmChannelPo.isUniSet" class="icheckS" value="0" ischannel="7" ${bo.msmChannelPo.isUniSet==0?'checked':''} />自定义
                            <i data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置,重新定义接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
              
            </td>
        </tr>
        <tr <c:if test="${bo.msmChannelPo.isUniSet!=0}">style="display:none"</c:if> id="advanceActivity_message">
                    <!-- <th></th> -->
            <td colspan="5">
         <table class="activeLayout" style="margin-left:20px" id="dxshiduan">
        <colgroup>
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
        </colgroup>
        <%-- <tr>      
            <th>短信时段设置</th>
            <td colspan="2">
            <input type="hidden" name = "msmChannelPo.messageSendTime" value="${bo.msmChannelPo.messageSendTime==null?bo.activityChannelRule.messageSendTime:bo.msmChannelPo.messageSendTime }"/>
            <input  type="checkbox"  name="messageSendTime" class="icheckS" value="1" ${bo.msmChannelPo.messageSendTime=='1'?'checked':''}/>上午(9:00-12:00)</td>
            <td style="padding-left: 10px" colspan="2"><input  type="checkbox"  name="messageSendTime" class="icheckS" value="2" ${bo.msmChannelPo.messageSendTime=='2'?'checked':''}/>上午(14:00-18:00)</td>
        </tr> --%>
        <tr>
        <th>短信时段设置:</th> 
        <input type="hidden" name = "msmChannelPo.messageSendTime" value="${bo.msmChannelPo.messageSendTime==null?bo.activityChannelRule.messageSendTime:bo.msmChannelPo.messageSendTime }"/>
        <input type="hidden" id="ftime0" value=""/><input type="hidden" id="ltime0" value=""/>
        <input type="hidden" id="ftime1" value=""/><input type="hidden" id="ltime1" value=""/>
        <input type="hidden" id="ftime2" value=""/><input type="hidden" id="ltime2" value=""/>
        <input type="hidden" id="ftime3" value=""/><input type="hidden" id="ltime3" value=""/>
        <input type="hidden" id="ftime4" value=""/><input type="hidden" id="ltime4" value=""/>
        <input type="hidden" id="defaultMst" value="${bo.activityChannelRule.messageSendTime}"/>
        <input type="hidden" id="defaultSd" value="${bo.activityChannelRule.startDate}"/>
        <input type="hidden" id="defaultEd" value="${bo.activityChannelRule.endDate}"/>
        <input type="hidden" id="defaultSf" value="${bo.activityChannelRule.sendFrequency}"/>
        <input type="hidden" id="defaultCst" value="${bo.activityChannelRule.cycleSendTimes}"/>
        <input type="hidden" id="defaultId" value="${bo.activityChannelRule.intervalDay}"/>      
        <td id="custom12138" colspan="2"><a onclick="customTime()" ischannel="7">自定义时间段</a></td>
        <td id="return12138" colspan="2" class="hide"><a onclick="returnTime()" ischannel="7">返回默认设置</a></td>
        </tr>       
        <c:forEach items="${bo.timePoint}" var="timePoint" varStatus="status">
        <tr>
        <th></th>                     
            <td id="radioBox${status.index}" colspan="2">
            <input  type="checkbox"  name="messageSendTime" class="icheckS" ischannel="7" value="${timePoint.expand2}" ${bo.msmChannelPo.messageSendTime==timePoint.expand2?'checked':''}/>
            ${timePoint.expand}(${timePoint.time})</td> 
            <td id="chooseBox${status.index}" class="hide" colspan="2">
                <select id="frontFirst${status.index}" onchange="hideOption(id,'1')" ischannel="7">
				<option value="">请选择..</option>
			 	<c:forEach items="${bo.timeQuantum}" var="tq">
                     <option id="${tq.id}" value="${tq.expand}">${tq.time}</option>
                </c:forEach>
			    </select>
			    至
			    <select id="behindLast${status.index}" onchange="hideOption(id,'2')" ischannel="7">
				<option value="">请选择..</option>
			 	<c:forEach items="${bo.timeQuantum}" var="tq">
                      <option id="${tq.id}" value="${tq.expand}">${tq.time}</option>
                </c:forEach>
			    </select>
            </td>
                       
        </tr>
        </c:forEach>
        <tr id="mouthsendshezhi">
            <th>按月刷新发送设置</th>
            <td>开始日期</td>
            <td> <input name="msmChannelPo.sendStartTime" class="form-control inputrefResh" type="number"  min="1" max="31"  check_name="按月刷新发送设置开始日期" check_max="1,31" ischannel="7" value="${bo.msmChannelPo.sendStartTime==null?bo.activityChannelRule.startDate:bo.msmChannelPo.sendStartTime }">日</td>
            <td class="tdRight">结束日期</td>
            <td> <input name="msmChannelPo.sendEndTime" class="form-control inputrefResh" type="number" min="1" max="31" check_empty check_name="按月刷新发送设置结束日期" check_max="1,31" ischannel="7" value="${bo.msmChannelPo.sendEndTime==null?bo.activityChannelRule.endDate:bo.msmChannelPo.sendEndTime }">日</td>
        </tr>
        <tr class="hide" id="ycleTimes34">
            <th></th>
            <td>本周期内发送次数</td>
            <%-- <td> <input name="msmChannelPo.cycleTimes" class="form-control inputrefResh" type="number" placeholder="${bo.activityChannelRule.cycleSendTimes }" min="1" max="31" value="${bo.msmChannelPo.cycleTimes==null?bo.activityChannelRule.cycleSendTimes:bo.msmChannelPo.cycleTimes }">次</td> --%>
            <td> <input name="msmChannelPo.cycleTimes" class="form-control inputrefResh" type="number"  min="1" max="31"  value="1" ischannel="7">次</td>
            <td class="tdRight">间隔</td>
            <%-- <td><input name="msmChannelPo.intervalHours" class="form-control inputrefResh"  type="number" placeholder="${bo.activityChannelRule.intervalDay }"  min="1" max="31" value="${bo.msmChannelPo.intervalHours==null?bo.activityChannelRule.intervalDay:bo.msmChannelPo.intervalHours }">日</td> --%>
            <td><input name="msmChannelPo.intervalHours" class="form-control inputrefResh"  type="number"  min="1" max="31"  value="32" ischannel="7">日</td>
        </tr>
        <tr id="timessenf324">
            <th>按日刷新发送设置</th>
            <td colspan="4">发送说明：出工单当天发</td>
        </tr>
        <tr id="touchLimitDay23">
            <th>发送频次设置</th>
            <td colspan="4">
                近<input class="form-control inputWidth" name="msmChannelPo.touchLimitDay" type="number"  min="1" ischannel="7" value="${bo.msmChannelPo.touchLimitDay==null?bo.activityChannelRule.sendFrequency:bo.msmChannelPo.touchLimitDay}"  max="100" check_empty check_name="发送频次设置" check_max="1,100">天一次
               <span data-toggle="tooltip" data-placement="right" title="发送频次:出工单时会判断发送短信记录。">
               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
               </span>
            </td>
        </tr>
      
    </table>
        </td>
        
        
        </tr>
        <!-- 集团短信开始 -->
               <%-- <tr id="localMessageInfoZB" style="display:none;">
        	<th></th>
            <td>集团短信</td>
            <td colspan="2">
              
                    <ul>
                        <li class="li1"><input  type="radio"  name="zongBuMsmChannelPo.isUniSet" class="icheckS" value="1" ischannel="3" ${bo.zongBuMsmChannelPo.isUniSet==1||bo.zongBuMsmChannelPo.isUniSet==null?'checked':'' } />使用统一设置
                            <i data-toggle="tooltip" data-placement="right" title="使用统一设置：使用渠道总控设置里的接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                        <li class="li2 messageZB"><input id="ZBMessageisUniSet" type="radio"  name="zongBuMsmChannelPo.isUniSet" class="icheckS" value="0" ischannel="3" ${bo.zongBuMsmChannelPo.isUniSet==0?'checked':''} />自定义
                            <i data-toggle="tooltip" data-placement="right" title="自定义：不使用统一设置,重新定义接触频次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
              
            </td>
        </tr>
        <tr <c:if test="${bo.zongBuMsmChannelPo.isUniSet!=0}">style="display:none"</c:if> id="advanceActivity_messageZB">
                    <!-- <th></th> -->
            <td colspan="5">
         <table class="activeLayout" style="margin-left:20px" id="dxshiduanZB">
        <colgroup>
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
            <col width="17%" />
            <col width="22%" />
        </colgroup>
       
        <tr>
        <th>集团短信时段设置:</th> 
        <input type="hidden" name = "zongBuMsmChannelPo.messageSendTime" value="${bo.zongBuMsmChannelPo.messageSendTime==null?bo.activityChannelRule.messageSendTimeJiTuan:bo.zongBuMsmChannelPo.messageSendTime }"/>
        <input type="hidden" id="ftimeZB0" value=""/><input type="hidden" id="ltimeZB0" value=""/>
        <input type="hidden" id="ftimeZB1" value=""/><input type="hidden" id="ltimeZB1" value=""/>
        <input type="hidden" id="ftimeZB2" value=""/><input type="hidden" id="ltimeZB2" value=""/>
        <input type="hidden" id="ftimeZB3" value=""/><input type="hidden" id="ltimeZB3" value=""/>
        <input type="hidden" id="ftimeZB4" value=""/><input type="hidden" id="ltimeZB4" value=""/>
        <input type="hidden" id="defaultMstZB" value="${bo.activityChannelRule.messageSendTimeJiTuan}"/>
        <input type="hidden" id="defaultSdZB" value="${bo.activityChannelRule.startDateJiTuan}"/>
        <input type="hidden" id="defaultEdZB" value="${bo.activityChannelRule.endDateJiTuan}"/>
        <input type="hidden" id="defaultSfZB" value="${bo.activityChannelRule.sendFrequencyJiTuan}"/>
        <input type="hidden" id="defaultCstZB" value="${bo.activityChannelRule.cycleSendTimes}"/>
        <input type="hidden" id="defaultIdZB" value="${bo.activityChannelRule.intervalDay}"/>      
        <td id="custom12138ZB" colspan="2"><a onclick="customTimeZB()" ischannel="3">自定义时间段</a></td>
        <td id="return12138ZB" colspan="2" class="hide"><a onclick="returnTimeZB()" ischannel="3">返回默认设置</a></td>
        </tr>       
        <c:forEach items="${bo.timePoint}" var="timePoint" varStatus="status">
        <tr>
        <th></th>                     
            <td id="radioBoxZB${status.index}" colspan="2">
            <input  type="checkbox"  name="messageSendTimeJiTuan" class="icheckS" ischannel="3" value="${timePoint.expand2}" ${bo.zongBuMsmChannelPo.messageSendTime==timePoint.expand2?'checked':''}/>
            ${timePoint.expand}(${timePoint.time})</td> 
            <td id="chooseBoxZB${status.index}" class="hide" colspan="2">
                <select id="frontFirZB${status.index}" onchange="hideOption(id,'3')" ischannel="3">
				<option value="">请选择..</option>
			 	<c:forEach items="${bo.timeQuantum}" var="tq">
                     <option id="${tq.id}" value="${tq.expand}">${tq.time}</option>
                </c:forEach>
			    </select>
			    至
			    <select id="behindLaZB${status.index}" onchange="hideOption(id,'4')" ischannel="3">
				<option value="">请选择..</option>
			 	<c:forEach items="${bo.timeQuantum}" var="tq">
                      <option id="${tq.id}" value="${tq.expand}">${tq.time}</option>
                </c:forEach>
			    </select>
            </td>
                       
        </tr>
        </c:forEach>
        <tr id="mouthsendshezhiZB">
            <th>按月刷新发送设置</th>
            <td>开始日期</td>
            <td> <input name="zongBuMsmChannelPo.sendStartTime" class="form-control inputrefResh" type="number"  min="1" max="31"  check_name="按月刷新发送设置开始日期" check_max="1,31" ischannel="3" value="${bo.zongBuMsmChannelPo.sendStartTime==null?bo.activityChannelRule.startDateJiTuan:bo.zongBuMsmChannelPo.sendStartTime }">日</td>
            <td class="tdRight">结束日期</td>
            <td> <input name="zongBuMsmChannelPo.sendEndTime" class="form-control inputrefResh" type="number" min="1" max="31" check_empty check_name="按月刷新发送设置结束日期" check_max="1,31" ischannel="3" value="${bo.zongBuMsmChannelPo.sendEndTime==null?bo.activityChannelRule.endDateJiTuan:bo.zongBuMsmChannelPo.sendEndTime }">日</td>
        </tr>
        <tr class="hide" id="ycleTimes34ZB">
            <th></th>
            <td>本周期内发送次数</td>
            <td> <input name="msmChannelPo.cycleTimes" class="form-control inputrefResh" type="number" placeholder="${bo.activityChannelRule.cycleSendTimes }" min="1" max="31" value="${bo.msmChannelPo.cycleTimes==null?bo.activityChannelRule.cycleSendTimes:bo.msmChannelPo.cycleTimes }">次</td>
            <td> <input name="zongBuMsmChannelPo.cycleTimes" class="form-control inputrefResh" type="number"  min="1" max="31"  value="1" ischannel="3">次</td>
            <td class="tdRight">间隔</td>
            <td><input name="msmChannelPo.intervalHours" class="form-control inputrefResh"  type="number" placeholder="${bo.activityChannelRule.intervalDay }"  min="1" max="31" value="${bo.msmChannelPo.intervalHours==null?bo.activityChannelRule.intervalDay:bo.msmChannelPo.intervalHours }">日</td>
            <td><input name="zongBuMsmChannelPo.intervalHours" class="form-control inputrefResh"  type="number"  min="1" max="31"  value="32" ischannel="3">日</td>
        </tr>
        <tr id="timessenf324ZB">
            <th>按日刷新发送设置</th>
            <td colspan="4">发送说明：出工单当天发</td>
        </tr>
        <tr id="touchLimitDay23ZB">
            <th>发送频次设置</th>
            <td colspan="4">
                近<input class="form-control inputWidth" name="zongBuMsmChannelPo.touchLimitDay" type="number"  min="1" ischannel="3" value="${bo.zongBuMsmChannelPo.touchLimitDay==null?bo.activityChannelRule.sendFrequencyJiTuan:bo.zongBuMsmChannelPo.touchLimitDay}"  max="100" check_empty check_name="发送频次设置" check_max="1,100">天一次
               <span data-toggle="tooltip" data-placement="right" title="发送频次:出工单时会判断发送短信记录。">
               <i class="fa fa-question-circle-o" aria-hidden="true"></i>
               </span>
            </td>
        </tr>
      
    </table>
        </td>
        
        
        </tr> --%>
        <!-- 集团短信结束 -->
        
      <!--   <tr>
            <th class="whiteNormal">受限用户</th>
            <td>查看限制用户数</td>
            <td colspan="3">
                客户经理：100个 占总数3%；短信：50个 占总数1%
            </td>
        </tr> -->
        <tr id="issSendorder323">
            <th></th>
            <td>处理方式</td>
            <td colspan="3">
                <input  class="icheckS" type="radio" name="po.isSendOrder"  value="0" ${bo.activityBasicInfo.isSendOrder==0||bo.activityBasicInfo.isSendOrder==null?'checked':'' }/>
                不出工单
            </td>
        </tr>
        <tr id="selfsendcChannelrule34">
            <th rowspan="3">渠道协同配置</th>
            <td>自动推送 <i data-toggle="tooltip" data-placement="right" title="当微信与短信同时选择时,自动发送渠道关系配置 " class="fa fa-question-circle-o" aria-hidden="true"></i></td>
            <td colspan="3">
                <ul>
                    <li class="li4"><input  type="radio"  name="po.selfSendChannelRule" class="icheckS" value="1" ${bo.activityBasicInfo.selfSendChannelRule==1||bo.activityBasicInfo.selfSendChannelRule==null?'checked':'' } />各自发送可以重复
                    </li>
                    <li class="li2 hidden"><input  type="radio"  name="po.selfSendChannelRule" class="icheckS" value="0"${bo.activityBasicInfo.selfSendChannelRule==0?'checked':'' } />短信微信互斥发送
                        <i data-toggle="tooltip" data-placement="right" title="先发送微信,其它用户发送短信" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
            </td>
        </tr>
        <tr id="dianziqudao123">
            <td >电子渠道<i data-toggle="tooltip" data-placement="right" title="电子渠道包括：网厅、手厅、沃视窗、弹窗" class="fa fa-question-circle-o" aria-hidden="true"></i></td>
            <td colspan="2">             
                <ul>
                    <li class="li1">
                        <input  type="radio"  name="po.eChannelShowRule" class="icheckS" value="1" ${bo.activityBasicInfo.eChannelShowRule==1||bo.activityBasicInfo.eChannelShowRule==null?'checked':'' }/>不互斥
                        <i data-toggle="tooltip" data-placement="right" title="不互斥：表示互不影响,每个渠道都可以展示一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </li>
                </ul>
            </td>
        </tr>
        <tr id="otherchannelexerule23">
            <td>客户经理与弹窗</td>
            <td colspan="2">
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
            </td>
        </tr>
    </table>
 	<input type="hidden" id="orgrange12" name="orgrange12" value=""/>
 	<input type="hidden" id="rulerange12" name="rulerange12" value=""/>
 	
 	<!-- 客户经理预览 -->
 	<input type="hidden" id="product_nameChoo" name="product_nameChoo" value=""/>
	<input type="hidden" id="REFERRALS_INFO" name="REFERRALS_INFO" value=""/>
	<input type="hidden" id="POLICY_DES" name="POLICY_DES" value=""/>
	<input type="hidden" id="USERGROUP_FILTERCON" name="USERGROUP_FILTERCON" value=""/>
	<!-- 本地弹窗 -->
	<input type="hidden" id="CI_WEIGHT_DES" name="CI_WEIGHT_DES" value=""/>
	<input type="hidden" id="TARGET" name="TARGET" value=""/>
	<input type="hidden" id="TALK" name="TALK" value=""/>
</div>
</div>
<script type="text/javascript">
    var ue = [];
	for(var i=0;i<$("[id^='editor']").length;i++){
	   ue[i] = UE.getEditor('editor'+i,{
		toolbars: [
           [${bo.ueditorTools}]
		],
		autoHeightEnabled: false,
	    autoFloatEnabled: false,
	    enableAutoSave: false
	   });
	}

    
    $("#advancedActivityBtn").click(function(){
    $("#advancedActivity").toggle();
    });
 
  /*   高级模式工单配置规则 */
    
    if($("#radioCheck4ChanneLSpecial").val()=="1"){
    	$('.li1.toggole input.icheckS').iCheck('check'); 
    	$("#explainTable").show();    	
    }
    if($("#radioCheck4PopSpecial").val()=="1"){
		$('.li1.pop input.icheckS').iCheck('check'); 
	    $("#popExplainTable").show();    	
    }
    if($("#radioCheck4TelSpecial").val()=="1"){
		$('.li1.tel input.icheckS').iCheck('check'); 
	    $("#telExplainTable").show();    	
    }
     var k=1;
     var forEachList=$("#forEachList").val();
     if(forEachList!=""&&forEachList!=null){
        var listSplit=forEachList.split(",");
        k=listSplit.length+1;
     }
	function addIssuedRule(){
		     var delid="del"+k;
			 var newdivid="deldiv"+k;
			 var newdiv1="#"+newdivid;
			 var tdid="tdid"+k;
			 var finid="#"+tdid;
			 var classI = "abc"+k;
			 var classId = "#"+classI;
			 var ziI="zi"+k;
			 var ziId = "#"+ziI;
			 var orderI = "order"+k;
			 var orderId = "#"+orderI;
			 var orT = "liorg"+k;
			 var orgT = "#"+orT; 
		     var oSel = document.getElementById("orderIssuedRule");
		     var oZi = document.getElementById("zi");
		     var oCici = document.getElementById("classid");
		     var oOrgRange = document.getElementById("classOrgRange");
		     var oOrgPath = document.getElementById("classOrgPath");
		     var oOrgId = document.getElementById("classOrgId");
             var lastVal = "lastVal"+k;
             var firstVal = "firstVal"+k;
			 var newdiv="<tr id='"+newdivid+"' name='newdiv'></tr>"
			 var aaa="<td colspan='2' class='ar'><button type='button' class='btn btn-primary term' id='"+delid+"' "+"onclick='delIssuedRule(this)'>删除</button></td>";
             var oNewSel = oSel.cloneNode(true);
             var oNewZi = oZi.cloneNode(true);
             var oNewCici = oCici.cloneNode(true);
             handleRule("add","");
			  $("#selectedRule").append(newdiv);
			// $(newdiv1).append("<div name='order'>第"+k+"优先级"+"</div>");
			 $(newdiv1).append("<td colspan='3' name='order'><ul><li style='width:27%' id='"+classI+"'></li><li style='width:8%;margin-left: 5px;margin-right: 4px;' id='"+ziI+"'></li><li style='width:28%' id='"+orderI+"'></li><li style='width:31%;margin-left: 5px;margin-right: 4px;' id='"+orT+"'></li></ul></td>");
			 oNewCici.setAttribute("id","classid"+k);
			 oNewSel.setAttribute("id","orderIssuedRule"+k);
			 oNewCici.setAttribute("value","");
			 oNewSel.setAttribute("value","");
			 if($("input[name='classLevel']").val()!="1"&&$("input[name='isLastStage']").val()!="1"){
		     var oNewOrgRange = oOrgRange.cloneNode(true);
             var oNewOrgPath = oOrgPath.cloneNode(true);
             var oNewOrgId = oOrgId.cloneNode(true);
             oNewOrgRange.setAttribute("value","");
			 oNewOrgPath.setAttribute("value","");
			 oNewOrgId.setAttribute("value","");
			 oNewOrgRange.setAttribute("id","classOrgRange"+k);
			 oNewOrgPath.setAttribute("id","classOrgPath"+k);
			 oNewOrgId.setAttribute("id","classOrgId"+k);
			 $(orgT).append(oNewOrgRange);
			 $(orgT).append(oNewOrgPath);
			 $(orgT).append(oNewOrgId);
			 $("#classOrgRange"+k).val("");
		     }
             $(classId).append(oNewCici);
             $(ziId).append(oNewZi);
             $(orderId).append(oNewSel);
			 $(newdiv1).append(aaa);
			 $("#savelastValue").append("<input type='hidden' id='"+lastVal+"' value=''/>");
			 $("#savelastValue").append("<input type='hidden' id='"+firstVal+"' value=''/>");
			 k++;
			
			 /* if($("#orderIssuedRule0").find("option[lev='3']").val() != undefined){
			    $("#orderIssuedRule0").find("option[lev='3']").each(function(){
			       $(this).remove();
			    });
			 } */			 			
	}
	
		function handleRule(g,ruleId){
	   var m="";
	   if($("#saveFrontId").val()!=""&&$("#saveFrontId")!=null){
          $("select[id^=classid]").each(function(){
			     var id=$(this).attr("id");
			     if(m==""){
			        m = id.substring(7,id.length);
			     }else{
			        m = m+","+id.substring(7,id.length);
			     }			     
			 });
		  m = m.substring(m.length-1,m.length);
		  if($("#saveFrontId").val()==$("#classid"+m).val()){		     
		     if(g=="add"){
		       var behindChoose = $("#classid"+m).parent().next().next().children();
		       $("#saveSpecialOption").find("option[lev='3']").each(function(){
		           behindChoose.find("option[id='"+$(this).attr("id")+"']").remove();
		       });		        
		     }else if(g=="delete"){
		       var behindChoose = $("#classid"+m).parent().next().next().children();
		       $("#saveSpecialOption").find("option[lev='3']").each(function(){
		           var op=document.getElementById($(this).attr("id"));
		           var newOp = op.cloneNode(true);
		           behindChoose.append(newOp);
		       });		       
		     }else if(g=="change"){
		       var behindChoose = $("#classid"+m).parent().next().next().children();
		       if(behindChoose.attr("id")==$("#"+ruleId).attr("id")){
		          if($("option[id='"+behindChoose.val()+"']").attr("lev")=="3"){
		             $("#addRule1").attr("disabled",true);
		             $("#addRule").attr("disabled",true);
		          }
		       }
		     }
		  }
		  if($("#"+ruleId).parent().prev().prev().children().val()==$("#saveFrontId").val()){
		     if(g=="change"){
		       if(ruleId.substring(ruleId.length-1,ruleId.length)!=m){
		       var behindChoose = $("#"+ruleId);
		       $("#saveSpecialOption").find("option[lev='3']").each(function(){
		           behindChoose.find("option[id='"+$(this).attr("id")+"']").remove();
		       });
		       }
		     }
		  }
       }
	}
	
	function getSelectRule(){
	    var orgId="";
	    var orgName="";
	    var orgPath="";
	    var orgPath1="";
		var str;
		var i=0;
		var orgRuleId="";
		var name=document.getElementsByName("IssuedRule");
		/* var orgId=document.getElementsByName("classOrgId");
		var orgName=document.getElementsByName("classOrgRange");
		var orgPath=document.getElementsByName("classOrgPath"); */
		$("select[name=IssuedRule]").each(function(){
			if($(this).val()==null||$(this).val()==""){
				return;
			}else{
			  if(i==0){
		      if($("input[name='classLevel']").val()!="1"){
		         orgId=$(this).parent().parent().find("input[name='classOrgId']").val().trim();
		         orgName=$(this).parent().parent().find("input[name='classOrgRange']").val().trim();
		         if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		            orgPath=$("input[name='po.frontlineChannelPo.sellingArea']").val();
		         }else{
		            orgPath=$(this).parent().parent().find("input[name='classOrgPath']").val().trim();
		         }  
			    /*  if($.trim($(this).parent().parent().find("input[name='classOrgPath']").val()) != null && $.trim($(this).parent().parent().find("input[name='classOrgPath']").val()) != ""){
				    orgPath1=$(this).parent().parent().find("input[name='classOrgPath']").val().trim();
				    orgRuleId=$(this).val();
			     } */
			  }else{
			     orgId="";
			     orgName="";
			     if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		            orgPath=$("input[name='po.frontlineChannelPo.sellingArea']").val();
		         }else{
		            orgPath="";
		         }
			  }
		      str=$(this).val();
			  i=1;
		 }else{
		 str+=","+$(this).val();
		 if($("input[name='classLevel']").val()!="1"){
		     orgId+=";"+$(this).parent().parent().find("input[name='classOrgId']").val().trim();
		     orgName+=";"+$(this).parent().parent().find("input[name='classOrgRange']").val().trim();
		     if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		         orgPath+=";"+$("input[name='po.frontlineChannelPo.sellingArea']").val();
		      }else{
		         orgPath+=";"+$(this).parent().parent().find("input[name='classOrgPath']").val().trim();
		      }	     
		 }else{
			     orgId+=";";
			     orgName+=";";
			     if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		            orgPath+=";"+$("input[name='po.frontlineChannelPo.sellingArea']").val();
		         }else{
		            orgPath+=";";
		         }
			  }		

		 }
		 if(($(this).parent().parent().find("input[name='classOrgId']").val()!=undefined&&$(this).parent().parent().find("input[name='classOrgId']").val().trim()!="")||$("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		 	if(($.trim($(this).parent().parent().find("input[name='classOrgPath']").val()) != null && $.trim($(this).parent().parent().find("input[name='classOrgPath']").val()) != "")||$("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		 		if(orgPath1==""){
		 		   if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		              orgPath1 = $("input[name='po.frontlineChannelPo.sellingArea']").val();
		           }else{
		              orgPath1 = $(this).parent().parent().find("input[name='classOrgPath']").val().trim();
		           }		   
		 		}else{
		 		   if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
		              orgPath1 = orgPath1 + ";" +$("input[name='po.frontlineChannelPo.sellingArea']").val();
		           }else{
		              orgPath1 = orgPath1 + ";" + $(this).parent().parent().find("input[name='classOrgPath']").val();
		           }		 		   
		 		}
		 		if(orgRuleId != null && orgRuleId != ""){
		 			orgRuleId+=","+$(this).val();
		 		}else{
		 			orgRuleId=$(this).val();
		 		}
		 	   }
		 	 }
			}			  
         });
		 $("#newrule").val(str);
		 $("#ruleOrgId").val(orgId);
		 $("#ruleOrgName").val(orgName);
		 $("#ruleOrgPath").val(orgPath);
		 $("#ruleOrgPathSpecial").val(orgPath1);
		 $("#orgRuleId").val(orgRuleId);
	}
	
	/**
	*调用划配接口查询用户数
	*/
	function refreshRuleNum(){ 
		getSelectRule();
		var y="0";
		var pathOrg = $("#ruleOrgPathSpecial").val();
		var idOrg = $("#orgRuleId").val();
		if($("#newrule").val() != null && $("#newrule").val() != ""){
			if($('input[name="po.orgPath"]').val() != null && $('input[name="po.orgPath"]').val() != ""){
				if($("#userGroupId").val() != null && $("#userGroupId").val() != ""){
				  $("select[id^='orderIssuedRule']").each(function(){
				     if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
				        y="1";
				     }
				  });
				  if(y!="1"||($("input[name='po.frontlineChannelPo.sellingArea']").val()!=null&&$("input[name='po.frontlineChannelPo.sellingArea']").val()!="")){
					$("#gdNum").html("加载中");
					//$("#refrule").attr("disabled", true); 
					//调用划配模块接口
			 		 $.ajax({
			 				async : true,
			 				type : "POST",
			 				url : "/"+services.epmwxwl+"/regionTree/doNum", 
			 				contentType : "application/json",
			     			data : JSON.stringify({"usergid":$("#userGroupId").val(),
			 										"ruleid":$("#newrule").val(),
			 										"tenantId":$('input[name="tenantid"]').val(),
			 										"rulesql":$("#FrontLineContent1Sql").val(),
			 										"rulerange":{"rule_type_id":idOrg,"rulerange":pathOrg},
			 										"orgrange":$('input[name="po.orgPath"]').val().substring(0,($('input[name="po.orgPath"]').val().length-1)),
			 										"path":$('input[name="orgPath"]').val()}),
			 				success : function(data) {
			 					//$("#refrule").removeAttr('disabled'); 
			 					if(data.status == "success"){
			 						//var useNum = $("#userGroupNum").html();
			 						var useNum = $("#userGroupChannelNum5").html();
			 						var gdNum = data.msg;
			 						if(parseInt(useNum) - parseInt(gdNum) > 0){
				 						$("#gdNum").html((parseInt(useNum) - parseInt(gdNum)));
			 						}else{
				 						$("#gdNum").html(0);
			 						}
			 					}else{
			 						$("#gdNum").html(data.msg);
								}
			 				}
			 		 })
			 		 }else{
			 	      $.ligerDialog.warn("请选择指定的渠道!");
			 	   }
				}else{
					$.ligerDialog.warn("请先选择目标客户群!");
				}
			}else{
				$.ligerDialog.warn("请先选择活动适用范围!");
			}
		}else{
			$.ligerDialog.warn("请先选择工单下发规则!");
		}
 		
	}
/**
 * 规则预览
 */
function previewView(){
	getSelectRule();
	var y="0";
    var pathOrg = $("#ruleOrgPathSpecial").val();
	var idOrg = $("#orgRuleId").val();
	if($("#newrule").val() != null && $("#newrule").val() != ""){
		if($('input[name="po.orgPath"]').val() != null && $('input[name="po.orgPath"]').val() != ""){
			if($("#userGroupId").val() != null && $("#userGroupId").val() != ""){
			$("select[id^='orderIssuedRule']").each(function(){
				     if($("option[id='"+$(this).val()+"']").attr("lev")=="1"){
				        y="1";
				     }
				  });
			  if((y!="1")||($('input[name="po.frontlineChannelPo.sellingArea"]').val()!=null&&$("input[name='po.frontlineChannelPo.sellingArea']").val()!="")){
				$('input[name="rulerange12"]').val(encodeURI("{\"rule_type_id\":\""+idOrg+ "\",\"rulerange\":\"" + pathOrg + "\"}"));
				var pathorgvar = $('input[name="po.orgPath"]').val().substring(0,($('input[name="po.orgPath"]').val().length-1));
				$('input[name="orgrange12"]').val(pathorgvar);
				$.ajax({
					async : true,
					type : "POST",
					url : "/"+services.epmwxwl+"/test",  
					success : function(data) {
						/* if(top.openTab==undefined){
							location.href="../activity/rulePreview";
						}else{
							top.openTab("下发预览","/clyxactivity/activity/rulePreview");
						} */
						window.open("rulePreview");	
					},
					error: function(){
						/* if(top.openTab==undefined){
							location.href="../activity/rulePreview";
						}else{
							top.openTab("下发预览","/clyxactivity/activity/rulePreview");
						} */
						window.open("rulePreview");	
					}
				})
				}else{
			 	      $.ligerDialog.warn("请选择指定的渠道!");
			 	   }
			}else{
				$.ligerDialog.warn("请先选择目标客户群!");
			}
		}else{
			$.ligerDialog.warn("请先选择活动适用范围!");
		}
	}else{
		$.ligerDialog.warn("请先选择工单下发规则!");
	}
}

/**
 * 客户经理预览
 */
 function frontlinePreviewview(){
	var chooseProductname=$("#selectedNames").val().split(",");
	var j=chooseProductname.length;
	if(j>5){
		j=5;
	}else{
		j=chooseProductname.length;
	}
	var proNameChoo="";
	for(var i=0;i<j;i++){
		proNameChoo=proNameChoo+chooseProductname[i]+",";
	}
	$("#product_nameChoo").val(proNameChoo.substring(0,(proNameChoo.length-1)));
	 //window.open("frontlinePreview");
	 var frontline = $.ligerDialog.open({
			url:"frontlinePreview",
			title:"客户经理预览",
			height: 500,
			width: 1100,
			isResize: true,
			isDrag:true,
			buttons : [ {
				text : '关闭',
				onclick: function (item, dialog) { dialog.close(); } 
			}]
		});
}


	function delIssuedRule(ele){
	       var m=0;
	       //console.log(ele);
		   // alert(ele);
		   // $(ele).empty();
		    var eleId = "orderIssuedRule"+$(ele).attr("id").substring(3,$(ele).attr("id").length);
		    if($("#"+eleId).val()!=""&&$("#"+eleId).val()!=null){
		        removeRepect(eleId,"del");
		    }
		    var object= ele.parentNode.parentNode.parentNode;
			object.removeChild(ele.parentNode.parentNode);
			var firstVal="firstVal"+$(ele).attr("id").substring(3,$(ele).attr("id").length);
			var lastVal="lastVal"+$(ele).attr("id").substring(3,$(ele).attr("id").length);
			$("#savelastValue").find("input[id='"+firstVal+"']").remove();
			$("#savelastValue").find("input[id='"+lastVal+"']").remove();
			//--k;
		    $("select[id^='orderIssuedRule']").each(function(){
				m++;
			});
			/* if($("#classid0").val()==$("#saveFrontId").val()&&m<=2&&$("#classid0").val()!=""){	
			   if($("#orderIssuedRule0").find("option[lev='1']").val() == undefined){
			      var op = $("#saveSpecialOption").find("option[lev='1']").attr("id");
			      var newop = document.getElementById(op);
			      var opcopy = newop.cloneNode(true);
			      $("#orderIssuedRule0").append(opcopy);
			   }
			   if($("#orderIssuedRule0").find("option[lev='3']").val() == undefined){
			      $("#saveSpecialOption").find("option[lev='3']").each(function(){
			          var op = $(this).attr("id");
			          var newop = document.getElementById(op);
			          var opcopy = newop.cloneNode(true);
			          $("#orderIssuedRule0").append(opcopy);
			      });
			   }			   
			} */
			handleRule("delete","");
		}
	
	//客户经理界面优化
    $(document).ready(function(){
    	 $("#selectData").iCheck({
 	        labelHover : false,
 	        cursor : true,
 	        checkboxClass : 'icheckbox_square-blue',
 	        radioClass : 'iradio_square-blue',
 	        increaseArea : '20%'
 	    }).on('ifChecked', function(event){
 	       // $("#content1").attr("class","");
 	        $("#content2").attr("class","");
 	        $("#content3").attr("class","btn btn-primary term");
 	        
 	    }).on('ifUnchecked', function(event){
 	       // $("#content1").attr("class","hidden");
 	        $("#content2").attr("class","hidden");
 	        $("#content3").attr("class","btn btn-primary term hidden");
 	    });
    	 
    	 $("#selectData2").iCheck({
  	        labelHover : false,
  	        cursor : true,
  	        checkboxClass : 'icheckbox_square-blue',
  	        radioClass : 'iradio_square-blue',
  	        increaseArea : '20%'
  	    }).on('ifChecked', function(event){
  	    	 $("#content4").attr("style","");
  	        $("#content4").attr("code","1");
  	    }).on('ifUnchecked', function(event){
  	       $("#content4").attr("style","display:none;");
  	        $("#content4").attr("code","0");
  	        $("textarea[name='po.frontlineChannelPo.smsWords']").val('');
  	    });
    	
    	//本地弹窗
    	 $("#selectDataChannel").iCheck({
   	        labelHover : false,
   	        cursor : true,
   	        checkboxClass : 'icheckbox_square-blue',
   	        radioClass : 'iradio_square-blue',
   	        increaseArea : '20%'
   	    }).on('ifChecked', function(event){
   	    	 $("#contentC4").attr("style","");
   	        $("#contentC4").attr("code","1");
   	    }).on('ifUnchecked', function(event){
   	       $("#contentC4").attr("style","display:none;");
   	        $("#contentC4").attr("code","0");
   	        $("textarea[name='mvclist[0].smsSendWords']").val('');
   	    });
    	
    	 $("#selectDataChannel2").iCheck({
    	        labelHover : false,
    	        cursor : true,
    	        checkboxClass : 'icheckbox_square-blue',
    	        radioClass : 'iradio_square-blue',
    	        increaseArea : '20%'
    	    }).on('ifChecked', function(event){
    	    	 $("#contentC5").attr("style","");
    	        $("#contentC5").attr("code","1");
    	    }).on('ifUnchecked', function(event){
    	       $("#contentC5").attr("style","display:none;");
    	        $("#contentC5").attr("code","0");
    	        $("textarea[name='mvclist[1].smsSendWords']").val('');
    	    });
    	
    })
	
    
  $(document).ready(function(){
    	/* var n=document.getElementById("cDiv").contentWindow.document.getElementById("cityOrgPath").value; */
    	 hideAndShow("FrontLineData","FrontLineContent","FrontLineContent1");
    	 hideAndShow("WebChatSelectData","WebChatContent","WebChatContent1");
    	 hideAndShow("WebOfficeSelectData","WebOfficeContent","WebOfficeContent1");
    	 hideAndShow("HandOfficeSelectData","HandOfficeContent","HandOfficeContent1");
    	 hideAndShow("WoWindowSelectData","WoWindowContent","WoWindowContent1");
    	 hideAndShow("channelTelePhoneSelectData","channelTelePhoneContent","channelTelePhoneContent1");
    	 hideAndShow("LocalMessageSelectData","LocalMessageContent","LocalMessageContent1");
    	 hideAndShow("PrivateData","PrivateContent","PrivateContent1");
    	 hideAndShow("SocialData","SocialContent","SocialContent1");
    	 hideAndShowOther("supportSendForProduct","sendForProduct");
    	 hideAndShow("ZongBuMsmSelectData","ZongBuMsmContent","ZongBuMsmContent1");
    	 hideAndShowOther("supportSendForProductZB","sendForProductZB");
    	 $("#huashuData").iCheck({
  	        labelHover : false,
  	        cursor : true,
  	        checkboxClass : 'icheckbox_square-blue',
  	        radioClass : 'iradio_square-blue',
  	        increaseArea : '20%'
  	    }).on('ifChecked', function(event){
  	        $("#content4").attr("class","form-control");
  	        
  	    }).on('ifUnchecked', function(event){
  	        $("#content4").attr("class","form-control hidden");
  	    });
    })
	     //获取客户经理界面条件筛选sql
        function chooseCondition(id,numId) {
			var chooseId="#"+id+"Id";
			var chooseSql="#"+id+"Sql";
			var chooseSqlCondition = "#"+ id + "SqlCondition";
			//var codition = $(chooseId).val();
			var codition = $(chooseSqlCondition).val();
		    conditionObj.taskCond(codition,"2","",function(sql, resume,conditions) {
				$(chooseId).val(resume);
				$(chooseSql).val(sql);
				$(chooseSqlCondition).val(conditions);
				//jQuery("#"+numId).html(getUserGroupNumberByChoice($("#userGroupId").val(),$(chooseSql).val()));
				if($("#userGroupId").val() != ""){
				    yonghuqunzhuanyong++;
				    $("#pauseSaveActivity").attr("disabled",true);
			        $("#saveActivityButton").attr("disabled",true);
					getUserGroupNumberByChoiceAsync($("#orgPath").val(),$("#userGroupId").val(),$(chooseSql).val(),function(){
						jQuery("#"+numId).html("渠道条件筛选加载中...");
					},function(val){
						jQuery("#"+numId).html(val);
						yonghuqunzhuanyong--;
						if(yonghuqunzhuanyong==0){
			                $("#pauseSaveActivity").attr("disabled",false);
			                $("#saveActivityButton").attr("disabled",false);
		                }
					});
					if(chooseId == "#FrontLineContent1Id"){
				    	outerUseRefresh();//当选则客户经理渠道时规则列表刷新
				    	refreshRuleNum();//刷新下发规则未划配用户数
				    }
				    if(chooseId == "#PrivateContent1Id"){
				    	outerUseRefreshPop();//当选则客户经理渠道时规则列表刷新
				    }
				    
				}
		     });
		    
        }
        function hideAndShow(first,second,third){
        	 var firstId="#"+first;
        	 var sccondId="#"+second;
        	 var thirdId="#"+third;
        	 $(firstId).iCheck({
      	        labelHover : false,
      	        cursor : true,
      	        checkboxClass : 'icheckbox_square-blue',
      	        radioClass : 'iradio_square-blue',
      	        increaseArea : '20%'
      	    }).on('ifChecked', function(event){
      	       // $("#content1").attr("class","");
      	        $(sccondId).attr("class","");
      	        $(thirdId).attr("class","btn btn-primary term");
      	        
      	    }).on('ifUnchecked', function(event){
      	       // $("#content1").attr("class","hidden");
      	        $(sccondId).attr("class","hidden");
      	        $(thirdId).attr("class","btn btn-primary term hidden");
      	     	
      	     	//点否清空页面条件值
      	     	$(sccondId).children().eq(0).val(null);
      	     	$(sccondId).children().eq(1).val(null);
      	     	$(thirdId).parent().parent().prev().children().find("span").html($("#userGroupNumAll").html());
      	     	if(sccondId == "#FrontLineContent"){
      	     		outerUseRefresh();//当选则客户经理渠道时规则列表刷新
      	     	}
      	    });
        }      
          function hideAndShowOther(first,second){
         	 var firstId="#"+first;
         	 var sccondId="#"+second;
         	 $(firstId).iCheck({
       	        labelHover : false,
       	        cursor : true,
       	        checkboxClass : 'icheckbox_square-blue',
       	        radioClass : 'iradio_square-blue',
       	        increaseArea : '20%'
       	    }).on('ifChecked', function(event){
       	       // $("#content1").attr("class","");
       	        $(sccondId).attr("class","");
       	        
       	    }).on('ifUnchecked', function(event){
       	       // $("#content1").attr("class","hidden");
       	        $(sccondId).attr("class","hidden");     	     	
       	     	$(sccondId).find("select").val("");
       	     	$(sccondId).find("select").find("option[value='']").attr("selected","");
       	     	$(sccondId).find("select").next().val("");
       	    });
         }
         //修改时回显选中的渠道
        $(document).ready(function(){
        
     	   var channelCheck=$("#selectChannelId").val().split(",");
     	   var channel=document.getElementsByName("channel");
     	   for(var i=0;i<channelCheck.length;i++){
     		   for(var j=0;j<channel.length;j++){
     			   if(channelCheck[i]==channel[j].value){
     				   var id="#"+channelCheck[i];
     				   $(id).iCheck('check');
     				   break;
     			   }
     		   }
     	   }
     	
        });
    
        //修改时不能操作渠道
        $(document).ready(function(){
         var state=$("#activityState").val();
         if(state==11){
        	 var channel=$("#selectChannelId").val().trim();
             if(channel.length!=0){
            	 $("input[name='channel']").each(function(e){
            		 $(this).attr("disabled",true);
            		});  	
             }
         }
       
         
        });  
        
      //短信订购产品选择
        function productOnchang(){
     	var i = 0;
     	var productNow;
	  	var orderPro;
    	  	if(i==0){
	    	  	var sel = $("#orderProduct");
	    	  	sel.find("option").remove();
	    	  	sel.append("<option value=''>请选择</option>");
	    	  	var orderProId = $("#orderProductIds").val();
	    	  	if(orderProId != ""){
	    	  		orderPro = $("#orderSelectedNames").val();
		       	 	var orderProIdList = orderProId.split(",");
		       	 	var orderProList = orderPro.split(",");
		       	 	for(var j=0;j<orderProIdList.length;j++){
			       	  	for(var k=0;k<orderProList.length;k++){
			       	  		if(j==k){
				       			sel.append('<option value='+orderProIdList[j]+'>'+orderProList[k]+'</option>');	
			       	  		}
			       	  	}
		       	 	}
	    	  	}
	    	 	
	       	  	i++;
    	  	}else{
    	  		productNow = $("#orderSelectedNames").val();
    	  		if(productNow != orderPro){
	    	  			var sel = $("#orderProduct");
	    	    	  	sel.find("option").remove();
	    	    	  	sel.append("<option value=''>请选择</option>");
	    	    	  	var orderProId = $("#orderProductIds").val();
	    	    	  	if(orderProId != ""){
	    	    	  		var orderProNow = $("#orderSelectedNames").val();
		    	    	 	var orderProIdList = orderProId.split(",");
		    	       	 	var orderProList = orderProNow.split(",");
		    	       	 	for(var j=0;j<orderProIdList.length;j++){
		 		       	  		for(var k=0;k<orderProList.length;k++){
		 		       	  			if(j==k){
		 			       				sel.append('<option value='+orderProIdList[j]+'>'+orderProList[k]+'</option>');	
		 		       	  			}
		 		       	  		}
		 	       	 		}
	    	    	  	}
	    	       	 	orderPro = $("#orderSelectedNames").val();
    	  			}
    	  		}
    	  	}
         
        function proChoose(){
        	var proId = $('#orderProduct').find('option:selected').val();
        	$("input[name='msmChannelPo.orderProductId']").val(proId);
        }
        
         //集团短信订购产品选择    	
        function productOnchangZB(){
        var i = 0;
     	var productNow;
	  	var orderPro;
    	  	if(i==0){
	    	  	var sel = $("#orderProductZB");
	    	  	sel.find("option").remove();
	    	  	sel.append("<option value=''>请选择</option>");
	    	  	var orderProId = $("#orderProductIds").val();
	    	  	if(orderProId != ""){
	    	  		orderPro = $("#orderSelectedNames").val();
		       	 	var orderProIdList = orderProId.split(",");
		       	 	var orderProList = orderPro.split(",");
		       	 	for(var j=0;j<orderProIdList.length;j++){
			       	  	for(var k=0;k<orderProList.length;k++){
			       	  		if(j==k){
				       			sel.append('<option value='+orderProIdList[j]+'>'+orderProList[k]+'</option>');	
			       	  		}
			       	  	}
		       	 	}
	    	  	}
	    	 	
	       	  	i++;
    	  	}else{
    	  		productNow = $("#orderSelectedNames").val();
    	  		if(productNow != orderPro){
	    	  			var sel = $("#orderProduct");
	    	    	  	sel.find("option").remove();
	    	    	  	sel.append("<option value=''>请选择</option>");
	    	    	  	var orderProId = $("#orderProductIds").val();
	    	    	  	if(orderProId != ""){
	    	    	  		var orderProNow = $("#orderSelectedNames").val();
		    	    	 	var orderProIdList = orderProId.split(",");
		    	       	 	var orderProList = orderProNow.split(",");
		    	       	 	for(var j=0;j<orderProIdList.length;j++){
		 		       	  		for(var k=0;k<orderProList.length;k++){
		 		       	  			if(j==k){
		 			       				sel.append('<option value='+orderProIdList[j]+'>'+orderProList[k]+'</option>');	
		 		       	  			}
		 		       	  		}
		 	       	 		}
	    	    	  	}
	    	       	 	orderPro = $("#orderSelectedNames").val();
    	  			}
    	  		}
    	  	}
         
        function proChooseZB(){
        	var proId = $('#orderProductZB').find('option:selected').val();
        	$("input[name='zongBuMsmChannelPo.orderProductId']").val(proId);
        }
        
        
/*          $(document).ready(function(){
          $("#trans").click(function() {
	           	var longUrl = $("#longUrl").val();
			if (longUrl == null || longUrl == "") {
		      alert("请输入长地址");
		      return;
			}
	     var urlLongtoShort="http://api.t.sina.com.cn/short_url/shorten.json?source=3271760578&url_long="+longUrl;
         $("#smsiframe").attr('src',urlLongtoShort);
         var d = document.frames["smsiframe"].document;
         var aa=d.getElementsByTagName('body').innerHTML;
         alert(aa);
	     });
        }); */        
</script>

