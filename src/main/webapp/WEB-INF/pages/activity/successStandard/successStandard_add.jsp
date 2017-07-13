<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <link
	href="/epmwxwl/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-dialog.css"
	rel="stylesheet" type="text/css" />
<script
	src="/epmwxwl/js/ligerui/lib/jquery/jquery-1.4.4.min.js"
	type="text/javascript"></script>
<script
	src="/epmwxwl/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="/epmwxwl/js/wxwl/utils/common.js"></script> 
<div data-target="#table-example2" data-offset="50" data-spy="scroll"
	class="slds-container--center slds-container--large">
	<div class="container">
		<div class="col-md-12">
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label"
						style="font-size: 25px; margin-top: 15px">成功标准新增</label>
				</div>
				<hr>
				<div>
				<div class="col-md-4">
					<input type="hidden" id="successId"
						value="${bo.successStandardPo.successId}" /> <input type="hidden"
						id="saveSuccessType" value="${bo.saveSuccessType}" /> <input
						type="hidden" id="successType1"
						value="${bo.successStandardPo.successTypeId}" /> <input
						type="hidden" id="successName1"
						value="${bo.successStandardPo.successName}" /> <input
						type="hidden" id="successCondition1"
						value="${bo.successStandardPo.successCondition}" /> <input
						type="hidden" id="desRules1"
						value="${bo.successStandardPo.successReward}" /> <input
						type="hidden" id="successPoint1"
						value="${bo.successStandardPo.successPoint}" /> <input
						type="hidden" id="successMatchingType1"
						value="${bo.successStandardPo.matchingTypeId}"><input
						type="hidden" id="successConditionSQL1"
						value="${bo.successStandardPo.successConditionSQL}" />
<div> <input type="hidden" id="rightProductIds"></div>	
					<div class="row" style="height: 40px">
						<label style="margin-left: 150px; font-size: 15px; float: right">成功标准类型
							<span class="" style="color: #F00; font-weight: bold">*</span>：
						</label>
					</div>
					<div class="row" style="height: 40px">
						<label style="margin-left: 150px; font-size: 15px; float: right">成功标准名称
							<span class="" style="color: #F00; font-weight: bold">*</span>：
						</label>
					</div>
					<div id="matchleft" class="row" style="height: 15px">
						<label style="margin-left: 150px; font-size: 15px; float: right">匹配类型：
						</label>
					</div>
					</div>
				<div class="col-md-8">	
				<div class="row" style="height: 40px">
						<select style="width: 120px;" id="successType">
						<option value="">请选择</option>
							<c:forEach items="${bo.successStandardTypeList}"
								varStatus="index" var="sst">
								<option lev="${sst.productRel}" value="${sst.typeId}">${sst.typeName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="row" style="height: 40px">
						<input type="text" style="width: 300px" id="successName" class= />
						<span id="name" style="color: red; float:"></span><input
							type="hidden" id="checkSuccessNameValid" value="0">
					</div>

					<div class="row" style="height: 15px" id="match">
						<!-- <div class="row" style="height:40px"> -->
						<input type="radio" name="match1" value="1" onclick="matchAll()">全部匹配
						<input type="radio" name="match1" value="2"
							onclick="matchAccurate()">精准匹配 <br>					
					</div>
					</div>
					</div>									
					<div class="col-md-12" style="width: 100%" >
					<div  class="col-md-4"></div>
					<div  class="col-md-8">
							<div id="table1"
								style="display: none; margin-left: -300px; margin-top: 0px">
								<div>

									<!-- 匹配类型div -->

									<div>		
									<div class="col-md-6" id="xuanZe2"></div>						
											<div  class="col-md-6" id="xuanZe1"style="margin-top: 10px; width: 50%" >
												<input type="checkbox" id="xuanZe">选择优先推荐产品
											</div>																			

										<div id="allProduct">
											<div >
												<div class="form-inline">
													<div class="center-block" style="margin-left:0px">										
														<input type="text" id="queryLeftVal" class="form-control"
															placeholder="请输入产品编码或名称" name="pro" /> <span class=""
															id="queryLeftProductName"><a id="queryLeft">查询</a></span>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已选择产品列表
													</div>
												</div>

												<!-- 左侧未选择产品列表 -->
												<div id="cc"></div>
											</div><br><br><br>


											<!-- 中间操作图标 -->																										
													<div style="margin-left: 300px;margin-right: 300px;height: 30px">														
														<button id="rightBtn" style="height: 30px;width: 40px">&nbsp &darr;&nbsp</button>																									
														<button id="allRightBtn" style="height: 30px;width: 40px">&darr;&darr;</button>																							
														<button id="leftBtn" style="height: 30px;width: 40px">&nbsp&nbsp&uarr;&nbsp</button>																							
														<button id="allLeftBtn" style="height: 30px;width: 40px">&uarr;&uarr;</button>																																		
											</div><br><br><br> 
											<!-- 右侧已选择产品列表 -->
											<div  id="rightDiv">

												<div class="form-inline">
													<div class="center-block">
														<input type="text" id="queryRightVal" class="form-control"
															placeholder="请输入产品编码或名称" name="product" /> <span class=""
															id="queryRightProductName"><a id="queryRight">查询</a></span>
													</div>
												</div>

												<div id="selpro" class="pre-scrollable">							
												</div>
											</div>
										</div>											
									</div>
								</div>
							</div>
							</div>
						</div><br><br><br><br>
						<div class="col-md-12">
						<div class="col-md-4">
					<div class="row" style="height: 40px">
						<label id="fuJia"
							style="margin-left: 150px; font-size: 15px; float: right">附加成功判断条件：
						</label>
					</div>
					<div class="row" style="height: 50px">
						<label id="shuoMing"
							style="margin-left: 150px; font-size: 15px; float: right">说明：</label>
					</div>
					<div class="row" style="height: 40px">
						<label id="jiangLi"
							style="margin-left: 150px; font-size: 15px; float: right">奖励积分描述规则：
						</label>
					</div>
					<div class="row" style="height: 50px">
						<label id="jiFen"
							style="margin-left: 150px; font-size: 15px; float: right">积分值：
						</label>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row" style="height: 40px" id="hide1">
						<div class="input-group">
						<input type="hidden" id="successConditionSQL" value=""/>
							<input type="text" id="successCondition" style="width: 500px"
								value=""  readonly="readonly"/>&nbsp;
							<button type="button" id="btn2" onclick="choose()">条件</button>
						</div>
					</div>


					<div class="row" style="height: 50px" id="hide2">
						<span>增加其他条件，鼠标点击“条件”，弹出标签树，选择条件保存后，文本框显示保存的条件</span>
					</div>

					<div class="row" style="height: 40px" id="hide3">

						<input type="text" style="width: 500px" id="desRules" />
					</div>

					<div class="row" style="height: 50px" id="hide4">

						<input type="text" style="width: 150px" id="successPoint"
							onblur="check(this)" /> <span style="margin-left: 10px">积分</span><input
							type="hidden" id="checkSuccessPoint" value="0">
					</div>
					</div>
					</div>
					<div class="col-md-12">
						<div class="slds-grid" style="margin-left: 200px">
							<button id="save-tool-btn"
								class="slds-grid  slds-button slds-button--brand"
								style="margin-right: 35px" onclick="checkValue()">&nbsp;保存
							</button>
						</div>
					</div>
				</div>





			</div>