<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增成功标准新增页面</title>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
<%-- <script src="${pageContext.request.contextPath}/js/activity/activity-prov-successStandard_add.js" type="text/javascript"></script> --%>
<style type="text/css">
</style>

<script type="text/javascript">
$(function(){
	$("#matchleft").hide();
	$("#match").hide();
	$("#successType").change(function(){
		alert(22);
		$("#table1").hide();
		$("#xuanZe").removeAttr("checked");
		$("#rightProductIds").val("");
		$("#matchleft").show();
		$("#match").show();
		var succType = $('#successType').find('option:selected').attr('lev');
		 document.getElementById("productrel1").value=succType;
		if(succType==0 || succType == undefined){
			$("#matchleft").hide();
			$("#match").hide();
		}else{
			var mach1 = document.getElementsByName("match1");
			for(var i = 0;i < mach1.length;i++){
	            if(mach1[i].value == 1){
	            	mach1[i].checked = 'checked';
	            	matchAll();
	            }
	        }
		}
	})
	
})
</script>
</head>
<body>
<form action="${basePath }saveSuccess" method="post">
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
							<input type="hidden" id="successId" name="successStandardPo.successId"
								value="${successId}" /> <input
								type="hidden" id="saveSuccessType" value="${bo.saveSuccessType}" />
							<%-- <input type="hidden" id="successType1"
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
							<div> --%>
								<input type="hidden" id="rightProductIds">
							</div>
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
								<select style="width: 120px;" id="successType" name="successStandardPo.successTypeId" value="${successStandardPo.successTypeId}">
									<option value="">请选择</option>
									<c:forEach items="${successStandardTypePo}"
										 var="sst">
										<option lev="${sst.productRel}" value="${sst.typeId}"${successStandardPo.successTypeId == sst.typeId? 'selected': ''}>${sst.typeName}</option>
									</c:forEach>
								</select>
								<input type="hidden" id="productrel1"  name="successStandardTypePo.productRel" value="">
							</div>

							<div class="row" style="height: 40px">
						<input type="text" style="width: 300px" id="successName" name="successStandardPo.successName" value="${successStandardPo.successName}"/>
						<span id="name" style="color: red; float:"></span><input
							type="hidden" id="checkSuccessNameValid" value="0">
					</div>

					<div class="row" style="height: 15px" id="match">
						<!-- <div class="row" style="height:40px"> -->
						<input type="radio" name="successStandardPo.matchingType" value="1"${successStandardPo.matchingTypeId==1||successStandardPo.matchingTypeId==null?'checked':'' } onclick="matchAll()">全部匹配
						<input type="radio" name="successStandardPo.matchingType" value="2"${successStandardPo.matchingTypeId==2?'checked':'' }
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


											<!-- 中间操作图标																										
													<div style="margin-left: 300px;margin-right: 300px;height: 30px">														
														<button id="rightBtn" style="height: 30px;width: 40px">&nbsp &darr;&nbsp</button>																									
														<button id="allRightBtn" style="height: 30px;width: 40px">&darr;&darr;</button>																							
														<button id="leftBtn" style="height: 30px;width: 40px">&nbsp&nbsp&uarr;&nbsp</button>																							
														<button id="allLeftBtn" style="height: 30px;width: 40px">&uarr;&uarr;</button>																																		
											</div><br><br><br> -->
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
						<input type="hidden" id="successConditionSQL" name="bo.successStandardPo.successConditionSQL" value="${bo.successStandardPo.successConditionSQL}"/>
							<input type="text" style="width: 500px"
								name="successStandardPo.successCondition" value="${successStandardPo.successCondition}"  readonly="readonly"/>&nbsp;
							<button type="button" id="btn2" onclick="choose()">条件</button>
						</div> 
					</div>


					<div class="row" style="height: 50px" id="hide2">
						<span>增加其他条件，鼠标点击“条件”，弹出标签树，选择条件保存后，文本框显示保存的条件</span>
					</div>

					<div class="row" style="height: 40px" id="hide3">

						<input type="text" style="width: 500px" id="desRules" name="successStandardPo.successReward" value="${successStandardPo.successReward}"/>
					</div>

					<div class="row" style="height: 50px" id="hide4">

						<input type="text" style="width: 150px" id="successPoint" name="successStandardPo.successPoint" value="${successStandardPo.successPoint}" onblur="check(this)"/> <span style="margin-left: 10px">积分</span><input
							type="hidden" id="checkSuccessPoint" value="0">
					</div>
					</div>
					</div>
					<div class="col-md-12">
						<div class="slds-grid" style="margin-left: 200px">
							<button id="save-tool-btn"
								class="slds-grid  slds-button slds-button--brand"
								style="margin-right: 35px">&nbsp;保存
							</button>
						</div>
					</div>
				</div>
			</div>
			</form>
</body>
</html>
