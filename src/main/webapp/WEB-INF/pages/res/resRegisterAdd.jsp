<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/ligerui/lib/jquery/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js"></script>
<script src="${pageContext.request.contextPath}/js/ligerui/lib/ligerUI/js/ligerui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wxwl/utils/common.js"></script>
</head>
<style>
select {
	width: 20px;
}
.listbox_title{       
	width: 200px;
    height: 30px;
    border: 1px solid #D6D6D6;
    background: #0070d2;
    color: white;
    font-size: 14px;
    line-height: 26px;
    text-align: center;}
.divbox{
	width: 200px;
	height:200px;
	border: 1px solid #D6D6D6;
}
.btn-move {
	width: 30px;
	display: inline-block;
}
.select_menu{
    position: absolute;
    top: 191px;
    right: 57px;
    z-index: 10;
    background-color: white;
    border: solid 1px #ddd;
   	width: 200px;
    height: 200px;
    padding-top: 5px;
    padding-left: 3px;
    display: none;
    box-shadow: 3px 3px 3px #aaa;
}
.select_menu input{
    height: 27px;
    line-height: 28px;
    background-color: #fff;
    width: 158px;
    color: #555555;
 }
.select_menu select{
	width:198px;
	height: 27px;
}
</style>
<body>
	<div align="center">
		<div style="padding-left:40px;height:100px;margin:auto;">
			<div id="form1">
				<table align="left">
				<tr>
					<td style="width:70px;" class="l-filter-value"><label for="id">资源名称：</label></td>
					<td class="l-filter-value" style="width:300px;">
						<input id="res_name" name="res_name"  type="text" class="ui-textbox"  value="${res.res_name}">
						<input type="hidden" id="res_id" value="${res.res_id}"/>
					</td>
					<td class="l-filter-value"><label for="res_type_name">资源说明：</label></td>
					<td class="l-filter-value">
							<input id="res_resume" name="res_resume" type="text" class="ui-textbox" value="${res.res_resume}">
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="main_table">资源主表：</label></td>
					<td class="l-filter-value">
						<input id="main_table" name="main_table" class="ui-textbox" type="text" value="${res.main_table}"/>
					</td>
					<td class="l-filter-value"><label for="main_field">资源主键：</label></td>
					<td class="l-filter-value">
							<input id="main_field" name="main_field" class="ui-textbox" type="text" value="${res.main_field}"/>
					</td>
				</tr>
				<tr>
					<td class="l-filter-value"><label for="tingyong">资源状态：</label></td>
					<td colspan="3" class="l-filter-value"><input id="qiyong" 	 name="stutas" class="ui-checkbox stutas" type="radio" value="0" />启用 
						<input id="tingyong" name="stutas" class="ui-checkbox stutas" type="radio" value="1" />停用
					</td>
				</tr>
				</table>
			</div>
		</div>
		<table align="center">
		<tr>
			<td style="width:200px">
				<div class="listbox_title">备选实体</div>
				<!-- <input type="text" id="listbox1" /> -->
				<div id="listbox1"></div>
			</td>
			<td  style="width:80px">
					<input class="l-button l-button-brand btn-move" type="button" onclick="moveToLeft()" value="<">
					<input class="l-button l-button-brand btn-move" type="button" onclick="moveToRight()" value=">">
			</td>
			<td style="width:200px">
				<div class="listbox_title">已选实体</div>
				<!-- <input type="text" id="listbox2" /> -->
				<div id="listbox2"></div>
			</td>
			<td style="width:240px;padding-left:20px;">
				<div id="selectedEntitySet" class="listbox_title">已选实体设置</div>
				<div id="listbox3" class="divbox">
					<div>
						<div style="padding-top:5px">
							<label>主键</label>
						</div>
						<div style="">
							<input type="text" id="primaryid" />
						</div>
					</div>
					<div>
						<div style="padding-top:5px">
							<label>外键</label>
						</div>
						<div style="">
							<input type="text" id="foreignid" />
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<br />
	<div class="select_menu" ></div>
	<button id="confirm" class="l-button l-button-brand btn_query">&nbsp;确认</button>
	<button id="cancel" class="l-button l-button-brand btn_query">&nbsp;取消</button>
</div>
</body>
<script type="text/javascript">
	var listValue;
	var keyFieldObj = {};
	var listValueAll = new Array();
	$(function() {
		$("#select_menu").hide();
		function init(){
			var arr = ${JSONFileds};
			if(arr!=null&&arr.length>0){
				var mainKey = "",foreignKey="";
				for(var i=0;i<arr.length;i++){
					mainKey = arr[i].mainKey;
					foreignKey=arr[i].foreignKey;
					mainKey = mainKey!=null?mainKey:"";
					foreignKey = foreignKey!=null?foreignKey:"";
					keyFieldObj[arr[i].ENTITY_ID+""]={id:arr[i].ENTITY_ID+"",mainKey:mainKey,foreignKey:foreignKey};
				}
			}
			//console.log(arr);
		}
		init();
		$("#form1").ligerForm({
			width: 300
		});
		
		
		//资源状态回显
		var stutas='${res.stutas}';
		if(stutas == "0"){
			$("#qiyong").attr("checked","checked");
		}else if(stutas == "1"){
			$("#tingyong").attr("checked","checked");
		}
		
		//列表框可移动
		listbox1 = $("#listbox1").ligerListBox({
			isShowCheckBox : false,
			isMultiSelect : true,
			width:200,
			height : 200,
			selectBoxWidth : 160,
			onDblclick:function(){
				moveToRight();
			}
		});
		
		listbox2 = $("#listbox2").ligerListBox({
			isShowCheckBox : false,
			isMultiSelect : false,
			height : 200,
			width:200,
			selectBoxWidth : 100,
			valueFieldID: 'aa'	,
			onDblclick:function(){
				moveToLeft();
			},
			onSelected : function(value){
				$(".select_menu").empty();
				 mainkeyObjrent.mainKey(value); 
				 mainkeyObjrent.foreignKey(value);
			}
		
		});
		
		var JSONStr='${JSONStr}';
		if(JSONStr!=null && JSONStr.trim()!=""){
			var list = strToJson(JSONStr);
			liger.get("listbox1").setData(list);
		}
		
		var JSONStr2='${JSONStr2}';
		if(JSONStr2!=null && JSONStr2.trim()!=""){
			var list2 = strToJson(JSONStr2);
			liger.get("listbox2").setData(list2);
		}
		
		// 确认 按钮
		$("#confirm").click(function() {
			var res_name = $("#res_name").val();
			if(res_name==null || res_name.trim()=="" ){
				alert("请填写资源名称");
				return;
			}
			var res_resume = $("#res_resume").val();
			if($("#qiyong").is(':checked')){
				var stutas='0';
			}else if($("#tingyong").is(':checked')){
				var stutas='1';
			}
			//  拿到 ListBox 里的值
			var listValue = new Array();
			var box2 = liger.get("listbox2");
		
			var res_id ='${res.res_id}';
			var action;
			var main_id="";
			if (typeof(primaryidObj) != "undefined"){ 
				main_id = primaryidObj.getValue();
				/* if(main_id == null||main_id.trim()==""){
					$.ligerDialog.alert("请填写主键");
					return;
				} */
			}
			var foreign_id=""; 
			if (typeof(foreignidObj) != "undefined"){ 
				foreign_id = foreignidObj.getValue();
				/* if(foreign_id == null||foreign_id.trim()==""){
					$.ligerDialog.alert("请填写外键");
					return;
				}  */
			}
			var main_table = $("#main_table").val();
			
			var main_field = $("#main_field").val();
			
			
			if(res_id!=null	&&	res_id!=""){
				   $.ajax({
						url: "${pageContext.request.contextPath}/resRegister/update",
						type: "POST",
						async: true,
						data:{	
							"res_id":res_id,
							"res_name":res_name,
							"res_resume":res_resume,
							"stutas":stutas,
							"main_table":main_table,
							"main_field":main_field,
							"listValue":mainkeyObjrent.getEntiy(),
							"main_id":main_id,
							"foreign_id":foreign_id
							
						},
						success: function(data){
							if(data=="success")
							{
								parent.hideMenu();
								parent.closeTypelayer();
							}else if(data=="registerFail"){
								$.ligerDialog.alert("注册失败，请重新注册");
							}else if(data=="updateFail"){
								$.ligerDialog.alert("更改失败，请重新更改");
							}
						}
					});   		
			}else{
				$.ajax({
					url:  "${pageContext.request.contextPath}/resRegister/save",
					type: "POST",
					async: true,
					data:{	
						"res_id":res_id,
						"res_name":res_name,
						"res_resume":res_resume,
						"main_table":main_table,
						"main_field":main_field,
						"stutas":stutas,
						"listValue":mainkeyObjrent.getEntiy()
					},
					success: function(data){
						if(data=="success")
						{
							parent.closeTypelayer();
						}else if(data=="registerFail"){
							$.ligerDialog.alert("注册失败，请重新注册");
						}else if(data=="updateFail"){
							$.ligerDialog.alert("更改失败，请重新更改");
						}
					}
				});  
			}
		});
		
		//　取消按钮
		$("#cancel").click(function() {
			parent.hideMenu();
			parent.cancelTypelayer();
		});
		
		
		
		var primaryidObj =  $("#primaryid").ligerComboBox({
			width : 200,
			valueFieldID : 'pri',
			textField : 'field_name',
			valueField : 'field_id',
			onSelected : function(value){
				var box2 = liger.get("listbox2");
				var selecteds = box2.getSelectedItems();
				if (!selecteds || selecteds.length<1)
					return;
				keyFieldObj[selecteds[0].id+""].mainKey = value ;
			},
			condition:true
			/*selectBoxRender:true ,
			onSuccess:function(data ,event){
				viewMenuStr(data,event);
			} */
		}); 
		
		var foreignidObj = $("#foreignid").ligerComboBox({
			width : 200,
			valueFieldID : 'fileds',
			textField : 'field_name',
			valueField : 'field_id',
			onSelected : function(value){
				var box2 = liger.get("listbox2");
				var selecteds = box2.getSelectedItems();
				if (!selecteds || selecteds.length<1)
					return;
				keyFieldObj[selecteds[0].id+""].foreignKey = value ;
			}
		});
		
		var mainkeyObjrent = {
			 mainKey:function(listValue){
				if(listValue == null){
					return;
				}
				var that = primaryidObj;
				that.options.url = "${pageContext.request.contextPath}/resRegister/registerJspGetPriIds";
				that.options.parms = {
					"listValue" : listValue,
					"ope" : "pri",
					"listValueAll":""
				}; 
				/* $.ajax({
					url:  "${pageContext.request.contextPath}/resRegister/registerJspGetPriIds",
					type: "POST",
					async: true,
					data: 
					{	
						"listValue" : listValue,
						"ope" : "pri",
						"listValueAll" : ""
					}
				}); */
				var keyvalue = keyFieldObj[listValue+""].mainKey;
				keyvalue = keyvalue != null? keyvalue:"";
				that.options.value = keyvalue;
				that.reload();
				that.selectValue(keyvalue); 
			},
			foreignKey:function(listValue){
				if(listValue == null){
					return;
				}
				var that = foreignidObj;
				listValueAll = getAllValue();
				that.options.url = "${pageContext.request.contextPath}/resRegister/registerJspGetPriIds";
				that.options.parms = {
					"listValue" : listValue,
					"ope" : "fileds",
					"listValueAll" : listValueAll
				}; 
			
				var keyvalue = keyFieldObj[listValue+""].foreignKey;
				keyvalue = keyvalue != null? keyvalue:"";
				that.options.value = keyvalue;
				
				that.reload();
				that.selectValue(keyvalue);
			},
			getEntiy:function(){
				var  box2 = liger.get("listbox2");
				var listValueAll = "[";
				var mainKey="";
				var foreignKey="";
				var entiyid="";
				if(box2.data){
					for (var i = 0; i < box2.data.length; i++) {
						entiyid=box2.data[i].id;
						if(listValueAll.length>5){
							listValueAll +=",";
						}
						if(keyFieldObj[entiyid+""]!=null){
							mainKey = keyFieldObj[entiyid+""].mainKey;
							mainKey = mainKey != null? mainKey:"";
							
							foreignKey = keyFieldObj[entiyid+""].foreignKey;
							foreignKey = foreignKey != null? foreignKey:"";
						}
						
						listValueAll +=  "{\"entiyid\":\""+entiyid+"\",\"mainKey\":\""+mainKey+"\",\"foreignKey\":\""+foreignKey+"\"}" ;
					}
				}
				listValueAll += "]";
				return listValueAll;
			}
		}
		
		
		/* $.ajax({
					url:  action,
					type: "POST",
					async: true,
					data: 
					{	
						"res_id":res_id,
						"res_name":res_name,
						"res_resume":res_resume,
						"stutas":stutas,
						"listValue":listValue
					},
					success: function(data) 
					{
						if(data=="success")
						{
							parent.closeTypelayer();
						}else if(data=="registerFail"){
							alert("注册失败，请重新注册");
						}else if(data=="updateFail"){
							alert("更改失败，请重新更改");
						}
					}
				});  */
				
	});
	
	function strToJson(str) {
		var json = eval('(' + str + ')');
		return json;
	}
	
	function moveToLeft() {
		var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
		var selecteds = box2.getSelectedItems();
		if (!selecteds || !selecteds.length)
			return;
		box2.removeItems(selecteds);
		box1.addItems(selecteds);
		
		keyFieldObj[selecteds[0].id+""] = null;
	}
	function moveToRight() {
		var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
		var selecteds = box1.getSelectedItems();
		if (!selecteds || !selecteds.length)
			return;
		box1.removeItems(selecteds);
		box2.addItems(selecteds);
		keyFieldObj[selecteds[0].id+""] = {id:selecteds[0].id+"",mainKey:"",foreignKey:""};
	}
	function getAllValue(){
		listValueAll = "";
		var  box2 = liger.get("listbox2");
		if(box2.data){
			for (var i = 0; i < box2.data.length; i++) {
				listValueAll +=  box2.data[i].id+',' ;
			}
		}
		return listValueAll;
	} 
	function viewMenuStr(data,event){
		dataStr = strToJson(data);
		//console.log(data);
		var h = "<input type='text' id='sreach_sel' class='ui-textbox'/><button class='l-button l-button-brand'>搜索</button></br><select >";
		if(dataStr){
			for(var i = 0;i<dataStr.length;i++){
				 h += "<option>"+dataStr[i].field_name+"</option>"
			}
		}
		h += "</select>"
		//console.log(h);
		var xyObj = getMousePos(event);
		$(".select_menu").html(h).css({left:(xyObj.x-50) + "px", top:(xyObj.y+10)+"px"}).show();
		$("#primaryid").bind("mousedown",onBodyDown);
	}
	function hideMenu() {
		$(".select_menu").empty().hide();
		$("#primaryid").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!( event.target.class == "select_menu" || $(event.target).parents(".select_menu").length>0)) {
			hideMenu();
		}
	}
	function getMousePos(event) { 
		var e = event || window.event; 
		var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft; 
		var scrollY = document.documentElement.scrollTop || document.body.scrollTop; 
		var x = e.pageX || e.clientX + scrollX; 
		var y = e.pageY || e.clientY + scrollY; 
		return { 'x': x, 'y': y }; 
	} 


</script>
</html>