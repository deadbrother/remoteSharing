<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>分组设置</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/rule/tagadd.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/js/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
</head>
<style type="text/css">
.conbtn {
	width: 30px;
	height: 30px;
	padding: 2px;
}

.contentformula {
	text-align: center;
	overflow: auto;
	height: 330px;
	padding: 10px;
}

.center {
	width: auto;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.text-center {
	text-align: center;
}
</style>
<body>
	<div class="center">
		<div style="width: 800px; padding-top: 10px;">
			<input type="hidden" id="caozuotype"
				value="<%=request.getAttribute("caozuotype")%>">
			<div class="panel panel-default" style="width: 300px; float: left;">
				<div class="panel-heading">
					<h3 class="panel-title">字段选择</h3>
					<input type="hidden" value="${dt.draw_type_id}" id="drid" />
				</div>
				<div class="panel-body contentformula">
					<%-- <select id="tablename" class="form-control" style="width:250px;">
					<option>请选择数据源</option>
					<option>数据源1</option>
					<option>数据源2</option>
					<option>数据源3</option>
					<option>数据源4</option>
				</select> --%>
					<ul id="TagTree" class="ztree"></ul>
				</div>
				<div class="panel-footer">
					<div style="line-height: 35px;">说明：双击选择字段</div>
				</div>
			</div>
			<div class="panel panel-default" style="width: 490px; float: right;">
				<div class="panel-heading">
					<h3 class="panel-title">公式定义</h3>
				</div>
				<div class="panel-body" style="height: 330px; padding: 10px;">
					 <div style="height:40px;">
			    	<div id="header" style="width:490pxpx;float:left;line-height:30px;font-size:14px;"></div>
			    	<input type="hidden" id="fileds" value="">
			    	<input type="hidden" id="Type" value="${Type}">
			    	<div style="float:left;width:300px;">
			    		字段名称:<input type="text" id="groupName"  name="condname" value="${clientConditionPo.groupname }"  class="form-control" style="width:300px;"/>
			    	</div>
			    </div> 
					<textarea name="conditions" id="groupDesc"
						style="width: 470px; height: 100px; padding: 10px; styleId="shry">${orgRangeBo.conditionResume }</textarea>
					<div>
						<div class="panel panel-default">
							<div class="panel-body">
								<table width="400px" border="0">
									<tr>
										<td style="height: 35px;"><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(0);">0</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(1);">1</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(2);">2</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(3);">3</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(4);">4</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('+');">+</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('*');">*</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('\\');">\</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' 且 ');">且</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' 非 ');">非</button></td>
									</tr>
									<tr>
										<td style="height: 35px;"><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(5);">5</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(6);">6</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(7);">7</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(8);">8</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(9);">9</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('-');">-&nbsp;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('/');">/</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('%');">%</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' 或 ');">或</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' ~ ');">~</button></td>
									</tr>
									<tr>
										<td style="height: 35px;"><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('(');">(</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(')');">)</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol('=');">=</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' &gt; ');">&gt;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' &lt; ');">&lt;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' &lt;&gt; ');">&lt;&gt;</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' &lt;= ');">&lt;=</button></td>
										<td><button type="button"
												class="l-button l-button-brand btn_query conbtn"
												onclick="symbol(' &gt;= ');">&gt;=</button></td>
										<td colspan="2"><button type="button"
												class="l-button l-button-brand btn_query"
												onclick="symbol(' Like ');">包含</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div style="text-align: right;">
						<button type="button" onclick="distributionSubmit()"
							class="l-button l-button-brand btn_query">确定</button>
						<button type="button"
							onclick="parent.closeconditionlayer(null);  "
							class="l-button l-button-brand btn_query">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	var layerObj;
	function functionWizard() {
		layerObj = layer.open({
			title : "函数向导",
			type : 2,
			area : [ "600px", "450px" ],
			content : "../orggroup/org-group!functionwizard.action"
		});
	}
	function funcWizardClose() {
		layer.close(layerObj);
	}
	
	function distributionSubmit() {
		var groupName=$("#groupName").val();
		var filed=$("#fileds").val();
		var conditionResume = $("#groupDesc").val();
		var Type=$("#Type").val();
		submitData(Type,groupName,filed,conditionResume);
	}
	function submitData(Type,groupName,filed, conditionResume) {
		parent.getTagInfo(Type,groupName,filed, conditionResume);
		parent.layer.close(parent.tagLayer);
	}
	function symbol(str,id) {
		var obj = document.getElementById(id);
		str += "";
		if (document.selection) { //ie
			obj.focus();//先激活当前对象
		} else if (typeof obj.selectionStart === 'number'
				&& typeof obj.selectionEnd === 'number') { //非ie
			var startPos = obj.selectionStart, endPos = obj.selectionEnd, cursorPos = startPos, tmpStr = obj.value;
			obj.value = tmpStr.substring(0, startPos) + str
					+ tmpStr.substring(endPos, tmpStr.length);
			cursorPos = cursorPos + str.length;
			obj.selectionStart = obj.selectionEnd = cursorPos;
		} else {
			obj.value += str;
		}
	}
</script>