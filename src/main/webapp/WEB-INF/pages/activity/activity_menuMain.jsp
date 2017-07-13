<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工单详情</title>
<%@include file="head-js-css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	window.onload =function()
	{
	    if($("#orderMessResult").val()!="" && $("#orderMessResult").val() != null){
	    	$.ligerDialog.warn($("#orderMessResult").val());
	    };
	    if($("#getRealUserAccount").val()!="" && $("#getRealUserAccount").val() != null){
	    	$.ligerDialog.warn($("#getRealUserAccount").val());
	    };
	    if($("#getRealFlowResult").val()!="" && $("#getRealFlowResult").val() != null){
	    	$.ligerDialog.warn($("#getRealFlowResult").val()); 
	    }
	}
</script>
</head>
<body>
	<input type="hidden" id="orderMessResult" value="${bo.menuDetail.orderMessResult}"/>
	<input type="hidden" id="getRealUserAccount" value="${bo.menuDetail.getRealUserAccount}"/>
	<input type="hidden" id="getRealFlowResult" value="${bo.menuDetail.getRealFlowResult}"/>
	<!--  主体内容开始 -->
	<div class="container" style=" margin-top:20px;margin-bottom:20px; width:800px; height:750px;border:1px dotted blue;">
		<!-- <h2 class="activity">营销活动详情<div class="pull-right" style="margin-right:120px;margin-top:15px"><button class="slds-button slds-button--brand " id="return-btn" onclick="historyBack()">返回</button></div></h2> -->
		<!--   三个页面嵌入 开始-->
		<div class="activitySetArea">
			<div id="step-1-basicinfo">
				<table class="activeLayout">
					<colgroup>
						<col width="90px" />
						<col width="*" />
						<col width="*" />
						<col width="*" />
					</colgroup>
					<div class="page-header" style="margin-top:15px">
						<h1 style="color:blue">
							活动信息
						</h1>
					</div>
					<tr>
					
						<th><span class="glyphicon glyphicon-th-large"></span>活动名称：</th>
						<td>${bo.menuDetail.activityName }
							</td>
					</tr>
					<tr>
						<th><span class="glyphicon glyphicon-th-list"></span>成功标准：</th>
						<td colspan="4">${bo.menuDetail.successName }
						</td>
					</tr>
						<th><span class="glyphicon glyphicon-comment"></span>营销话术：</th>
						<td colspan="4"><textarea style="width:550px" id="sendContentWet" class="form-control" rows="8" name="channelWebchatInfo.channelWebchatContent" readonly></textarea></td>
						<td>${bo.menuDetail.huashu }</td>
					</tr>
					</table>
					<table class="activeLayout">
					<colgroup>
						<col width="90px" />
						<col width="*" />
						<col width="*" />
						<col width="*" />
					</colgroup>
					<tr>
					<div class="page-header">
						<h1 style="color:blue">
							用户信息
						</h1>
						</div>
					</tr>
					<tr>
						<th style="float:left"><span class="glyphicon glyphicon-phone"></span>用户号码：</th>
						<td colspan="3">${bo.menuDetail.PHONE_NUMBER}
						</td>

					</tr>
					<tr>
						<th style="float:left"><span class="glyphicon glyphicon-th-large"></span>用户姓名：</th>
						<td style="width:270px">${bo.menuDetail.CUST_NAME}</td>

						<th style="width:95px"><span class="glyphicon glyphicon-user"></span>用户性别：</th>
						<td>${bo.menuDetail.SEX}</td>

					</tr>
					<tr>
						<th style="float:left"><span class="glyphicon glyphicon-dashboard"></span>剩余流量：</th>
						<td style="width:270px">${bo.menuDetail.resultremain }</td>
								
						<th style="float:left"><span class="glyphicon glyphicon-th-large"></span>套餐：</th>
						<td>${bo.menuDetail.PACKAGE_NAME}</td>
					</tr>

					<tr>
						<th style="float:left"><span class="glyphicon glyphicon-th-large"></span>合约名称：</th>
						<td style="width:270px">${bo.menuDetail.AGREEMENT_NAME}</td>
						
						<th style="width:95px"><span class="glyphicon glyphicon-th-large"></span>用户类型：</th>
						<td>${bo.menuDetail.SERVICE_TYPE}</td>
					</tr>
					<tr>
						<th style="float:left"><span class="glyphicon glyphicon-th-large"></span>ARPU：</th>
						<td style="width:270px">${bo.menuDetail.ARPU}</td>

						<th style="width:95px"><span class="glyphicon glyphicon-usd"></span>实时余额：</th>
						<td>${bo.menuDetail.resultbalance }</td>
					</tr>

					

				</table>



				<!--   //第二个表格结束 -->


				<!--3 配置策略  -->

				<%-- <div id="step-3-channel">
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
											<li><a href="javascript:void(0)"> <strong><span
														id="userGroupNumAll">--</span> <sub>户</sub></strong> <em>目标用户总数</em>
											</a></li>
											<li><a href="javascript:void(0)"> <strong><span
														id="userGroupNum11">--</span> <sub>户</sub></strong> <em>微信</em>
											</a></li>

											<li><a href="javascript:void(0)"> <strong><span
														id="userGroupNum2">--</span> <sub>户</sub></strong> <em>网厅</em>
											</a></li>
											<li><a href="javascript:void(0)"> <strong><span
														id="userGroupNum1">--</span> <sub>户</sub></strong> <em>手厅</em>
											</a></li>

										</ol>

										<div class="ChannelOut_activity" id="channelShow5"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="5" id="5" /> <i class="fa fa-user-o"
													aria-hidden="true"></i> 客户经理
											</h5>
											<div class="AreaIn" id="InNo1">

												<table class="managerTable" id="selectedRule">
													<colgroup>
														<col width="25%"/>
                                          <col width="20%"/>
                                          <col width="55%"/>
														<col width="10%" />
														<col width="40%" />
														<col width="50%" />
													</colgroup>
													<tr>
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum5">--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据：</td>
														<td>${bo.po.frontlineChannelPo.filterConditionSql != null?'是':'否'}
														</td>
														<td id="FrontLineContent"
															<c:if test="${bo.po.frontlineChannelPo.filterConditionSql == null}">class="ar hidden"</c:if>>
															筛选数据条件 ${bo.po.frontlineChannelPo.filterCondition } <input
															type="hidden" id="FrontLineContent1Sql"
															name="filterConditionSql1"
															value="${bo.po.frontlineChannelPo.filterConditionSql}">


														</td>
													</tr>


													<tr>
														<td class="ar" style="vertical-align:middle;">营销话术：</td>
														<td colspan="3">
															${bo.po.frontlineChannelPo.marketingWords}</td>
													</tr>
													<tr>
														<td class="ar">发送短信：</td>
														<td colspan="2">
                                              ${ bo.po.frontlineChannelPo.isSendSMS==1?'是':'否'}
                                          </td>
														<td colspan="4" id="content4"
															<c:if test="${ bo.po.frontlineChannelPo.isSendSMS!=1}">style="display:none;"</c:if>>
															${bo.po.frontlineChannelPo.smsWords}</td>

													</tr>
													<input type="hidden" id="newrule"
														name='po.frontlineChannelPo.orderIssuedRule' value="">

													<c:forEach items="${bo.po.frontLineWorkOrderRulePoList }"
														var="frontLineWorkOrderRule" varStatus="status">
														<c:if test="${status.index == 0}">
															<tr>
																<td class="ar">工单下发规则：</td>
																<td colspan="2"><c:forEach var="classification"
																		items="${bo.classification}">
																		<c:set var="isDoing1" value="0" />
																		<c:if
																			test="${classification.classificationId ==frontLineWorkOrderRule.ruleTypeClassId}">
																			<c:set var="isDoing1" value="1" /> 
					                              ${classification.classificationName}
                		                          	</c:if>
																	</c:forEach> - <c:forEach var="activityWorkOrderRuleInfo"
																		items="${bo.getRuleType}">
																		<c:set var="isDoing1" value="0" />
																		<c:if
																			test="${activityWorkOrderRuleInfo.ruleTypeId ==frontLineWorkOrderRule.ruleTypeId}">
																			<c:set var="isDoing1" value="1" /> 
					                              ${activityWorkOrderRuleInfo.ruleTypeName}
                		                          	</c:if>

																	</c:forEach></td>
																<td colspan="2">
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${frontLineWorkOrderRule.ruleOrgName}">${frontLineWorkOrderRule.ruleOrgName}
																	</div>
																</td>

															</tr>
														</c:if>
														<c:if test="${status.index!=0}">
															<tr>
																<td class="ar">工单下发规则：</td>
																<td colspan="2"><c:forEach var="classification"
																		items="${bo.classification}">
																		<c:set var="isDoing1" value="0" />
																		<c:if
																			test="${classification.classificationId ==frontLineWorkOrderRule.ruleTypeClassId}">
																			<c:set var="isDoing1" value="1" /> 
					                              ${classification.classificationName}
                		                          	</c:if>
																	</c:forEach>- <c:forEach var="getRuleType"
																		items="${bo.getRuleType}">
																		<c:set var="isDoing" value="0" />
																		<c:if
																			test="${getRuleType.ruleTypeId ==frontLineWorkOrderRule.ruleTypeId}">
																			<c:set var="isDoing" value="1" /> 
					                             
                		                          	${getRuleType.ruleTypeName}</c:if>

																	</c:forEach></td>
																<td colspan="2">
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${frontLineWorkOrderRule.ruleOrgName}">${frontLineWorkOrderRule.ruleOrgName}
																	</div>

																</td>
															</tr>
														</c:if>
													</c:forEach>

												</table>

											</div>
										</div>
										<div class="ChannelOut_activity" id="channelShow7"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="7" id="7" /> <i class="fa fa-envelope-open-o"
													aria-hidden="true"></i> 本地短信
											</h5>
											<div class="AreaIn" id="InNo2">

												<table class="managerTable">
													<colgroup>
														<col width="20%" />
														<col width="20%" />
														<col width="60%" />

													</colgroup>
													<tr>
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum7">--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据 ：</td>
														<td>${bo.msmChannelPo.filterConditionSql != null?'是':'否'}
														</td>
														<c:if test="${bo.msmChannelPo.filterConditionSql == null}">
															<td></td>
														</c:if>
														<td id="LocalMessageContent"
															<c:if test="${bo.msmChannelPo.filterConditionSql ==null}">class="ar hidden"</c:if>>
															筛选数据条件： ${bo.msmChannelPo.filterCondition } <input
															type="hidden" name="filterConditionSql2"
															value="${bo.msmChannelPo.filterConditionSql}">
														</td>
													</tr>
													<tr>
														<td class="ar">订购产品选择 ：</td>
														<td colspan="4">${bo.msmChannelPo.orderProductName}</td>

													</tr>
													<tr>
														<td class="ar">营销类型 ：</td>
														<td colspan="4">${bo.msmChannelPo.marketingName}</td>

													</tr>
													<tr>
														<td class="ar" style="vertical-align:middle;">发送内容：</td>
														<td colspan="3">${bo.msmChannelPo.smsContent }</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="ChannelOut_activity" id="channelShow11"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="11" id="11" /> <i class="fa fa-commenting-o"
													aria-hidden="true"></i> 微信
											</h5>
											<div class="AreaIn" id="InNo3">

												<table class="managerTable">
													<colgroup>
														<col width="20%" />
														<col width="20%" />
														<col width="60%" />
													</colgroup>
													<tr>
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum11">--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据：</td>
														<td>${bo.channelWebchatInfo.filterConditionSql != null?'是':'否'}
														</td>
														<td id="WebChatContent"
															<c:if test="${bo.channelWebchatInfo.filterConditionSql == null}">class="ar hidden"</c:if>>

															筛选数据条件： <input type="hidden" id="WebChatContent1Sql"
															name="filterConditionSql3"
															value="${bo.channelWebchatInfo.filterConditionSql}">

															${bo.channelWebchatInfo.filterCondition }



														</td>
													</tr>

													<tr>
														<td class="ar">公众号信息：</td>
														<td colspan="4"><c:forEach
																var="channelPublicWebChatPo" items="${bo.webChatPublic}">
																<c:if
																	test="${channelPublicWebChatPo.publicId==bo.webChatMidActivityPo.publicId }">
					                          
                			                         ${channelPublicWebChatPo.publicName}</c:if>

															</c:forEach></td>

													</tr>

													<tr>
														<td class="ar">标题：</td>
														<td colspan="2">${bo.channelWebchatInfo.channelWebchatTitle }</td>
													</tr>
													<tr>
														<td class="ar">网址：</td>
														<td colspan="2">${bo.channelWebchatInfo.channelWebchatUrl }</td>
													</tr>
													<tr>
														<td class="ar" style="vertical-align:middle;">话术：</td>
														<td colspan="2">${bo.channelWebchatInfo.channelWebchatContent}</td>
													</tr>
												</table>

											</div>
										</div>
										<div class="ChannelOut_activity" id="channelShow8"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="8" id="8" /> <i class="fa fa-newspaper-o"
													aria-hidden="true"></i> 本地弹窗
											</h5>
											<div class="AreaIn">
												<table class="managerTable">
													<colgroup>
													<colgroup>
														<col width="20%" />
														<col width="20%" />
														<col width="35%" />
														<col width="15%" />
														<col width="10%" />
													</colgroup>
													<tr>
														<td class="al" colspan="5">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum8">--</span></td>
													</tr>
													</colgroup>
													<tr>
														<c:if
															test="${bo.channelBusiness.filterConditionSql == null}">
															<td>筛选数据：${bo.channelBusiness.filterConditionSql != null?'是':'否'}</td>
														</c:if>
														<c:if
															test="${bo.channelBusiness.filterConditionSql != null}">
															<td class="ar">筛选数据：</td>
															<td>${bo.channelBusiness.filterConditionSql != null?'是':'否'}
															</td>
															<td colspan="3" id="PrivateContent">筛选数据条件 ： <!--  <input type="text" id="PrivateContent1Id" class="form-control manInput" placeholder="" > -->
																<input type="hidden" id="PrivateContent1Sql"
																name="filterConditionSql4"
																value="${bo.channelBusiness.filterConditionSql}">
																&nbsp;&nbsp;${bo.channelBusiness.filterCondition }
															</td>
														</c:if>


													</tr>
												</table>
											</div>

											<div class="AreaIn" id="InNo4"
												style="margin-top:-16px;display: block;left:0;top:0;margin: 0px 100px 0 0px; ">

												<div class="windowDiv">
													<ul class="nav nav-tabs " role="tablist" id="myTab">
														<li role="presentation" class="active"><a
															href="#home" role="tab" data-toggle="tab">自有营业厅</a></li>
														<li role="presentation"><a href="#home1" role="tab"
															data-toggle="tab">社会营业厅</a></li>
													</ul>
													<div class="tab-content">
														<div role="tabpanel" class="tab-pane active" id="home">
															<input type="hidden" name="mvclist[0].channelName"
																value="自有营业厅">
															<table class="managerTable">
																<colgroup>
																	<col width="23%" />
																	<col width="25%" />
																	<col width="37%" />
																	<col width="15%" />
																</colgroup>

																<tr>
																<tr>
																	<td class="ar">渠道生效：</td>
																	<td><c:choose>
																			<c:when
																				test="${bo.channelBusiness.channelName1=='自有营业厅'  }">
																				<input type="checkbox" name="activ" class="icheckS"
																					value="" checked />点选生效
                                                      </c:when>
																			<c:otherwise>
																				<input type="checkbox" name="activ" class="icheckS"
																					value="" />点选生效
                                                      </c:otherwise>
																		</c:choose></td>

																</tr>
																<tr>
																	<td class="ar">日弹出限制：</td>
																	<td colspan="3">${bo.channelBusiness.numberLimit1 }&nbsp;&nbsp;&nbsp;次</td>


																</tr>
																<!--    <tr>
                                                      <td  class="ar">
                                                         
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>-->
																<tr>
																	<td class="ar">目标：</td>
																	<td colspan="2">${bo.channelBusiness.target1 }</td>
																</tr>
																<tr>
																	<td class="ar" style="vertical-align:middle;">话术：
																	</td>
																	<td id="escapeXml" colspan="2">${bo.channelBusiness.content1}</td>
																	<td></td>
																</tr>
																<tr>
																	<td class="ar">发送短信：</td>
																	 <td>
			                                              ${bo.channelBusiness.isSendSms1==1?'是':'否'}
			                                          </td>
																	<td colspan="4" id="contentC4"
																		<c:if test="${bo.channelBusiness.isSendSms1!=1}">style="display:none;"</c:if>>
																		${bo.channelBusiness.smsSendWords1}</td>

																</tr>
															</table>
														</div>
														<div role="tabpanel" class="tab-pane" id="home1">
															<input type="hidden" name="mvclist[1].channelName"
																value="社会营业厅">
															<table class="managerTable">
																<colgroup>
																	<col width="23%" />
																	<col width="25%" />
																	<col width="37%" />
																	<col width="15%" />
																</colgroup>
																<!--               <tr>
                                          <td class="ar">筛选数据</td>
                                          <td>
                                              <ul>
                                                  <li class="li3"><input type="radio" id="SocialData" name="socail" class="icheckS" value="1" />是</li>
                                                  <li class="li2"><input type="radio" name="socail" class="icheckS" value="0" checked />否</li>
                                              </ul>
                                          </td>
                                          <td colspan="2" id="SocialContent" class="ar hidden">
                                              筛选数据条件 
                                              <input type="text" id="SocialContent1Id" class="form-control manInput" placeholder="" >
                                              <input type="hidden" id="SocialContent1Sql" name="mvclist[1].filterConditionSql" value="">
                                              <button type="button" id="SocialContent1" class="btn btn-primary term hidden" onclick='chooseCondition("SocialContent1","userGroupChannelNum9")'>条件</button>
                                          </td>
                                        
                                      </tr> -->
																<tr>
																<tr>
																	<td class="ar">渠道生效：</td>
																	<td><c:choose>
																			<c:when
																				test="${bo.channelBusiness.channelName2=='社会营业厅'  }">
																				<input type="checkbox" name="activ" class="icheckS"
																					value="" checked />点选生效
                                                      </c:when>
																			<c:otherwise>
																				<input type="checkbox" name="activ" class="icheckS"
																					value="" />点选生效
                                                      </c:otherwise>
																		</c:choose></td>

																</tr>
																<tr>
																	<td class="ar">日弹出限制：</td>
																	<td colspan="3">${bo.channelBusiness.numberLimit2  }&nbsp;&nbsp;&nbsp;次</td>


																</tr>
																<!--     <tr>
                                                      <td  class="ar">
                                                         
                                                      </td>
                                                      <td colspan="2"><input type="number" class="form-control" placeholder="" min="1" max="100" ></td>
                                                  </tr>-->
																<tr>
																	<td class="ar">目标：</td>
																	<td colspan="2">${bo.channelBusiness.target2 }</td>
																</tr>
																<tr>
																	<td class="ar" style="vertical-align:middle;">话术：
																	</td>
																	<td colspan="2" id="escapeXml2">${bo.channelBusiness.content2}</td>
																	<td></td>
																</tr>
																<tr>
																	<td class="ar">发送短信：</td>
																	 <td>
			                                              ${bo.channelBusiness.isSendSms2==1?'是':'否'}
			                                          </td>
																	<td colspan="4" id="contentC5"
																		<c:if test="${bo.channelBusiness.isSendSms2!=1}">style="display:none;"</c:if>>
																		${bo.channelBusiness.smsSendWords2}</td>

																</tr>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="ChannelOut_activity" id="channelShow2"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="2" id="2" /> <i class="fa fa-television"
													aria-hidden="true"></i> 网厅
											</h5>
											<div class="AreaIn" id="InNo5">

												<table class="managerTable">
													<colgroup>
														<col width="20%" />
														<col width="20%" />
														<col width="60%" />
													</colgroup>
													<tr>
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum2">--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据：</td>
														<td>${bo.wangting.filterConditionSql != null?'是':'否'}
														</td>
														<td id="WebOfficeContent"
															<c:if test="${bo.wangting.filterConditionSql == null}">class="hidden"</c:if>>
															筛选数据条件 ： ${bo.wangting.filterCondition } <input
															type="hidden" name="filterConditionSql5"
															value="${bo.wangting.filterConditionSql}">
														</td>
													</tr>
													<tr>
														<td class="ar" style="vertical-align:middle;">话术：</td>
														<td colspan="2">${bo.wangting.content }</td>

													</tr>
													<tr>
														<td class="ar">标题：</td>
														<td colspan="2">${bo.wangting.title }</td>
													</tr>
													<tr>
														<td class="ar">网址：</td>
														<td colspan="2">${bo.wangting.url}</td>
													</tr>
												</table>

											</div>
										</div>
										<div class="ChannelOut_activity" id="channelShow1"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="1" id="1" /> <i class="fa fa-tablet"
													aria-hidden="true"></i> 手厅
											</h5>
											<div class="AreaIn" id="InNo6">

												<table class="managerTable">
													<colgroup>
														<col width="20%" />
														<col width="20%" />
														<col width="60%" />
													</colgroup>
													<tr>
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum1">--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据：</td>
														<td>${bo.channelHandOfficePo.filterConditionSql != null?'是':'否'}
														</td>
														<td id="HandOfficeContent"
															<c:if test="${bo.channelHandOfficePo.filterConditionSql == null}">class="hidden"</c:if>>
															筛选数据条件 ： ${bo.channelHandOfficePo.filterCondition } <input
															type="hidden" id="HandOfficeContent1Sql"
															name="filterConditionSql6"
															value="${bo.channelHandOfficePo.filterConditionSql}">

														</td>
													</tr>
													<tr>
														<td class="ar" style="vertical-align:middle;">话术：</td>
														<td colspan="2">${bo.channelHandOfficePo.content }</td>
													</tr>
													<tr>
														<td class="ar">标题：</td>
														<td colspan="2">${bo.channelHandOfficePo.title }</td>
													</tr>
													<tr>
														<td class="ar">网址：</td>
														<td colspan="2">${bo.channelHandOfficePo.url }</td>
													</tr>

												</table>

											</div>
										</div>
										<div class="ChannelOut_activity" id="channelShow9"
											style="display:none">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="9" id="9" /> <i class="fa fa-sticky-note-o"
													aria-hidden="true"></i> 沃视窗
											</h5>
											<div class="AreaIn" id="InNo7">

												<table class="managerTable">
													<colgroup>
														<col width="20%" />
														<col width="25%" />
														<col width="55%" />
													</colgroup>
													<tr>
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum9">--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据：</td>
														<td>${bo.channelWoWindowPo.filterConditionSql != null?'是':'否'}
														</td>
														<td id="WoWindowContent"
															<c:if test="${bo.channelWoWindowPo.filterConditionSql == null}">class="hidden"</c:if>>
															筛选数据条件 ： ${ bo.channelWoWindowPo.filterCondition} <input
															type="hidden" name="filterConditionSql7"
															value="${bo.channelWoWindowPo.filterConditionSql}">
														</td>
													</tr>
													<tr>
														<td class="ar" style="vertical-align:middle;">话术：</td>
														<td>${bo.channelWoWindowPo.huashu }</td>
													</tr>
													<tr>
														<td class="ar">标题：</td>
														<td>${bo.channelWoWindowPo.title }</td>
													</tr>
													<tr>
														<td class="ar">网址：</td>
														<td colspan="2">${bo.channelWoWindowPo.url }</td>
													</tr>
													<tr>
														<td class="ar">图片网址：</td>
														<td colspan="2">${bo.channelWoWindowPo.imgUrl }</td>
													</tr>
													<tr>
														<td class="ar"><span>*</span>图片尺寸：</td>
														<td colspan="2"><c:choose>
																<c:when
																	test="${bo.channelWoWindowPo.imgSize=='600*360' }">
                                                  600*360
                                              </c:when>
																<c:when
																	test="${bo.channelWoWindowPo.imgSize=='640*90' }">
                                               
                                                  640*90" 
							                   
                                              </c:when>
																<c:when
																	test="${bo.channelWoWindowPo.imgSize=='640*268' }">
                                                  640*268
							                     
                                              </c:when>
																<c:when
																	test="${bo.channelWoWindowPo.imgSize=='620*420' }">                                                  
							                      620*420
                                              </c:when>
																<c:otherwise>
                                                  无                                            
                                              </c:otherwise>
															</c:choose></td>
													</tr>
												</table>

											</div>
										</div>
										<div class="ChannelOut_activity">
											<h5>
												<input type="checkbox" name="channel" class="icheckS"
													value="12" id="12" ischannel="12" /> <i
													class="fa fa-phone fa-1x nbs" aria-hidden="true"></i> 电话渠道
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
														<col width="20%" />
														<col width="20%" />
														<col width="30%" />
														<col width="30%" />
													</colgroup>

													<!--<![endif]-->
													<tr width="130">
														<td class="al" colspan="4">当前目标用户数：<span
															class="grayRed" style="font-weight: 700"
															id="userGroupChannelNum12" numtd>--</span></td>
													</tr>
													<tr>
														<td class="ar">筛选数据</td>
														<td>
															  <ul>
                                                  <li class="li3"><input type="radio" id="channelTelePhoneSelectData" name="channelTelePhoneRadio" class="icheckS" value="1" ischannel="12" <c:if test="${bo.channelTelePhone.filterConditionSql != null}">checked</c:if>/>是</li>
                                                  <li class="li2 showFrontline"><input type="radio" name="channelTelePhoneRadio" class="icheckS" value="0" ischannel="12" <c:if test="${bo.channelTelePhone.filterConditionSql == null}">checked</c:if> />否</li>
                                              </ul>

															${bo.channelTelePhone.filterConditionSql != null?'是':'否'}

														</td>
														<td id="channelTelePhoneContent" colspan="2"
															<c:if test="${bo.channelTelePhone.filterConditionSql == null}">class="hidden"</c:if>>
															筛选数据条件 ： ${ bo.channelTelePhone.filterCondition} <input
															type="hidden" name="filterConditionSql12"
															value="${bo.channelTelePhone.filterConditionSql}">
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
													<tr>
														<td class="ar" style="vertical-align:middle;"><span>*</span>话术
														</td>
														<td colspan="2">${bo.channelTelePhone.telephoneHuashuContent }</td>

													</tr>

													<tr>
														<td class="ar">选择渠道</td>

														<td colspan="3"><c:forEach
																items="${bo.channelTelePhone.orgCityNameList}" var="ual">
                   								&nbsp;&nbsp;${ual}</br>
															</c:forEach>
														<td>
													</tr>

													<input type="hidden" id="orgCityIds"
														name="channelTelePhone.orgCityIds"
														value="${bo.channelTelePhone.orgCityIds }" />
													<input type="hidden" id="companyId"
														name="channelTelePhone.companyId"
														value="${bo.channelTelePhone.companyId }" />
												</table>
												<table></table>



											</div>
										</div>
									</div>
									</div>
								</td>
							</tr>
						</table>
					</div>

					<button id="advancedActivityBtn" type="button"
						class="btn btn-primary fr" style="margin-top:10px;"
						data-toggle="modal" data-target="">高级模式</button>
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
								<tr>
									<th>活动优先级：</th>
									<td colspan="2">
										${bo.activityBasicInfo.urgencyLevel==1?'高':bo.activityBasicInfo.urgencyLevel==2?'中':'低' }
									</td>
								</tr>
								<tr>
									<th>关联活动：</th>
									<td colspan="2"><c:forEach
											items="${bo.underActivityList }" var="ual">

											<c:if
												test="${ual.activityDailyId==bo.activityBasicInfo.parentActivity}">
                     ${ual.activityDailyName }
                    </c:if>

										</c:forEach></td>
								</tr>
								<tr>
									<th>所属政策：</th>
									<td colspan="2"><c:forEach items="${bo.policyList }"
											var="pol">
											<c:if test="${pol.policyId==bo.activityBasicInfo.policyId}">${pol.policyName}</c:if>
										</c:forEach></td>
								</tr>
							</table>
							<h3 class="headList">工单规则扩展配置</h3>
							<table class="activeLayout">
								<colgroup>
									<col width="125px" />
									<col width="30%" />
									<col width="*" />
									<col width="*" />
								</colgroup>
								<tr id="orderIsValid" class="hide">
									<th>工单有效期：</th>
									<c:if test="${bo.activityBasicInfo.activityCycle==1}">
										<td colspan="2">${bo.activityBasicInfo.orderCycle }&nbsp;&nbsp;月
										</td>
									</c:if>
									<c:if test="${bo.activityBasicInfo.activityCycle!=1}">
										<td colspan="2">${bo.activityBasicInfo.orderCycle }&nbsp;&nbsp;日
										</td>
									</c:if>
								</tr>
								<c:if test="${bo.activityBasicInfo.activityCycle!=3}">
									<tr>
										<th>工单更新规则：</th>
										<td colspan="2">
											${bo.activityBasicInfo.orderUpdateRule==1?'追加':'覆盖'}</td>
									</tr>
								</c:if>
								<tr>
									<th>预留工单百分比：</th>
									<td colspan="2">${bo.activityBasicInfo.obligateOrder}%</td>
								</tr>
								<tr>
									<th>参照活动结束时间：</th>
									<c:if test="${bo.activityBasicInfo.orderIsConsultEndDate==1}">
										<td colspan="2">是</td>
									</c:if>
									<c:if
										test="${bo.activityBasicInfo.orderIsConsultEndDate==0||bo.activityBasicInfo.orderIsConsultEndDate==null}">
										<td colspan="2">否</td>
									</c:if>
								</tr>
							</table>

							<h3 class="headList">客户经理扩展配置</h3>
							<table class="activeLayout">
								<colgroup>
									<col width="22%" />
									<col width="25%" />
									<col width="25%" />
									<col width="28%" />
								</colgroup>
								<tr>
									<!-- <th  class="whiteNormal">客户经理不同用户显示不同推荐信息说明：</th> -->
									<td class="whiteNormal">客户经理不同用户显示不同推荐信息说明：${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'否':'是'}</td>
									<td >
                ${bo.po.frontlineChannelPo.channelSpecialFilterList==null||bo.po.frontlineChannelPo.channelSpecialFilterList.size()==0?'否':'是'}
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
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName}">${bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].filterName}
														</div> <input type="hidden" rulename
														name="po.frontlineChannelPo.channelSpecialFilterList[0].filterName"
														class="form-control tableInput" placeholder=""
														value="规则名称">
													</td>
													<input type="hidden" id="" ord
														name="po.frontlineChannelPo.channelSpecialFilterList[0].ord"
														value="0">
													<td>以下筛选条件剩余用户数</td>
													<td id="userGroupStrategyNum0" numtd>--</td>
													<td>
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords}">${bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].marketingWords}
														</div>

													</td>
													<td>
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate}">${bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate==null?'':bo.po.frontlineChannelPo.channelSpecialFilterList[0].msmTemplate}
														</div>

													</td>
												</tr>

												<c:if
													test="${not empty bo.po.frontlineChannelPo.channelSpecialFilterList}">
													<c:forEach var="csfPo"
														items="${bo.po.frontlineChannelPo.channelSpecialFilterList}"
														varStatus="status">
														<c:if test="${csfPo.ord != '0'}">
															<tr>
																<td>${csfPo.ord }</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.filterName}">${csfPo.filterName}
																	</div>
																</td>
																<input type="hidden" id="" ord
																	name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].ord"
																	value="${csfPo.ord }">
																<td>${csfPo.filterCondition }<input type="hidden"
																	id="" sql
																	name="po.frontlineChannelPo.channelSpecialFilterList[${status.index}].filterConditionSql"
																	value="${csfPo.filterConditionSql }">
																</td>
																<td id="userGroupStrategyNum${status.index}" numtd>--</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.marketingWords }">${csfPo.marketingWords }
																	</div>
																</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.msmTemplate }">${csfPo.msmTemplate }
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

							<h3 class="headList">弹窗渠道扩展配置</h3>
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
									<td>
                ${bo.popSpecialFilterList==null||bo.popSpecialFilterList.size()==0?'否':'是'}
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
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.popSpecialFilterList[0].filterName==null?'':bo.popSpecialFilterList[0].filterName}">${bo.popSpecialFilterList[0].filterName==null?'':bo.popSpecialFilterList[0].filterName}
														</div> <input type="hidden" rulename
														name="popSpecialFilterList[0].filterName"
														class="form-control tableInput" placeholder=""
														value="规则名称">
													</td>
													<input type="hidden" id="" ord
														name="popSpecialFilterList[0].ord" value="0">
													<td>以下筛选条件剩余用户数</td>
													<td id="userGroupPopNum0" numtd>--</td>
													<td>
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.popSpecialFilterList[0].marketingWords==null?'':bo.popSpecialFilterList[0].marketingWords}">${bo.popSpecialFilterList[0].marketingWords==null?'':bo.popSpecialFilterList[0].marketingWords}
														</div>

													</td>
													<td>
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.popSpecialFilterList[0].msmTemplate==null?'':bo.popSpecialFilterList[0].msmTemplate}">${bo.popSpecialFilterList[0].msmTemplate==null?'':bo.popSpecialFilterList[0].msmTemplate}
														</div>

													</td>
												</tr>

												<c:if test="${not empty bo.popSpecialFilterList}">
													<c:forEach var="csfPo" items="${bo.popSpecialFilterList}"
														varStatus="status">
														<c:if test="${csfPo.ord != '0'}">
															<tr>
																<td>${csfPo.ord }</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.filterName}">${csfPo.filterName}
																	</div>
																</td>
																<input type="hidden" id="" ord
																	name="popSpecialFilterList[${status.index}].ord"
																	value="${csfPo.ord }">
																<td>${csfPo.filterCondition }<input type="hidden"
																	id="" sql
																	name="popSpecialFilterList[${status.index}].filterConditionSql"
																	value="${csfPo.filterConditionSql }">
																</td>
																<td id="userGroupPopNum${status.index}" numtd>--</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.marketingWords}">${csfPo.marketingWords}
																	</div>
																</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.msmTemplate }">${csfPo.msmTemplate }
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

							<h3 class="headList">电话渠道扩展配置</h3>
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
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.channelTelePhone.telchannelSpecialFilterList[0].filterName==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].filterName}">${bo.channelTelePhone.telchannelSpecialFilterList[0].filterName==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].filterName}
														</div> <input type="hidden" rulename
														name="channelTelePhone.telchannelSpecialFilterList[0].filterName"
														class="form-control tableInput" placeholder=""
														value="规则名称">
													</td>
													<input type="hidden" id="" ord
														name="channelTelePhone.telchannelSpecialFilterList[0].ord"
														value="0">
													<td>以下筛选条件剩余用户数</td>
													<td id="userGroupTeleNum0" numtd>--</td>
													<td>
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords}">${bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].marketingWords}
														</div>

													</td>
													<td>
														<div class="l-grid-row-cell-inner"
															style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
															title="${bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate}">${bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate==null?'':bo.channelTelePhone.telchannelSpecialFilterList[0].msmTemplate}
														</div>

													</td>
												</tr>

												<c:if
													test="${not empty bo.channelTelePhone.telchannelSpecialFilterList}">
													<c:forEach var="csfPo"
														items="${bo.channelTelePhone.telchannelSpecialFilterList}"
														varStatus="status">
														<c:if test="${csfPo.ord != '0'}">
															<tr>
																<td>${csfPo.ord }</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.filterName}">${csfPo.filterName}
																	</div>
																</td>
																<input type="hidden" id="" ord
																	name="channelTelePhone.telchannelSpecialFilterList[${status.index}].ord"
																	value="${csfPo.ord }">
																<td>${csfPo.filterCondition }<input type="hidden"
																	id="" sql
																	name="channelTelePhone.telchannelSpecialFilterList[${status.index}].filterConditionSql"
																	value="${csfPo.filterConditionSql }">
																</td>
																<td id="userGroupTeleNum${status.index}" numtd>--</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.marketingWords}">${csfPo.marketingWords}
																	</div>
																</td>
																<td>
																	<div class="l-grid-row-cell-inner"
																		style="max-height:20px; width:250px; text-align:left;
                                                    display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"
																		title="${csfPo.msmTemplate }">${csfPo.msmTemplate }
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

							<h3 class="headList">渠道扩展配置</h3>
							<table class="activeLayout">
								<colgroup>
									<col width="125px" />
									<col width="30%" />
									<col width="*" />
									<col width="*" />
								</colgroup>
								<tr>
									<th>接触频次定义：</th>
									<td>客户经理：</td>
									<td colspan="2">
										${bo.po.frontlineChannelPo.isUniSet==0?'自定义':'使用统一设置' }</td>

								</tr>
								<c:if test="${bo.po.frontlineChannelPo.isUniSet==0}">
									<tr id="advanceActivity_frontlineChannel">
										<th>接触频次设置：</th>
										<td>
											近&nbsp;&nbsp;&nbsp;${bo.po.frontlineChannelPo.touchLimitDay==null?bo.activityChannelRule.touchLimitDay:bo.po.frontlineChannelPo.touchLimitDay }&nbsp;&nbsp;天一次
											<span data-toggle="tooltip" data-placement="right"
											title="接触频次：出工单时会判断接触记录表中近多少天是否与用户接触过。"> </span>
										</td>


									</tr>
								</c:if>


								<tr>
									<td></td>
									<td>短信：</td>
									<td colspan="2">
										${bo.msmChannelPo.isUniSet==0?'自定义':'使用统一设置'}</td>
								</tr>

								<tr
									<c:if test="${bo.msmChannelPo.isUniSet!=0}">style="display:none"</c:if>
									id="advanceActivity_message">
									<th></th>
									<td colspan="5">
										<table class="activeLayout" style="margin-left:20px">
											<colgroup>
												<col width="22%" />
												<col width="17%" />
												<col width="22%" />
												<col width="17%" />
												<col width="22%" />
											</colgroup>
											<tr
												<c:if test="${bo.msmChannelPo.messageSendTime==''}"> style="display:none;"</c:if>>
												<th>短信时段设置：</th>
												<input type="hidden" id="messageSendTimeDetail"
													value="${bo.msmChannelPo.messageSendTime }" />
												<td colspan="4" id="mstDetail" align="left"></td>
												<td   <c:if test="${bo.msmChannelPo.messageSendTime!='1'&& bo.msmChannelPo.messageSendTime!='1,2'}"> style="display:none;"</c:if>  colspan="2" >
            <input type="hidden" name = "msmChannelPo.messageSendTime" value="${bo.msmChannelPo.messageSendTime==null?bo.activityChannelRule.messageSendTime:bo.msmChannelPo.messageSendTime }"/>上午（9：00-12：00）</td>
            <td <c:if test="${bo.msmChannelPo.messageSendTime!='2'&& bo.msmChannelPo.messageSendTime!='1,2'}"> style="display:none;"</c:if>style="padding-left: 90px;" colspan="2">下午（14：30-18：00）</td>
											</tr>
											<tr>
												<th>按月刷新发送设置：</th>
												<td>开始日期：</td>
												<td>
													&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.sendStartTime==null?bo.activityChannelRule.startDate:bo.msmChannelPo.sendStartTime }日</td>
												<td class="tdRight">结束日期：</td>
												<td>
													&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.sendEndTime==null?bo.activityChannelRule.endDate:bo.msmChannelPo.sendEndTime }日</td>
											</tr>
											<tr>
												<th></th>
												<td>本周期内发送次数：</td>
												<td>
													&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.cycleTimes==null?bo.activityChannelRule.cycleSendTimes:bo.msmChannelPo.cycleTimes }次</td>
												<td class="tdRight">间隔：&nbsp;&nbsp;&nbsp;</td>
												<td>&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.intervalHours==null?bo.activityChannelRule.intervalDay:bo.msmChannelPo.intervalHours }日</td>
											</tr>
											<tr>
												<th>按日刷新发送设置：</th>
												<td colspan="4">发送说明：出工单当天发</td>
											</tr>
											<tr>
												<th>发送频次设置：</th>
												<td colspan="4">
													近&nbsp;&nbsp;&nbsp;${bo.msmChannelPo.touchLimitDay==null?bo.activityChannelRule.sendFrequency:bo.msmChannelPo.touchLimitDay}&nbsp;&nbsp;天一次
													</span>
												</td>
											</tr>
										</table>
									</td>


								</tr>

								<!--  <tr>
            <th class="whiteNormal">受限用户：</th>
            <td>查看限制用户数</td>
            <td colspan="3">
                客户经理：100个 占总数3%；短信：50个 占总数1%
            </td>
        </tr> -->
								<tr>
									<th></th>
									<td>处理方式</td>
									<td colspan="3">
										${bo.activityBasicInfo.isSendOrder==0||bo.activityBasicInfo.isSendOrder==null?'不出工单':'不出工单' }

									</td>
								</tr>
								<tr>
									<th rowspan="3">渠道协同配置：</th>
									<td>自动推送</td>
									<td colspan="3">各自发送可以重复  <form>
                    <ul>
                        <li class="li4"><input  type="radio"  name="po.selfSendChannelRule" class="icheckS" value="1" ${bo.activityBasicInfo.selfSendChannelRule==1||bo.activityBasicInfo.selfSendChannelRule==null?'checked':'' } />各自发送可以重复
                        </li>
                        <li class="li2 hidden"><input  type="radio"  name="po.selfSendChannelRule" class="icheckS" value="0"${bo.activityBasicInfo.selfSendChannelRule==0?'checked':'' } />短信微信互斥发送
                            <i data-toggle="tooltip" data-placement="right" title="先发送微信,其它用户发送短信" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
									</td>
								</tr>
								<tr>
									<td>电子渠道</td>
									<td colspan="2">不互斥  <form>
                    <ul>
                        <li class="li1">
                            <input  type="radio"  name="po.eChannelShowRule" class="icheckS" value="1" ${bo.activityBasicInfo.eChannelShowRule==1||bo.activityBasicInfo.eChannelShowRule==null?'checked':'' }/>不互斥
                            <i data-toggle="tooltip" data-placement="right" title="不互斥：表示互不影响,每个渠道都可以展示一次" class="fa fa-question-circle-o" aria-hidden="true"></i>
                        </li>
                    </ul>
                </form>
									</td>
								</tr>
								<tr>
									<td>客户经理与弹窗</td>
									<td colspan="2">不互斥  <form>
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
                </form>
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
 --%>

		</div>
		<!--  主体内容  结束 -->
	</div>
</body>
</html>
