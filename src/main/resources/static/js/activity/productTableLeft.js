/**
 * 库有产品表数据加载
 */

function loadLeft() {
	managerUp = $("#maingridOne").ligerGrid(
					{
						columns : [
								{
									//display : '产品编码',
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
										return "<div class='l-grid-row-cell-inner' style='height:10px;text-align:left;' title='"
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
										return "<div class='l-grid-row-cell-inner' style='height:10px;text-align:left;' title='"
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
								},
								{name : 'productId',hide : 'hide'}, 
								{name : 'ifOrder',hide : 'hide'}
								],
						isScroll : false,
						/*
						 * url :
						 * '../activity/querySuccessProductList1?successStandardPo.successTypeId=5&isLeft=left&successStandardPo.successProductIds=1006&successProductPo.productCode=',
						 */
						url : '../activity/querySuccessProductList1',
						title : '库有产品列表',
						rownumbers : false,
						usePager : true,
						pageSize : 5,
						width : 690,
						checkbox : true,
						onCheckAllRow : function(checked, element) {
							
						},
						onCheckRow : function(checked, data, rowid, rowdata) {
							/*// 对未选择产品的id进行操作
							var successProductIds = data.productId;
							var v1 = parent.$("#successProductIds").val();
							if (v1 == '') {
								parent.$("#successProductIds").val(successProductIds);
							} else {
								parent.$("#successProductIds").val(v1 + ',' + successProductIds);
								
								 var ss = parent.$("#successProductIds").val();
								 parent.$("input[name='successStandardPo.successProductIds']").val(ss);
								 
							}
							// 对未选择产品的name进行操作
							var selectedNames = data.productName;
							var n1 = parent.$("#selectedNames").val();
							if (n1 == '') {
								parent.$("#selectedNames").val(selectedNames);
							} else {
								parent.$("#selectedNames").val(n1 + ',' + selectedNames);
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
	parent.managerUp=managerUp;
	parent.refreshUp();
}
function chooseUpPro(){
	$(".l-selected").find("td:eq(6)>div").each(function(){
		var rowProductId = $(this).html();
		var successProductIds = parent.$("#successProductIds").val();
		if (successProductIds == '') {
			parent.$("#successProductIds").val(rowProductId);
		} else {
			parent.$("#successProductIds").val(successProductIds + ','+ rowProductId);
		}
	});
	var orderProductId = "";
	var orderSelectedName = "";
	var rows = managerUp.getSelectedRows();
	for (var i = 0, l = rows.length; i < l; i++) { 
        if (rows[i].ifOrder==1) {
        	orderProductId = rows[i].productId;
        	orderSelectedName = rows[i].productName;
    		var orderProductIds = parent.$("#orderProductIds").val();
    		var orderSelectedNames = parent.$("#orderSelectedNames").val();
    		if (orderProductIds == '') {
    			parent.$("#orderProductIds").val(orderProductId);
    		} else {
    			parent.$("#orderProductIds").val(orderProductIds + ','+ orderProductId);
    		} 
    		if (orderSelectedNames == '') {
    			parent.$("#orderSelectedNames").val(orderSelectedName);
    		} else {
    			parent.$("#orderSelectedNames").val(orderSelectedNames + ','+ orderSelectedName);
    		}
        }  
  
    }
	
	$(".l-selected").find("td:eq(2)>div").each(function(){
		var rowProductName = $(this).text();
		var selectedNames = parent.$("#selectedNames").val();
		if (selectedNames == '') {
			parent.$("#selectedNames").val(rowProductName);
		} else {
			parent.$("#selectedNames").val(selectedNames + ','+ rowProductName);
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

