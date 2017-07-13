<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选择函数</title>
</head>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/wxwl/cond/css1.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/cond/selectfunction.js" type="text/javascript"></script>
<style type="text/css">
.node{
	FONT-SIZE: 12px; 
}
.contentformula {overflow: auto;height:180px;padding:10px;}
.m_arrow {
	width: 16px;
	height: 16px;
	font-family: "Webdings";
	font-size: 7px;
	line-height: 2px;
	padding-left: 2px;
	cursor: default;
}
.{width:240px;margin-top:10px;}
</style>
<body>
<input type="hidden" name="codearr" id="codearr"/>
<input type="hidden" name="strarr" id="strarr"/>
<table width="100%" height="380px" border="0" align="center" id="itemtreenode">
  <tr> 
    <td width="76%" height="150px"> 
      <table width="100%" height="150px" border="0" align="center">
        <tr> 
          <td height="150px" style="padding-left:5px;">
			<div id="selectifram" class="node">
            	<div class="l-panel"  style="width:490px;float:left;"> 
				    <div class="l-panel-header"> 
				         <h3>函数选择</h3>
				    </div> 
				    <div class="l-panel-content contentformula"> 
				        <ul id="leftTree" class="ztree"></ul>
				    </div>
				    <div class="l-panel-footer">
				    	<div style="line-height:25px;">
				    	说明：请选择函数，按[下一步]设置函数需要的参数
				    	</div>
				    </div>
				</div>
           	</div> 
           	<div id="selectformula"  style="display:none" class="node">
           	<div class="l-panel"  style="width:490px;float:left;"> 
           		<div class="l-panel-header"> 
				      <h4> 请设置函数参数，按[完成]结束函数向导 </h4>
				</div> 
            	<div  id="form1" class="l-panel-content contentformula"> 
            	<table width="100%" height="165" border="0" align="center">
             		<tr> 	
                		<td valign="top"><div id="explained" class="node"></div> 
                  		<div id="subsetnum1"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="numtitle">数值表达式</div>
                				</td>
                				<td>
                					<input type="text" name="numexpression1_item" id="numexpression1_item"  class="ui-textbox" onclick="toggleSelect('numexpression1');"/>
                					<input type="hidden" id="numexpression1_arr" name="numexpression1_arr">
                				</td>
                			</tr>
                 		 </table>		
                  		</div>
                  		<div id="subsetnum2"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					数值表达式
                				</td>
                				<td>
                					<input type="text" name="numexpression2_item" id="numexpression2_item" class="ui-textbox" onclick="toggleSelect('numexpression2');">
                					<input type="hidden" id="numexpression2_arr" name="numexpression2_arr">
                				</td>
                			</tr>
                 		 </table>		
                  		</div>  
                 		<div id="subsetdate1"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="datesubset" class="node"></div>
                				</td>
                				<td>
                					<input type="text" name="dateexpression1_item" id="dateexpression1_item" class="ui-textbox" onclick="toggleSelect('dateexpression1');">
                					<input type="hidden" id="dateexpression1_arr" name="dateexpression1_arr">
                				</td>
                			</tr>
                 		</table>		
                 		</div> 
                 		<div id="subsetdate2"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="datesubset1" class="node"></div>
                				</td>
                				<td>
                					<input type="text" id="dateexpression2_item" name="dateexpression2_item"  class="ui-textbox" style="width:240px" onclick="toggleSelect('dateexpression2');">
                					<input type="hidden" id="dateexpression2_arr" name="dateexpression2_arr">
                				</td>
                			</tr>
                 		</table>		
                 		</div> 
                 		<div id="condstrview"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="condname"></div>
                				</td>
                				<td>
                					<select id="statid"  name="statid" property="statid" style="width:240px">
			 							<option></option>
									</select>  
                				</td>
                			</tr>
                 		 </table>		
                  		</div> 
                  		<div id="subsetstr"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="strsubset" class="node"></div>
                				</td>
                				<td>
                					<input type="text" id="strexpression_item" name="strexpression_item"  class="ui-textbox" style="width:240px" onclick="toggleSelect('strexpression');">
                					<input type="hidden" id="strexpression_arr" name="strexpression_arr">
                				</td>
                			</tr>
                 		 </table>		
                  		</div> 
                 		<div id="itemidSelect"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="itemidname"></div>
                				</td>
                				<td>
                					<input type="text" id="itemid_item" name="itemid_item" style="width:240px" class="ui-textbox"  onclick="toggleSelect('itemid');">
                					<input type="hidden" id="itemid_arr" name="itemid_arr">
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="datastrcss"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="datastrcssaname">指标名称</div>
                				</td>
                				<td>
                					<input type="text" id="datestr_item" name="datestr_item" style="width:240px" class="ui-textbox"  onclick="toggleSelect('datestr');">
                					<input type="hidden" id="datestr_arr" name="datestr_arr">
                				</td>
                			</tr>
                 		 </table>		
                  		</div>
                  		<div id="hdayslogoview"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="hdayslogoname">节假日标志</div>
                				</td>
                				<td>
                					<select id="hdayslogo"  name="hdayslogo" style="width:240px">
                						<option value='不含节假日'>不含节假日</option>
                						<option value='含节假日'>含节假日</option>
                					</select>
                				</td>
                			</tr>
                 		 </table>		
                  		</div>
                  		<div id="incrementalItem"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="incrementalItemname"></div>
                				</td>
                				<td>
                					<input type="text" id="incrementalItem_item" name="incrementalItem_item" class="ui-textbox"  style="width:240px" onclick="toggleSelect('incrementalItem');">
                					<input type="hidden" id="incrementalItem_arr" name="incrementalItem_arr">
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="rangeidview"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="rangeidname"></div>
                				</td>
                				<td>
                					<select id="rangeid" name="rangeid" property="rangeid" style="width:240px">
			 							<option></option>
									</select>  
                				</td>
                			</tr>
                 		 </table>		
                  		</div> 
                 		<div id="decimalpoint"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="decimalname"></div>
                				</td>
                				<td width="140">
                					<input type="text" id="decimal"  name="decimal" value="0" />
                				</td>
                				<td>
                					&nbsp;
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="initiationnum"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					长&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                					&nbsp;&nbsp;&nbsp;&nbsp;度
                				</td>
                				<td width="140">
                					<input type="text" id="initiation" name="initiation" value="0" />
                				</td>
                				<td>
                					&nbsp;
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="directioncss"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					方&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                					向
                				</td>
                				<td>
                					<select id="direction" name="direction" style="width:240px">
                						<option value=""> </option>
                						<option value='最初第'>最初第</option>
                						<option value='最近第'>最近第</option>
                					</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                  		<div id="datastrcss1"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="datastrcss1name">指标名称</div>
                				</td>
                				<td>
                					<input type="text" id="strid_item" name="strid_item" style="width:240px" class="ui-textbox"  onclick="toggleSelect('strid');">
                					<input type="hidden" id="strid_arr" name="strid_arr">
                				</td>
                			</tr>
                 		 </table>		
                  		</div>    
                 		<div id="conditionscss"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					条&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件
                				</td>
                				<td><input type="text" id="conditions" name="conditions" class="ui-textbox" ></input></td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="waycss"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					方&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                					式
                				</td>
                				<td>
                					<select id="way" name="way" style="width:240px">
                						<option value=""> </option>
                						<option value='的总和'>的总和</option>
                						<option value='的平均值'>的平均值</option>
                						<option value='的个数'>的个数</option>
                						<option value='的最大值'>的最大值</option>
                						<option value='的最小值'>的最小值</option>
                						<option value='的最初第一条记录'>的最初第一条记录</option>
                						<option value='的最近第一条记录'>的最近第一条记录</option>
                					</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="codeMax"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="codeMaxname"></div>
                				</td>
                				<td>
                					<select id="code_maxarr" name="code_maxarr" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="codeMin"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="codeMinname"></div>
                				</td>
                				<td>
                					<select id="code_minarr" name="code_minarr" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="stand"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="standname"></div>
                				</td>
                				<td>
                					<select name="standid" id="standid" style="width:240px">
			 							<option></option>
									</select>  
                				</td>
                			</tr>
                 		 </table>		
                  		</div>
                  		<div id="standhHighLow" style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="standhlname"></div>
                				</td>
                				<td>
                					<select name="standhlid" id="standhlid" style="width:240px">
			 							<option></option>
									</select>  
                				</td>
                			</tr>
                 		 </table>		
                  		</div>
                  		<div id="standHfactor"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="hfactorname"></div>
                				</td>
                				<td>
                					<select id="hfactor_arr" name="hfactor_arr" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="standS_hfactor"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="s_hfactorname"></div>
                				</td>
                				<td>
                					<select id="s_hfactor_arr" name="s_hfactor_arr" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="standVfactor"  style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="vfactorname"></div>
                				</td>
                				<td>
                					<select id="vfactor_arr" name="vfactor_arr" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="standS_vfactor" style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="s_vfactorname"></div>
                				</td>
                				<td>
                					<select id="s_vfactor_arr" name="s_vfactor_arr" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                 		<div id="standItem" style="display:none"> 
                  		<table width="100%" height="40" border="0">
                			<tr>
                				<td width="80" style="word-break: break-all; word-wrap:break-word;">
                					<div id="itemname"></div>
                				</td>
                				<td>
                					<select id="item" name="item" style="width:240px">
             						</select>
                				</td>
                			</tr>
                 		</table>		
                 		</div>
                  </td>
              	</tr>
            </table>
             </div>
             <div class="panel-footer" style="height:26px;">&nbsp;</div>
            </div> 
           </td>
        </tr>
      </table> </td>
    <td width="24%" rowspan="3" valign="middle"> 
    	<table width="100%" height="214px" border="0">
	        <tr> 
	        	<td height="121px" align="center" valign="bottom"> 
		            <div id="stepDark"> 
		          		<button type="button"  id="nextstepDark"   name="nextstepDark"  class="btn btn-default"  disabled="disabled">下一步</button>
		            </div> 
		            <div id="stepBrilliant"  style="display:none"> 
		            	<button type="button"  id="nextstepBrilliant"  name="nextstepBrilliant"  class="btn btn-primary"  onclick="nextStep();subsetfunction();">下一步</button>
		            </div> 
	        	</td>
	        </tr>
	        <tr> 
	        	<td height="91" align="center"> 
		          	<div id="darkReturnStep"> 
		          		<button type="button"  id="darkstep"   name="darkstep"  class="btn btn-default"  disabled="disabled">上一步</button>
		            </div> 
		            <div id="brilliantReturnStep"  style="display:none"> 
		            	<button type="button"  id="brilliantstep"  name="brilliantstep"  class="btn btn-primary"  onclick="returnStep();">上一步</button>
		            </div> 
	            </td>
	        </tr>
	        <tr> 
	          <td height="54" align="center">
	          	<div id="darkCompleted"> 
	          		<button type="button"  id="completeddark"   name="completeddark"  class="btn btn-default"  disabled="disabled">完成</button>
	            </div>
	            <div id="brilliantCompleted"  style="display:none"> 
	            	<button type="button"  id="completedbrilliant"  name="completedbrilliant"  class="btn btn-primary"  onclick="completed();">完成</button>
	            </div>
	          </td>
	        </tr>
      </table>
     </td>
  </tr>
  <tr> 
    <td height="14"><div id="note" class="node" style="padding-left:10px;">说明：数值函数</div></td>
  </tr>
  <tr> 
    <td height="83" align="center">
    	<table width="99%" height="82" border="0">
       		<tr>
       			<td valign="top">
       				<div id="calculation" class="node" style="padding-left:10px;"></div>
      				<input type="hidden" name="formula"  id="formula" value=""> 
      				<input type="hidden" name="id" id="id" value=""> 
      				<input type="hidden" name="attribute"  id="attribute" value="">
      				<input type="hidden" name="nodeitemid" id="nodeitemid" value=""> 
				</td>
       		</tr>
       </table> 
      </td>
  </tr>
</table>
<div id="selectItemPanle" style="display:none;width:300px;height:200px;overflow: auto;position:absolute;border:1px solid #ccc;background-color:#fff">
<ul id="itemTree" class="ztree"></ul>
</div>
</body>
</html>
<script>
$(function(){
	$("#form1").ligerForm({
		inputWidth: 240
	});
	$("#initiation").ligerSpinner({
		width: 240,
		type: "int"
	});
	$("#decimal").ligerSpinner({
		width: 240,
		type: "int"
	});
	var condData = frameElement.dialog.get("data");
	var drawTypeId = condData.drawTypeId;
	var typeflag = condData.typeflag;
	
	var setting = {
        view: {
            dblClickExpand: false,
            showLine: false
        }, 
        data: {
            key: {
                title: "name"
            },
            keep: {
				leaf: true,
				parent: true
			},
            simpleData: {
                enable: true,
                idKey:"id",
                pIdKey:"pid"
           }
        },
        edit: {
			drag:{
				isCopy: false,
				isMove: true
			},
			enable: false,
		},
        callback: {
            onClick: function(event,treeId,treeNode){
            	saveCalculation(treeNode);
            }
		
        }
    };
	$.fn.zTree.init($("#leftTree"), setting, funcJsonData());
	
	
	var itemsetting = {
			view: {
	            dblClickExpand: false,
	            showLine: false
	        }, 
		    data:{
				simpleData: {
					enable:true, 
					idKey:'id',
					pIdKey:'pid',
					rootPId: 0
				},
				key:{
					name:'res_filed_type_name',
					title: "name"
				},
				keep: {
					parent: true,
					leaf: true
				}
			},
			async: {
				enable: true,
				type:"POST",
				autoParam: ["id=res_field_type_id","flag"],
				otherParam: {"drawTypeId":drawTypeId,"typeflag":typeflag},
				url:"/epmwxwl/condFunc/tagTreeData",
				dataFilter: null
			},
			callback:{
				//双击事件，将标签拖到文本框
				onDblClick: function(event,treeId,treeNode){
					var nodeitemid = $("#nodeitemid").val();
	            	$("#"+nodeitemid+"_item").val(treeNode.res_filed_type_name);
	            	$("#"+nodeitemid+"_arr").val(treeNode.id);
	            	hideItemTree();
				}

			}
		};
	$.fn.zTree.init($("#itemTree"), itemsetting);
});
</script>
