<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/js/bonc.table.js"></script>


<div id="successListDiv" style="width: 99.97%; margin-top: 5px;margin-bottom: 0px;"
		class="slds-container--fluid">
		<table width="100%" id="tools-demo-table" style="margin-bottom: 0px;" class="slds-table slds-table--bordered slds-table--fixed-layout " data-epm="selectable-table" role="grid">
				<thead>
					<tr>
						<th width="2%" >
						  <label class="slds-checkbox" for="opportunities-ownership">
				          <input name="default" type="checkbox" id="opportunities-ownership" />
				          <span class="slds-checkbox--faux"></span>
				          </label></th> 
						<input name="successId" type="hidden" value="${successId}"/>
						
						<th width="7%" style="text-align: left;padding-left:2px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">组织机构</b></th>
						<th width="7%" style="text-align: left;padding-left:-2px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">成功标准编码</b></th>
						<th width="8%" style="text-align: left;padding-left:8px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">成功标准名称</b></th>
						<th width="8%" style="text-align: left;padding-left:8px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">成功标准类型</b></th>
						<th width="6%" style="text-align: left;padding-left:8px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">匹配类型</b></th>
						<th width="8%" style="text-align: left;padding-left:10px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">附加判定成功条件</b></th>
						<th width="10%" style="text-align: left;padding-left:35px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">奖励积分规则描述</b></th>
						<th width="6%" style="text-align: left;padding-left:25px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">奖励积分</b></th>
						<th width="10%" style="text-align: left;padding-left:12px;"class="slds-is-sortable slds-is-resizable "><b
							style="text-align: left;">操作</b></th>  
					</tr>
				</thead>
				 <tbody id="traversal" class="hidden" data-traversal-url="${pageContext.request.contextPath}/clyx/activity/activity-prov!getSuccessList.action" data-traversal-prompt='{"empty":"<tr><td colspan=\"${fn:length(propertyState) + 10}\" style=\"color:orange\">暂无成功标准信息</td></tr>"}'>
					<tr >
						<th> <label class="slds-checkbox" >
							<input name="ids" type="checkbox" value="$[successId]"/> <span class="slds-checkbox--faux"></span>
						</th>
						
						<td align="left" title="$[orgName]" style="overflow:hidden;text-overflow:ellipsis"><span class="blink">
							$[orgName]
						</span></td>
						<td align="left">1111</td>
						<td align="left" title=$[successName]>$[successName,successNameLimitedLength]</td>
						<td align="left">$[successType]</td>
						<td align="left" style="overflow:hidden">
						$[matchingType]
						</td>
						<td align="left" title="$[successCondition]" >$[successCondition,successConditionLimitedLength]</td>
						<td align="left" title="$[successReward]" style="padding-left:30px">$[successReward,successRewardLimitedLength]</td>
						<td align="left" style="padding-left:30px">$[successPoint] </td>
						<td align="left" title="" >
							<a href="activity-prov!addSuccess.action?bo.successStandardPo.successId=$[successId]&bo.saveSuccessType=2">编辑</a>
							<a href="#" onclick="deleteSuccess($[successId])">删除</a></td>
              </tr> 
				</tbody>
		</table>
		<div id="pagination" pagi-for="#traversal"></div>
	</div>                   
