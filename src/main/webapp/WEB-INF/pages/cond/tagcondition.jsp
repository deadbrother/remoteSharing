<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>条件设置</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.all.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerForm.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/cond/cond.js" type="text/javascript"></script>

</head>
<style type="text/css">
.conbtn {width:30px;height:30px;padding:2px;}
.contentformula {text-align:center;overflow: auto;height:330px;padding:10px;}
.center {
  width: auto;
  display: table;
  margin-left: auto;
  margin-right: auto;
}
.text-center {
  text-align: center;
}
.l-panel {
    border: 1px solid #D6D6D6;
}

</style>
<body>

	<div class="center">
		<div style="width: 800px; padding-top: 10px;">
			<div class="l-panel" style="width: 300px; float: left;">
				<div class="l-panel-header">
					<h3>字段选择</h3>
				</div>
				<div class="l-panel-content" style="overflow:auto;height: 370px;">
					<ul id="TagTree" class="ztree"></ul>
				</div>
				<div class="l-panel-footer">
					<div style="line-height: 35px;">说明：双击选择字段</div>
				</div>
			</div>
			<div class="l-panel" style="width: 490px; float: right;">
				<div class="l-panel-header">
					<h3>公式定义</h3>
				</div>
				<div class="l-panel-content" style="height: 330px; padding: 10px;">
					<div id="form1">
						<div style="height:40px;" id="condTitile">
					    	<div style="width:80px;float:left;line-height:30px;font-size:14px;">公式名称：</div>
					    	<div style="float:left;width:300px;">
					    		<input type="text" id="groupName"  name="groupName"   class="ui-textbox" />
					    	</div>
				    	</div> 
				    </div>
						<textarea name="conditions" id="groupDesc" style="width: 430px; height: 100px; padding: 10px;" styleId="shry">${orgRangeBo.conditionResume }</textarea>
						<input type="hidden" id="drid" value="${dt.draw_type_id}" class="ui-textbox">
						<input type="hidden" id="typeflag" value="${typeflag}" class="ui-textbox">
						<div style="padding: 10px; text-align: left;">
							<button type="button" id="wizard" class="l-button l-button-brand btn_query" onclick="conditionSet.functionWizard();">函数向导</button>
						</div>
					
					<div>
						<div class="l-panel">
							<div class="l-panel-content" style="padding:5px;">
								<table style="width:400px" border="0">
									<tr>
										<td style="height: 35px;"><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(0);">0</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(1);">1</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(2);">2</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(3);">3</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(4);">4</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('+');">+</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('*');">*</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('\\');">\</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' 且 ');">且</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' 非 ');">非</button></td>
									</tr>
									<tr>
										<td style="height: 35px;"><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(5);">5</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(6);">6</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(7);">7</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(8);">8</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(9);">9</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('-');">-&nbsp;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('/');">/</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('%');">%</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' 或 ');">或</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' ~ ');">~</button></td>
									</tr>
									<tr>
										<td style="height: 35px;"><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('(');">(</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(')');">)</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol('=');">=</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' &gt; ');">&gt;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' &lt; ');">&lt;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' &lt;&gt; ');">&lt;&gt;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' &lt;= ');">&lt;=</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="conditionSet.symbol(' &gt;= ');">&gt;=</button></td>
										<td colspan="2"><button type="button"
												class="l-button l-button-brand btn_query "
												onclick="conditionSet.symbol(' Like ');">包含</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div style="padding:10px;">
					<div style="text-align: right;">
						<button type="button" onclick="conditionSet.condSubmit('${dt.draw_type_id}')"
							class="l-button l-button-brand btn_query">&nbsp;确定&nbsp;</button>
						<button type="button"
							onclick="conditionSet.closeCond();"
							class="l-button l-button-brand btn_query">&nbsp;取消&nbsp;</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	$("#form1").ligerForm({});
</script>