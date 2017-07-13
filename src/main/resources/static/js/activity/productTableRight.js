/**
 * 已选产品表数据加载
 */
function loadRight() {
	managerDown = $("#maingridDown")
			.ligerGrid(
					{
						columns : [
								{
									display : '<td style="text-align:left;height:24px">产品编码</td>',
									name : 'productCode',
									align : 'center',
									width : '15%',
									render : function(rowdata, index, value) {
										var productCode = "";
										if(value == null){
											productCode = ""
										}else{
											productCode = value;
										}
										return "<div class='l-grid-row-cell-inner' style='max-height:20px;text-align:left;' title='"
												+ productCode
												+ "'>"
												+ productCode
												+ "</div>";
									}
								},
								{
									display : '<td style="text-align:left;height:24px">产品来源</td>',
									name : 'productSuccessType1',
									align : 'center',
									width : '10%',
									render : function(rowdata, index, value) {
										var productSuccessType1 = "";
										if(value == null){
											productSuccessType1 = ""
										}else{
											productSuccessType1 = value;
										}
										return "<div class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;' title='"
												+ productSuccessType1
												+ "'>"
												+ productSuccessType1
												+ "</div>";
									}
								},
								{
									display : '<td style="text-align:left;height:24px">产品名称</td>',
									name : 'productName',
									align : 'center',
									width : '43%',
									render : function(rowdata, index, value) {
										var productName = "";
										if(value == null){
											productName = ""
										}else{
											productName = value;
										}
										return "<div class='l-grid-row-cell-inner' style='max-height:20px;text-align:left;' title='"
												+ productName
												+ "'>"
												+ productName
												+ "</div>";
									}
								}, 
								{
									display : '<td style="text-align:left;height:24px">产品分类</td>',
									name : 'productSuccesstype',
									align : 'center',
									width : '10%',
									render : function(rowdata, index, value) {
										var productSuccesstype = "";
										if(value == null){
											productSuccesstype = ""
										}else{
											productSuccesstype = value;
										}
										return "<div class='l-grid-row-cell-inner' style='max-height:20px;text-align:left;' title='"
												+ productSuccesstype
												+ "'>"
												+ productSuccesstype
												+ "</div>";
									}
								},
								{
									display : '<td style="text-align:left;height:24px">产品网别</td>',
									name : 'serviceType',
									align : 'center',
									width : '10%',
									render : function(rowdata, index, value) {
										var serviceType = "";
										if(value == null){
											serviceType = ""
										}else{
											serviceType = value;
										}
										return "<div class='l-grid-row-cell-inner' style='max-height:20px;text-align:left;' title='"
												+ serviceType
												+ "'>"
												+ serviceType
												+ "</div>";
									}
								},
								{
									display : '<td style="text-align:left;height:24px">付费类型</td>',
									name : 'payMode',
									align : 'center',
									width : '12%',
									render : function(rowdata, index, value) {
										var payMode = "";
										if(value == null){
											payMode = ""
										}else{
											payMode = value;
										}
										return "<div class='l-grid-row-cell-inner' style='max-height:20px;text-align:left;' title='"
												+ payMode
												+ "'>"
												+ payMode
												+ "</div>";
									}
								},{
									name : 'productId',
									hide : 'hide'
								}, ],
						isScroll : false,
						/*
						 * url :
						 * '../activity/querySuccessProductList1?successStandardPo.successTypeId=5&isLeft=right&successStandardPo.successProductIds=1006&successProductPo.productCode=',
						 */
						url : '../activity/querySuccessProductList1?isLeft=right',
						title : '已选产品列表',
						rownumbers : false,
						usePager : true,
						pageSize : 5,
						width : 690,
						checkbox : true,
						onCheckAllRow : function(checked, element) {
							
						},
						onCheckRow : function(checked, data, rowid, rowdata) {
							// 对已选择产品的id进行操作
							/*var successProductIds = data.productId;
							var v2 = parent.$("#successProductIds").val();
							if (v2 == successProductIds) {
								parent.$("#successProductIds").val('');
							} else {
								var oneId = v2.split(",")[0];
								if (oneId == successProductIds) {
									var v3 = v2.replace(successProductIds + ",", "");
									parent.$("#successProductIds").val(v3);
								} else {
									var v3 = v2.replace(',' + successProductIds, "");
									parent.$("#successProductIds").val(v3);
								}
								
								 * var ss = $("#successProductIds").val();
								 * $("input[name='successStandardPo.successProductIds']").val(ss);
								 
							}
							// 对已选择产品的name进行操作
							var rowProductName = data.productName;
							var selectedNames = parent.$("#selectedNames").val();
							if (rowProductName == selectedNames) {
								parent.$("#selectedNames").val('');
							} else {
								var oneName = selectedNames.split(",")[0];
								if (oneName == rowProductName) {
									var v3 = selectedNames.replace(rowProductName + ",", "");
									parent.$("#selectedNames").val(v3);
								} else {
									var v3 = selectedNames.replace(','+ rowProductName, "");
									parent.$("#selectedNames").val(v3);
								}
							}

							$(window.parent.refreshUp());
							$(window.parent.refreshDown());
							if (parent.$("#selectedNames").val() == null|| parent.$("#selectedNames").val() == "") {
								parent.productName = "";
								$(window.parent.strategyDesc());
							} else {
								parent.productName = "产品名称为："+ parent.$("#selectedNames").val() + "；";
								$(window.parent.strategyDesc());
							}*/
						}
					});
	parent.managerDown=managerDown;
	parent.refreshDown();
}
function deleteDownPro(){
	$(".l-selected").find("td:eq(6)>div").each(function(){
		var rowProductId = $(this).html();
		var successProductIds = parent.$("#successProductIds").val();
		var orderProductIds = parent.$("#orderProductIds").val();
		if (rowProductId == successProductIds) {
			parent.$("#successProductIds").val("");
			parent.$("#orderProductIds").val("")
		} else {
			 var oneId = successProductIds.split(",");
			 for(var i=0;i<oneId.length;i++){
				 if (oneId[i] == rowProductId) {
					 if(i==(oneId.length-1)){
						 var v3 = successProductIds.replace(","+rowProductId, "");
						 parent.$("#successProductIds").val(v3);
					 }else{
						 var v3 = successProductIds.replace(rowProductId + ",", "");
						 parent.$("#successProductIds").val(v3);
					 }		
				}
			}
			//短信订购产品筛选
			 var orderId = orderProductIds.split(",");
			 for(var i=0;i<orderId.length;i++){
				 if (orderId[i] == rowProductId) {
					 if(i==(orderId.length-1)){
						 var v3Order = orderProductIds.replace(","+rowProductId, "");
						 parent.$("#orderProductIds").val(v3Order);
					 }else{
						 var v3Order = orderProductIds.replace(rowProductId + ",", "");
						 parent.$("#orderProductIds").val(v3Order);
					 }		
				}
		}
		//短信订购产品筛选
		 var orderId = orderProductIds.split(",");
		 for(var i=0;i<orderId.length;i++){
			 if (orderId[i] == rowProductId) {
				 if(i==(orderId.length-1)){
					 var v3Order = orderProductIds.replace(","+rowProductId, "");
					 parent.$("#orderProductIds").val(v3Order);
				 }else{
					 var v3Order = orderProductIds.replace(rowProductId + ",", "");
					 parent.$("#orderProductIds").val(v3Order);
				 }
			 }
		 }
	}
	})
	$(".l-selected").find("td:eq(2)>div").each(function(){
		var rowProductName = $(this).text();
		var selectedNames = parent.$("#selectedNames").val();
		var orderSelectedNames = parent.$("#orderSelectedNames").val();
		if (rowProductName == selectedNames) {
			parent.$("#selectedNames").val("");
			parent.$("#orderSelectedNames").val("");
		} else {
			var oneName = selectedNames.split(",");
			for(var i=0;i<oneName.length;i++){
				if (oneName[i] == rowProductName) {
					if(i==(oneName.length-1)){
						var v3 = selectedNames.replace(","+rowProductName, "");
						parent.$("#selectedNames").val(v3);
					}else{
						var v3 = selectedNames.replace(rowProductName + ",", "");
						parent.$("#selectedNames").val(v3);
					}	
				}
			}
			//短信订购产品筛选
			var orderName = orderSelectedNames.split(",");
			for(var i=0;i<orderName.length;i++){
				if (orderName[i] == rowProductName) {
					parent.$("#orderProduct option").removeAttr("selected");
					if(i==(orderName.length-1)){
						var v3Order = orderSelectedNames.replace(","+rowProductName, "");
						 parent.$("#orderSelectedNames").val(v3Order);
					}else{
						var v3Order = orderSelectedNames.replace(rowProductName + ",", "");
						 parent.$("#orderSelectedNames").val(v3Order);
					}	
				}
			}
		}
	})
	
	$(window.parent.refreshUp());
	$(window.parent.refreshDown());
	$(".l-grid-header-table tr.l-grid-hd-row").removeClass("l-checked");
	if (parent.$("#selectedNames").val() == null|| parent.$("#selectedNames").val() == "") {
		parent.productName = "";
		$(window.parent.strategyDesc());
	} else {
		parent.productName = "产品名称为："+ parent.$("#selectedNames").val() + "；";
		$(window.parent.strategyDesc());
	}
}
