var manager;
$(function ()
{
	manager=  $("#maingrid").ligerGrid({
            columns: [
            { display: '码表名称', name: 'code_name' ,align: 'center'},
            { display: '类型名称', name: 'code_type_name', align: 'center'},
            { display: '码表说明', name: 'code_desc', align: 'center'},
            { display: '父码表名称', name: 'parent_name', align: 'center'},
            { display: '排序',  align: 'center',render: function (rowdata, rowindex, value)
                {
	        	  var h = "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"up('"+rowdata.code_id+"')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"down('"+rowdata.code_id+"')\" /> </div>";
	        	  return h;
	          }
            },
            { display: '操作', align: 'center' ,render: function (rowdata, rowindex, value)
              {
            	  id = rowdata.code_id;
            	  var h="<div id=\"divexecute_"+id+"\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"+id+"',event)\" src=\"/epmwxwl/image/menu-arrow.png\"></div>";
	        	  return h;
	          }
            }
            ],   isScroll: false,
 
            url : '../entityCodeMessage/listAjax',
            checkbox:false,
            rownumbers:false,
            usePager:true,
                
   }) 
   $("#form1").ligerForm();
   $("#add").click(function() {
   		typeLayer = $.ligerDialog.open({
   			title:'码表',
   			url : '../entityCodeMessage/addJsp',
   			height : 400,
   			width:300,
   			isResize : true,
   		});
	});	
    $("#search-btn").click(function (){
		reload();
    });
         
         /*var g = $("#parentTree").ligerComboBox();
     	$("#parentTree").click(function(){
     		$(".ztree").show();
     	})
     	

     	typeTreeSetting = {
     		data : {
     			simpleData : {
     				enable : true,
     				idKey : 'code_id',
     				pIdKey : 'parent_id'
     			},
     			key : {
     				name : 'code_name',
     				title : "code_name"
     			},
     			keep : {
     				parent : true,
     				leaf : true
     			}
     		},
     		edit : {
     			enable : false,
     		},
     		view : {
     			showLine : false,

     		},

     		async : {
     			enable : true,
     			type : 'post',
     			autoParam : [ "code_id" ],
     			url : contextPath + '/entityCodeMessage/findCodeTree',
     			dataFilter : null
     		},
     		callback: {
     			onDblClick:  function(event, treeId, treeNode) {
     				$("#parentTree").val(treeNode.code_name);
     			}
     		
     		}
     	};

     	$.fn.zTree.init($("#typeTree"), typeTreeSetting);
     	zTree = $.fn.zTree.getZTreeObj("typeTree");
     	rMenu = $("#rMenu");*/
}
);



//操作
function viewMenuStr(id,event){
	var str = "<div style='height:25px;'><a href=\"javascript:update('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteById('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/delete.png\">&nbsp;删除</a></div>";
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
//删除
function deleteById(id){
	$.ajax({
		url: '/epmwxwl/entityCodeMessage/delete',
		type: "POST",
		async: true,
		data: 
		{
			"id":id
		},
		success: function(data) 
		{
			if(data=="success")
			{
				manager.deleteSelectedRow();
				hideMenu();
				
			}
			else{
				alert("删除失败");	
			}
		}
	}); 
}

//修改
function update(id){
	typeLayer = $.ligerDialog.open({
		title:'数据源类型',
		url : '/epmwxwl/entityCodeMessage/updateJsp/'+id,
		height : 400,
		width:300,
		isResize : true,
	});
}

//升序
function up(id){
	var code_name= $("#code_name").val();
	var code_type_id = 	$("#code_type_id").val();
	var code_desc=$("#code_desc").val();
	if(code_type_id=="NULL"){
		code_type_id='';
	}
	$.ajax({
		url: '/epmwxwl/entityCodeMessage/exchangeWithUp',
		type: "POST",
		async: true,
		data: 
		{
			"code_id":id,
			"code_name":code_name,
			"code_type_id":code_type_id,
			"code_desc":code_desc
		},
		success: function(data) 
		{
			if(data=="success")
			{
				reload();
			} else if(data=="first"){
				alert("当前类型已经位于首位");
			}
			else{
				alert("升序失败");	
			}
		}
	}); 
}

//降序
function down(id){
	var code_name= $("#code_name").val();
	var code_type_id = 	$("#code_type_id").val();
	var code_desc=$("#code_desc").val();
	if(code_type_id=="NULL"){
		code_type_id='';
	}
	
	$.ajax({
		url: '/epmwxwl/entityCodeMessage/exchangeWithDown',
		type: "POST",
		async: true,
		data: 
		{
			"code_id":id,
			"code_name":code_name,
			"code_type_id":code_type_id,
			"code_desc":code_desc
			
		},
		success: function(data) 
		{
			if(data=="success")
			{
				reload();
			} else if(data=="last"){
				alert("当前类型已经位于末尾");
			}
			else{
				alert("降序失败");	
			}
		}
	}); 
}

function reload(){
	var code_name= $("#code_name").val();
	var code_type_id = 	$("#code_type_id").val();
	var code_desc=$("#code_desc").val();
	/*var parent_id = $("#parentTree").val();*/
	if(code_type_id=="NULL"){
		code_type_id='';
	}
	manager.options.parms = {"code_name":code_name,"code_type_id":code_type_id,"code_desc":code_desc/*,"parent_id":parent_id*/};
	manager.reload(1);
}
//关闭layer 取消按钮
function cancelTypelayer(){
	typeLayer.close();
}
//关闭layer 刷新页面  因为要重新排序
function closeTypelayer(){
	reload();
	cancelTypelayer();
}