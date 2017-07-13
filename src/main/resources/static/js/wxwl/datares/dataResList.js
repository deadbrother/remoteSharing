var option;
$(function (){
	$("#form1").ligerForm({
		inputWidth : 200
	});
	option = $("#dataType").ligerComboBox({
		width : 200,
		initIsTriggerEvent: false,
		resize:true,
		valueFieldID: 'typelist'
	});	  
	  manager=  $("#maingrid").ligerGrid({
		  columns: [
	                { display: '编号', name: 'data_res_id',width:"5%", align: 'center'},
	                { display: '名称', name: 'data_res_name' ,width:"10%",align: 'center'},
	                { display: '说明', name: 'data_res_desc', width:"10%",align: 'center'},
	                { display: '类型', name: 'data_res_type_name',width:"10%", align: 'center'},
	                { display: '数据库链接', name: 'data_res_url',width:"40%", align: 'center'},
	                { display: '用户名', name: 'username',width:"10%", align: 'center'},
	                { display: '状态', name: 'data_status',width:"5%", align: 'center'},
	                { display: '排序',  align: 'center',width:"5%",render: function (rowdata, rowindex, value)
	                	 {
			        	  var h = "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"move('"+rowdata.data_res_id+"','"+rowindex+"','up')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"move('"+rowdata.data_res_id+"','"+rowindex+"','down')\" /> </div>";
			        	  return h;
			          }
	                },
	                { display: '操作', align: 'center' ,width:"5%",render: function (rowdata, rowindex, value)
	                    {
	                  	  id = rowdata.data_res_id;
	                  	  var h="<div id=\"divexecute_"+id+"\" ><img  style=\"cursor: pointer\" onclick=\"viewMenuStr('"+id+"',event)\" src=\"/epmwxwl/image/menu-arrow.png\"></div>";
	  		        	  if("1"==rowdata.data_stutas||"2"==rowdata.data_stutas){
	  		        		  //正在执行中的规则
	  		        		  h="<div id='divexecute_"+id+"'><img src='/epmwxwl/image/loading-2.gif' width='25px' height='25px'/></div>";
	  		        		  //判断后台什么时候执行完成
	  		        		  arr[i]=	window.setInterval("timer('" + rowdata.rangeid+"','"+ rowdata.id+"','"+ i+"','"+ rowindex+"','"+rowdata.clientsetid+ "')",6000);
	  		        		  i++;
	  		        	  }
	  		        	  if(rowdata.isparent=="true"&&"root"!=rowdata.id){
	  		        		  h="";
	  		        	  } 
	  		        	  return h;
	  		          }
	                  }
	                ],
	                isScroll: false,
	                width:"97%",
	                url:'../dataRes/search',
	                checkbox:false,
	                rownumbers:false,
	                usePager:true,
	                alternatingRow: false,
			        enabledEdit: true, 
			        fixedCellHeight:false,
			        rowHeight: 32,                           //行默认的高度
			        headerRowHeight: 32
	  });
		  
	  
	  $("#addType").click(function() {
		  ligerDialog = $.ligerDialog.open({ url: '../dataRes/add', height: 500, width: 600, 
			 isResize: true
		});
	  
	  });
	  $("#search-btn").click(function (){
		  reload();
	  });  
});



function updateType(data_res_id){
	ligerDialog = $.ligerDialog.open({ url: "../dataRes/updateJsp/"+data_res_id, height: 500, width: 600, 
	 	isResize: true
	});
}

function deleteType(data_res_id){
	$.ajax({
		url: '../dataRes/delete',
		type: "POST",
		async: true,
		data: 
		{
			"data_res_id":data_res_id
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

function move(data_res_id,rowindex,oper){
	if(oper=='up'){
		if(parseInt(rowindex)-1<0){
			$.ligerDialog.success('不能再升了!');
		}else{
			getmove(data_res_id,manager.getRow(rowindex-1).data_res_id);
		}
	}else if(oper == "down"){
		if(manager.getRow(parseInt(rowindex)+1) == undefined){
			$.ligerDialog.success('不能再降了!');
		}else{
			getmove(data_res_id,manager.getRow(parseInt(rowindex)+1).data_res_id);
		}
	}
	
}



function cancelTypelayer(){
  ligerDialog.close();
}

//关闭layer 刷新页面  因为要重新排序
function closeTypelayer(){
	reload();
	cancelTypelayer();
}

//操作
function viewMenuStr(id,event){
	var str = "<div style='height:25px;'><a href=\"javascript:updateType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/edit.png\">&nbsp;编辑</a></div>";
	str += "<div style='height:25px;'><a href=\"javascript:deleteType('"+id+"')\" style=\"line-height:0;\"><image src=\"/epmwxwl/image/delete.png\">&nbsp;删除</a></div>";
	var xyObj = getMousePos(event);
	$("#modifyMenu").html(str).css({left:(xyObj.x-50) + "px", top:(xyObj.y+10)+"px"}).show();
	$(document).bind("mousedown",onBodyDown);
}
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).bind("mousedown",onBodyDown);
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

function reload(){
	var dataId= $("#dataId").val();
	var dataName = 	$("#dataName").val();
	var dataType=$("#dataType").val();
	manager.options.parms = {
			"data_res_id":dataId,
			"data_res_name":dataName,
			"data_res_type_id":dataType
	};
	manager.reload(1);
}
function getmove(data_res_id,oth_data_res_id){
	$.ajax({
		url: '../dataRes/exchange',
		type: "POST",
		async: true,
		data: 
		{	
			"data_res_id":data_res_id,
			"oth_data_res_id":oth_data_res_id
		},
		success: function(data) 
		{	
			if(data=="success"){
			  reload();
			}else{
				$.ligerDialog.success('请重试!');
			}
		}
	}); 
}


	  

