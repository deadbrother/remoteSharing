<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css"rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/utils/common.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/demos/grid/CustomersData.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/common/fromCheck.js" type="text/javascript"></script>
<script type="text/javascript">
	var src, test1, g, combo1;
	var listValue = new Array();
	$(function() {
		$("#form1").ligerForm({
			inputWidth : 200
		});

		//layer弹窗
		$("#btn1").click(function() {
			/**
			*sql条件说明
			*标签类型  0.移网 1.宽网 2.全网
			*callback
			*/
			conditionObj.taskCond("","2", function(sql, resume) {
				alert(sql);
				alert(resume);
			});
		});
		src = "demos/listbox/listbox3.htm";

		//ligerui弹窗
		$("#btn2").click(function() {
			$.ligerDialog.open({
				url : 'js/ligerui/' + src,
				isDrag : true,
				width : 900,
				height : 300,
				name : 'baidu',
				titie : 'baidu',
				isResize : true,
				left : 247,
				top : 133,
				allowClose : true,
				showMin : true,
				layoutMode : 2
			});
		});
		//下拉列表  单选
		test1 = $("#test1").ligerComboBox({
			data : [ {
				text : '张三',
				id : '1'
			}, {
				text : '李四',
				id : '2'
			}, {
				text : '赵武',
				id : '44'
			} ],
			resize : true,
			width : 200,
			valueFieldID : 'test3',
			onSelected : function(value, text) {
				//alert(value);//默认选中值
			}
		});

		test1.selectValue("44");
		test1.getValue();

		//下拉列表 多选
		$("#test2").ligerComboBox({
			data : [ {
				text : '张三',
				id : '1'
			}, {
				text : '李四',
				id : '2'
			}, {
				text : '赵武',
				id : '44'
			} ],
			isShowCheckBox : true,
			isMultiSelect : true,
			valueFieldID : 'test4'
		});

		//列表框可移动
		$("#listbox1").ligerListBox({
			isShowCheckBox : false,
			isMultiSelect : true,
			height : 200,
			selectBoxWidth : 100,
			data : data,
			onDblclick : function() {
				formOperate.moveToRight();
			}

		});
		//liger.get("listbox1").setData(data);

		$("#listbox2").ligerListBox({
			data:[{text : '张三',id : '1'}, {text : '李四',id : '2'}],
			isShowCheckBox : false,
			isMultiSelect : true,
			height : 200,
			selectBoxWidth : 100,
			onDblclick : function() {
				formOperate.moveToLeft();
			}
		});

		//日期控件（年月）
		$("#date1").ligerDateEditor({
			showTime : false,
			label : '只显示年月',
			labelWidth : 100,
			labelAlign : 'left'

		});

		//日期控件（年月日）
		$("#date2").ligerDateEditor({
			showTime : true,
			label : '带时间',
			labelWidth : 100,
			labelAlign : 'left'
		});

		//表格 
		g = $("#maingrid4").ligerGrid({
			columns : [ {
				display : '主键',
				name : 'CustomerID',
				align : 'left',
				width : 120
			}, {
				display : '公司名',
				name : 'CompanyName',
				minWidth : 60
			}, {
				display : '联系名1',
				name : 'ContactName',
				width : 100,
				align : 'left',
				frozen : true
			}, {
				display : '联系名2',
				name : 'ContactName',
				width : 200,
				align : 'left'
			}, {
				display : '联系名3',
				name : 'ContactName',
				width : 200,
				align : 'left'
			}, {
				display : '联系名4',
				name : 'ContactName',
				width : 200,
				align : 'left',
				frozen : true
			}, {
				display : '城市',
				name : 'City',
				width : 200
			} ],
			data :CustomersData ,
			pageSize : 20,
			sortName : 'CustomerID',
			width : '98%',
			height : '98%',
			checkbox : true,
			rownumbers : true,
			fixedCellHeight : false

		});
		$("#pageloading").hide();

		//下拉框树
		combo1 = $("#txt1").ligerComboBox(
			{
				width : 180,
				selectBoxWidth : 200,
				selectBoxHeight : 300,
				treeLeafOnly : false,
				tree : {
					url : '${pageContext.request.contextPath}/js/ligerui/demos/tree/tree.json?type="company"',
					ajaxType : 'get',
					idFieldName : 'id',
					parentIDFieldName : 'pid',
					delay : true
				}
	
			});
	});
	var formOperate = {
			//为树赋值
			f_test:function(){
				// combo1.selectValue("节点1.1");
			},
			//获取单选值
			clickee:function () {
				alert($("#test3").val());
			},
			//获取多选值
			clickees:function(){
				alert($("#test4").val());
			},
			//可移动列表框向左移
			moveToLeft:function (){
				var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
				var selecteds = box2.getSelectedItems();
				if (!selecteds || !selecteds.length)
					return;
				box2.removeItems(selecteds);
				box1.addItems(selecteds);
			},
			//可移动列表框向右移
			moveToRight:function(){
				var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
				var selecteds = box1.getSelectedItems();
				if (!selecteds || !selecteds.length)
					return;
				box1.removeItems(selecteds);
				box2.addItems(selecteds);
			},
			//获取可移动列表框值
			getValue:function(){
				listValue.length = 0;
				var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
				if(box2.data){
					for (var i = 0; i < box2.data.length; i++) {
						listValue.push(box2.data[i].text);
					}
				}
				alert(listValue);
			}
	}
	var data = 
	[	{text : '张三',id : '1'}, 
        {text : '李四',id : '2'}, 
        {text : '赵武2',id : '3'}, 
		{text : '赵武3',id : '4'}, 
		{text : '赵武4',id : '5'}, 
		{text : '赵武5',id : '6'}, 
		{text : '赵武6',id : '7'}, 
		{text : '赵武7',id : '8'} 
	];
</script>

<style type="text/css">
body {margin: 10px;}
h1 {font-size: 20px;font-family: Verdana;}
h4 {font-size: 16px;margin-top: 25px;margin-bottom: 10px;}
td {padding: 5px;}
td button {padding: 5px;}
.btn_query:before {content: "\2601";}
.btn_add:before {content: "\2b";}
.btn_task:before {content: "\2a";}
.btn-move {width: 30px;display: inline-block;}
.listbox_title {width: 150px;height: 30px;border: 1px solid #D6D6D6;background: #0070d2;color: white;font-size: 14px;line-height: 26px;text-align: center;}
.bs-glyphicons li { float: left;width: 7%;height: 44px;padding: 10px;font-size: 10px;line-height: 1.4;text-align: center; background-color: #f9f9f9; border: 1px solid #fff; }
.bs-glyphicons-list { padding-left: 0;list-style: none;}
.pnglist { margin-top: 10px;margin-bottom: 10px;}
</style>
</head>
<body>

	<h1>表单演示</h1>
	<div id="form1">
		<button class="l-button l-button-brand btn_query">&nbsp;查询</button>
		<button class="l-button l-button-brand btn_add">&nbsp;新增类型</button>
		<button class="l-button l-button-green btn_count">&nbsp;划配统计</button>
		<button class="l-button l-button-pink btn_open">&nbsp;导入</button>
		<button class="l-button l-button-green btn_save">&nbsp;导出</button>
		
		<button class="l-button l-button-brand " id="btn1">layer弹窗</button>
		<button class="l-button l-button-brand " id="btn2">ligerui弹窗</button>
		<div class="pnglist">	
			<ul class="bs-glyphicons">
				<li>
					<span><img alt="" src="image/down.png"></span>
					<span>image/down.png</span>
				</li>
				<li>
					<span><img alt="" src="image/up.png"></span>
					<span>image/up.png</span>
				</li>
				<li>
					<span><img alt="" src="image/setting.png"></span>
					<span>image/setting.png</span>
				</li>
				<li>
					<span><img alt="" src="image/delete.png"></span>
					<span>image/delete.png</span>
				</li>
				<li>
					<span><img alt="" src="image/edit.png"></span>
					<span>image/edit.png</span>
				</li>
				<li>
					<span><img alt="" src="image/menu-arrow.png"></span>
					<span>image/menu-arrow.png</span>
				</li>
			</ul>
			
			
		</div>
		<table>
			<tr>
				<td><label for="id" class="slds-form-element__label">划配类型：</label></td>
				<td><select>
						<option>请选择</option>
						<option>用户化配</option>
						<option>任务化配</option>
						<option>其他化配</option>
				</select></td>
				<td><label for="id" class="slds-form-element__label">当前租户：</label></td>
				<td><input id="" name="" type="text" class="ui-textbox"
					value="河南" readonly></td>
			</tr>

			<tr>
				<td><label for="pwd1" class="slds-form-element__label">Password：</label></td>
				<td><input id="pwd1" name="pwd" type="password"
					class="ui-password" /></td>
				<td><label for="textarea1">TextArea：</label></td>
				<td><textarea id="textarea1" name="area" class="ui-textarea"></textarea>
				</td>
				<td><label for="date1" class="slds-form-element__label">DatePicker：</label></td>
				<td><input id="date1" name="birthDay" type="text"
					class="ui-datepicker" /></td>
				<td>Spinner：</td>
				<td><input name="age" type="text" class="ui-spinner" value="22" />
				</td>
			</tr>
			<tr>
				<td>CheckBox：</td>
				<td><input name="married" class="ui-checkbox" type="text"
					value="Y" /> <input name="married" class="ui-checkbox" type="text"
					value="N" /></td>
				<td>RadioButtonList：</td>
				<td><input name="country3" type="hidden" class="ui-radiolist" />
				</td>
			</tr>
			<tr>
				<td>下拉框单选</td>
				<td><input type="text" id="test1" /></td>
				<td>下拉框多选</td>
				<td><input type="text" id="test2" /></td>
				<td><button class="l-button l-button-brand"
						onclick="javascript:formOperate.clickee()">获取单选值</button></td>
				<td><button class="l-button l-button-brand"
						onclick="javascript:formOperate.clickees()">获取多选值</button></td>
			</tr>
			<tr>
				<td>列表框可移动</td>
				<td>
					<div class="listbox_title">数据</div> <input type="text"
					id="listbox1" />
				</td>
				<td><input class="l-button l-button-brand btn-move"
					type="button" onclick="formOperate.moveToLeft()" value="<">
					<input class="l-button l-button-brand btn-move" type="button"
					onclick="formOperate.moveToRight()" value=">"></td>
				<td><input type="text" id="listbox2" /></td>
				<td><button class="l-button l-button-brand "
						onclick="formOperate.getValue()">获取值</button></td>
				<td>结构树，实现异步加载</td>
				<td><input type="text" id="txt1" /></td>
				<td>
					<button class="l-button l-button-brand "
						onclick="formOperate.f_test()">按钮测试</button>
				</td>
			</tr>

		</table>
	</div>
	<p>
	<h1>表格及分页</h1>
	<div class="l-loading" style="display: block" id="pageloading"></div>
	<div id="maingrid4" style="margin: 0; padding: 0"></div>
	<div style="display: none;"></div>

          活动名称<input type="text"  check_name="活动名称"  check_empty check_size="2,10" ><br>
          活动内容 <input type="text"  check_name="活动内容"  check_empty check_size="2,5"  ><br>
          有效期:<select  check_select  check_name="有效期">
             <option  value="-1" >请选择---</option>
             <option  value="1" >1月</option>
             <option  value="2" >2月</option>
             <option  value="3" >3月</option>
             </select><br>
          月份:<select  check_select  check_name="月份">
             <option  value="-1" >请选择---</option>
             <option  value="1" >1月</option>
             <option  value="2" >2月</option>
             <option  value="3" >3月</option>
             <option  value="3" >4月</option>
             <option  value="3" >5月</option>
             </select><br>
    <button  onclick="commonFromCheck()">验证长度</button><br>
</body>
</html>
