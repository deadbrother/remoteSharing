/**
 * 
 */
$(function() {

	manager = $("#huashu")
			.ligerGrid(
					{
						columns : [
								{
									align : 'left',
									width : '5%',
									 render: function(rowdata,index,value){
								        	return "<input type='radio' id='radio"+rowdata.__id+"' name='yipuliuradio'  style='max-height:20px; text-align:left;'/>";
								        }
								},
								{
									display : '变量名称',
									name : 'name',
									width : '13.5%',
									align : 'left',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.name+"'>"+rowdata.name+"</div>";										
									}
								},
								{
									display : '变量描述',
									name : 'remarks',
									width : '13.5%',
									align : 'left',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.remarks+"'>"+rowdata.remarks+"</div>";										
									}
								},
								{
									display : '排序',
									name : 'ord',
									width : '7%',
									align : 'center',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"+rowdata.ord+"'>"+rowdata.ord+"</div>";										
									}
								},
								{
									display : '变量内容',
									name : 'content',
									width : '13.5%',
									align : 'left',
									render: function(rowdata, rowindex, value){
										var content =rowdata.content;
										/*content=content.replace('${','');
										content=content.replace('}','');*/
										return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+content+"'>"+content+"</div>";										
									}
								},
								{
									display : '映射行云字段',
									name : 'realName',
									width : '13.5%',
									align : 'left',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.realName+"'>"+rowdata.realName+"</div>";										
									}
								},
								{
									display : '变量类型',
									name : 'varType',
									width : '13.5%',
									align : 'left',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.varType+"'>"+rowdata.varType+"</div>";										
									}
								},
								{
									display : 'mysql对应行云字段',
									name : 'mysqlName',
									width : '16.5%',
									align : 'left',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+rowdata.mysqlName+"'>"+rowdata.mysqlName+"</div>";										
									}
								},
								{
									display : '是否有效',
									name : 'valid',
									width : '8.5%',
									align : 'center',
									render: function(rowdata, rowindex, value){
										return "<div class='l-grid-row-cell-inner' style=' text-align:center;display:block;' title='"+rowdata.valid+"'>"+rowdata.valid+"</div>";										
									}
								},
								{
									hide:'hide',
									name:'id'
								}
								],
						isScroll : false,
						url : '../huashu/list',
						rownumbers : false,						
						usePager : true,
						enabledSort : false,
						onSelectRow :function(rowdata, rowid, rowobj){	
							$("#radio"+rowdata.__id).prop("checked",true);
						}						
					});
		
//查询
	$("#search-tool-btn").click(function(){
		var name= $("#huahsuName").val();
		manager.options.parms = {"name":name};
		manager.reload(1);
	});

	//新增
	$("#add-tool-btn").click(function(){		
		location.href = "../huashu/huashuAdd";
	});
	
	//修改
	$("#modify-tool-btn").click(function(){
		var rows = manager.getSelectedRows();
		if(rows.length==0) {
			$.ligerDialog.warn("请选择一条进行修改");
			return;
		}		
		var id = rows[0].id;
		location.href = "../huashu/huashuUpdate?id="+id;
	});
	
	//删除
	$("#delete-tool-btn").click(function(){
		var rows = manager.getSelectedRows();
		if(rows.length==0) {
			$.ligerDialog.warn("请选择一条进行删除");
			return;
		}		
		var id = rows[0].id;
		jQuery.ligerDialog.confirm('请确认是否要删除该话术变量？', function (confirm) {
            if (confirm){
            	location.href = "../huashu/huashuDelete?id="+id;
            	$.ligerDialog.warn("删除成功");          	
				}else{
          	  return;
            }
                
        });
	});
})
