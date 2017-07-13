/**
 * 
 */
$(function() {
	 
	$("#form1").ligerForm({
		inputWidth : 200
	});
	manager = $("#maingrid").ligerGrid(
			{
				columns : [
           {
   	        align : 'left',
   	        width : '5%',
   	        render: function(rowdata,index,value){
   	        	return "<input type='radio' id='radio"+rowdata.__id+"' name='yipuliuradio' class='l-grid-row-cell-inner' style='max-height:20px; text-align:left;'/>";
   	        }
           },

				        { display : '主题编码',name : 'themeCode',width : '15%',align : 'left'},
				        { display : '主题名称',name : 'themeName',width : '25%',align : 'left'},
						{ display : '主题说明',name : 'themeDesc',width : '35%',align : 'left',render: function(record, rowindex, value){
							return "<div class='l-grid-row-cell-inner' style=' text-align:left;display:block;' title='"+value+"'>"+value+"</div>";
							return html;
						}},
						{ display : '主题排序',name : 'ord',width : '10%',align : 'right'},
						{ display : '是否有效',name : 'isValid',width : '10%',align : 'center',render: function (rowdata, rowindex, value){
							if(value == "1"){
								return "是";
							}else if(value == "0"){
								return "否";
							}
						}}
],
				isScroll : false,
				url : '../theme/list',
				rownumbers : false,
				onSelectRow :cwc,
				usePager : true,
				enabledSort:false
			});
	
	//查询
	$("#search-tool-btn").click(function(){
		reload();
	});
	function cwc(rowdata, rowid, rowobj){
		// $("#cwc"+rowdata.__id).attr("checked",true);
		$("#radio"+rowdata.__id).prop("checked",true);
	}
	$("#test-tool-btn").click(function(){
		var ma = manager.getSelectedRows();
		alert(ma.length);
	});
	//修改
	$("#modify-tool-btn").click(function(){
		var ma = manager.getSelectedRows();
		if(ma.length==0) {
			alert("请选择一条进行修改");
			return;
		}
		if(ma.length>1) {
			alert("请只选择一条进行修改");
			return;
		}
		var themeCode = ma[0].themeCode;
		location.href = "../theme/findThemeByCode?themeCode="+themeCode;
	});
	/**
	 * 新增
	 */
	$("#add-tool-btn").click(function(){
		location.href = "../theme/toSave";
	});
	
});
/**
 * 鼠标滑过显示详细描述
 * @param id
 * @param event
 */
function showDesc(id,event) {
	var des = $("#deid").html();
	if(des.replace(/(^\s*)|(\s*$)/g, "")!=null && des.replace(/(^\s*)|(\s*$)/g, "")!="") {
		$.ajax({
			url:"../theme/getDesc",
			type:"POST",
			data:{
				"themeCode":id
			},
			success:function(data) {
				if(data.length>10) {
					var str = "<div style='height:25px;'>"+data+"</div>"
					var xyObj = getMousePos(event);
					$("#modifyMenu").html(str).css({left:(xyObj.x-5) + "px", top:(xyObj.y+1)+"px"}).show();
					$(document).bind("mousedown",onBodyDown);
				}
				
			}
		});
	}
}
/**
 * 隐藏详细区域
 * @param id
 */
function hideDesc(id){

	$("#modifyMenu").css("display","none");
}
/**
 * 动态查询,重新加载列表
 */
function reload() {
	var theme_themeName=$("#theme_themeName").val();

	if("NULL" == theme_themeName){
		theme_themeName="";
	}

	manager.options.parms = {"themeName":theme_themeName};
	manager.reload(1);
}
/**
 * 获取鼠标位置
 * @param event
 * @returns {___anonymous3128_3145}
 */
function getMousePos(event) { 
	var e = event || window.event; 
	var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft; 
	var scrollY = document.documentElement.scrollTop || document.body.scrollTop; 
	var x = e.pageX || e.clientX + scrollX; 
	var y = e.pageY || e.clientY + scrollY; 
	return { 'x': x, 'y': y }; 
} 
/**
 * 隐藏显示区域
 */
function hideMenu() {
	$("#modifyMenu").empty().hide();
	$(document).unbind("modifyMenu", onBodyDown);
}
/**
 * 
 * @param event
 */
function onBodyDown(event) {
	if (!( event.target.id == "modifyMenu" || $(event.target).parents("#modifyMenu").length>0||
			event.target.id == "runGz")) {
		hideMenu();
	}
}
