$(function(){
	smsportmanager = $("#smsPort").ligerGrid({
		columns : [
        {
	        align : 'left',
	        width : '5%',
	        render: function(rowdata,index,value){
	        	return "<input type='radio' id='radio"+rowdata.__id+"' name='yipuliuradio' class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'/>";
	        }
        },    
		{
			display : '<td style="text-align:left">活动分类</td>',
			name : 'activityClassifyName',
			align : 'left',
			width : '19%',
			render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityClassifyName+"'>"+rowdata.activityClassifyName+"</div>";
			}

		}, {
			display : '<td style="text-align:left">创建机构</td>',
			name : 'createMechanismName',
			align : 'left',
			width : '19%',
			render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.createMechanismName+"'>"+rowdata.createMechanismName+"</div>";
			}

		}, {
			display : '<td style="text-align:left">活动类型</td>',
			name : 'activityTypeName',
			align : 'left',
			width : '19%',
			render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.activityTypeName+"'>"+rowdata.activityTypeName+"</div>";
			}

		}, {
			display : '<td style="text-align:left">营销类型</td>',
			name : 'marketingTypeName',
			align : 'left',
			width : '19%',
			render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.marketingTypeName+"'>"+rowdata.marketingTypeName+"</div>";
			}

		},{
			display : '<td style="text-align:left">使用端口</td>',
			name : 'usePortName',
			align : 'left',
			width : '19%',
			render:function(rowdata,index,value){
				return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.usePortName+"'>"+rowdata.usePortName+"</div>";
			}

		},{
			id : 'id',
			name : 'id',
			hide : 'hide'
		},{
			id : 'activityClassify',
			name : 'activityClassify',
			hide : 'hide'
		},{
			id : 'createMechanism',
			name : 'createMechanism',
			hide : 'hide'
		},{
			id : 'activityType',
			name : 'activityType',
			hide : 'hide'
		},{
			id : 'marketingType',
			name : 'marketingType',
			hide : 'hide'
		},{
			id : 'usePort',
			name : 'usePort',
			hide : 'hide'
		}],
		checkbox : false,
		isSingleCheck :true,
		isScroll : false,
		pageSize:10,
		fixedCellHeight:false,
		pageSizeOptions:[3,4,5,6,7],
		url : '../activity/portConfig',
		method : 'post',
		rownumbers : false,
		usePager : true,
		onSelectRow :cwc,
		width : '100%',
		allowHideColumn:false,
		enabledSort:false

	});

	$(".l-grid-header1").html("");
	function cwc(rowdata, rowid, rowobj){
		$("#radio"+rowdata.__id).prop("checked",true);
	}
})
var port;
/**
 * 新增页面获取
 */
function portAdd(){
	port = $.ligerDialog.open({
		url:"smsPortAdd",
		title:"新增",
		height: 400,
		width: 600,
		isResize: true,
		isDrag:true,
		buttons : [ {
			text : '关闭',
			onclick: function (item, dialog) { dialog.close(); } 
		}]
	});
}
function closePort(){
	parent.port.close();
}

/**
 * 修改页面获取
 */
function portModify(){
	var id = $(".l-selected").find("td:eq(6)>div").html();
	var activityClassify = $(".l-selected").find("td:eq(7)>div").html();
	var createMechanism = $(".l-selected").find("td:eq(8)>div").html();
	var activityType = $(".l-selected").find("td:eq(9)>div").html();
	var marketingType = $(".l-selected").find("td:eq(10)>div").html();
	var usePort = $(".l-selected").find("td:eq(11)>div").html();
	if(id == null || id == ""){
		$.ligerDialog.warn("请选择一条数据进行修改！");
	}else{
		port = $.ligerDialog.open({
			url:"smsPortAdd?activitySmsProtConfig.id="+id+"&activitySmsProtConfig.activityClassify="+activityClassify+"&activitySmsProtConfig.createMechanism="+createMechanism+"&activitySmsProtConfig.activityType="+activityType+"&activitySmsProtConfig.marketingType="+marketingType+"&activitySmsProtConfig.usePort="+usePort,
			title:"修改",
			height: 400,
			width: 600,
			isResize: true,
			isDrag:true,
			buttons : [ {
				text : '关闭',
				onclick: function (item, dialog) { dialog.close(); } 
			}]
		});
		
		
	}
}
/**
 * 活动分类选择为场景营销时   隐藏活动类型
 * @param obj
 */
function selectTypeOnchang(obj){
	if($("#activityClassify option:selected").val() == "2"){
		$("#activityType2").val("1");
		$("#typeacti").hide();
	}else{
		$("#typeacti").show();
		$("#activityType2").val("");
	}
}
/**
 * 验证选择框必须选择
 * 
 */

function checkSelect(){
	var flag = true;
	$("select[check_select]").each(function(){
		var obj=$(this).val();
		var check_name = $(this).attr("check_name");
		if(obj==""){
			$.ligerDialog.warn("请选择"+check_name);
			//alert("请选择"+check_name);
			flag = false; 
			return false;
		}else{
			return true;
		}
	});
	return flag;
}
/**
 * 新增/修改
 */
function portSave(){
	if(!checkSelect()){
    	return;
    }
	//规则选择重复性校验
	var flag = true;
	$.ajax({
		async : false,
			type : "POST",
			url : "../activity/checkSave",  
			data : {
				"activitySmsProtConfig.id":$("#portId").val(),
				"activitySmsProtConfig.activityClassify":$("#activityClassify option:selected").val(),
				"activitySmsProtConfig.createMechanism":$("#createMechanism option:selected").val(),
				"activitySmsProtConfig.activityType":$("#activityType2 option:selected").val(),
				"activitySmsProtConfig.marketingType":$("#marketingType option:selected").val()
			},
			success : function(data) {
				if(data=="false") {
					$.ligerDialog.warn("该条配置已经存在，请修改后再次保存！");
					flag = false;
				}
			}
			
	})
	if(flag == false){
		return;
	}
	//保存操作
	$.ajax({
		async : false,
			type : "POST",
			url : "../activity/portSave",  
			data : {
				"portIsSave":$("#portIsSave").val(),
				"activitySmsProtConfig.id":$("#portId").val(),
				"activitySmsProtConfig.activityClassify":$("#activityClassify option:selected").val(),
				"activitySmsProtConfig.createMechanism":$("#createMechanism option:selected").val(),
				"activitySmsProtConfig.activityType":$("#activityType2 option:selected").val(),
				"activitySmsProtConfig.marketingType":$("#marketingType option:selected").val(),
				"activitySmsProtConfig.usePort":$("#activityPort option:selected").val(),
				"activitySmsProtConfig.userPortName":$("#activityPort option:selected").html()
			},
			success : function(data) {
				if(data=="success") {
					parent.smsportmanager.reload();
					parent.	$.ligerDialog.warn("保存成功");
					parent.port.close();
				}else{
					$.ligerDialog.warn("保存失败");
				}
			}
	})
}
/**
 * 删除
 */
function deletePort(){
	var id = $(".l-selected").find("td:eq(6)>div").html();
	if(id == null || id == ""){
		$.ligerDialog.warn("请选择一条数据进行删除！");
	}else{
		jQuery.ligerDialog.confirm('是否确定删除？', function (confirm) {
		    if (confirm){
		    	$.ajax({
		    		async : false,
		    			type : "POST",
		    			url : "../activity/portDelete",  
		    			data : {
		    				"activitySmsProtConfig.id":id
		    			},
		    			success : function(data) {
		    				if(data=="success") {
		    					$.ligerDialog.warn("删除成功");
		    					smsportmanager.reload();
		    				}else{
		    					$.ligerDialog.warn("删除失败");
		    				}
		    			}
		    	})
		    }else{
		  	  return;
		    }
		        
		});
	}
	
}
/**
*模糊查询
*/
function reloadPort(){
	smsportmanager.options.page = 1 ;
	smsportmanager.options.parms = 
		{"activitySmsProtConfig.activityClassify":$("#activityClassify option:selected").val(),
		 "activitySmsProtConfig.createMechanism":$("#createMechanism option:selected").val(),
		 "activitySmsProtConfig.activityType":$("#activityType2 option:selected").val(),
		 "activitySmsProtConfig.marketingType":$("#marketingType option:selected").val()
		};
	smsportmanager.reload(1);
}