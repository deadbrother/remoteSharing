<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="/bonc-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/js/bonc.table.js"></script>


<div id="successListRightDiv" style="width: 99.97%; margin-top: 5px;margin-bottom: 0px;"
		class="slds-container--fluid">
		<table width="100%" id="tools-demo-table-right" style="margin-bottom: 0px;" class="slds-table slds-table--bordered slds-table--fixed-layout " data-epm="selectable-table" role="grid">
				<thead>
					<tr>
						<th width="10%" >
						  <label class="slds-checkbox" for="opportunities-ownership">
				          <input name="checkAll" type="checkbox" id="opportunities-ownership" />
				          <span class="slds-checkbox--faux"></span>
				          </label></th> 
						<th width="15%" style="text-align: left;padding-left:8px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">产品编码</b></th>
						<th width="15%" style="text-align: left;padding-left:8px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">产品来源</b></th>
						<th width="60%" style="text-align: left;padding-left:8px;"class="slds-is-sortable slds-is-resizable"><b
							style="text-align: left;">产品名称</b></th>
					</tr>
				</thead>
				 <tbody id="traversalRight"  data-traversal-url="${pageContext.request.contextPath}/clyx/activity/activity-prov!querySuccessProductList.action?bo.isLeft=right" data-traversal-prompt='{"empty":"<tr><td colspan=\"${fn:length(propertyState) + 10}\" style=\"color:orange\">暂无相关的产品信息</td></tr>"}'>
					<tr >
						<th> <label class="slds-checkbox" >
							<input name="checkOne" type="checkbox" value="$[productId]"/> <span class="slds-checkbox--faux"></span>
						</th>
						<td align="left">$[productCode]</td>
						<td align="left">$[productSuccessType1]</td>
						<td align="left"  name="nameTd" title="$[productName]">$[productName]</td>
              </tr> 
				</tbody>
		</table>
		 <div id="paginationRight" pagi-for="#traversalRight"></div>
	</div>                   
