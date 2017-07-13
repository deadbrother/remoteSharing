$(function() {
	if($("#ftpType").val()==0){
		phonemanager = $("#phoneList").ligerGrid(
				{
					columns : [
					           {
					        	   align : 'left',
					        	   width : '5%',
					        	   render : function(rowdata, index, value) {
					        		   return "<input type='radio' id='radio"
					        		   + rowdata.__id
					        		   + "' name='yipuliuradio' class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'/>";
					        	   }
					           },
					           {
					        	   display : '<td style="text-align:left">渠道名称</td>',
					        	   name : 'channelName',
					        	   align : 'left',
					        	   width : '10%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.channelName
					        		   + "'>"
					        		   + rowdata.channelName
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">公司Id</td>',
					        	   name : 'channelId',
					        	   align : 'left',
					        	   width : '7%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + rowdata.channelId
					        		   + "'>"
					        		   + rowdata.channelId + "</div>";
					        	   }
					           
					           },
					           
					           {
					        	   display : '<td style="text-align:left">归属地市</td>',
					        	   name : 'cityName',
					        	   align : 'left',
					        	   width : '15%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.cityName
					        		   + "'>"
					        		   + rowdata.cityName + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">渠道状态</td>',
					        	   name : 'isValid',
					        	   align : 'left',
					        	   width : '9%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.isValid=="0") {
					        			   rowdata.activityTypeName = "无效";
					        		   } else {
					        			   rowdata.activityTypeName = "有效";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.activityTypeName
					        		   + "'>"
					        		   + rowdata.activityTypeName
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">业务类型</td>',
					        	   name : 'typeName',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.typeName
					        		   + "'>"
					        		   + rowdata.typeName + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">公司ftp端口</td>',
					        	   name : 'ftpPort',
					        	   align : 'left',
					        	   width : '10%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.ftpPort
					        		   + "'>"
					        		   + rowdata.ftpPort + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">ftp用户名</td>',
					        	   name : 'ftpUsername',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.ftpUsername == null) {
					        			   rowdata.ftpUsername = "";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + rowdata.ftpUsername
					        		   + "'>"
					        		   + rowdata.ftpUsername
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">ftp密码</td>',
					        	   name : 'ftpPassword',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.ftpPassword == null) {
					        			   rowdata.ftpPassword = "********";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + "********"
					        		   + "'>"
					        		   + "********"
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">文件密钥</td>',
					        	   name : 'fileKey',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.fileKey == null) {
					        			   rowdata.fileKey = "********";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + rowdata.fileKey
					        		   + "'>"
					        		   + rowdata.fileKey + "</div>";
					        	   }
					           
					           } ],
					           checkbox : false,
					           isSingleCheck : true,
					           isScroll : false,
					           pageSize : 10,
					           fixedCellHeight : false,
					           pageSizeOptions : [ 3, 4, 5, 6, 7 ],
					           url : '../activity/phoneList',
					           method : 'post',
					           rownumbers : false,
					           usePager : true,
					           onSelectRow : cwc,
					           width : '100%',
					           allowHideColumn : false,
					           enabledSort : false
					           
				});	
	}else{
		phonemanager = $("#phoneList").ligerGrid(
				{
					columns : [
					           {
					        	   align : 'left',
					        	   width : '5%',
					        	   render : function(rowdata, index, value) {
					        		   return "<input type='radio' id='radio"
					        		   + rowdata.__id
					        		   + "' name='yipuliuradio' class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'/>";
					        	   }
					           },
					           {
					        	   display : '<td style="text-align:left">渠道名称</td>',
					        	   name : 'channelName',
					        	   align : 'left',
					        	   width : '13%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.channelName
					        		   + "'>"
					        		   + rowdata.channelName
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">公司Id</td>',
					        	   name : 'channelId',
					        	   align : 'left',
					        	   width : '7%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + rowdata.channelId
					        		   + "'>"
					        		   + rowdata.channelId + "</div>";
					        	   }
					           
					           },
					           
					           {
					        	   display : '<td style="text-align:left">归属地市</td>',
					        	   name : 'cityName',
					        	   align : 'left',
					        	   width : '17%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.cityName
					        		   + "'>"
					        		   + rowdata.cityName + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">渠道状态</td>',
					        	   name : 'isValid',
					        	   align : 'left',
					        	   width : '9%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.isValid=="0") {
					        			   rowdata.activityTypeName = "无效";
					        		   } else {
					        			   rowdata.activityTypeName = "有效";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.activityTypeName
					        		   + "'>"
					        		   + rowdata.activityTypeName
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">业务类型</td>',
					        	   name : 'typeName',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.typeName
					        		   + "'>"
					        		   + rowdata.typeName + "</div>";
					        	   }
					           
					           },
					           /*{
					        	   display : '<td style="text-align:left">公司ftp端口</td>',
					        	   name : 'ftpPort',
					        	   align : 'left',
					        	   width : '10%',
					        	   render : function(rowdata, index, value) {
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"
					        		   + rowdata.ftpPort
					        		   + "'>"
					        		   + rowdata.ftpPort + "</div>";
					        	   }
					           
					           },*/
					           {
					        	   display : '<td style="text-align:left">sftp用户名</td>',
					        	   name : 'ftpUsername',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.ftpUsername == null) {
					        			   rowdata.ftpUsername = "";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + rowdata.ftpUsername
					        		   + "'>"
					        		   + rowdata.ftpUsername
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">sftp密码</td>',
					        	   name : 'ftpPassword',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.ftpPassword == null) {
					        			   rowdata.ftpPassword = "********";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + "********"
					        		   + "'>"
					        		   + "********"
					        		   + "</div>";
					        	   }
					           
					           },
					           {
					        	   display : '<td style="text-align:left">文件密钥</td>',
					        	   name : 'fileKey',
					        	   align : 'left',
					        	   width : '11%',
					        	   render : function(rowdata, index, value) {
					        		   if (rowdata.fileKey == null) {
					        			   rowdata.fileKey = "********";
					        		   }
					        		   return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"
					        		   + rowdata.fileKey
					        		   + "'>"
					        		   + rowdata.fileKey + "</div>";
					        	   }
					           
					           } ],
					           checkbox : false,
					           isSingleCheck : true,
					           isScroll : false,
					           pageSize : 10,
					           fixedCellHeight : false,
					           pageSizeOptions : [ 3, 4, 5, 6, 7 ],
					           url : '../activity/phoneList',
					           method : 'post',
					           rownumbers : false,
					           usePager : true,
					           onSelectRow : cwc,
					           width : '100%',
					           allowHideColumn : false,
					           enabledSort : false
					           
				});
	}

	$(".l-grid-header1").html("");
	function cwc(rowdata, rowid, rowobj) {
		$("#radio" + rowdata.__id).prop("checked", true);
	}
})
var port;
/**
 * 新增页面获取
 */
function portAdd() {
	port = $.ligerDialog.open({
		url : "phoneAdd",
		title : "新增",
		height : 400,
		width : 600,
		isResize : true,
		isDrag : true,
		buttons : [ {
			text : '关闭',
			onclick : function(item, dialog) {
				dialog.close();
			}
		} ]
	});
}
function closePort() {
	parent.port.close();
}

/**
 * 修改页面获取
 */
function portModify() {
	var id = $(".l-selected").find("td:eq(2)>div>div").html() + "";

	if (id == null || id == "") {
		$.ligerDialog.warn("请选择一条数据进行修改！");
	} else {
		port = $.ligerDialog.open({
			url : "phoneAdd?tpInfo.channelId=" + id,
			title : "修改",
			height : 400,
			width : 600,
			isResize : true,
			isDrag : true,
			buttons : [ {
				text : '关闭',
				onclick : function(item, dialog) {
					dialog.close();
				}
			} ]
		});

	}
}


/**
 * 新增/修改
 */
function phoneSave() {
	
	// 保存操作
	var array = new Array();
	var nameListArray = new Array();
	array = $("#cityName").val();
	nameListArray = $("#phoneNameList").val().split(',');
	var cityId = "";
	if (array != null) {
		for (var i = 0; i < array.length; i++) {
			if (cityId == "") {
				cityId = array[i];
			} else {
				cityId = cityId + "," + array[i];
			}
		}
	}
	
	/*for (var j = 0; j < nameListArray.length; j++) {
		alert(nameListArray[j]);
		if ($("#phoneIsSave").val() == "1") {
			if (j == nameListArray.length - 1) {
				if ($("#channelName").val() == nameListArray[j].substring(14,
						nameListArray[j].length - 2)) {
					$.ligerDialog.warn("渠道名不能重复！");
					return;
				}
			} else {
				if ($("#channelName").val() == nameListArray[j].substring(14,
						nameListArray[j].length - 1)) {
					$.ligerDialog.warn("渠道名不能重复！");
					return;
				}
			}
		}
	}*/
	if ($("#channelName").val() == null || $("#channelName").val() == "") {
		$.ligerDialog.warn("渠道名不能为空！");
		return;
	}
	
	if ($("#channelName").val().indexOf("!") != -1) {
		$.ligerDialog.warn("渠道名不能包含感叹号！");
		return;
	}
	//渠道名称校验
	//规则选择重复性校验
	var flag = true;
	var channelId = $("#channelId").val();
	$.ajax({
		async : false,
			type : "POST",
			url : "../activity/checkTeleSave",  
			data : {
				"tpInfo.channelName":$("#channelName").val(),
				"tpInfo.channelId":channelId
			},
			success : function(data) {
				if(data=="false") {
					$.ligerDialog.warn("渠道名不能重复！");
					flag = false;
				}
			}
			
	})
	if(flag == false){
		return;
	}

	if ($("#typeId").val() == null || $("#typeId").val() == "") {
		$.ligerDialog.warn("请选择一个业务类型！");
		return;
	}
	if (cityId == "") {
		$.ligerDialog.warn("请选择归属地市！");
		return;
	}
	if(cityId.indexOf($("#provinceId").val())>=0 && cityId.split(",").length>1){
		$.ligerDialog.warn("全省与地市不能同时选择！");
		return;
	}
	if ($("#isValid").val() == null || $("#isValid").val() == "") {
		$.ligerDialog.warn("请选择一个渠道状态！");
		return;
	}
	
	if ($("#downPath").val() == null || $("#downPath").val() == "") {
		$.ligerDialog.warn("下发路径不能为空！");
		return;
	}
	if($("#ftpType") == 0){
		if(/^(?!\d+$)[a-zA-Z0-9]+/.test($("#downPath").val())){}
		else{
			$.ligerDialog.warn("下发路径格式不正确！");
			return;
		}
	}else{
		if(/\/[a-zA-Z0-9]+/.test($("#downPath").val())){}
		else{
			$.ligerDialog.warn("下发路径格式不正确！");
			return;
		}
	}
	
	if ($("#returnPath").val() == null || $("#returnPath").val() == "") {
		$.ligerDialog.warn("回执路径不能为空！");
		return;
	}
	if($("#ftpType") == 0){
		if(/^(?!\d+$)[a-zA-Z0-9]+/.test($("#returnPath").val())){}
		else{
			$.ligerDialog.warn("回执路径格式不正确！");
			return;
		}
	}else{
		if(/\/[a-zA-Z0-9]+/.test($("#returnPath").val())){}
		else{
			$.ligerDialog.warn("回执路径格式不正确！");
			return;
		}
	}
	if ($("#ftpId").val() == null || $("#ftpId").val() == "") {
		$.ligerDialog.warn("ftpIP不能为空！");
		return;
	}
	 
	   if(/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/.test($("#ftpId").val())&& RegExp.$1<256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256)     
	   {}     
	   else {
		   $.ligerDialog.warn("ftpIP格式不正确！");
			return;
	   }     
	 if($("#ftpType") == 0){
		 if ($("#ftpPort").val() == null || $("#ftpPort").val() == "") {
			 $.ligerDialog.warn("ftp端口不能为空！");
			 return;
		 }	 
	 }   
	if ($("#ftpUsername").val() == null || $("#ftpUsername").val() == "") {
		$.ligerDialog.warn("ftp用户名不能为空！");
		return;
	}
	if ($("#ftpPassword").val() == null || $("#ftpPassword").val() == "") {
		$.ligerDialog.warn("ftp密码不能为空！");
		return;
	}

	if ($("#fileKey").val() == null || $("#fileKey").val() == "") {
		$.ligerDialog.warn("文件密钥不能为空！");
		return;
	}
	
	$.ajax({
				async : false,
				type : "POST",
				url : "phoneSave",
				data : {
					"phoneIsSave" : $("#phoneIsSave").val(),
					"tpInfo.channelId" : $("#channelId").val(),
					"tpInfo.channelName" : $("#channelName").val(),
					"tpInfo.typeId" : $("#typeId").val(),
					"tpInfo.cityId" : cityId,
					"tpInfo.cityName" : getElementByClassName("btn dropdown-toggle btn-default"),
					"tpInfo.isValid" : $("#isValid").val(),
					"tpInfo.downPath" : $("#downPath").val(),
					"tpInfo.returnPath" : $("#returnPath").val(),
					"tpInfo.ftpId" : $("#ftpId").val(),
					"tpInfo.ftpPort" : $("#ftpPort").val(),
					"tpInfo.ftpUsername" : $("#ftpUsername").val(),
					"tpInfo.ftpPassword" : $("#ftpPassword").val(),
					"tpInfo.fileKey" : $("#fileKey").val()
				},
				success : function(data) {
					if (data == "success") {
						parent.phonemanager.reload();
						parent.$.ligerDialog.warn("保存成功");
						parent.port.close();
					} else {
						$.ligerDialog.warn("保存失败");
					}
				}
			})
}
/**
 * 删除
 */
function deletePort() {
	var id = $(".l-selected").find("td:eq(2)>div>div").html() + "";
	//alert(id);
	if (id == null || id == "") {
		$.ligerDialog.warn("请选择一条数据进行删除！");
	} else {
		jQuery.ligerDialog.confirm('是否确定删除？', function(confirm) {
			if (confirm) {
				$.ajax({
					async : false,
					type : "POST",
					url : "../activity/phoneDelete",
					data : {
						"tpInfo.channelId" : id
					},
					success : function(data) {
						if (data == "success") {
							$.ligerDialog.warn("删除成功");
							phonemanager.reload();
						} else {
							$.ligerDialog.warn("删除失败");
						}
					}
				})
			} else {
				return;
			}

		});
	}

}

function getElementByClassName(classnames) {
	var objArray = "";// 定义返回对象数组
	var tags = document.getElementsByTagName("*");// 获取页面所有元素
	var index = 0;
	for ( var i in tags) {
		if (tags[i].nodeType == 1) {
			if (tags[i].getAttribute("class") == classnames) { // 如果某元素的class值为所需要
				objArray = tags[i].getAttribute("title");
				break;
			}
		}
	}
	return objArray;
}
/*
 * function see(){ alert(getElementByClassName("btn dropdown-toggle
 * btn-default")); alert($("#cityName").val()); }
 */

/**
 * 模糊查询
 */
function reloadPort() {
	/*
	 * smsportmanager.options.page = 1 ; smsportmanager.options.parms =
	 * {"activitySmsProtConfig.activityClassify":$("#activityClassify
	 * option:selected").val(),
	 * "activitySmsProtConfig.createMechanism":$("#createMechanism
	 * option:selected").val(),
	 * "activitySmsProtConfig.activityType":$("#activityType2
	 * option:selected").val(),
	 * "activitySmsProtConfig.marketingType":$("#marketingType
	 * option:selected").val() }; smsportmanager.reload(1);
	 */
	phonemanager.options.page = 1;
	var channelName = $.trim($("#channelName").val());
	var cityName = $("#cityName").val();
	var isValid = $("#isValid").val();
	var typeId = $("#typeId").val();

	phonemanager.options.parms = {
		"tpInfo.channelName" : channelName,
		"tpInfo.cityName" : cityName,
		"tpInfo.isValid" : isValid,
		"tpInfo.typeId" : typeId
	};
	phonemanager.reload(1);
}


function setKeyFile() {
	$.ajax({
		async : false,
		type : "POST",
		url : "../activity/check",
		data : {
			
		},
		success : function(data) {
			$("#fileKey").val(data);
		}
	})
	
}