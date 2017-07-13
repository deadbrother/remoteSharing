<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
input.l-bar-button{
  line-height: 35px!important;
  height: 35px!important;
}
</style>


	<table class="activeLayout" style="table-layout:fixed;word-wrap:break-word;">
        <colgroup>
            <col width="145px" />
            <col width="*" />
            <col width="*" />
            <col width="*" />
        </colgroup>
        <tr id="usergroup23">
            <th>
                <span>*</span>目标客户群
            </th>
            <td>
            	  <input type="hidden" id="ciwaId" value="${param.usergroupid}"/>
            	  <input type="hidden" id="userGroupId" name="po.userGroupId" value="${bo.activityBasicInfo.userGroupId}"/>
            	  <input type="hidden" id="userGroupType" name="po.userGroupType" value="${bo.activityBasicInfo.userGroupType}"/>
                  <input type="text" class="form-control ktext" id="userGroupName" placeholder="" name="po.userGroupName" readonly="readonly" value="${bo.activityBasicInfo.userGroupName}" onmouseover="this.title=this.value" check_empty check_name="目标客户群">
            </td>
            <th colspan="3">
                <span class="people">用户数：</span>
                <span class="num" id="userGroupNum" numtd>--</span>
            
                <button type="button" id="chooseUserGroupButton" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="userGrouplist();loadData()">选择</button>
                <button type="button" id="newUserGroupButton" class="btn btn-primary"  onclick="userGrouplistNew()">新建</button>
                <button type="button" id="importUserGroupButton" class="btn btn-primary" onclick="userGrouplistImport()">导入</button>
            </th>
        </tr>
        <tr id="isdeleteblackUser">
            <th>剔除防打扰名单</th>
            <td>
                <ul>
                    <li class="li1"><input type="radio" name="po.isDeleteBlackUser" class="icheckS" value="1" ${bo.activityBasicInfo.isDeleteWhiteUser=='1'||bo.activityBasicInfo.isDeleteWhiteUser==null?'checked':''} />是</li>
                    <li class="li2"><input type="radio" name="po.isDeleteBlackUser" class="icheckS" value="0" ${bo.activityBasicInfo.isDeleteWhiteUser=='0'?'checked':''}/>否</li>
                </ul>
            </td>
            <!-- <th >剔除白名单</th>
            <td>
                <ul>
                    <li class="li1"><input type="radio" name="po.isDeleteWhiteUser" class="icheckS" value="1" ${bo.activityBasicInfo.isDeleteBlackUser=='1'||bo.activityBasicInfo.isDeleteBlackUser==null?'checked':''} />是</li>
                    <li class="li2"><input type="radio" name="po.isDeleteWhiteUser" class="icheckS" value="0"  ${bo.activityBasicInfo.isDeleteBlackUser=='0' ?'checked':''} />否</li>
                </ul>
            </td> -->
        </tr>
       <tr id="successStandardType12">
            <th><span>*</span>成功标准类型</th><input type="hidden" value='' id="selectedIds"><input type="hidden" value='' id="selectedNames">
            <td>
                <select class="form-control" id="successType" name="successStandardPo.successTypeId" value="${bo.successStandardPo.successTypeId}" onchange="selectOnchang(this)">
					<option value="">请选择..</option>
						<c:forEach items="${bo.successStandardTypeList}"
							 var="sst">
							<option lev="${sst.productRel}" str="${sst.condition}" rst="${sst.rst1}" value="${sst.typeId}" ${bo.successStandardPo.successTypeId == sst.typeId? 'selected': ''}>${sst.typeName}</option>
						</c:forEach>
				</select>
				<!--保存成功标准所有信息的隐藏域  -->
				<input type="hidden" id="productrel1"  name="successStandardTypePo.productRel" value="">
            	<input type="hidden" id="successProductIds"  name="successStandardPo.successProductIds" value="${bo.successStandardPo.successProductIds}">
            	<input type="hidden" id="orderProductIds"  name="successStandardPo.orderProductIds" value="">
            	<input type="hidden" id="orderSelectedNames" name="successStandardPo.orderProductNames" value="">
            </td>
        </tr>
        <tr id="succcondition" style="display: none;">
        	<td></td>
        	<td id="successTypeCondition" colspan="4" class="al"></td>
        </tr>
        <tr id="match2" style="display: none;">
          <th id="match1" style="display: none;">匹配类型</th>
            <td colspan="3">
                <ul id="match" style="display: none;">
				<li style="margin-right: 14px;" id="check1"><input type="radio" name="successStandardPo.matchingType" value="1"${bo.successStandardPo.matchingTypeId==1||bo.successStandardPo.matchingTypeId==null?'checked':'' }
					onclick="matchAll()" />全部匹配</li>
				<li id="lili"><input type="checkbox" id="xuanZe" onclick="matchFirst()">选择优先产品</li>
				<li id="check2"><input type="radio" name="successStandardPo.matchingType" value="2"${bo.successStandardPo.matchingTypeId==2?'checked':'' }
					onclick="matchAccurate()" />精确匹配</li>
			</ul>
		</td>
        </tr>
	<tr id="productTr" style="display: none;">
		<td colspan="4" style="word-wrap:break-word;word-break:break-all;">
			<div id="allProduct">
				<iframe id="iframeLeft" name="iframeLeft" src="productTableLeft"
					width="730px" scrolling="auto" height="400"> </iframe>
		</td>
		<th></th>
	</tr>


	<tr id="productTrDown" style="display: none;">
		<td colspan="4" style="word-wrap:break-word;word-break:break-all;">
			<div id="allProductDown">
				<iframe id="iframeRight" name="iframeRight" src="productTableRight"
					width="730px"  scrolling="auto" height="400"> </iframe>
		</td>
		<th></th>
	</tr>

	<tr id="successSqlCondition232">
            <th>
               附加条件
            </th>
            <td colspan="2">
            	<input type="hidden" id="successSqlCondition" name="successStandardPo.successSqlCondition" value="${bo.successStandardPo.successSqlCondition}"/>
            	<input type="hidden" id="successConditionSQL" name="successStandardPo.successConditionSQL" value="${bo.successStandardPo.successConditionSQL}"/>
                <input type="text" class="form-control ktext" id="successCondition" placeholder="" name="successStandardPo.successCondition" value="${bo.successStandardPo.successCondition}" onmouseover="this.title=this.value"  readonly="readonly" />
             </td>
             <td><button type="button" id="btn2" onclick="choosesucc()" class="btn btn-primary term " >条件</button></td>
            <td class="iconleft"> 
            <ul>
            <li><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="增加其他附加条件，与成功标准类型组合判断成功与否"></i></li>
            </ul>
            </td>
        </tr>
        <tr id="successReward234">
            <th>
                奖励描述
            </th>
            <td colspan="3">
                <input type="text" class="form-control" id="desRules" name="successStandardPo.successReward" value="${bo.successStandardPo.successReward}" check_size="0,90" check_name="奖励描述" onmouseover="this.title=this.value" placeholder="" onblur="reward()">
            </td>
            <td class="iconleft"> 
            <ul>
            <li><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="本活动的奖励描述，执行页面可以展示"></i></li>
            </ul>
            </td>
        </tr>
        <tr id="strategyDesc232">
            <th style="vertical-align:middle;"> 策略描述</th>
            <td colspan="3">
                <textarea class="form-control" rows="3" id="strategyDesc" name="po.strategyDesc" readonly="readonly" value="${bo.activityBasicInfo.strategyDesc}" check_name="策略描述" check_size="-1,900">${bo.activityBasicInfo.strategyDesc}</textarea>
            </td>
            <td class="iconleft">
            <ul>
            <li><i class="fa fa-question-circle-o" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="策略描述，根据成功标准自动生成"></i></li>
            </ul>
            </td>
        </tr>
    </table>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y:scroll">
		<div class="modal-dialog"  >
			<div class="modal-content" style="margin-left:-40px;width:950px;" >
				<table
					class="slds-table slds-table--bordered slds-table--fixed-layout"
					data-epm="selectable-table" style="margin-bottom: 0px;">
					<tr class="slds-is-sortable slds-is-resizable">
						<td class="slds-grid">
						     <span style="padding:2px">用户群名称：</span>
							 <input type="text" id="queryUserGroup" class="" placeholder="请输入用户群名称"  value="">
						</td>
						<td>
							 <span style="padding:2px">创建人：</span>
							 <input type="text" id="queryUserGroupCreater" class="" placeholder="请输入创建人"  value="">
						</td>
						<td> 
							<button type="button" class="slds-button slds-button--brand" id="clickReload" onclick="resetForm();">查询</button>
							<button type="button" class="slds-button slds-button--brand"  onclick="choose();" >选择</button>
							<button type="button" class="slds-button slds-button--brand" data-dismiss="modal"  id="close1" style="">关闭</button>
						</td>
					</tr>
				</table>
				
				<div class="slds-container--left slds-p-horizontal--lagrge"
					style="width: 98%">
					<div id="userGroupList22" class=""></div>
					<div class="slds-container--left slds-p-horizontal--lagrge" style="margin-top: 10px">
				<!-- <a id="newUserGroup" onclick="newUserGroup();">列表中没有我需要的用户群，新建用户群</a> -->
				</div>
				</div>
				
				<div id="modifyMenu" class="boxMenu"></div>
			</div>
		</div>
	</div>
	<!--     弹出框结束 -->
	<div class="activediv"></div>
	<!--   //第二个表格结束 -->
