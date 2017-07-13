var manager;
var option;
var id="";

$(function (){ 
	if(dtstr!=null&&dtstr.length>0){
		id=dtstr[0].id
	}
	option = $("#selOption").ligerComboBox({
		width : 200,
		initIsTriggerEvent: false,
		data : dtstr,
		value:id,
		valueFieldID : 'test3',
		onSelected:function(){
			var draw_type_id = $("#test3").val();
			draw_type_id = draw_type_id!=null?draw_type_id:"";
			manager.options.parms = {"draw_type_id":draw_type_id};
			manager.reload(1);
		}
	});
	manager=   $("#maingrid").ligerGrid({
		columns: [
		          { display: '规则名称', name: 'rule_type_name',align: 'center' },
		          { display: '划配方式', name: 'res_type_name',align: 'center'},
		          { display: '适用租户', name: 'tenant_id', align: 'center'},
		          { display: '划配类型', name: 'rowtypet_name',align: 'center'},
		          {display : '状态',name : 'stutas',align : 'center',type : 'String',render: function (rowdata, rowindex, value){
		        		  if(value!=null&&value=="1"){
		        			  return "停用";
		        		  }else{
		        			  return "启用";
		        		  }
		        	  }
					},
		          { display: '操作', align: 'center' ,render: function (rowdata, rowindex, value)
		        	  {
		        	  id = rowdata.rule_type_id;
		        	  var h="<div id=\"divexecute_"+id+"\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"+id+"','"+rowdata.stutas+"',event)\" src=\"/epmwxwl/image/menu-arrow.png\"></div>";
		        	  if(rowdata.isparent=="true"&&"root"!=rowdata.id){
		        		  h="";
		        	  } 
		        	  return h;
		        	  }
		          }

		          ],   
		          isScroll: false,
		          url : '../ruleType/findAllAjax',
		          checkbox:false,
		          rownumbers:false,
		          usePager:true

	});
	option.selectValue(id);
	$("#form1").ligerForm();
});
//操作
function viewMenuStr(id,stutas,event){
	var stutasstr = "停用";
	if(stutas=="1"){
		stutasstr = "启用";
	}
	
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/delete.png\">&nbsp;删除</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:updateStutas('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/switch.png\">&nbsp;"+stutasstr+"</a></div>";
	var xyObj = getMousePos(event);
	$("#modifyMenu").html(str).css({left:(xyObj.x-50) + "px", top:(xyObj.y+10)+"px"}).show();
	$(document).bind("mousedown",onBodyDown);
}
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!( event.target.id == "modifyMenu" || $(event.target).parents("#modifyMenu").length>0||
			event.target.id == "runGz")) {
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
function updateStutas(rule_type_id){
	hideMenu();
	$.ajax({
		url: '/epmwxwl/ruleType/updateStutas/'+rule_type_id,
		type: "POST",
		async: true,
		data:{
			"rule_type_id":rule_type_id
		},
		success: function(data) {
			if(data=="success"){
				var selValue=option.getValue();
				option.selectValue(selValue);
			}else{
				alert("修改失败");
			}
		}
	}); 
}

function deleteType(rule_type_id){
	$.ajax({
		url: '/epmwxwl/ruleType/deleteRule/'+rule_type_id,
		type: "POST",
		async: true,
		data:{
			"rule_type_id":rule_type_id
		},
		success: function(data) {
			if(data=="success"){
				manager.deleteSelectedRow();
				hideMenu();
			}else{
				alert("删除失败");
			}
		}
	}); 
} 
var detailWin;
function addRuleSet(){
	detailWin=$.ligerDialog.open({
		title:'增加划配规则',
		url : "saveJsp/save?rule_type_id=",
		height :600,
		width:900,
		isResize : true,
		isDrag:true,
		buttons: [
		          { text: '确定', onclick: function () { dosubmit(); } },
		          { text: '取消', onclick: function () { detailWin.hide(); } }
		          ]

	});
} 
function dosubmit(){
	var dialog=detailWin.frame;
	var drawType=dialog.$("#drseleid").val();
	var drawTypeName=dialog.$("#drsele").val();
	var drawName=dialog.$("#ruleTypeName").val();
	var ruleType=dialog.$("#rrseleid").val();
	var ruleSql=dialog.$("#rulesql").val();
	var ruleDesc=dialog.$("#ruleDesc").text();
	var doType=dialog.$("#doType").val();
	var ruleTypeId=dialog.$("#rule_type_id").val();
	var rows;
	if(ruleType=="arv"){
		rows=JSON.stringify(dialog.a.getData());	
	}else if(ruleType=="first"){
		rows=JSON.stringify(dialog.l.getData());	
	}
	var data;
	data={"ruleType.rule_type_name":drawName,
			"ruleType.draw_type_id":drawType,
			"ruleType.res_type_id":ruleType,
			"ruleType.condition_resume":ruleDesc,
			"ruleType.condition_sql":ruleSql,
			"ruleType.rule_type_id":ruleTypeId,
			"ruleFields":rows.toString()}; 
	submitData(data,doType);
}
function submitData(submitData,doType){
	$.ajax({
		url: "/epmwxwl/ruleType/doSaveRuleSet/"+doType,
		type: "POST",
		async: false,
		data:submitData,
		success: function(data) 
		{   
			if(data=="success"){
				alert("添加成功");
				manager.reload(1);
				detailWin.hide();
			}else{
				alert("添加失败，重新添加");
			}    
		}
	}); 
}
function updateType(rule_type_id){
	detailWin=$.ligerDialog.open({
		title:'修改划配规则',
		url : "saveJsp/edit?rule_type_id="+rule_type_id,
		height :600,
		width:900,
		isResize : true,
		isDrag:true,
		buttons: [
		          { text: '确定', onclick: function () { dosubmit(); } },
		          { text: '取消', onclick: function () { detailWin.hide(); } }
		          ]

	});
}



