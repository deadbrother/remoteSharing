var manager;
$(function ()
{
         manager=  $("#maingrid").ligerGrid({
                columns: [
                { display: '编号', name: 'data_res_type_id', align: 'center'},
                { display: '类型名称', name: 'data_res_type_name' ,align: 'center'},
                { display: '数据源分类', name: 'res_type', align: 'center'},
                { display: '状态', name: 'data_stutas', align: 'center'},
                { display: '排序',  align: 'center',render: function (rowdata, rowindex, value)
                    {
		        	  var h = "<div><image  src='/epmwxwl/image/up.png'  style='cursor:pointer' href=\"javascript:;\" onclick=\"up('"+rowdata.data_res_type_id+"')\" /><image  style='cursor:pointer' src='/epmwxwl/image/down.png' onclick=\"down('"+rowdata.data_res_type_id+"')\" /> </div>";
		        	  return h;
		          }
                },
                { display: '操作', align: 'center' ,render: function (rowdata, rowindex, value)
                  {
                	  id = rowdata.data_res_type_id;
//		        	  var h = "<div><a href=\"javascript:;\" onclick=\"deleteType('"+rowdata.data_res_type_id+"')\">删除</a>||<a href=\"javascript:;\" onclick=\"updateType('"+rowdata.data_res_type_id+"')\">修改</a></div>";
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
                ],   isScroll: false,
                url : '../dataResType/findAllAjax',
                checkbox:false,
                rownumbers:false,
                usePager:true
           }) 
           $("#addType").click(function() {

       		typeLayer = $.ligerDialog.open({
       			title:'数据源类型',
       			url : '../dataResType/saveJsp',
       			height : 320,
       			isResize : true,
       		});
   		});	
         $("#search-btn").click(function() {
        	 reload();
         });	
}
);
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
	console.log(y);
	return { 'x': x, 'y': y }; 
} 

//升序
function up(data_res_type_id){
	
	 var data_res_type_name=$("#data_res_type_name").val();
	 var res_type=$("#res_type").val();
	 var data_stutas=$("#data_stutas").val();
	 if("NULL"==res_type){
		 res_type="";	 
	 }
	 if("NULL"==data_stutas){
		 data_stutas="";	 
	 }	
	
	$.ajax({
		url: '../dataResType/exchangeWithUp',
		type: "POST",
		async: true,
		data: 
		{
			"data_res_type_id":data_res_type_id,
			"data_res_type_name":data_res_type_name,
			"res_type":res_type,
			"data_stutas":data_stutas
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
function down(data_res_type_id){
	$.ajax({
		url: '../dataResType/exchangeWithDown',
		type: "POST",
		async: true,
		data: 
		{
			"data_res_type_id":data_res_type_id
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

//修改
function updateType(data_res_type_id){
	typeLayer = $.ligerDialog.open({
		title:'数据源类型',
		url : '../dataResType/updateJsp/'+data_res_type_id,
		height : 320,
		isResize : true,
	});
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

function reload(){
	 var data_res_type_name=$("#data_res_type_name").val();
	 var res_type=$("#res_type").val();
	 var data_stutas=$("#data_stutas").val();
	 if("NULL"==res_type){
		 res_type="";	 
	 }
	 if("NULL"==data_stutas){
		 data_stutas="";	 
	 }			
	manager.options.parms = {"data_res_type_name":data_res_type_name,"res_type":res_type,"data_stutas":data_stutas};
	manager.reload(1);
}

	//删除选中的类型
	function deleteType(data_res_type_id){
		$.ajax({
			url: '/epmwxwl/dataResType/delete',
			type: "POST",
			async: true,
			data: 
			{
				"data_res_type_id":data_res_type_id
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